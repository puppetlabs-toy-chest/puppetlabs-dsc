#region localizeddata
if (Test-Path "${PSScriptRoot}\${PSUICulture}")
{
    Import-LocalizedData `
        -BindingVariable LocalizedData `
        -Filename MSFT_SystemLocale.psd1 `
        -BaseDirectory "${PSScriptRoot}\${PSUICulture}"
}
else
{
    #fallback to en-US
    Import-LocalizedData `
        -BindingVariable LocalizedData `
        -Filename MSFT_SystemLocale.psd1 `
        -BaseDirectory "${PSScriptRoot}\en-US"
}
#endregion

<#
    .SYNOPSIS
    Returns the current System Local on the node.
    .PARAMETER IsSingleInstance
    Specifies the resource is a single instance, the value must be 'Yes'
    .PARAMETER SystemLocale
    Specifies the System Locale.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [String] $IsSingleInstance,

        [Parameter(Mandatory = $true)]
        [String] $SystemLocale
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingSystemLocaleMessage)
        ) -join '' )

    # Get the current System Locale
    $currentSystemLocale = Get-WinSystemLocale `
        -ErrorAction Stop

    # Generate the return object.
    $returnValue = @{
        IsSingleInstance = $IsSingleInstance
        SystemLocale     = $currentSystemLocale.Name
    }

    return $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
    Sets the current System Locale on the node.
    .PARAMETER IsSingleInstance
    Specifies the resource is a single instance, the value must be 'Yes'
    .PARAMETER SystemLocale
    Specifies the System Locale.
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [String] $IsSingleInstance,

        [Parameter(Mandatory = $true)]
        [String] $SystemLocale
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingSystemLocaleMessage)
        ) -join '' )

    # Get the current System Locale
    $currentSystemLocale = Get-WinSystemLocale `
        -ErrorAction Stop
    if ($currentSystemLocale.Name -ne $SystemLocale)
    {
        Set-WinSystemLocale `
            -SystemLocale $SystemLocale `
            -ErrorAction Stop

        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SystemLocaleUpdatedMessage)
            ) -join '' )

        $global:DSCMachineStatus = 1

        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.RestartRequiredMessage)
            ) -join '' )
    }
} # Set-TargetResource

<#
    .SYNOPSIS
    Tests if the current System Locale on the node needs to be changed.
    .PARAMETER IsSingleInstance
    Specifies the resource is a single instance, the value must be 'Yes'
    .PARAMETER SystemLocale
    Specifies the System Locale.
    .OUTPUTS
    Returns false if the System Locale needs to be changed or true if it is correct.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [String] $IsSingleInstance,

        [Parameter(Mandatory = $true)]
        [String] $SystemLocale
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingSystemLocaleMessage)
        ) -join '' )


    if (-not (Test-SystemLocaleValue -SystemLocale $SystemLocale)) {
        New-TerminatingError `
            -errorId 'InvalidSystemLocaleError' `
            -errorMessage ($LocalizedData.InvalidSystemLocaleError -f $SystemLocale) `
            -errorCategory InvalidArgument
    } # if

    # Get the current System Locale
    $currentSystemLocale = Get-WinSystemLocale `
        -ErrorAction Stop

    if ($currentSystemLocale.Name -ne $SystemLocale)
    {
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SystemLocaleParameterNeedsUpdateMessage -f `
                $currentSystemLocale.Name,$SystemLocale)
        ) -join '' )
        return $false
    }
    return $true
} # Test-TargetResource

# Helper Functions
<#
    .SYNOPSIS
    Throw a custome exception.
    .PARAMETER ErrorId
    The identifier representing the exception being thrown.
    .PARAMETER ErrorMessage
    The error message to be used for this exception.
    .PARAMETER ErrorCategory
    The exception error category.
#>
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

    $exception = New-Object `
        -TypeName System.InvalidOperationException `
        -ArgumentList $errorMessage
    $errorRecord = New-Object `
        -TypeName System.Management.Automation.ErrorRecord `
        -ArgumentList $exception, $errorId, $errorCategory, $null
    $PSCmdlet.ThrowTerminatingError($errorRecord)
}

<#
    .SYNOPSIS
    Checks the provided System Locale against the list of valid cultures.
    .PARAMETER SystemLocale
    The System Locale to check the validitiy of.
#>
function Test-SystemLocaleValue
{
    [CmdletBinding()]
    [OutputType([Boolean])]
    param
    (
        [Parameter(Mandatory)]
        [String] $SystemLocale
    )
    $validCultures = [System.Globalization.CultureInfo]::GetCultures(`
        [System.Globalization.CultureTypes]::AllCultures`
        ).name
    return ($SystemLocale -in $validCultures)
}

Export-ModuleMember -Function *-TargetResource
