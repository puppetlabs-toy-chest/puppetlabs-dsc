@{
    # Version number of this module.
    moduleVersion = '3.2.0.0'

    # ID used to uniquely identify this module
    GUID              = 'f8ddd7fc-c6d6-469e-8a80-c96efabe2fcc'

    # Author of this module
    Author            = 'Microsoft Corporation'

    # Company or vendor of this module
    CompanyName       = 'Microsoft Corporation'

    # Copyright statement for this module
    Copyright         = '(c) 2018 Microsoft Corporation. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'This DSC Resource module can be used to install or uninstall Certificate Services components in Windows Server.'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '4.0'

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @()

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @()

    # DSC resources to export from this module
    DscResourcesToExport = @(
        'AdcsCertificationAuthority',
        'AdcsEnrollmentPolicyWebService',
        'AdcsOnlineResponder',
        'AdcsWebEnrollment',
        'AdcsOcspExtension'
        )

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags         = @('DesiredStateConfiguration', 'DSC', 'DSCResourceKit', 'DSCResource')

            # A URL to the license for this module.
            LicenseUri   = 'https://github.com/PowerShell/ActiveDirectoryCSDsc/blob/master/LICENSE'

            # A URL to the main website for this project.
            ProjectUri   = 'https://github.com/PowerShell/ActiveDirectoryCSDsc'

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
        ReleaseNotes = '- Added "DscResourcesToExport" to manifest to improve information in
  PowerShell Gallery - fixes [Issue 68](https://github.com/PowerShell/ActiveDirectoryCSDsc/issues/68).
- Removed unused CAType variables and references in AdcsOnlineResponder - fixes
  [issue 52](https://github.com/PowerShell/ActiveDirectoryCSDsc/issues/52).
- Updated Examples to enable publising to PowerShell Gallery - fixes
  [issue 54](https://github.com/PowerShell/ActiveDirectoryCSDsc/issues/54).
- Cleaned up property alignment in module manifest file.
- Added new resource AdcsOcspExtension - see [Issue 70](https://github.com/PowerShell/ActiveDirectoryCSDsc/issues/70).
  - Added new ActiveDirectoryCSDsc.CommonHelper.psm1 helper module and unit test.
  - Added stub function to /Tests/TestHelpers (ADCSStub.psm1) so Pester tests
    can run without having to install ADCSAdministration module.
- Converted module to auto-documentation Wiki - fixes [Issue 53](https://github.com/PowerShell/ActiveDirectoryCSDsc/issues/53).
- Enabled Example publishing to PSGallery.
- Moved change log to CHANGELOG.MD.
- Opted into Common Tests "Validate Example Files To Be Published",
  "Validate Markdown Links" and "Relative Path Length".
- Correct AppVeyor `Invoke-AppveyorAfterTestTask` - fixes [Issue 73](https://github.com/PowerShell/ActiveDirectoryCSDsc/issues/73).

'
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}

