@{

ModuleVersion = '1.9.0.0'

GUID = '026e7fd8-06dd-41bc-b373-59366ab18679'

Author = 'Microsoft Corporation'

CompanyName = 'Microsoft Corporation'

Copyright = '(c) 2018 Microsoft Corporation. All rights reserved.'

Description = 'Module containing DSC resources used to configure Failover Clusters.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0'

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
        ReleaseNotes = '- Changes to xFailoverCluster
  - Update Pester syntax to v4
  - Updated year to 2018 in license file and module manifest ([issue 167](https://github.com/PowerShell/xFailOverCluster/issues/167)).
- Changes to xClusterNetwork
  - Updated readme to describe process for adding and removing additional networks on clusters
- Changes to xCluster
  - Allow the cluster to be assigned an IP address from a DHCP ([issue 109](https://github.com/PowerShell/xFailOverCluster/issues/109)).
    When the parameter StaticIPAddress is not specified then the cluster will be
    configured to use an IP address from a DHCP.
  - Get-TargetResource now correctly returns the IP address instead of throwing
    and error ([issue 28](https://github.com/PowerShell/xFailOverCluster/issues/28)).
  - Added -IgnoreNetwork parameter ([issue 143](https://github.com/PowerShell/xFailOverCluster/issues/143)).
- Changes to xClusterQuorum
  - When using NodeAndFileShareMajority on Windows Server 2016 any subsequent run
    failed when Test-TargetResource validated the configuration.
  - Cleaned up tests which was using over complicated evaluation code.
  - Added cloud witness (Azure storage) functionality on Windows 2016
    ([issue 37](https://github.com/PowerShell/xFailOverCluster/issues/37)).

'

    } # End of PSData hashtable

} # End of PrivateData hashtable
}




