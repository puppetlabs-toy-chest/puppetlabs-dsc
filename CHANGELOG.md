## 2016-11-10 - Supported Release 1.2.0
### Summary

The DSC module brings the DSC Resources included to be current as of Novemeber 2016. It also includes all of the Officially supported DSC Resources from Microsoft, with the exception of the PsDscResources repo which is in ongoing development.

### Features
- Add psDscRunAsCredential Support ([FM-5671](https://tickets.puppet.com/browse/MODULES-5671))
- Include September DSC Resource Kit release ([MODULES-3983](https://tickets.puppet.com/browse/MODULES-3983))
- Include November DSC Resource Kit release ([MODULES-4059](https://tickets.puppet.com/browse/MODULES-4059))

### Bugfixes

- Fix: Fix WaitForAll blacklist test ([MODULES-3764](https://tickets.puppet.com/browse/MODULES-3764))
- Fix: Update travis/appveyor with Ruby 2.3 ([MODULES-3775](https://tickets.puppet.com/browse/MODULES-3775))
- Fix: Support new MS supported Official DSC Resources ([MODULES-3683](https://tickets.puppet.com/browse/MODULES-3683))
- Fix: Fix maxpath issues ([MODULES-3683](https://tickets.puppet.com/browse/MODULES-3683))

## 2016-08-08 - Supported Release 1.1.0
### Summary

The DSC module has many bugs fixed and DSC Resources updated to be current as of 26th July 2016.

### Features
- Nano Server Compatibility ([MODULES-3343](https://tickets.puppet.com/browse/MODULES-3343))
- Better tracking of DSC Resource version with `dsc_resource_release_tags.yml` file ([MODULES-3228](https://tickets.puppet.com/browse/MODULES-3228))([MODULES-3674](https://tickets.puppet.com/browse/MODULES-3674))
- Revendored DSC Resources as of 26th July 2016

### Bugfixes

- Fix: Tests failing on PE 3.8.x because master_manipluator is pinned ([MODULES-2772](https://tickets.puppet.com/browse/MODULES-2772))
- Fix: Improve the DSC Build import process ([FM-4661](https://tickets.puppet.com/browse/FM-4661))
- Fix: Tests failing due to RSpec 3+ compatibility ([FM-4915](https://tickets.puppet.com/browse/FM-4915))
- Fix: Remove unnecessary files from module build
- Fix: Simplify 'Ensure' Property Handling ([MODULES-3133](https://tickets.puppet.com/browse/MODULES-3133))
- Fix: Upgrade MOF Parser for UTF8-BOMs ([MODULES-3133](https://tickets.puppet.com/browse/MODULES-3133))
- Fix: Update links for WM5 Production release
- Fix: Increase execution timeout ([MODULES-3342](https://tickets.puppet.com/browse/MODULES-3342))
- Fix: Fix acceptance tests for MySQL DSC resource ([MODULES-3431](https://tickets.puppet.com/browse/MODULES-3431))
- Fix: Update documentation with Module Version strategy ([MODULES-3491](https://tickets.puppet.com/browse/MODULES-3491))

## 2016-03-17 - Supported Release 1.0.1
### Summary

The DSC module is now packaged in a different format tar file.  When installing the module on Windows with the Puppet module tool command `puppet module install puppetlab-dsc`, all files present in the tar.gz archive are not properly copied to the module directory. This is due to a bug in the module tool that is fixed as part of ([PUP-5994](https://tickets.puppet.com/browse/PUP-5994)) and ships in the Puppet Enterprise 3.8.7, puppet-agent 1.4.0, or newer installers.  To enable existing Windows agents to properly install the module, it was necessary to repack the module in a different manner to work around this problem.

### Bugfixes

- Fix: The tar file format for the module has been changed to work around a bug in the Puppet module tool ([PUP-5994](https://tickets.puppet.com/browse/PUP-5994))

## 2016-01-19 - Supported Release 1.0.0
### Summary

First supported release! Performance is increased (more than 2 times in most instances) by reusing PowerShell instance! Support PSCredentials, KeyValuePair and other Embedded Instance Classes. Update DSC Modules to latest available. Notify on Reboot required (and handle it with a known named Puppet reboot resource).

### Features

- Reuse PowerShell instance for increased performance ([MODULES-2709](https://tickets.puppet.com/browse/MODULES-2709))
- Support PSCredentials, KeyValuePair and other arbitrary EmbeddedInstance MOF Classes ([MODULES-2178](https://tickets.puppet.com/browse/MODULES-2178))
- Remove LCM Refresh Mode Disabled Requirement ([MODULES-2575](https://tickets.puppet.com/browse/MODULES-2575))
- Remove Unsupported DSC Resource Types xChrome, xDscDiagnostics, xFireFox, xSafeHarbor, xSecurity, MSFT_WaitForAll, MSFT_WaitForAny and MSFT_WaitForSome ([MODULES-2244](https://tickets.puppet.com/browse/MODULES-2244)).  Further reduce the module size by removing unnecessary files ([MODULES-2777](https://tickets.puppet.com/browse/MODULES-2777))
- Update DSC Modules to latest available as of November 15, 2015. (Commit [84a467c](https://github.com/PowerShell/DscResources/tree/84a467c30379a57202bed721d259a517a138290c) of [PowerShell/DscResources](https://github.com/PowerShell/DscResources/))
- Propagate DSC resource 'RebootRequired' status via Puppet notify, enabling DSC resources to trigger a system reboot ([MODULES-2641](https://tickets.puppet.com/browse/MODULES-2641))

### Bugfixes

- Fix: Module dependencies are incompatible with Puppet 3.x ([MODULES-2514](https://tickets.puppet.com/browse/MODULES-2514))
- Fix: Only allow module to run on PowerShell v5 ([MODULES-2521](https://tickets.puppet.com/browse/MODULES-2521))
- Fix: Setting LCM Mode to "Pull" Causes crash ([MODULES-2485](https://tickets.puppet.com/browse/MODULES-2485))
- Fix: Empty password for PSCredential causes crash ([MODULES-2615](https://tickets.puppet.com/browse/MODULES-2615))
- Fix: Module doesn't properly handle signed integers ([MODULES-2759](https://tickets.puppet.com/browse/MODULES-2759))
- Fix: Package resource fails when ReturnCode is specified ([MODULES-2562](https://tickets.puppet.com/browse/MODULES-2562))
- Fix: Symlinking vendored modules causes duplicate errors if the same version of one of the modules is already installed ([MODULES-2837](https://tickets.puppet.com/browse/MODULES-2837))

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

- Use WMF 5 instead of WMF 4 to take advantage of a much faster and more direct Invoke-DscResource over Start-DscConfiguration ([MODULES-1960](https://tickets.puppet.com/browse/MODULES-1960))
- Use latest DSC Resources from the PowerShell Gallery.
- Allow setting the LCM RefreshMode as a defined type. ([MODULES-2243](https://tickets.puppet.com/browse/MODULES-2243))
- Commit generated types / specs ([MODULES-1956](https://tickets.puppet.com/browse/MODULES-1956))
- Vendor resource kit files and ensure on PSModulePath so user doesn't need to install all of the resources ([MODULES-2175](https://tickets.puppet.com/browse/MODULES-2175))

### Bugfixes

- Fix `dsc_ensure => absent` ([MODULES-2267](https://tickets.puppet.com/browse/MODULES-2267))
- Use original MOF gem for building types ([MODULES-1957](https://tickets.puppet.com/browse/MODULES-1957))
- Call PowerShell with arguments ([MODULES-2182](https://tickets.puppet.com/browse/MODULES-2182))
- Manage DSC resources without ensure ([MODULES-2257](https://tickets.puppet.com/browse/MODULES-2257))
- Mixing quotes causes crash ([MODULES-2442](https://tickets.puppet.com/browse/MODULES-2242))
- Uint8 type generation ([MODULES-2481](https://tickets.puppet.com/browse/MODULES-2481))
- Ensure Puppet 4 compatibility ([MODULES-2299](https://tickets.puppet.com/browse/MODULES-2299))

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
