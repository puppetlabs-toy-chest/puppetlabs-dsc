#region LocalizedData
$Culture = 'en-us'
if (Test-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath $PSUICulture))
{
    $Culture = $PSUICulture
}
Import-LocalizedData `
    -BindingVariable LocalizedData `
    -Filename TimezoneHelper.psd1 `
    -BaseDirectory $PSScriptRoot `
    -UICulture $Culture
#endregion

# Internal function to throw terminating error with specified errroCategory, errorId and errorMessage
function New-TerminatingError
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [String] $ErrorId,

        [Parameter(Mandatory)]
        [String] $ErrorMessage,

        [Parameter(Mandatory)]
        [System.Management.Automation.ErrorCategory] $ErrorCategory
    )

    $exception = New-Object System.InvalidOperationException $errorMessage
    $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception, $errorId, $errorCategory, $null
    throw $errorRecord
}

function Get-TimeZone
{
    [CmdletBinding()]
    param()
    
    Write-Verbose -Message ($LocalizedData.GettingTimezoneCimMessage)

    $TimeZone = (Get-CimInstance `
        -ClassName WIN32_Timezone `
        -Namespace root\cimv2).StandardName

    Write-Verbose -Message ($LocalizedData.CurrentTimezoneMessage `
        -f $Timezone)

    return $TimeZone
} # function Get-TimeZone

function Set-TimeZone
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [System.String]
        $TimeZone
    )
    $AddTypeCommand = Get-Command `
        -Module Microsoft.Powershell.Utility `
        -Name Add-Type `
        -ErrorAction SilentlyContinue
    if ($AddTypeCommand)
    {
        # We can use Reflection to modify the TimeZone
        Write-Verbose -Message ($LocalizedData.SettingTimezonedotNetMessage `
            -f $TimeZone)

        # Add the [TimeZoneHelper.TimeZone] type if it is not defined.
        if (-not ([System.Management.Automation.PSTypeName]'TimeZoneHelper.TimeZone').Type)
        {
            Write-Verbose -Message ($LocalizedData.AddingSetTimeZonedotNetTypeMessage)
            $SetTimeZoneCs = Get-Content `
                -Path (Join-Path -Path $PSScriptRoot -ChildPath 'SetTimeZone.cs') `
                -Raw
            Add-Type `
                -Language CSharp `
                -TypeDefinition $SetTimeZoneCs
        }
        Set-TimeZoneUsingNET -Timezone $TimeZone
    }
    else
    {
        # For Nano Server the tzutil must be used
        Write-Verbose -Message ($LocalizedData.SettingTimezoneTzUtilMessage `
            -f $TimeZone)

        try
        {
            & tzutil.exe @('/s',$TimeZone)
        }
        catch
        {
            $ErrorMsg = $_.Exception.Message
            Write-Verbose -Message $ErrorMsg
        }

        Write-Verbose -Message ($LocalizedData.TimezoneUpdatedMessage `
            -f $TimeZone)
    }
} # function Set-TimeZone

# This function exists so that the ::Set method can be mocked by Pester.
function Set-TimeZoneUsingNET {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [System.String]
        $TimeZone
    )
    [Microsoft.PowerShell.xTimeZone.TimeZone]::Set($TimeZone)
}
