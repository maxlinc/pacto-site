```
layout: page
title: Documentation-Driven Contracts
menuOrder: 2.3
```

Documentation-Driven Contracts are another service evolution pattern that may be more appropriate for public APIs or other providers that many consumers.  Since establishing a separate contract for each consumer is not practical, the next best thing is to have ensure the documentation accurate reflects the promises made by the service.

In Documentation-Driven Contracts you want to make your documentation the source of truth for the contract.  Good documentation formats are [apiblueprint](http://apiblueprint.org/) (used by [apiary.io](http://apiary.io/)), [swagger](https://helloreverb.com/developers/swagger), or [WADL](http://en.wikipedia.org/wiki/Web_Application_Description_Language) (used by Apigee and others).

We want to take those documentation formats:
- Create contracts based on the documented structure
- Create sample requests for simulated consumers to test providers
- Create stubbed responses to test consumers

Pacto does not yet have support for generating a Contract from documentation, but it is on our roadmap.  We will likely start with [apiblueprint](http://apiblueprint.org/).
