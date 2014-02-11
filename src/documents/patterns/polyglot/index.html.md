```
title: Polyglot Testing
menuOrder: 2.4
layout: page
```

Pacto can be used to test more than just Ruby projects.  In fact, we've been experimenting with Pacto as a way to validate OpenStack SDKs written in many languages.  The setup looks like this:

![Polyglot Testing](/images/polyglot.png 'Polyglot Testing Setup')

The test suite is used to ensure that similar code samples from each SDK trigger similar RESTful interactions with the provider's API.  The process is:
1. The test suite (written in RSpec) launches a Pacto Server to intercept API interactions.
2. The test suite then runs the sample code for each SDK.
3. The SDKs are configured to call the APIs via a Pacto endpoint.  Pacto forwards the requests to the real service (or returns a stubbed response, if stubbing is enabled) and then validates the request/response interaction matched a contract.
4. Once the sample code has finished running, the RSpec tests can check with Pacto to confirm only expected services were called, and that there were no validation errors.
5. We then generate a [feature matrix report](https://github.com/maxlinc/matrix_formatter) and other documentation for the SDKs.

The test suite is designed so that necessary pieces within a test are multi-threaded and avoid deadlocks, and you can run multiple tests in parallel to minimize the time required to test.

We haven't packaged this approach up as a reusable project yet, but our [test suite is open-source](https://github.com/rackerlabs/polytrix) so check it out and then [contact Max](/pages/contact) if you're interested in helping extract reusable patterns.
