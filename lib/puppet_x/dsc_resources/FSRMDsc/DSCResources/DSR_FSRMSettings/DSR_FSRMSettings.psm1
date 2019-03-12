$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Networking Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'FSRMDsc.ResourceHelper' `
            -ChildPath 'FSRMDsc.ResourceHelper.psm1'))

# Import Localization Strings
$LocalizedData = Get-LocalizedData `
    -ResourceName 'DSR_FSRMSettings' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
        Retrieves the current state of the FSRM Settings.

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
        [String]
        $IsSingleInstance
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingSettingsMessage) `
        ) -join '' )

    $settings = Get-FSRMSetting

    $returnValue = @{
        IsSingleInstance         = $IsSingleInstance
        SmtpServer               = $settings.SmtpServer
        AdminEmailAddress        = $settings.AdminEmailAddress
        FromEmailAddress         = $settings.FromEmailAddress
        CommandNotificationLimit = $settings.CommandNotificationLimit
        EmailNotificationLimit   = $settings.EmailNotificationLimit
        EventNotificationLimit   = $settings.EventNotificationLimit
    }

    return $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
        Sets the current state of the FSRM Settings.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'.

    .PARAMETER SmtpServer
        Specifies the fully qualified domain name (FQDN) or IP address of the SMTP server that
        FSRM uses to send email.

    .PARAMETER AdminEmailAddress
        Specifies a semicolon-separated list of email addresses for the recipients of any email
        that the server sends to the administrator.

    .PARAMETER FromEmailAddress
        Specifies the default email address from which FSRM sends email messages.

    .PARAMETER CommandNotificationLimit
        Specifies the minimum number of seconds between individual running events of a command-type
        notification.

    .PARAMETER EmailNotificationLimit
        Specifies the minimum number of seconds between individual running events of an email-type
        notification.

    .PARAMETER EventNotificationLimit
        Specifies the minimum number of seconds between individual running events of an event-type
        notification.
#>
Function Set-TargetResource
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding(SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [String]
        $IsSingleInstance,

        [Parameter()]
        [System.String]
        $SmtpServer,

        [Parameter()]
        [System.String]
        $AdminEmailAddress,

        [Parameter()]
        [System.String]
        $FromEmailAddress,

        [Parameter()]
        [System.Uint32]
        $CommandNotificationLimit,

        [Parameter()]
        [System.Uint32]
        $EmailNotificationLimit,

        [Parameter()]
        [System.Uint32]
        $EventNotificationLimit
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingSettingsMessage) `
        ) -join '' )

    # Remove any parameters that can't be splatted.
    $null = $PSBoundParameters.Remove('IsSingleInstance')

    # Set the existing Settings with a splat
    Set-FSRMSetting @PSBoundParameters

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingsUpdatedMessage) `
        ) -join '' )
} # Set-TargetResource

<#
    .SYNOPSIS
        Tests the current state of the FSRM Settings.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'.

    .PARAMETER SmtpServer
        Specifies the fully qualified domain name (FQDN) or IP address of the SMTP server that
        FSRM uses to send email.

    .PARAMETER AdminEmailAddress
        Specifies a semicolon-separated list of email addresses for the recipients of any email
        that the server sends to the administrator.

    .PARAMETER FromEmailAddress
        Specifies the default email address from which FSRM sends email messages.

    .PARAMETER CommandNotificationLimit
        Specifies the minimum number of seconds between individual running events of a command-type
        notification.

    .PARAMETER EmailNotificationLimit
        Specifies the minimum number of seconds between individual running events of an email-type
        notification.

    .PARAMETER EventNotificationLimit
        Specifies the minimum number of seconds between individual running events of an event-type
        notification.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [String]
        $IsSingleInstance,

        [Parameter()]
        [System.String]
        $SmtpServer,

        [Parameter()]
        [System.String]
        $AdminEmailAddress,

        [Parameter()]
        [System.String]
        $FromEmailAddress,

        [Parameter()]
        [System.Uint32]
        $CommandNotificationLimit,

        [Parameter()]
        [System.Uint32]
        $EmailNotificationLimit,

        [Parameter()]
        [System.Uint32]
        $EventNotificationLimit
    )

    # Flag to signal whether settings are correct
    [Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingSettingsMessage) `
        ) -join '' )

    # Lookup the existing Settings
    $settings = Get-FSRMSetting

    # The Settings exists already - check the parameters
    if (($PSBoundParameters.ContainsKey('SmtpServer')) `
            -and ($settings.SmtpServer -ne $SmtpServer))
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.SettingsNeedsUpdateMessage) `
                    -f 'SmtpServer'
            ) -join '' )

        $desiredConfigurationMatch = $false
    }

    if (($PSBoundParameters.ContainsKey('AdminEmailAddress')) `
            -and ($settings.AdminEmailAddress -ne $AdminEmailAddress))
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.SettingsNeedsUpdateMessage) `
                    -f 'AdminEmailAddress'
            ) -join '' )

        $desiredConfigurationMatch = $false
    }

    if (($PSBoundParameters.ContainsKey('FromEmailAddress')) `
            -and ($settings.FromEmailAddress -ne $FromEmailAddress))
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.SettingsNeedsUpdateMessage) `
                    -f 'FromEmailAddress'
            ) -join '' )

        $desiredConfigurationMatch = $false
    }

    if (($PSBoundParameters.ContainsKey('CommandNotificationLimit')) `
            -and ($settings.CommandNotificationLimit -ne $CommandNotificationLimit))
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.SettingsNeedsUpdateMessage) `
                    -f 'CommandNotificationLimit'
            ) -join '' )

        $desiredConfigurationMatch = $false
    }

    if (($PSBoundParameters.ContainsKey('EmailNotificationLimit')) `
            -and ($settings.EmailNotificationLimit -ne $EmailNotificationLimit))
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EmailNotificationLimit) `
                    -f 'FromEmailAddress'
            ) -join '' )

        $desiredConfigurationMatch = $false
    }

    if (($PSBoundParameters.ContainsKey('EventNotificationLimit')) `
            -and ($settings.EventNotificationLimit -ne $EventNotificationLimit))
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.SettingsNeedsUpdateMessage) `
                    -f 'EventNotificationLimit'
            ) -join '' )

        $desiredConfigurationMatch = $false
    }

    return $desiredConfigurationMatch
} # Test-TargetResource

Export-ModuleMember -Function *-TargetResource
