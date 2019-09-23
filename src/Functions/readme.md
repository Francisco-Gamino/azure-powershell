<!-- region Generated -->
# Az.Functions
This directory contains the PowerShell module for the Functions service.

---
## Status
[![Az.Functions](https://img.shields.io/powershellgallery/v/Az.Functions.svg?style=flat-square&label=Az.Functions "Az.Functions")](https://www.powershellgallery.com/packages/Az.Functions/)

## Info
- Modifiable: yes
- Generated: all
- Committed: yes
- Packaged: yes

---
## Detail
This module was primarily generated via [AutoRest](https://github.com/Azure/autorest) using the [PowerShell](https://github.com/Azure/autorest.powershell) extension.

## Module Requirements
- [Az.Accounts module](https://www.powershellgallery.com/packages/Az.Accounts/), version 1.6.0 or greater

## Authentication
AutoRest does not generate authentication code for the module. Authentication is handled via Az.Accounts by altering the HTTP payload before it is sent.

## Development
For information on how to develop for `Az.Functions`, see [how-to.md](how-to.md).
<!-- endregion -->

---
## Generation Requirements
Use of the beta version of `autorest.powershell` generator requires the following:
- [NodeJS LTS](https://nodejs.org) (10.15.x LTS preferred)
  - **Note**: It *will not work* with Node < 10.x. Using 11.x builds may cause issues as they may introduce instability or breaking changes.
> If you want an easy way to install and update Node, [NVS - Node Version Switcher](../nodejs/installing-via-nvs.md) or [NVM - Node Version Manager](../nodejs/installing-via-nvm.md) is recommended.
- [AutoRest](https://aka.ms/autorest) v3 beta <br>`npm install -g autorest@beta`<br>&nbsp;
- PowerShell 6.0 or greater
  - If you don't have it installed, you can use the cross-platform npm package <br>`npm install -g pwsh`<br>&nbsp;
- .NET Core SDK 2.0 or greater
  - If you don't have it installed, you can use the cross-platform npm package <br>`npm install -g dotnet-sdk-2.2`<br>&nbsp;

## Run Generation
In this directory, run AutoRest:
> `autorest`

---
### AutoRest Configuration
> see https://aka.ms/autorest

``` yaml
require:
  - $(this-folder)/../readme.azure.md
  - $(repo)/specification/web/resource-manager/readme.md
module-version: 0.0.1
title: Functions

directive:
  - from: swagger-document
    where: $..produces
    transform: $ = $.filter( each => each === 'application/json');
    reason: this spec adds produces application/xml and text/json erronously.
  - where:
      subject: Operation
    hide: true
  - where: $.definitions.Identifier.properties
    suppress: R3019
# Cmdlet renames
  - where:
      subject: WebAppFunction
    set:
      subject: FunctionApp
# Cmdlets to hide
  - where:
      subject: WebAppPremierAddOn(.*)
    hide: true
  - where:
      subject: WebAppVnetConnection(.*)
    hide: true
  - where:
      subject: WebAppSwiftVirtualNetworkConnection(.*)
    hide: true
  - where:
      subject: WebAppRelayServiceConnection(.*)
    hide: true
  - where:
      subject: WebAppPremierAddOnSlot(.*)
    hide: true
  - where:
      subject: WebAppHybridConnection(.*)
    hide: true
  - where:
      subject: WebAppDomainOwnershipIdentifier(.*)
    hide: true
  - where:
      subject: SiteVnetConnection(.*)
    hide: true
  - where:
      subject: SiteRelayServiceConnection(.*)
    hide: true
  - where:
      subject: (.*)ServerFarm(.*)
    hide: true
  - where:
      subject: (.*)Domain(.*)
    hide: true
  - where:
      subject: (.*)Certificate(.*)
    hide: true
  - where:
      subject: AppServicePlanVnetRoute(.*)
    hide: true
  - where:
      subject: AppServiceEnvironmentWorkerPool(.*)
    hide: true
  - where:
      subject: AppServiceEnvironmentMultiRolePool(.*)
    hide: true
  - where:
      subject: WebAppCustomHostname(.*)
    hide: true
  - where:
      subject: SiteCloneable(.*)
    hide: true
  - where:
      subject: HostingEnvironmentVnet(.*)
    hide: true
  - where:
      subject: GlobalDomainRegistrationDomainPurchase(.*)
    hide: true
  - where:
      subject: WebAppWebSiteNetworkTrace(.*)
    hide: true
  - where:
      subject: WebAppWebSiteNetworkTraceSlot(.*)
    hide: true
  - where:
      subject: WebAppWebSiteNetworkTrace(.*)
    hide: true
  - where:
      subject: WebAppNetworkTrace(.*)
    hide: true
  - where:
      subject: WebAppVnetConnection(.*)
    hide: true
  - where:
      subject: WebAppPublicCertificate(.*)
    hide: true
  - where:
      subject: WebAppDiagnosticLog(.*)
    hide: true
  - where:
      subject: WebAppPerfMonCounter(.*)
    hide: true
  - where:
      subject: WebAppNetworkTrace(.*)
    hide: true
  - where:
      subject: WebAppMigrateMySqlStatus(.*)
    hide: true
  - where:
      subject: WebAppMetric(.*)
    hide: true
  - where:
      subject: SiteNetworkFeature(.*)
    hide: true
  - where:
      subject: ResourceHealthMetadata(.*)
    hide: true
  - where:
      subject: Recommendation(.*)
    hide: true
  - where:
      subject: (.*)MultiRolePoolInstanceMetric(.*)
    hide: true
  - where:
      subject: (.*)MultiRoleMetricDefinition(.*)
    hide: true
  - where:
      subject: (.*)PremierAddOn(.*)
    hide: true
```
