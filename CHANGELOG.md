## 2017-08-30 - Supported Release 1.4.0

The DSC module received bug fixes mainly related to conflicting with the PowerShell module. The module was also updated with the July and August DSC Resource Packs.

### Changed

- Updated metadata for Puppet 4 and Puppet 5 ([MODULES-4840](https://tickets.puppetlabs.com/browse/MODULES-4840), [MODULES-5144](https://tickets.puppetlabs.com/browse/MODULES-5144))
- Restricted WMF version to 5.0 RTM or above ([MODULES-2770](https://tickets.puppetlabs.com/browse/MODULES-2770))
- Included July 2017 DSC Resource Kit release ([MODULES-5534](https://tickets.puppet.com/browse/MODULES-5534))
- Included August 2017 DSC Resource Kit release ([MODULES-5536](https://tickets.puppet.com/browse/MODULES-5536))

### Deprecated

- Add `dsc::lcm_config` class deprecation warning ([MODULES-3409](https://tickets.puppetlabs.com/browse/MODULES-3409))

### Fixed

- Updated documentation for the latest WMF 5.1 links
- Fixed Global Variable warning message ([MODULES-5224](https://tickets.puppetlabs.com/browse/MODULES-5224))
- Fixed PowerShellManager template path ([MODULES-5228](https://tickets.puppetlabs.com/browse/MODULES-5228))
- Moved vendored resources test ([MODULES-2980](https://tickets.puppetlabs.com/browse/MODULES-2980))

## 2017-08-25 - Supported Release 1.3.1

The DSC module has been repackaged to remove extraneous content from the 1.3.0 release.

### Bugfixes

- Fix: Extraneous vendor content in puppetlabs-dsc-1.3.0.tar.gz ([MODULES-5380](https://tickets.puppetlabs.com/browse/MODULES-5380))

## 2017-04-27 - Supported Release 1.3.0

The DSC module brings the DSC Resources included to be current as of April 2017.  The release also includes an update for newer PowerShell versions (5.1) and better documentation.

### Summary

- Include January 2017 DSC Resource Kit release ([MODULES-4371](https://tickets.puppet.com/browse/MODULES-4371))
- Include March 2017 DSC Resource Kit release ([MODULES-4371](https://tickets.puppet.com/browse/MODULES-4371))
- Update Build README with better instructions ([MODULES-4128](https://tickets.puppet.com/browse/MODULES-4128))
- Update README with troubleshooting help ([MODULES-4128](https://tickets.puppet.com/browse/MODULES-4128))
- Update support PowerShell 5.1 ([MODULES-3977](https://tickets.puppet.com/browse/MODULES-3977))
- Include April 2017 DSC Resource Kit release ([MODULES-4747](https://tickets.puppet.com/browse/MODULES-4747))

### Bugfixes

- Fix: Fix building custom DSC Resources ([MODULES-4201](https://tickets.puppet.com/browse/MODULES-4201))
- Fix: Add known issue with `dsc_file` to README ([MODULES-3178](https://tickets.puppet.com/browse/MODULES-3178))
- Fix: Fix DSC repository name case ([MODULES-4430](https://tickets.puppet.com/browse/MODULES-4430))
- Fix: Module manifest parser does not handle double quotes ([MODULES-4422](https://tickets.puppet.com/browse/MODULES-4422))
- Fix: Update error message on older PowerShell versions ([MODULES-4014](https://tickets.puppet.com/browse/MODULES-4014))
- Fix: Add facade rake tasks for use in CI and Test Tiering ([MODULES-4667](https://tickets.puppet.com/browse/MODULES-4667))
- Fix: Fix integration test failing due to pre-existing reboot condition

## 2016-11-10 - Supported Release 1.2.0

### Summary

The DSC module brings the DSC Resources included to be current as of November 2016. It also includes all of the Officially supported DSC Resources from Microsoft, with the exception of the PsDscResources repo which is in ongoing development.

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
