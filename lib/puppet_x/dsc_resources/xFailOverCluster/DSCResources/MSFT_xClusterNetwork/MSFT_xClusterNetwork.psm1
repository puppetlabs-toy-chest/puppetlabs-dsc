Import-Module -Name (Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) `
        -ChildPath 'CommonResourceHelper.psm1')

$script:localizedData = Get-LocalizedData -ResourceName 'MSFT_xClusterNetwork'

<#
    .SYNOPSIS
        Returns the current state of the failover cluster network resource.

    .PARAMETER Address
        The address for the cluster network in the format '10.0.0.0'.

    .PARAMETER AddressMask
        The address mask for the cluster network in the format '255.255.255.0'.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Address,

        [Parameter(Mandatory = $true)]
        [System.String]
        $AddressMask
    )

    Write-Verbose -Message ($script:localizedData.GetClusterNetworkInformation -f $Name)

    $NetworkResource = Get-ClusterNetwork | Where-Object -FilterScript {
        $_.Address -eq $Address -and $_.AddressMask -eq $AddressMask
    }

    @{
        Address     = $Address
        AddressMask = $AddressMask
        Name        = $NetworkResource.Name
        Role        = $NetworkResource.Role
        Metric      = $NetworkResource.Metric
    }
}

<#
    .SYNOPSIS
        Configures the properties Name, Role and Metric of the failover cluster
        network resource.

    .PARAMETER Address
        The address for the cluster network in the format '10.0.0.0'.

    .PARAMETER AddressMask
        The address mask for the cluster network in the format '255.255.255.0'.

    .PARAMETER Name
        The name of the cluster network. If the cluster network name is not in
        desired state it will be renamed to match this name.

    .PARAMETER Role
        The role of the cluster network. If the cluster network role is not in
        desired state it will change to match this role.

        The cluster network role can be set to either the value 0, 1 or 3.

        0 = Do not allow cluster network communication
        1 = Allow cluster network communication only
        3 = Allow cluster network communication and client connectivity

        See this article for more information about cluster network role values;
        https://technet.microsoft.com/en-us/library/dn550728(v=ws.11).aspx

    .PARAMETER Metric
        The metric number for the cluster network. If the cluster network metric
        number is not in desired state it will be changed to match this metric
        number.
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Address,

        [Parameter(Mandatory = $true)]
        [System.String]
        $AddressMask,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [ValidateSet('0', '1', '3')]
        [System.String]
        $Role,

        [Parameter()]
        [System.String]
        $Metric
    )

    $getTargetResourceResult = Get-TargetResource -Address $Address -AddressMask $AddressMask

    if ($PSBoundParameters.ContainsKey('Name') -and $getTargetResourceResult.Name -ne $Name)
    {
        Write-Verbose -Message ($script:localizedData.ChangeNetworkName -f $Address, $AddressMask, $Name)

        $clusterNetworkResource = Get-ClusterNetwork | Where-Object -FilterScript {
            $_.Address -eq $Address -and $_.AddressMask -eq $AddressMask
        }
        $clusterNetworkResource.Name = $Name
        $clusterNetworkResource.Update()
    }

    if ($PSBoundParameters.ContainsKey('Role') -and $getTargetResourceResult.Role -ne $Role)
    {
        Write-Verbose -Message ($script:localizedData.ChangeNetworkRole -f $Address, $AddressMask, $Role)

        $clusterNetworkResource = Get-ClusterNetwork | Where-Object -FilterScript {
            $_.Address -eq $Address -and $_.AddressMask -eq $AddressMask
        }
        $clusterNetworkResource.Role = $Role
        $clusterNetworkResource.Update()
    }

    if ($PSBoundParameters.ContainsKey('Metric') -and $getTargetResourceResult.Metric -ne $Metric)
    {
        Write-Verbose -Message ($script:localizedData.ChangeNetworkMetric -f $Address, $AddressMask, $Metric)

        $clusterNetworkResource = Get-ClusterNetwork | Where-Object -FilterScript {
            $_.Address -eq $Address -and $_.AddressMask -eq $AddressMask
        }
        $clusterNetworkResource.Metric = $Metric
        $clusterNetworkResource.Update()
    }
}

<#
    .SYNOPSIS
        Tests that the failover cluster network resource exist and has the correct
        values for the properties Name, Role and Metric.

    .PARAMETER Address
        The address for the cluster network in the format '10.0.0.0'.

    .PARAMETER AddressMask
        The address mask for the cluster network in the format '255.255.255.0'.

    .PARAMETER Name
        The name of the cluster network. If the cluster network name is not in
        desired state it will be renamed to match this name.

    .PARAMETER Role
        The role of the cluster network. If the cluster network role is not in
        desired state it will change to match this role.

        The cluster network role can be set to either the value 0, 1 or 3.

        0 = Do not allow cluster network communication
        1 = Allow cluster network communication only
        3 = Allow cluster network communication and client connectivity

        See this article for more information about cluster network role values;
        https://technet.microsoft.com/en-us/library/dn550728(v=ws.11).aspx

    .PARAMETER Metric
        The metric number for the cluster network. If the cluster network metric
        number is not in desired state it will be changed to match this metric
        number.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Address,

        [Parameter(Mandatory = $true)]
        [System.String]
        $AddressMask,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [ValidateSet('0', '1', '3')]
        [System.String]
        $Role,

        [Parameter()]
        [System.String]
        $Metric
    )

    Write-Verbose -Message ($script:localizedData.EvaluatingClusterNetworkInformation -f $Name)

    $getTargetResourceResult = Get-TargetResource -Address $Address -AddressMask $AddressMask

    $testTargetResourceReturnValue = $true

    if ($PSBoundParameters.ContainsKey('Name'))
    {
        if ($Name -ne $getTargetResourceResult.Name)
        {
            $testTargetResourceReturnValue = $false
        }
    }

    if ($PSBoundParameters.ContainsKey('Role'))
    {
        if ($Role -ne $getTargetResourceResult.Role)
        {
            $testTargetResourceReturnValue = $false
        }
    }

    if ($PSBoundParameters.ContainsKey('Metric'))
    {
        if ($Metric -ne $getTargetResourceResult.Metric)
        {
            $testTargetResourceReturnValue = $false
        }
    }

    $testTargetResourceReturnValue
}

Export-ModuleMember -Function *-TargetResource
