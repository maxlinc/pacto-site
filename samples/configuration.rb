# Just require pacto to add it to your project.
require 'pacto'
# Pacto will disable live connections, so you will get an error if
# your code unexpectedly calls an service that was not stubbed.  If you
# want to re-enable connections, run `WebMock.allow_net_connect!`
WebMock.allow_net_connect!

# Pacto can be configured via a block:
Pacto.configure do |c|
  # Path for loading/storing contracts.
  c.contracts_path = 'contracts'
  # If the request matching should be strict (especially regarding HTTP Headers).
  c.strict_matchers = true
  # You can set the Ruby Logger used by Pacto.
  c.logger = Logger.instance
  # (Deprecated) You can specify a callback for post-processing responses.  Note that only one hook
  # can be active, and specifying your own will disable ERB post-processing.
  c.register_hook do |contracts, request, response|
    puts "Received #{request}"
  end
  # Options to pass to the [json-schema-generator](https://github.com/maxlinc/json-schema-generator) while generating contracts.
  c.generator_options = { :schema_version => 'draft3' }
end

# You can also do inline configuration.  This example tells the json-schema-generator to store default values in the schema.
Pacto.configuration.generator_options = { :defaults => true }

# We can load the contract and validate it, by sending a new request and making sure
# the response matches the JSON schema.  Obviously it will pass since we just recorded it,
# but if the service has made a change, or if you alter the contract with new expectations,
# then you will see a contract validation message.
contracts = Pacto.build_contracts('contracts', 'https://api.github.com')
contracts.validate_all

# We can also use Pacto to stub the service based on the contract.
contracts.stub_all
# The stubbed data won't be very realistic, the default behavior is to return the simplest data
# that complies with the schema.  That basically means that you'll have "bar" for every string.
readme = Octokit.readme 'thoughtworks/pacto'
# You're now getting stubbed data.  Unless you generated the schema with the `defaults` option enabled,
# then this will just return "bar" as the encoding.  If you recorded the defaults, then it will return
# the value received when the Contract was generated.
puts readme.type

# You can turn on validation mode so Pacto will detect and validate HTTP requests.
Pacto.validate!

# Pacto comes with rspec matchers
require 'pacto/rspec'
describe 'my_code' do
  it 'calls a service' do
    Octokit.readme 'thoughtworks/pacto'
    # The have_validated matcher makes sure that Pacto received and successfully validated a request
    expect(Pacto).to have_validated(:get, 'https://api.github.com/repos/thoughtworks/pacto/readme')
  end
end

# It's probably a good idea to reset Pacto between each rspec scenario
RSpec.configure do |c|
  c.after(:each)  { Pacto.clear! }
end

contracts = Pacto.build_contracts('contracts', 'https://api.github.com').stub_all
Pacto.validate!

describe 'my_code' do
  it 'calls a service' do
    Octokit.readme 'thoughtworks/pacto'
    # The have_validated matcher makes sure that Pacto received and successfully validated a request
    expect(Pacto).to have_validated(:get, 'https://api.github.com/repos/thoughtworks/pacto/readme')
  end
end
