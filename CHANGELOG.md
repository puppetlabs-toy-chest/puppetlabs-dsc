# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.8.0] - 2019-01-15

### Added

- Added small example exec for updating execution policy via contribution by [nekototori](https://github.com/Nekototori)

### Fixed

- Ensure that using sensitive values in DSC resource declarations functions when the master and agent are different major versions ([MODULES-8172](https://tickets.puppetlabs.com/browse/MODULES-8172))

## [1.7.0] - 2018-10-10

### Added

- Added Beaker Testmode Switcher ([MODULES-6742](https://tickets.puppetlabs.com/browse/MODULES-6742))
- Added support for Puppet 6 ([MODULES-7832](https://tickets.puppetlabs.com/browse/MODULES-7832))

### Fixed

- Fix broken type files ([MODULES-7462](https://tickets.puppetlabs.com/browse/MODULES-7462))

### Changed

- Converted module to PDK format ([MODULES-7399](https://tickets.puppetlabs.com/browse/MODULES-7399))

## [1.6.0] - 2018-05-09

### Added

- Added documentation on the LCM RefreshMode setting ([MODULES-6640](https://tickets.puppetlabs.com/browse/MODULES-6640))
- Added Windows 2016 to metadata ([MODULES-4271](https://tickets.puppetlabs.com/browse/MODULES-4271))

### Fixed

- Fixed DSC Resource Module Version parsing error ([MODULES-7055](https://tickets.puppetlabs.com/browse/MODULES-7055))
- Fixed case sensitive file name psd1 resolver ([MODULES-7063](https://tickets.puppetlabs.com/browse/MODULES-7063))
- Fixed pining HQ DSC Resources ([MODULES-6694](https://tickets.puppetlabs.com/browse/MODULES-6694))
- Fixed starting pipes on Windows 2008R2 ([MODULES-6929](https://tickets.puppetlabs.com/browse/MODULES-6929))

### Changed

- Updated SharePointDsc to 2.2.0.0  ([MODULES-7057](https://tickets.puppetlabs.com/browse/MODULES-7057))
- Updated SqlServerDsc to 11.1.0.0  ([MODULES-7057](https://tickets.puppetlabs.com/browse/MODULES-7057))
- Updated xActiveDirectory to 2.18.0.0  ([MODULES-7057](https://tickets.puppetlabs.com/browse/MODULES-7057))
- Updated xComputerManagement to 4.1.0.0  ([MODULES-7057](https://tickets.puppetlabs.com/browse/MODULES-7057))
- Updated xFailOverCluster to 1.10.0.0  ([MODULES-7057](https://tickets.puppetlabs.com/browse/MODULES-7057))
- Updated xNetworking to 5.6.0.0  ([MODULES-7057](https://tickets.puppetlabs.com/browse/MODULES-7057))
- Updated xPSDesiredStateConfiguration to 8.1.0.0  ([MODULES-7057](https://tickets.puppetlabs.com/browse/MODULES-7057))
- Bumped the puppetlabs-reboot module dependancy to reflect that the new version is 2.0.0 ([MODULES-6678](https://tickets.puppetlabs.com/browse/MODULES-6678))

## [1.5.0] - 2018-02-19

### Adds

- **BREAKING**: Update SqlServerDsc to 11.0.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update OfficeOnlineServerDsc to 1.2.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update SecurityPolicyDsc to 2.2.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update SharePointDsc to 2.1.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update StorageDsc to 4.0.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update SystemLocaleDsc to 1.2.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xActiveDirectory to 2.17.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xAdcsDeployment to 1.4.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xCertificate to 4.2.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xComputerManagement to 4.0.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xDatabase to 1.7.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xDnsServer to 1.9.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xExchange to 1.19.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xFailOverCluster to 1.9.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xHyper-V to 3.11.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Pinned xPowerShellExecutionPolicy to 1.1.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xPSDesiredStateConfiguration to 8.0.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xNetworking to 5.5.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xRemoteDesktopSessionHost to 1.5.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xSharePoint to 2.1.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xTimeZone to 1.7.0.0 ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- Update xSQLServer ([MODULES-5689](https://tickets.puppetlabs.com/browse/MODULES-5689))
- Update xSQLServer ([MODULES-5431](https://tickets.puppetlabs.com/browse/MODULES-5431))

### Fixes

- Fixed including HQ DSC Resources in dsc_resource_tags.yml
- Correctly ignore PSDscResources in build process
- Remove warning for MSFT_WaitFor DSC Resources
- Fix parsing DSC Resource manifest files ([MODULES-5590](https://tickets.puppetlabs.com/browse/MODULES-5590))

### Removed

- **BREAKING**: Removed xSQLServer ([MODULES-6592](https://tickets.puppetlabs.com/browse/MODULES-6592))
- **BREAKING**: Removed powershell and stdlib module dependencies ([MODULES-5548](https://tickets.puppetlabs.com/browse/MODULES-5548))

## [1.4.1] - 2018-01-05

### Added

- Allow users to specify passwords in a `MSFT_Credential` as [Sensitive](https://puppet.com/docs/puppet/latest/lang_data_sensitive.html) strings ([MODULES-5743](https://tickets.puppetlabs.com/browse/MODULES-5743))

### Fixed

- Increased the timeout for opening PowerShell from 10 to 30 seconds to prevent erroneous failures ([MODULES-4748](https://tickets.puppetlabs.com/browse/MODULES-4748))
- Prevented the PowerShell manager from creating zombie processes ([MODULES-4748](https://tickets.puppetlabs.com/browse/MODULES-4748))

## [1.4.0] - 2017-08-30

### Added

- Included July 2017 DSC Resource Kit release ([MODULES-5534](https://tickets.puppet.com/browse/MODULES-5534))
- Included August 2017 DSC Resource Kit release ([MODULES-5536](https://tickets.puppet.com/browse/MODULES-5536))
- Updated metadata for Puppet 4 and Puppet 5 ([MODULES-4840](https://tickets.puppetlabs.com/browse/MODULES-4840), [MODULES-5144](https://tickets.puppetlabs.com/browse/MODULES-5144))

### Changed

- Restricted WMF version to 5.0 RTM or above ([MODULES-2770](https://tickets.puppetlabs.com/browse/MODULES-2770))

### Deprecated

- Add `dsc::lcm_config` class deprecation warning ([MODULES-3409](https://tickets.puppetlabs.com/browse/MODULES-3409))

### Fixed

- Updated documentation for the latest WMF 5.1 links
- Fixed Global Variable warning message ([MODULES-5224](https://tickets.puppetlabs.com/browse/MODULES-5224))
- Fixed PowerShellManager template path ([MODULES-5228](https://tickets.puppetlabs.com/browse/MODULES-5228))
- Moved vendored resources test ([MODULES-2980](https://tickets.puppetlabs.com/browse/MODULES-2980))

## [1.3.1] 2017-08-25

### Fixed

- Fix: Extraneous vendor content in puppetlabs-dsc-1.3.0.tar.gz ([MODULES-5380](https://tickets.puppetlabs.com/browse/MODULES-5380))

## [1.3.0] - 2017-04-27

### Added

- Include January 2017 DSC Resource Kit release ([MODULES-4371](https://tickets.puppet.com/browse/MODULES-4371))
- Include March 2017 DSC Resource Kit release ([MODULES-4371](https://tickets.puppet.com/browse/MODULES-4371))
- Update Build README with better instructions ([MODULES-4128](https://tickets.puppet.com/browse/MODULES-4128))
- Update README with troubleshooting help ([MODULES-4128](https://tickets.puppet.com/browse/MODULES-4128))
- Update support PowerShell 5.1 ([MODULES-3977](https://tickets.puppet.com/browse/MODULES-3977))
- Include April 2017 DSC Resource Kit release ([MODULES-4747](https://tickets.puppet.com/browse/MODULES-4747))

### Fixed

- Fix building custom DSC Resources ([MODULES-4201](https://tickets.puppet.com/browse/MODULES-4201))
- Add known issue with `dsc_file` to README ([MODULES-3178](https://tickets.puppet.com/browse/MODULES-3178))
- Fix DSC repository name case ([MODULES-4430](https://tickets.puppet.com/browse/MODULES-4430))
- Module manifest parser does not handle double quotes ([MODULES-4422](https://tickets.puppet.com/browse/MODULES-4422))
- Update error message on older PowerShell versions ([MODULES-4014](https://tickets.puppet.com/browse/MODULES-4014))
- Add facade rake tasks for use in CI and Test Tiering ([MODULES-4667](https://tickets.puppet.com/browse/MODULES-4667))
- Fix integration test failing due to pre-existing reboot condition

## [1.2.0] - 2016-11-10

### Added

- Add psDscRunAsCredential Support ([FM-5671](https://tickets.puppet.com/browse/MODULES-5671))
- Include September DSC Resource Kit release ([MODULES-3983](https://tickets.puppet.com/browse/MODULES-3983))
- Include November DSC Resource Kit release ([MODULES-4059](https://tickets.puppet.com/browse/MODULES-4059))

### Fixed

- Fix WaitForAll blacklist test ([MODULES-3764](https://tickets.puppet.com/browse/MODULES-3764))
- Update travis/appveyor with Ruby 2.3 ([MODULES-3775](https://tickets.puppet.com/browse/MODULES-3775))
- Support new MS supported Official DSC Resources ([MODULES-3683](https://tickets.puppet.com/browse/MODULES-3683))
- Fix maxpath issues ([MODULES-3683](https://tickets.puppet.com/browse/MODULES-3683))

## [1.1.0] - 2016-08-08

### Added

- Nano Server Compatibility ([MODULES-3343](https://tickets.puppet.com/browse/MODULES-3343))
- Better tracking of DSC Resource version with `dsc_resource_release_tags.yml` file ([MODULES-3228](https://tickets.puppet.com/browse/MODULES-3228))([MODULES-3674](https://tickets.puppet.com/browse/MODULES-3674))
- Revendored DSC Resources as of 26th July 2016

### Fixed

- Tests failing on PE 3.8.x because master_manipluator is pinned ([MODULES-2772](https://tickets.puppet.com/browse/MODULES-2772))
- Improve the DSC Build import process ([FM-4661](https://tickets.puppet.com/browse/FM-4661))
- Tests failing due to RSpec 3+ compatibility ([FM-4915](https://tickets.puppet.com/browse/FM-4915))
- Remove unnecessary files from module build
- Simplify 'Ensure' Property Handling ([MODULES-3133](https://tickets.puppet.com/browse/MODULES-3133))
- Upgrade MOF Parser for UTF8-BOMs ([MODULES-3133](https://tickets.puppet.com/browse/MODULES-3133))
- Update links for WM5 Production release
- Increase execution timeout ([MODULES-3342](https://tickets.puppet.com/browse/MODULES-3342))
- Fix acceptance tests for MySQL DSC resource ([MODULES-3431](https://tickets.puppet.com/browse/MODULES-3431))
- Update documentation with Module Version strategy ([MODULES-3491](https://tickets.puppet.com/browse/MODULES-3491))

## [1.0.1] - 2016-03-17

### Fixed

- The tar file format for the module has been changed to work around a bug in the Puppet module tool ([PUP-5994](https://tickets.puppet.com/browse/PUP-5994)). When installing the module on Windows with the Puppet module tool command `puppet module install puppetlab-dsc`, all files present in the tar.gz archive are not properly copied to the module directory. This is due to a bug in the module tool that is fixed as part of ([PUP-5994](https://tickets.puppet.com/browse/PUP-5994)) and ships in the Puppet Enterprise 3.8.7, puppet-agent 1.4.0, or newer installers.  To enable existing Windows agents to properly install the module, it was necessary to repack the module in a different manner to work around this problem.

## [1.0.0] - 2016-01-19

### Added

- Reuse PowerShell instance for increased performance ([MODULES-2709](https://tickets.puppet.com/browse/MODULES-2709))
- Support PSCredentials, KeyValuePair and other arbitrary EmbeddedInstance MOF Classes ([MODULES-2178](https://tickets.puppet.com/browse/MODULES-2178))
- Update DSC Modules to latest available as of November 15, 2015. (Commit [84a467c](https://github.com/PowerShell/DscResources/tree/84a467c30379a57202bed721d259a517a138290c) of [PowerShell/DscResources](https://github.com/PowerShell/DscResources/))
- Propagate DSC resource 'RebootRequired' status via Puppet notify, enabling DSC resources to trigger a system reboot ([MODULES-2641](https://tickets.puppet.com/browse/MODULES-2641))

### Fixed

- Module dependencies are incompatible with Puppet 3.x ([MODULES-2514](https://tickets.puppet.com/browse/MODULES-2514))
- Only allow module to run on PowerShell v5 ([MODULES-2521](https://tickets.puppet.com/browse/MODULES-2521))
- Setting LCM Mode to "Pull" Causes crash ([MODULES-2485](https://tickets.puppet.com/browse/MODULES-2485))
- Empty password for PSCredential causes crash ([MODULES-2615](https://tickets.puppet.com/browse/MODULES-2615))
- Module doesn't properly handle signed integers ([MODULES-2759](https://tickets.puppet.com/browse/MODULES-2759))
- Package resource fails when ReturnCode is specified ([MODULES-2562](https://tickets.puppet.com/browse/MODULES-2562))
- Symlinking vendored modules causes duplicate errors if the same version of one of the modules is already installed ([MODULES-2837](https://tickets.puppet.com/browse/MODULES-2837))

### Removed

- Remove LCM Refresh Mode Disabled Requirement ([MODULES-2575](https://tickets.puppet.com/browse/MODULES-2575))
- Remove Unsupported DSC Resource Types xChrome, xDscDiagnostics, xFireFox, xSafeHarbor, xSecurity, MSFT_WaitForAll, MSFT_WaitForAny and MSFT_WaitForSome ([MODULES-2244](https://tickets.puppet.com/browse/MODULES-2244)).
- Further reduce the module size by removing unnecessary files ([MODULES-2777](https://tickets.puppet.com/browse/MODULES-2777))

## [0.8.1] - 2015-09-02

### Summary

### Changed

- Update WMF 5 links to production preview

### Fixed

- Fix links in metadata.json

## [0.8.0] - 2015-09-02

### Added

- Use WMF 5 instead of WMF 4 to take advantage of a much faster and more direct Invoke-DscResource over Start-DscConfiguration ([MODULES-1960](https://tickets.puppet.com/browse/MODULES-1960))
- Use latest DSC Resources from the PowerShell Gallery.
- Allow setting the LCM RefreshMode as a defined type. ([MODULES-2243](https://tickets.puppet.com/browse/MODULES-2243))
- Commit generated types / specs ([MODULES-1956](https://tickets.puppet.com/browse/MODULES-1956))
- Vendor resource kit files and ensure on PSModulePath so user doesn't need to install all of the resources ([MODULES-2175](https://tickets.puppet.com/browse/MODULES-2175))

### Fixed

- Fix `dsc_ensure => absent` ([MODULES-2267](https://tickets.puppet.com/browse/MODULES-2267))
- Use original MOF gem for building types ([MODULES-1957](https://tickets.puppet.com/browse/MODULES-1957))
- Call PowerShell with arguments ([MODULES-2182](https://tickets.puppet.com/browse/MODULES-2182))
- Manage DSC resources without ensure ([MODULES-2257](https://tickets.puppet.com/browse/MODULES-2257))
- Mixing quotes causes crash ([MODULES-2442](https://tickets.puppet.com/browse/MODULES-2242))
- Uint8 type generation ([MODULES-2481](https://tickets.puppet.com/browse/MODULES-2481))
- Ensure Puppet 4 compatibility ([MODULES-2299](https://tickets.puppet.com/browse/MODULES-2299))

## [0.1.1] - 2014-09-19 (msutter)

### Added

- add linting
- rewrite for encoding issues
- fix doc typo

### Fixed

- fix import of base resource 'file'
- fix dsc File resource
- remove includeallfeature attribute from IIS role

## [0.1.0] - 2014-09-15 (msutter)

### Summary

Initial release to provide user the ability to manage PowerShell DSC resources with Puppet.
