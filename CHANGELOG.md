## 2016-01-14 - Supported Release 1.0.0
### Summary

First supported release! Performance is increased (more than 2 times in most instances) by reusing PowerShell instance! Support PSCredentials, KeyValuePair and other Embedded Instance Classes. Update DSC Modules to latest available. Notify on Reboot required (and handle it with a known named Puppet reboot resource).

### Features

- Reuse PowerShell instance for increased performance ([MODULES-2709](https://tickets.puppetlabs.com/browse/MODULES-2709))
- Support PSCredentials, KeyValuePair and other arbitrary EmbeddedInstance MOF Classes ([MODULES-2178](https://tickets.puppetlabs.com/browse/MODULES-2178))
- Remove LCM Refresh Mode Disabled Requirement ([MODULES-2575](https://tickets.puppetlabs.com/browse/MODULES-2575))
- Remove Unsupported DSC Resource Types xChrome, xDscDiagnostics, xFireFox, xSafeHarbor, xSecurity, MSFT_WaitForAll, MSFT_WaitForAny and MSFT_WaitForSome ([MODULES-2244](https://tickets.puppetlabs.com/browse/MODULES-2244)).  Further reduce the module size by removing unnecessary files ([MODULES-2777](https://tickets.puppetlabs.com/browse/MODULES-2777))
- Update DSC Modules to latest available as of November 15, 2015. (Commit [84a467c](https://github.com/PowerShell/DscResources/tree/84a467c30379a57202bed721d259a517a138290c) of [PowerShell/DscResources](https://github.com/PowerShell/DscResources/))
- Propagate DSC resource 'RebootRequired' status via Puppet notify, enabling DSC resources to trigger a system reboot ([MODULES-2641](https://tickets.puppetlabs.com/browse/MODULES-2641))

### Bugfixes

- Fix: Module dependencies are incompatible with Puppet 3.x ([MODULES-2514](https://tickets.puppetlabs.com/browse/MODULES-2514))
- Fix: Only allow module to run on PowerShell v5 ([MODULES-2521](https://tickets.puppetlabs.com/browse/MODULES-2521))
- Fix: Setting LCM Mode to "Pull" Causes crash ([MODULES-2485](https://tickets.puppetlabs.com/browse/MODULES-2485))
- Fix: Empty password for PSCredential causes crash ([MODULES-2615](https://tickets.puppetlabs.com/browse/MODULES-2615))
- Fix: Module doesn't properly handle signed integers ([MODULES-2759](https://tickets.puppetlabs.com/browse/MODULES-2759))
- Fix: Package resource fails when ReturnCode is specified ([MODULES-2562](https://tickets.puppetlabs.com/browse/MODULES-2562))
- Fix: Symlinking vendored modules causes duplicate errors if the same version of one of the modules is already installed ([MODULES-2837](https://tickets.puppetlabs.com/browse/MODULES-2837))

See any known issues or limitations in the ReadMe.

## 2015-09-02 - Unsupported Release 0.8.1

### Summary

Fix forge links and update url for WMF 5.

### Features

- Update WMF 5 links to production preview

### Bugfixes

- Fix links in metadata.json

## 2015-09-02 - Initial Puppet Labs Unsupported Release 0.8.0

### Summary

Initial release from Puppet Labs moving to PowerShell 5 to take advantage of Invoke-DSCResource. Instead of a DSC Resource Kit, update to use the latest DSC resources from the PowerShell Gallery and bundle the resources with the module.

### Features

- Use WMF 5 instead of WMF 4 to take advantage of a much faster and more direct Invoke-DscResource over Start-DscConfiguration ([MODULES-1960](https://tickets.puppetlabs.com/browse/MODULES-1960))
- Use latest DSC Resources from the PowerShell Gallery.
- Allow setting the LCM RefreshMode as a defined type. ([MODULES-2243](https://tickets.puppetlabs.com/browse/MODULES-2243))
- Commit generated types / specs ([MODULES-1956](https://tickets.puppetlabs.com/browse/MODULES-1956))
- Vendor resource kit files and ensure on PSModulePath so user doesn't need to install all of the resources ([MODULES-2175](https://tickets.puppetlabs.com/browse/MODULES-2175))

### Bugfixes

- Fix `dsc_ensure => absent` ([MODULES-2267](https://tickets.puppetlabs.com/browse/MODULES-2267))
- Use original MOF gem for building types ([MODULES-1957](https://tickets.puppetlabs.com/browse/MODULES-1957))
- Call PowerShell with arguments ([MODULES-2182](https://tickets.puppetlabs.com/browse/MODULES-2182))
- Manage DSC resources without ensure ([MODULES-2257](https://tickets.puppetlabs.com/browse/MODULES-2257))
- Mixing quotes causes crash ([MODULES-2442](https://tickets.puppetlabs.com/browse/MODULES-2242))
- Uint8 type generation ([MODULES-2481](https://tickets.puppetlabs.com/browse/MODULES-2481))
- Ensure Puppet 4 compatibility ([MODULES-2299](https://tickets.puppetlabs.com/browse/MODULES-2299))

## 2014-09-19 - Release 0.1.1 (msutter)
### Summary

### Features

- add linting
- rewrite for encoding issues
- fix doc typo

### Bugfixes

- fix import of base resource 'file'
- fix dsc File resource
- remove includeallfeature attribute from IIS role

## 2014-09-15 - Initial Release 0.1.0 (msutter)
### Summary

Initial release to provide user the ability to manage PowerShell DSC resources with Puppet.
