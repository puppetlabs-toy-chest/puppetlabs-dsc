

@{


ModuleVersion = '1.5.0.0'
GUID = '026e7fd8-06dd-41bc-b373-59366ab18679'

Author = 'Microsoft Corporation'
CompanyName = 'Microsoft Corporation'
Copyright = '(c) 2014 Microsoft Corporation. All rights reserved.'

Description = 'Module containing DSC resources used to configure Failover Clusters.'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('DesiredStateConfiguration', 'DSC', 'DSCResourceKit', 'DSCResource')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/PowerShell/xFailOverCluster/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/PowerShell/xFailOverCluster'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Added xClusterQuorum resource with options *NodeMajority*, *NodeAndDiskMajority*, *NodeAndFileShareMajority*, *DiskOnly*
* Currently does not implement cloudwitness for Windows 2016.
* Added xClusterDisk resource

'

    } # End of PSData hashtable

} # End of PrivateData hashtable
}


