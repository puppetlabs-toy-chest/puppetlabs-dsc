Import-Module -Name (Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) `
        -ChildPath 'CommonResourceHelper.psm1')

$script:localizedData = Get-LocalizedData -ResourceName 'MSFT_xClusterPreferredOwner'

<#
    .SYNOPSIS
        Returns the current state of the failover cluster group and cluster
        resource preferred owners.

    .PARAMETER ClusterGroup
        Name of the cluster group.

    .PARAMETER ClusterName
        Name of the cluster.

    .PARAMETER Nodes
        The nodes to set as owners.

    .PARAMETER ClusterResources
        The resources to set preferred owners on.

    .PARAMETER Ensure
        If the preferred owners should be present or absent. Default value is
        'Present'.
#>
function Get-TargetResource
{
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $ClusterGroup,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ClusterName,

        [Parameter(Mandatory = $true)]
        [System.String[]]
        $Nodes,

        [Parameter()]
        [System.String[]]
        $ClusterResources,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    Write-Verbose -Message ($script:localizedData.GetOwnerInformationForCluster -f $ClusterName)

    $ownerNodes = @(
        Write-Verbose -Message ($script:localizedData.GetOwnerInformationForClusterGroup -f $ClusterGroup)
        ((Get-ClusterGroup -Cluster $ClusterName | Where-Object -FilterScript {
                    $_.Name -like $ClusterGroup
                } | Get-ClusterOwnerNode).OwnerNodes).Name

        if ($ClusterResources)
        {
            foreach ($resource in $ClusterResources)
            {
                Write-Verbose -Message ($script:localizedData.GetOwnerInformationForClusterResource -f $resource)
                ((Get-ClusterResource -Cluster $ClusterName | Where-Object -FilterScript {
                            $_.Name -like $resource
                        } | Get-ClusterOwnerNode).OwnerNodes).Name
            }
        }
    )

    $ownerNodes = $ownerNodes | Select-Object -Unique

    @{
        ClusterGroup     = $ClusterGroup
        ClusterName      = $ClusterName
        Nodes            = $ownerNodes
        ClusterResources = $ClusterResources
        Ensure           = $Ensure
    }
}

<#
    .SYNOPSIS
        Configures the desired preferred owners on the failover cluster group and cluster
        resource.

    .PARAMETER ClusterGroup
        Name of the cluster group.

    .PARAMETER ClusterName
        Name of the cluster.

    .PARAMETER Nodes
        The nodes to set as owners.

    .PARAMETER ClusterResources
        The resources to set preferred owners on.

    .PARAMETER Ensure
        If the preferred owners should be present or absent. Default value is
        'Present'.
#>
function Set-TargetResource
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $ClusterGroup,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ClusterName,

        [Parameter(Mandatory = $true)]
        [System.String[]]
        $Nodes,

        [Parameter()]
        [System.String[]]
        $ClusterResources,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    Write-Verbose -Message ($script:localizedData.GetAllNodesOfCluster -f $ClusterName)
    $allNodes = (Get-ClusterNode -Cluster $ClusterName).Name

    if ($Ensure -eq 'Present')
    {
        Write-Verbose -Message ($script:localizedData.SetOwnerForClusterGroup -f $ClusterGroup, $Nodes)
        $null = Get-ClusterGroup -Cluster $ClusterName | Where-Object -FilterScript {
            $_.Name -like $ClusterGroup
        } | Set-ClusterOwnerNode -Owners $Nodes

        $null = Get-ClusterResource | Where-Object {
            $_.OwnerGroup -like $ClusterGroup
        } | Set-ClusterOwnerNode -Owners $allNodes

        Write-Verbose -Message ($script:localizedData.MoveClusterGroup -f $ClusterGroup, $Nodes[0])
        $null = Get-ClusterGroup -Cluster $ClusterName | Where-Object -FilterScript {
            $_.name -like $ClusterGroup
        } | Move-ClusterGroup -Node $Nodes[0]

        foreach ($resource in $ClusterResources)
        {
            Write-Verbose -Message ($script:localizedData.SetOwnerForClusterResource -f $resource, $Nodes)
            $null = Get-ClusterResource -Cluster $ClusterName | Where-Object -FilterScript {
                $_.Name -like $resource
            } | Set-ClusterOwnerNode -Owners $Nodes
        }
    }

    if ($Ensure -eq 'Absent')
    {
        Write-Verbose -Message ($script:localizedData.GetOwnerInformationForClusterGroup -f $ClusterGroup)
        $currentOwners = ((Get-ClusterGroup -Cluster $ClusterName | Where-Object -FilterScript {
                    $_.Name -like $ClusterGroup
                } | Get-ClusterOwnerNode).OwnerNodes).Name | Sort-Object -Unique

        $newOwners = @(
            foreach ($currentOwner in $currentOwners)
            {
                if ($Nodes -notcontains $currentOwner)
                {
                    $currentOwner
                }
            }
        )

        Write-Verbose -Message ($script:localizedData.RemoveOwnerFromClusterGroup -f $ClusterGroup, $Nodes)
        $null = Get-ClusterGroup -Cluster $ClusterName | Where-Object -FilterScript {
            $_.Name -like $ClusterGroup
        } | Set-ClusterOwnerNode $newOwners

        Write-Verbose -Message ($script:localizedData.SetOwnerForClusterGroup -f $ClusterGroup, $newOwners)
        $null = Get-ClusterResource | Where-Object -FilterScript {
            $_.OwnerGroup -like $ClusterGroup
        } | Set-ClusterOwnerNode $allNodes

        Write-Verbose -Message ($script:localizedData.MoveClusterGroup -f $ClusterGroup, $newOwners[0])
        $null = Get-ClusterGroup -Cluster $ClusterName | Where-Object -FilterScript {
            $_.Name -like $ClusterGroup
        } | Move-ClusterGroup -Node $newOwners[0]

        foreach ($resource in $ClusterResources)
        {
            Write-Verbose -Message ($script:localizedData.GetOwnerInformationForClusterResource -f $resource)
            $currentOwners = ((Get-ClusterResource -Cluster $ClusterName | Where-Object -FilterScript {
                        $_.Name -like $resource
                    } | Get-ClusterOwnerNode).OwnerNodes).Name | Sort-Object -Unique

            $newOwners = @(
                foreach ($currentOwner in $currentOwners)
                {
                    if ($Nodes -notcontains $currentOwner)
                    {
                        $currentOwner
                    }
                }
            )

            Write-Verbose -Message ($script:localizedData.SetOwnerForClusterResource -f $resource, $newOwners)
            $null = Get-ClusterResource -Cluster $ClusterName | Where-Object -FilterScript {
                $_.Name -like $resource
            } | Set-ClusterOwnerNode -Owners $newOwners
        }
    }
}

<#
    .SYNOPSIS
        Tests so that the desired preferred owners on the failover cluster group
        and cluster resource are in desired state.

    .PARAMETER ClusterGroup
        Name of the cluster group.

    .PARAMETER ClusterName
        Name of the cluster.

    .PARAMETER Nodes
        The nodes to set as owners.

    .PARAMETER ClusterResources
        The resources to set preferred owners on.

    .PARAMETER Ensure
        If the preferred owners should be present or absent. Default value is
        'Present'.
#>

function Test-TargetResource
{
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $ClusterGroup,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ClusterName,

        [Parameter(Mandatory = $true)]
        [System.String[]]
        $Nodes,

        [Parameter()]
        [System.String[]]
        $ClusterResources,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    Write-Verbose -Message ($script:localizedData.TestOwnerInformationForCluster -f $ClusterName)

    $getTargetResourceResult = (Get-TargetResource @PSBoundParameters).Nodes
    $result = $true

    if ($Ensure -eq 'Present')
    {
        foreach ($object in $getTargetResourceResult)
        {
            if ($Nodes -notcontains $object)
            {
                Write-Verbose -Message ($script:localizedData.WasNotFoundAsPossibleOwner -f $object)
                $result = $false
            }
        }

        foreach ($object in $Nodes)
        {
            if ($getTargetResourceResult -notcontains $object)
            {
                Write-Verbose -Message ($script:localizedData.WasNotFoundAsPossibleOwner -f $object)
                $result = $false
            }
        }
    }

    if ($Ensure -eq 'Absent')
    {
        foreach ($object in $getTargetResourceResult)
        {
            if ($Nodes -contains $object)
            {
                Write-Verbose -Message ($script:localizedData.WasFoundAsPossibleOwner -f $object)
                $result = $false
            }
        }

        foreach ($object in $Nodes)
        {
            if ($getTargetResourceResult -contains $object)
            {
                Write-Verbose -Message ($script:localizedData.WasFoundAsPossibleOwner -f $object)
                $result = $false
            }
        }
    }

    $result
}
