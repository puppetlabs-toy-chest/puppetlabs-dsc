

@{


ModuleVersion = '1.4.0.0'

GUID = 'abee25c0-d40a-4bf2-a04e-ed059aba377b'

Author = 'Microsoft Corporation'

CompanyName = 'Microsoft Corporation'

Copyright = '(c) 2014 Microsoft Corporation. All rights reserved.'

Description = 'SQL module.'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('DesiredStateConfiguration', 'DSC', 'DSCResourceKit', 'DSCResource')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/PowerShell/xSqlPs/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/PowerShell/xSqlPs'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Converted appveyor.yml to install Pester from PSGallery instead of from Chocolatey.
* Fixed bugs in xSqlAlias that prevented the succesful creation of the aliases and caused errors.

'

    } # End of PSData hashtable

} # End of PrivateData hashtable
}

