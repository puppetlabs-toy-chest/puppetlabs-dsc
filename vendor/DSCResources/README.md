## DSC Resource Kit Wave 6

This is a fixed version of the [DSC Resource Kit Wave 6](http://gallery.technet.microsoft.com/scriptcenter/DSC-Resource-Kit-All-c449312d)

The fixes are for compatibility with the MOF parser. This is originally from https://github.com/msutter/dsc-resource-kit-wave-6


## Fixes

Resource: xRDRemoteApp
- removing resource MSFT_xRDRemoteApp due to parsing error

Resource: xRemoteDesktopAdmin
- renaming class xRemoteDesktopAdmin to MSFT_xRemoteDesktopAdmin

Resource: MSFT_xWindowsOptionalFeature
- Change validateset of ensure from 'enable,disable' to 'present,absent' and adapt the ps code

Resource: MSFT_xWordPressSite
- Add Absent to valuemap in mof schema

## Notes

Be aware that the composite resources in this resource kit are not automaticaly discovered from the puppet dsc module at types build time.
If you'd like to generate a puppet type for them, you have to manually create a xxx.schema.mof file next to the xxx.schema.psm1 file.


