# Import the ADCS Deployment Resource Helper Module.
Import-Module -Name (Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) `
        -ChildPath (Join-Path -Path 'ActiveDirectoryCSDsc.ResourceHelper' `
            -ChildPath 'ActiveDirectoryCSDsc.ResourceHelper.psm1'))

# Import Localization Strings
$localizedData = Get-LocalizedData `
    -ResourceName 'ActiveDirectoryCSDsc.CommonHelper' `
    -ResourcePath $PSScriptRoot

<#

    .SYNOPSIS
        Restarts a System Service

    .PARAMETER Name
        Name of the service to be restarted.

#>
function Restart-ServiceIfExists
{
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [System.String]
        $Name
    )

    Write-Verbose -Message ($localizedData.GetServiceInformation -f $Name) -Verbose
    $servicesService = Get-Service @PSBoundParameters -ErrorAction Continue

    if ($servicesService)
    {
        Write-Verbose -Message ($localizedData.RestartService -f $Name) -Verbose
        $servicesService | Restart-Service -Force -ErrorAction Stop -Verbose
    }
    else
    {
        Write-Verbose -Message ($localizedData.UnknownService -f $Name) -Verbose
    }
}

Export-ModuleMember -Function Restart-ServiceIfExists
