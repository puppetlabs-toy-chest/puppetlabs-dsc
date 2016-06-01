
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [String] $Address,

        [Parameter(Mandatory = $true)]
        [String] $AddressMask,

        [Parameter(Mandatory = $false)]
        [String] $Name,

        [Parameter(Mandatory = $false)]
        [ValidateSet("0","1","3")]
        [String] $Role,

        [Parameter(Mandatory = $false)]
        [String] $Metric
    )

    $NetworkResource = Get-ClusterNetwork | Where-Object { $_.Address -eq $Address -and $_.AddressMask -eq $AddressMask }

    @{
        Address     = $Address
        AddressMask = $AddressMask
        Name        = $NetworkResource.Name
        Role        = $NetworkResource.Role
        Metric      = $NetworkResource.Metric
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [String] $Address,

        [Parameter(Mandatory = $true)]
        [String] $AddressMask,

        [Parameter(Mandatory = $false)]
        [String] $Name,

        [Parameter(Mandatory = $false)]
        [ValidateSet("0","1","3")]
        [String] $Role,

        [Parameter(Mandatory = $false)]
        [String] $Metric
    )

    
    if (-not (Test-TargetResource -Address $Address -AddressMask $AddressMask -Name $Name -Role $Role -Metric $Metric))
    {
        $CurrentNetwork = Get-TargetResource -Address $Address -AddressMask $AddressMask

        if ($PSBoundParameters.ContainsKey('Name') -and $CurrentNetwork.Name -ne $Name)
        {
            Write-Verbose "Update the name of network $Address/$AddressMask to '$Name'"

            $NetworkResource = Get-ClusterNetwork | Where-Object { $_.Address -eq $Address -and $_.AddressMask -eq $AddressMask }
            $NetworkResource.Name = $Name
            $NetworkResource.Update()
        }

        if ($PSBoundParameters.ContainsKey('Role') -and $CurrentNetwork.Role -ne $Role)
        {
            Write-Verbose "Update the role of network $Address/$AddressMask to '$Role'"

            $NetworkResource = Get-ClusterNetwork | Where-Object { $_.Address -eq $Address -and $_.AddressMask -eq $AddressMask }
            $NetworkResource.Role = $Role
            $NetworkResource.Update()
        }

        if ($PSBoundParameters.ContainsKey('Metric') -and $CurrentNetwork.Metric -ne $Metric)
        {
            Write-Verbose "Update the metric of network $Address/$AddressMask to '$Metric'"

            $NetworkResource = Get-ClusterNetwork | Where-Object { $_.Address -eq $Address -and $_.AddressMask -eq $AddressMask }
            $NetworkResource.Metric = $Metric
            $NetworkResource.Update()
        }
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [String] $Address,

        [Parameter(Mandatory = $true)]
        [String] $AddressMask,

        [Parameter(Mandatory = $false)]
        [String] $Name,

        [Parameter(Mandatory = $false)]
        [ValidateSet("0","1","3")]
        [String] $Role,

        [Parameter(Mandatory = $false)]
        [String] $Metric
    )

    $CurrentNetwork = Get-TargetResource -Address $Address -AddressMask $AddressMask

    return (
        (($Name -eq $CurrentNetwork.Name) -or (-not $PSBoundParameters.ContainsKey('Name'))) -and
        (($Role -eq $CurrentNetwork.Role) -or (-not $PSBoundParameters.ContainsKey('Role'))) -and
        (($Metric -eq $CurrentNetwork.Metric) -or (-not $PSBoundParameters.ContainsKey('Metric')))
    )
}

Export-ModuleMember -Function *-TargetResource
