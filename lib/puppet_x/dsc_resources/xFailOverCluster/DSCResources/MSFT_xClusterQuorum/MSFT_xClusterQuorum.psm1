Import-Module -Name (Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) `
        -ChildPath 'CommonResourceHelper.psm1')

$script:localizedData = Get-LocalizedData -ResourceName 'MSFT_xClusterQuorum'

<#
    .SYNOPSIS
        Returns the current state of the failover cluster quorum.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance
    )

    Write-Verbose -Message $script:localizedData.GetClusterQuorumInformation

    $getClusterQuorumResult = Get-ClusterQuorum

    switch ($getClusterQuorumResult.QuorumType)
    {
        # WS2016 only
        'Majority'
        {
            if ($null -eq $getClusterQuorumResult.QuorumResource)
            {
                $clusterQuorumType = 'NodeMajority'
            }
            elseif ($getClusterQuorumResult.QuorumResource.ResourceType.DisplayName -eq 'Physical Disk')
            {
                $clusterQuorumType = 'NodeAndDiskMajority'
            }
            elseif ($getClusterQuorumResult.QuorumResource.ResourceType.DisplayName -eq 'File Share Quorum Witness')
            {
                $clusterQuorumType = 'NodeAndFileShareMajority'
            }
            elseif ($getClusterQuorumResult.QuorumResource.ResourceType.DisplayName -eq 'Cloud Witness')
            {
                $clusterQuorumType = 'NodeAndCloudMajority'
            }
            else
            {
                throw "Unknown quorum resource: $($getClusterQuorumResult.QuorumResource)"
            }
        }

        # WS2012R2 only
        'NodeMajority'
        {
            $clusterQuorumType = 'NodeMajority'
        }

        'NodeAndDiskMajority'
        {
            $clusterQuorumType = 'NodeAndDiskMajority'
        }

        'NodeAndFileShareMajority'
        {
            $clusterQuorumType = 'NodeAndFileShareMajority'
        }

        # All
        'DiskOnly'
        {
            $clusterQuorumType = 'DiskOnly'
        }

        # Default
        default
        {
            throw "Unknown quorum type: $($getClusterQuorumResult.QuorumType)"
        }
    }

    if ($clusterQuorumType -eq 'NodeAndFileShareMajority')
    {
        $clusterQuorumResource = $getClusterQuorumResult.QuorumResource |
            Get-ClusterParameter -Name SharePath |
            Select-Object -ExpandProperty Value
    }
    elseif ($clusterQuorumType -eq 'NodeAndCloudMajority')
    {
        $clusterQuorumResource = $getClusterQuorumResult.QuorumResource |
            Get-ClusterParameter -Name AccountName |
            Select-Object -ExpandProperty Value
    }
    else
    {
        $clusterQuorumResource = [String] $getClusterQuorumResult.QuorumResource.Name
    }

    @{
        IsSingleInstance        = $IsSingleInstance
        Type                    = $clusterQuorumType
        Resource                = $clusterQuorumResource
        StorageAccountAccessKey = ""    # Return an empty value since we cannot retrieve the current Access Key
    }
}

<#
    .SYNOPSIS
        Configures the failover cluster quorum.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'.

    .PARAMETER Type
        Quorum type to use. Can be set to either NodeMajority, NodeAndDiskMajority,
        NodeAndFileShareMajority, NodeAndCloudMajority or DiskOnly.

    .PARAMETER Resource
        The name of the disk, file share or Azure storage account resource to use
        as witness. This parameter is optional if the quorum type is set to NodeMajority.

    .PARAMETER StorageAccountAccessKey
        The access key of the Azure storage account to use as witness.
        This parameter is required if the quorum type is set to NodeAndCloudMajority.
        The key is currently not updated if the resource is already set.
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance,

        [Parameter()]
        [ValidateSet('NodeMajority', 'NodeAndDiskMajority', 'NodeAndFileShareMajority', 'NodeAndCloudMajority', 'DiskOnly')]
        [System.String]
        $Type,

        [Parameter()]
        [System.String]
        $Resource,

        [Parameter()]
        [System.String]
        $StorageAccountAccessKey
    )

    Write-Verbose -Message ($script:localizedData.SetClusterQuorum -f $Type)

    switch ($Type)
    {
        'NodeMajority'
        {
            Set-ClusterQuorum -NodeMajority
        }

        'NodeAndDiskMajority'
        {
            Set-ClusterQuorum -NodeAndDiskMajority $Resource
        }

        'NodeAndFileShareMajority'
        {
            Set-ClusterQuorum -NodeAndFileShareMajority $Resource
        }

        'DiskOnly'
        {
            Set-ClusterQuorum -DiskOnly $Resource
        }

        'NodeAndCloudMajority'
        {
            Set-ClusterQuorum -CloudWitness -AccountName $Resource -AccessKey $StorageAccountAccessKey
        }
    }
}

<#
    .SYNOPSIS
        Tests the current state of the failover cluster quorum.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'.

    .PARAMETER Type
        Quorum type to use. Can be set to either NodeMajority, NodeAndDiskMajority,
        NodeAndFileShareMajority, NodeAndCloudMajority or DiskOnly.

    .PARAMETER Resource
        The name of the disk, file share or Azure storage account resource to use
        as witness. This parameter is optional if the quorum type is set to NodeMajority.

    .PARAMETER StorageAccountAccessKey
        The access key of the Azure storage account to use as witness.
        This parameter is required if the quorum type is set to NodeAndCloudMajority.
        The key is currently not updated if the resource is already set.
        Not used in Test-TargetResource.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance,

        [Parameter()]
        [ValidateSet('NodeMajority', 'NodeAndDiskMajority', 'NodeAndFileShareMajority', 'NodeAndCloudMajority', 'DiskOnly')]
        [System.String]
        $Type,

        [Parameter()]
        [System.String]
        $Resource,

        [Parameter()]
        [System.String]
        $StorageAccountAccessKey
    )

    Write-Verbose -Message $script:localizedData.EvaluatingClusterQuorumInformation

    $getGetTargetResourceResult = Get-TargetResource -IsSingleInstance $IsSingleInstance

    $testTargetResourceReturnValue = $false

    if ($getGetTargetResourceResult.Type -eq $Type -and $getGetTargetResourceResult.Resource -eq $Resource)
    {
        $testTargetResourceReturnValue = $true
    }

    $testTargetResourceReturnValue
}

Export-ModuleMember -Function *-TargetResource
