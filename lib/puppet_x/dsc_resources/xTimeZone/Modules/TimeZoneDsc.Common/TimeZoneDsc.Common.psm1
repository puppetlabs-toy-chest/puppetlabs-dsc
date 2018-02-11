# Import the Networking Resource Helper Module
Import-Module -Name (Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) `
        -ChildPath (Join-Path -Path 'TimeZoneDsc.ResourceHelper' `
            -ChildPath 'TimeZoneDsc.ResourceHelper.psm1'))

# Import Localization Strings
$script:localizedData = Get-LocalizedData `
    -ResourceName 'TimeZoneDsc.Common' `
    -ResourcePath $PSScriptRoot

<#
    .SYNOPSIS
        Get the of the current time zone Id.
#>
function Get-TimeZoneId
{
    [CmdletBinding()]
    param
    (
    )

    if (Test-Command -Name 'Get-TimeZone' -Module 'Microsoft.PowerShell.Management')
    {
        Write-Verbose -Message ($LocalizedData.GettingTimeZoneMessage -f 'Cmdlets')

        $timeZone = (Get-TimeZone).StandardName
    }
    else
    {
        Write-Verbose -Message ($LocalizedData.GettingTimeZoneMessage -f 'CIM')

        $timeZone = (Get-CimInstance `
                -ClassName Win32_TimeZone `
                -Namespace root\cimv2).StandardName
    }

    Write-Verbose -Message ($LocalizedData.CurrentTimeZoneMessage `
            -f $timeZone)

    $timeZoneInfo = [System.TimeZoneInfo]::GetSystemTimeZones() |
        Where-Object StandardName -eq $timeZone

    return $timeZoneInfo.Id
} # function Get-TimeZoneId

<#
    .SYNOPSIS
        Compare a time zone Id with the current time zone Id.

    .PARAMETER TimeZoneId
        The Id of the time zone to compare with the current time zone.
#>
function Test-TimeZoneId
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $TimeZoneId
    )

    # Test if the expected value is the same as the current value.
    $currentTimeZoneId = Get-TimeZoneId

    return $TimeZoneId -eq $currentTimeZoneId
} # function Test-TimeZoneId

<#
    .SYNOPSIS
        Sets the current time zone using a time zone Id.

    .PARAMETER TimeZoneId
        The Id of the time zone to set.
#>
function Set-TimeZoneId
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $TimeZoneId
    )

    if (Test-Command -Name 'Set-TimeZone' -Module 'Microsoft.PowerShell.Management')
    {
        Set-TimeZone -Id $TimeZoneId
    }
    else
    {
        if (Test-Command -Name 'Add-Type' -Module 'Microsoft.Powershell.Utility')
        {
            # We can use reflection to modify the time zone.
            Write-Verbose -Message ($LocalizedData.SettingTimeZoneMessage `
                    -f $TimeZoneId, '.NET')

            Set-TimeZoneUsingDotNet -TimezoneId $TimeZoneId
        }
        else
        {
            # For anything else use TZUTIL.EXE.
            Write-Verbose -Message ($LocalizedData.SettingTimeZoneMessage `
                    -f $TimeZoneId, 'TZUTIL.EXE')

            try
            {
                & tzutil.exe @('/s', $TimeZoneId)
            }
            catch
            {
                Write-Verbose -Message $_.Exception.Message
            } # try
        } # if
    } # if

    Write-Verbose -Message ($LocalizedData.TimeZoneUpdatedMessage `
            -f $TimeZoneId)
} # function Set-TimeZoneId

<#
    .SYNOPSIS
        This function sets the time zone on the machine using .NET reflection.
        It exists so that the ::Set method can be mocked by Pester.

    .PARAMETER TimeZoneId
        The Id of the time zone to set using .NET.
#>
function Set-TimeZoneUsingDotNet
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $TimeZoneId
    )

    # Add the [TimeZoneHelper.TimeZone] type if it is not defined.
    if (-not ([System.Management.Automation.PSTypeName] 'TimeZoneHelper.TimeZone').Type)
    {
        Write-Verbose -Message ($LocalizedData.AddingSetTimeZoneDotNetTypeMessage)

        $setTimeZoneCs = Get-Content `
            -Path (Join-Path -Path $PSScriptRoot -ChildPath 'SetTimeZone.cs') `
            -Raw

        Add-Type `
            -Language CSharp `
            -TypeDefinition $setTimeZoneCs
    } # if

    [Microsoft.PowerShell.xTimeZone.TimeZone]::Set($TimeZoneId)
} # function Set-TimeZoneUsingDotNet

<#
    .SYNOPSIS
        This function tests if a cmdlet exists.

    .PARAMETER Name
        The name of the cmdlet to check for.

    .PARAMETER Module
        The module containing the command.
#>
function Test-Command
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Module
    )

    return ($null -ne (Get-Command @PSBoundParameters -ErrorAction SilentlyContinue))
} # function Test-Command

Export-ModuleMember -Function @(
    'Get-TimeZoneId'
    'Test-TimeZoneId'
    'Set-TimeZoneId'
    'Set-TimeZoneUsingDotNet'
    'Test-Command'
)
