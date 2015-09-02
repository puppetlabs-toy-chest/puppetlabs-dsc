##2015-09-02 - Unsupported Release 0.8.1

###Summary

Fix forge links and update url for WMF 5.

###Features
- Update WMF 5 links to production preview

###Bugfixes
- Fix links in metadata.json


##2015-09-02 - Initial Puppet Labs Unsupported Release 0.8.0

###Summary

Initial release from Puppet Labs moving to PowerShell 5 to take advantage of Invoke-DSCResource. Instead of a DSC Resource Kit, update to use the latest DSC resources from the PowerShell Gallery and bundle the resources with the module.

###Features
- Use WMF 5 instead of WMF 4 to take advantage of a much faster and more direct Invoke-DscResource over Start-DscConfiguration (MODULES-1960)
- Use latest DSC Resources from the PowerShell Gallery.
- Allow setting the LCM RefreshMode as a defined type. (MODULES-2243)
- Commit generated types / specs (MODULES-1956)
- Vendor resource kit files and ensure on PSModulePath so user doesn't need to install all of the resources (MODULES-2175)

###Bugfixes
- Fix `dsc_ensure => absent` (MODULES-2267)
- Use original MOF gem for building types (MODULES-1957)
- Call PowerShell with arguments (MODULES-2182)
- Manage DSC resources without ensure (MODULES-2257)
- Mixing quotes causes crash (MODULES-2442)
- Uint8 type generation (MODULES-2481)
- Ensure Puppet 4 compatibility (MODULES-2299)


##2014-09-19 - Release 0.1.1 (msutter)

###Summary

###Features
- add linting
- rewrite for encoding issues
- fix doc typo

###Bugfixes
- fix import of base resource 'file'
- fix dsc File resource
- remove includeallfeature attribute from IIS role


##2014-09-15 - Initial Release 0.1.0 (msutter)

###Summary

Initial release to provide user the ability to manage PowerShell DSC resources with Puppet.
