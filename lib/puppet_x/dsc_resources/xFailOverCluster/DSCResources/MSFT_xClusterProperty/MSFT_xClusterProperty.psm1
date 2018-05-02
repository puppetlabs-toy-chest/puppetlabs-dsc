Import-Module -Name (Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) `
        -ChildPath 'CommonResourceHelper.psm1')

$script:localizedData = Get-LocalizedData -ResourceName 'MSFT_xClusterProperty'

<#
    .SYNOPSIS
        Configures cluster properties.

    .PARAMETER Name
        Name of the cluster.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name
    )

    Write-Verbose -Message ($script:localizedData.GettingClusterProperties -f $Name)

    $cluster = Get-Cluster -Name $Name
    $returnValue = @{
    Name                        = $Name
    AddEvictDelay               = $cluster.AddEvictDelay
    ClusterLogLevel             = $cluster.ClusterLogLevel
    ClusterLogSize              = $cluster.ClusterLogSize
    CrossSiteDelay              = $cluster.CrossSiteDelay
    CrossSiteThreshold          = $cluster.CrossSiteThreshold
    Description                 = $cluster.Description
    CrossSubnetDelay            = $cluster.CrossSubnetDelay
    CrossSubnetThreshold        = $cluster.CrossSubnetThreshold
    DatabaseReadWriteMode       = $cluster.DatabaseReadWriteMode
    DefaultNetworkRole          = $cluster.DefaultNetworkRole
    DrainOnShutdown             = $cluster.DrainOnShutdown
    DynamicQuorum               = $cluster.DynamicQuorum
    NetftIPSecEnabled           = $cluster.NetftIPSecEnabled
    QuarantineDuration          = $cluster.QuarantineDuration
    PreferredSite               = $cluster.PreferredSite
    QuarantineThreshold         = $cluster.QuarantineThreshold
    SameSubnetDelay             = $cluster.SameSubnetDelay
    SameSubnetThreshold         = $cluster.SameSubnetThreshold
    ShutdownTimeoutInMinutes    = $cluster.ShutdownTimeoutInMinutes
    }

    return $returnValue
}
<#
    .SYNOPSIS
        Configures cluster properties.

    .PARAMETER AddEvictDelay
        Specifies how many seconds after a node is evicted that the failover cluster service will wait before adding a new node.

    .PARAMETER ClusterLogLevel
        Controls the level of cluster logging.

    .PARAMETER ClusterLogSize
        Controls the maximum size of the cluster log files on each of the nodes.

    .PARAMETER CrossSiteDelay
        Controls the time interval, in milliseconds, that the cluster network driver waits between sending Cluster Service heartbeats across sites.

    .PARAMETER CrossSiteThreshold
        Controls how many Cluster Service heartbeats can be missed across sites before it determines that Cluster Service has stopped responding.

    .PARAMETER CrossSubnetDelay
        Controls the time interval, in milliseconds, that the cluster network driver waits between sending Cluster Service heartbeats across subnets.

    .PARAMETER CrossSubnetThreshold
        Controls how many Cluster Service heartbeats can be missed across subnets before it determines that Cluster Service has stopped responding.

    .PARAMETER DatabaseReadWriteMode
        Specifies the read/write mode for the cluster database.

    .PARAMETER DefaultNetworkRole
        Specifies the role that the cluster automatically assigns to any newly discovered or created network.

    .PARAMETER Description
        Stores administrative comments about the cluster. The following table summarizes the attributes of the Description property.

    .PARAMETER DrainOnShutdown
        Specifies whether to enable Node Drain for a cluster.

    .PARAMETER DynamicQuorum
        Enables the cluster to change the required number of nodes that need to participate in quorum when nodes shut down or crash.

    .PARAMETER Name
        Name of the cluster.

    .PARAMETER NetftIPSecEnabled
        Specifies whether Internet Protocol Security (IPSec) encryption is enabled for inter-node cluster communication.

    .PARAMETER PreferredSite
        Specifies the preferred site for a site-aware cluster.

    .PARAMETER QuarantineDuration
        Specifies the quarantine duration for a node, in seconds.

    .PARAMETER QuarantineThreshold
        Specifies the quarantine threshold for a node, in minutes.

    .PARAMETER SameSubnetDelay
        Controls the delay, in milliseconds, between netft heartbeats.

    .PARAMETER SameSubnetThreshold
        Controls how many heartbeats can be missed on the same subnet before the route is declared as unreachable.

    .PARAMETER ShutdownTimeoutInMinutes
        Specifies how many minutes after a system shutdown is initiated that the failover cluster service will wait for resources to go offline.
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.UInt32]
        $AddEvictDelay,

        [Parameter()]
        [System.UInt32]
        $ClusterLogLevel,

        [Parameter()]
        [System.UInt32]
        $ClusterLogSize,

        [Parameter()]
        [System.UInt32]
        $CrossSiteDelay,

        [Parameter()]
        [System.UInt32]
        $CrossSiteThreshold,

        [Parameter()]
        [System.UInt32]
        $CrossSubnetDelay,

        [Parameter()]
        [System.UInt32]
        $CrossSubnetThreshold,

        [Parameter()]
        [System.UInt32]
        $DatabaseReadWriteMode,

        [Parameter()]
        [System.UInt32]
        $DefaultNetworkRole,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.UInt32]
        $DrainOnShutdown,

        [Parameter()]
        [System.UInt32]
        $DynamicQuorum,

        [Parameter()]
        [System.UInt32]
        $NetftIPSecEnabled,

        [Parameter()]
        [System.String]
        $PreferredSite,

        [Parameter()]
        [System.UInt32]
        $QuarantineDuration,

        [Parameter()]
        [System.UInt32]
        $QuarantineThreshold,

        [Parameter()]
        [System.UInt32]
        $SameSubnetDelay,

        [Parameter()]
        [System.UInt32]
        $SameSubnetThreshold,

        [Parameter()]
        [System.UInt32]
        $ShutdownTimeoutInMinutes
    )

    Write-Verbose -Message ($script:localizedData.SettingClusterProperties)

    $boundParameters = $PSBoundParameters
    $boundParameters.Remove('Name') | Out-Null
    $boundParameters.Remove('Verbose') | Out-Null

    $cluster = Get-Cluster -Name $Name
    foreach ($boundParameter in $boundParameters.GetEnumerator())
    {
        Write-Verbose -Message ($script:localizedData.SettingClusterProperty -f $($boundParameter.Key), $boundParameter.Value)
        $cluster.$($boundParameter.Key) = $boundParameter.Value
    }
}
<#
    .SYNOPSIS
        Configures cluster properties.

    .PARAMETER AddEvictDelay
        Specifies how many seconds after a node is evicted that the failover cluster service will wait before adding a new node.

    .PARAMETER ClusterLogLevel
        Controls the level of cluster logging.

    .PARAMETER ClusterLogSize
        Controls the maximum size of the cluster log files on each of the nodes.

    .PARAMETER CrossSiteDelay
        Controls the time interval, in milliseconds, that the cluster network driver waits between sending Cluster Service heartbeats across sites.

    .PARAMETER CrossSiteThreshold
        Controls how many Cluster Service heartbeats can be missed across sites before it determines that Cluster Service has stopped responding.

    .PARAMETER CrossSubnetDelay
        Controls the time interval, in milliseconds, that the cluster network driver waits between sending Cluster Service heartbeats across subnets.

    .PARAMETER CrossSubnetThreshold
        Controls how many Cluster Service heartbeats can be missed across subnets before it determines that Cluster Service has stopped responding.

    .PARAMETER DatabaseReadWriteMode
        Specifies the read/write mode for the cluster database.

    .PARAMETER DefaultNetworkRole
        Specifies the role that the cluster automatically assigns to any newly discovered or created network.

    .PARAMETER Description
        Stores administrative comments about the cluster. The following table summarizes the attributes of the Description property.

    .PARAMETER DrainOnShutdown
        Specifies whether to enable Node Drain for a cluster.

    .PARAMETER DynamicQuorum
        Enables the cluster to change the required number of nodes that need to participate in quorum when nodes shut down or crash.

    .PARAMETER Name
        Name of the cluster.

    .PARAMETER NetftIPSecEnabled
        Specifies whether Internet Protocol Security (IPSec) encryption is enabled for inter-node cluster communication.

    .PARAMETER PreferredSite
        Specifies the preferred site for a site-aware cluster.

    .PARAMETER QuarantineDuration
        Specifies the quarantine duration for a node, in seconds.

    .PARAMETER QuarantineThreshold
        Specifies the quarantine threshold for a node, in minutes.

    .PARAMETER SameSubnetDelay
        Controls the delay, in milliseconds, between netft heartbeats.

    .PARAMETER SameSubnetThreshold
        Controls how many heartbeats can be missed on the same subnet before the route is declared as unreachable.

    .PARAMETER ShutdownTimeoutInMinutes
        Specifies how many minutes after a system shutdown is initiated that the failover cluster service will wait for resources to go offline.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.UInt32]
        $AddEvictDelay,

        [Parameter()]
        [System.UInt32]
        $ClusterLogLevel,

        [Parameter()]
        [System.UInt32]
        $ClusterLogSize,

        [Parameter()]
        [System.UInt32]
        $CrossSiteDelay,

        [Parameter()]
        [System.UInt32]
        $CrossSiteThreshold,

        [Parameter()]
        [System.UInt32]
        $CrossSubnetDelay,

        [Parameter()]
        [System.UInt32]
        $CrossSubnetThreshold,

        [Parameter()]
        [System.UInt32]
        $DatabaseReadWriteMode,

        [Parameter()]
        [System.UInt32]
        $DefaultNetworkRole,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.UInt32]
        $DrainOnShutdown,

        [Parameter()]
        [System.UInt32]
        $DynamicQuorum,

        [Parameter()]
        [System.UInt32]
        $NetftIPSecEnabled,

        [Parameter()]
        [System.String]
        $PreferredSite,

        [Parameter()]
        [System.UInt32]
        $QuarantineDuration,

        [Parameter()]
        [System.UInt32]
        $QuarantineThreshold,

        [Parameter()]
        [System.UInt32]
        $SameSubnetDelay,

        [Parameter()]
        [System.UInt32]
        $SameSubnetThreshold,

        [Parameter()]
        [System.UInt32]
        $ShutdownTimeoutInMinutes
    )

    Write-Verbose -Message ($script:localizedData.GettingClusterProperties -f $Name)

    $boundParameters = $PSBoundParameters
    $boundParameters.Remove('Name') | Out-Null
    $boundParameters.Remove('Result') | Out-Null
    $boundParameters.Remove('Verbose') | Out-Null
    $boundParameters.Remove('Debug') | Out-Null

    $cluster = Get-Cluster -Name $Name

    $output = $true

    foreach ($boundParameter in $boundParameters.GetEnumerator())
    {
        if($cluster.$($boundParameter.Key) -ne $boundParameter.Value)
        {
            Write-Debug -Message ($script:localizedData.IncorrectClusterProperty -f $($boundParameter.Key), $cluster.$($boundParameter.Key), $boundParameter.Value)
            Write-Verbose -Message ($script:localizedData.IncorrectClusterProperty -f $($boundParameter.Key), $cluster.$($boundParameter.Key), $boundParameter.Value)
            $output = $false
        }
    }

    return $output
}

Export-ModuleMember -Function *-TargetResource
