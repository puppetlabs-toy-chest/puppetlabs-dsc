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

    Write-Verbose -Message "Retrieving Owner information for cluster $ClusterName..."

    $ownerNodes = @(

        Write-Verbose -Message "Retrieving Owner information for Cluster Group $ClusterGroup"
        (((Get-ClusterGroup -Cluster $ClusterName) | Where-Object -FilterScript {
            $_.Name -like $ClusterGroup
        } | Get-ClusterOwnerNode).OwnerNodes).Name

        if ($ClusterResources)
        {
            foreach ($resource in $ClusterResources)
            {
                Write-Verbose -Message "Retrieving Owner information for Cluster Resource $resource"
                (((Get-ClusterResource -Cluster $ClusterName) | Where-Object -FilterScript {
                    $_.Name -like $resource
                } | Get-ClusterOwnerNode).OwnerNodes).Name
            }
        }
    )

    $ownerNodes = $ownerNodes | Select-Object -Unique

    @{
        ClusterGroup = $ClusterGroup
        Clustername = $ClusterName
        Nodes = $ownerNodes
        ClusterResources = $ClusterResources
        Ensure = $Ensure
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

    Write-Verbose -Message "Retrieving all owners from cluster $ClusterName"
    $allNodes = (Get-ClusterNode -Cluster $ClusterName).Name

    if ($Ensure -eq 'Present')
    {
        Write-Verbose -Message "Setting Cluster owners for Group $ClusterGroup to $Nodes"
        $null = (Get-ClusterGroup -Cluster $ClusterName) | Where-Object -FilterScript {
            $_.Name -like $ClusterGroup
        } | Set-ClusterOwnerNode -Owners $Nodes

        $null = (Get-ClusterResource) | Where-Object {
            $_.OwnerGroup -like $ClusterGroup
        } | Set-ClusterOwnerNode -Owners $allNodes

        Write-Verbose -Message "Moving Cluster Group $ClusterGroup to node $($Nodes[0])"
        $null = (Get-ClusterGroup -Cluster $ClusterName) | Where-Object -FilterScript {
            $_.name -like $ClusterGroup
        } | Move-ClusterGroup -Node $Nodes[0]

        foreach ($resource in $ClusterResources)
        {
            Write-Verbose -Message "Setting Cluster owners for Resource $resource to $Nodes"
            $null = (Get-ClusterResource -Cluster $ClusterName) | Where-Object -FilterScript {
                $_.Name -like $resource
            } | Set-ClusterOwnerNode -Owners $Nodes
        }
    }

    if ($Ensure -eq 'Absent')
    {
        Write-Verbose -Message "Retrieving current cluster owners for group $ClusterGroup"
        $currentOwners = (((Get-ClusterGroup -Cluster $ClusterName) | Where-Object -FilterScript {
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

        Write-Verbose -Message "Removing owners from group $($ClusterGroup): $Nodes"
        $null = (Get-ClusterGroup -Cluster $ClusterName) | Where-Object -FilterScript {
            $_.Name -like $ClusterGroup
        } | Set-ClusterOwnerNode $newOwners

        Write-Verbose -Message "Setting Cluster owners for Group $ClusterGroup to $newOwners"
        $null = (Get-ClusterResource) | Where-Object -FilterScript {
            $_.OwnerGroup -like $ClusterGroup
        } | Set-ClusterOwnerNode $allNodes

        Write-Verbose -Message "Moving Cluster Group $ClusterGroup to node $($newOwners[0])"
        $null = (Get-ClusterGroup -Cluster $ClusterName) | Where-Object -FilterScript {
            $_.Name -like $ClusterGroup
        } | Move-ClusterGroup -Node $newOwners[0]

        foreach ($resource in $ClusterResources)
        {
            Write-Verbose -Message "Retrieving current cluster owners for resource $resource"
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

            Write-Verbose -Message "Setting Cluster owners for Resource $resource to $newOwners"
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

    Write-Verbose -Message "Testing Owner information for cluster $ClusterName..."

    $getTargetResourceResult = (Get-TargetResource @PSBoundParameters).Nodes
    $result = $true

    if ($Ensure -eq 'Present')
    {
        foreach ($object in $getTargetResourceResult)
        {
            if ($Nodes -notcontains $object)
            {
                Write-Verbose -Message "$object was NOT found as possible owner"
                $result = $false
            }
        }

        foreach ($object in $Nodes)
        {
            if ($getTargetResourceResult -notcontains $object)
            {
                Write-Verbose -Message "$object was NOT found as possible owner"
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
                Write-Verbose -Message "$object WAS found as possible owner"
                $result = $false
            }
        }

        foreach ($object in $Nodes)
        {
            if ($getTargetResourceResult -contains $object)
            {
                Write-Verbose -Message "$object WAS found as possible owner"
                $result = $false
            }
        }
    }

    $result
}
