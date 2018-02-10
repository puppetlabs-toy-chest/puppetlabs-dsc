$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the ADCS Deployment Resource Helper Module.
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'AdcsDeploymentDsc.ResourceHelper' `
            -ChildPath 'AdcsDeploymentDsc.ResourceHelper.psm1'))

# Import Localization Strings.
$LocalizedData = Get-LocalizedData `
    -ResourceName 'MSFT_xAdcsOnlineResponder' `
    -ResourcePath (Split-Path -Parent $script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
        Returns an object containing the current state information for the ADCS Online Responder.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'.

    .PARAMETER Credential
        If the Online Responder service is configured to use Standalone certification authority,
        then an account that is a member of the local Administrators on the CA is required. If
        the Online Responder service is configured to use an Enterprise CA, then an account that
        is a member of Domain Admins is required.

    .PARAMETER Ensure
        Specifies whether the Online Responder feature should be installed or uninstalled.

    .OUTPUTS
        Returns an object containing the ADCS Online Responder state information.
#>
Function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingAdcsOnlineResponderStatusMessage)
        ) -join '' )

    $adcsParameters = @{} + $PSBoundParameters
    $null = $adcsParameters.Remove('IsSingleInstance')
    $null = $adcsParameters.Remove('Ensure')
    $null = $adcsParameters.Remove('Debug')
    $null = $adcsParameters.Remove('ErrorAction')

    try
    {
        $null = Install-AdcsOnlineResponder @adcsParameters -WhatIf
        # CA is not installed
        $Ensure = 'Absent'
    }
    catch [Microsoft.CertificateServices.Deployment.Common.OCSP.OnlineResponderSetupException]
    {
        # CA is already installed
        $Ensure = 'Present'
    }
    catch
    {
        # Something else went wrong
        Throw $_
    }

    return @{
        Ensure     = $Ensure
        CAType     = $CAType
        Credential = $Credential
    }
} # Function Get-TargetResource

<#
    .SYNOPSIS
        Installs or uinstalls the ADCS Online Responder from the server.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'.

    .PARAMETER Credential
        If the Online Responder service is configured to use Standalone certification authority,
        then an account that is a member of the local Administrators on the CA is required. If
        the Online Responder service is configured to use an Enterprise CA, then an account that
        is a member of Domain Admins is required.

    .PARAMETER Ensure
        Specifies whether the Online Responder feature should be installed or uninstalled.
#>
Function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingAdcsOnlineResponderStatusMessage)
        ) -join '' )

    $adcsParameters = @{} + $PSBoundParameters
    $null = $adcsParameters.Remove('IsSingleInstance')
    $null = $adcsParameters.Remove('Ensure')
    $null = $adcsParameters.Remove('Debug')
    $null = $adcsParameters.Remove('ErrorAction')

    $errorMessage = ''

    switch ($Ensure)
    {
        'Present'
        {
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.InstallingAdcsOnlineResponderMessage)
                ) -join '' )

            $errorMessage = (Install-AdcsOnlineResponder @adcsParameters -Force).ErrorString
        }

        'Absent'
        {
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.UninstallingAdcsOnlineResponderMessage)
                ) -join '' )

            $errorMessage = (Uninstall-AdcsOnlineResponder -Force).ErrorString
        }
    } # switch

    if (-not [System.String]::IsNullOrEmpty($errorMessage))
    {
        New-InvalidOperationException -Message $errorMessage
    }
} # Function Set-TargetResource

<#
    .SYNOPSIS
        Tests is the ADCS Online Responder is in the desired state.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'.

    .PARAMETER Credential
        If the Online Responder service is configured to use Standalone certification authority,
        then an account that is a member of the local Administrators on the CA is required. If
        the Online Responder service is configured to use an Enterprise CA, then an account that
        is a member of Domain Admins is required.

    .PARAMETER Ensure
        Specifies whether the Online Responder feature should be installed or uninstalled.

    .OUTPUTS
        Returns true if the ADCS Online Responder is in the desired state.
#>
Function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingAdcsOnlineResponderStatusMessage -f $CAType)
        ) -join '' )

    $adcsParameters = @{} + $PSBoundParameters
    $null = $adcsParameters.Remove('IsSingleInstance')
    $null = $adcsParameters.Remove('Ensure')
    $null = $adcsParameters.Remove('Debug')
    $null = $adcsParameters.Remove('ErrorAction')

    try
    {
        $null = Install-AdcsOnlineResponder @adcsParameters -WhatIf
        # Online Responder is not installed
        switch ($Ensure)
        {
            'Present'
            {
                # Online Responder is not installed but should be - change required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsOnlineResponderNotInstalledButShouldBeMessage)
                    ) -join '' )

                return $false
            }

            'Absent'
            {
                # Online Responder is not installed and should not be - change not required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsOnlineResponderNotInstalledAndShouldNotBeMessage)
                    ) -join '' )

                return $true
            }
        } # switch
    }
    catch [Microsoft.CertificateServices.Deployment.Common.OCSP.OnlineResponderSetupException]
    {
        # Online Responder is already installed
        switch ($Ensure)
        {
            'Present'
            {
                # Online Responder is installed and should be - change not required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsOnlineResponderInstalledAndShouldBeMessage)
                    ) -join '' )

                return $true
            }

            'Absent'
            {
                # Online Responder is installed and should not be - change required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsOnlineResponderInstalledButShouldNotBeMessage)
                    ) -join '' )

                return $false
            }
        } # switch
    }
    catch
    {
        # Something else went wrong
        Throw $_
    } # try
} # Function Test-TargetResource

Export-ModuleMember -Function *-TargetResource
