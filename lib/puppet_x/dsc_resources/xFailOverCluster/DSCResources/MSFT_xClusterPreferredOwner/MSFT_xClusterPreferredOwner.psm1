#
# MSFT_xClusterPreferredOwner: DSC resource to configure the Windows Failover Cluster Preferred Owner.
#

#
# The Get-TargetResource cmdlet.
#
function Get-TargetResource
{
    [OutputType([Hashtable])]
    param
    (    
        [parameter(Mandatory)]
        [string]
        $ClusterGroup,

        [parameter(Mandatory)]
        [string]
        $Clustername,

        [parameter(Mandatory)]
        [string[]]
        $Nodes,

        [string[]]
        $ClusterResources,

        [ValidateSet('Present', 'Absent')]
        [String]
        $Ensure = 'Present'
    )
    
    Write-Verbose -Message "Retrieving Owner information for cluster $Clustername..."

    $ownernodes = @(
        
        Write-Verbose -Message "Retrieving Owner information for Cluster Group $ClusterGroup"
        (((Get-ClusterGroup -cluster $Clustername)| Where-Object {$_.name -like "$ClusterGroup"} | Get-ClusterOwnerNode).ownernodes).name

        if ($ClusterResources)
        {
            foreach ($resource in $ClusterResources)
            {
                Write-Verbose -Message "Retrieving Owner information for Cluster Resource $resource"
                (((Get-ClusterResource -cluster $Clustername)| Where-Object {$_.name -like "$resource"} | Get-ClusterOwnerNode).ownernodes).name
            }
        }
    )
    $ownernodes = $ownernodes | Select-Object -Unique
    
    $returnValue = @{
        ClusterGroup = $ClusterGroup
        Clustername = $Clustername
        Nodes = $ownernodes
        ClusterResources = $ClusterResources
        Ensure = $Ensure
    }

    $returnValue
}

#
# The Set-TargetResource cmdlet.
#
function Set-TargetResource
{
    param
    (    
        [parameter(Mandatory)]
        [string]
        $ClusterGroup,

        [parameter(Mandatory)]
        [string]
        $Clustername,

        [parameter(Mandatory)]
        [string[]]
        $Nodes,

        [string[]]
        $ClusterResources,

        [ValidateSet('Present', 'Absent')]
        [String]
        $Ensure = 'Present'
    )

    Write-Verbose -Message "Retrieving all owners from cluster $Clustername"
    $allnodes = (Get-ClusterNode -cluster $ClusterName).name

    if ($Ensure -eq 'Present')
    {
        Write-Verbose -Message "Setting Cluster owners for Group $ClusterGroup to $nodes"
        $null = (Get-ClusterGroup -cluster $ClusterName)| Where-Object {$_.name -like $ClusterGroup} | Set-ClusterOwnerNode $Nodes
        $null = (Get-ClusterResource)| Where-Object {$_.OwnerGroup -like $ClusterGroup} | Set-ClusterOwnerNode $allnodes
        
        Write-Verbose -Message "Moving Cluster Group $ClusterGroup to node $($nodes[0])"
        $null = (Get-ClusterGroup -cluster $ClusterName)| Where-Object {$_.name -like $ClusterGroup} | Move-ClusterGroup -Node $Nodes[0]
        
        foreach ($resource in $ClusterResources)
        {
            Write-Verbose -Message "Setting Cluster owners for Resource $resource to $nodes"
            $null = (Get-ClusterResource -cluster $Clustername)| Where-Object {$_.name -like "$resource"} | Set-ClusterOwnerNode -owners $Nodes
        }
    }
    if ($Ensure -eq 'Absent')
    {          

            Write-Verbose -Message "Retrieving current clusterowners for group $ClusterGroup"
            $currentowners = (((Get-ClusterGroup -cluster $Clustername)| Where-Object {$_.name -like "$ClusterGroup"} | Get-ClusterOwnerNode).ownernodes).name | Sort-Object -Unique
            $newowners = @(
                foreach ($currentowner in $currentowners)
                {
                    if ($Nodes -notcontains $currentowner)
                    {
                        $currentowner
                    }
                }
            )
            Write-Verbose -Message "Removing owners from group $($ClusterGroup): $Nodes"
            $null = (Get-ClusterGroup -cluster $ClusterName)| Where-Object {$_.name -like $ClusterGroup} | Set-ClusterOwnerNode $newowners

            Write-Verbose -Message "Setting Cluster owners for Group $ClusterGroup to $newowners"
            $null = (Get-ClusterResource)| Where-Object {$_.OwnerGroup -like $ClusterGroup} | Set-ClusterOwnerNode $allnodes

            Write-Verbose -Message "Moving Cluster Group $ClusterGroup to node $($newowners[0])"
            $null = (Get-ClusterGroup -cluster $ClusterName)| Where-Object {$_.name -like $ClusterGroup} | Move-ClusterGroup -Node $newowners[0]

        foreach ($resource in $ClusterResources)
        {
            Write-Verbose -Message "Retrieving current clusterowners for resource $resource"
            $currentowners = ((Get-ClusterResource -cluster $Clustername | Where-Object {$_.name -like "$resource"} | Get-ClusterOwnerNode).ownernodes).name | Sort-Object -Unique
            $newowners = @(
                foreach ($currentowner in $currentowners)
                {
                    if ($Nodes -notcontains $currentowner)
                    {
                        $currentowner
                    }
                }
            )
            Write-Verbose -Message "Setting Cluster owners for Resource $resource to $newowners"
            $null = Get-ClusterResource -cluster $Clustername | Where-Object {$_.name -like "$resource"} | Set-ClusterOwnerNode -owners $newowners
        }
    } 
}

# 
# Test-TargetResource
#

function Test-TargetResource  
{
    [OutputType([Boolean])]
    param
    (    
        [parameter(Mandatory)]
        [string]
        $ClusterGroup,

        [parameter(Mandatory)]
        [string]
        $Clustername,

        [parameter(Mandatory)]
        [string[]]
        $Nodes,

        [string[]]
        $ClusterResources,

        [ValidateSet('Present', 'Absent')]
        [String]
        $Ensure = 'Present'
    )

    Write-Verbose -Message "Testing Owner information for cluster $Clustername..."

    $getinfo = (Get-TargetResource @PSBoundParameters).Nodes
    $result = $true

    if ($Ensure -eq 'Present')
        {
        foreach ($object in $getinfo)
        {
            if ($Nodes -notcontains $object)
            {
                Write-Verbose -Message "$object was NOT found as possible owner"
                $result = $false
            }
        }
        foreach ($object in $nodes)
        {
            if ($getinfo -notcontains $object)
            {
                Write-Verbose -Message "$object was NOT found as possible owner"
                $result = $false
            }
        }
    }

    if ($Ensure -eq 'Absent')
        {
        foreach ($object in $getinfo)
        {
            if ($Nodes -contains $object)
            {
                Write-Verbose -Message "$object WAS found as possible owner"
                $result = $false
            }
        }
        foreach ($object in $nodes)
        {
            if ($getinfo -contains $object)
            {
                Write-Verbose -Message "$object WAS found as possible owner"
                $result = $false
            }
        }
    }

    $result
}
