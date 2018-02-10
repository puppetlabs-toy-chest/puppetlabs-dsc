$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the ADCS Deployment Resource Helper Module.
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'AdcsDeploymentDsc.ResourceHelper' `
            -ChildPath 'AdcsDeploymentDsc.ResourceHelper.psm1'))

# Import Localization Strings.
$LocalizedData = Get-LocalizedData `
    -ResourceName 'MSFT_xAdcsWebEnrollment' `
    -ResourcePath (Split-Path -Parent $script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
        Returns an object containing the current state information for the ADCS Web Enrollment.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'.

    .PARAMETER CAConfig
        CAConfig parameter string. Do not specify this if there is a local CA installed.

    .PARAMETER Credential
        If the Web Enrollment service is configured to use Standalone certification authority, then
        an account that is a member of the local Administrators on the CA is required. If the
        Web Enrollment service is configured to use an Enterprise CA, then an account that is a
        member of Domain Admins is required.

    .PARAMETER Ensure
        Specifies whether the Web Enrollment feature should be installed or uninstalled.

    .OUTPUTS
        Returns an object containing the ADCS Web Enrollment state information.
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

        [Parameter()]
        [System.String]
        $CAConfig,

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
            $($LocalizedData.GettingAdcsWebEnrollmentStatusMessage)
        ) -join '' )

    $adcsParameters = @{} + $PSBoundParameters
    $null = $adcsParameters.Remove('IsSingleInstance')
    $null = $adcsParameters.Remove('Ensure')
    $null = $adcsParameters.Remove('Debug')
    $null = $adcsParameters.Remove('ErrorAction')

    try
    {
        $null = Install-AdcsWebEnrollment @adcsParameters -WhatIf
        # CA is not installed
        $Ensure = 'Absent'
    }
    catch [Microsoft.CertificateServices.Deployment.Common.WEP.WebEnrollmentSetupException]
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
        CAConfig   = $CAConfig
        Credential = $Credential
    }
} # Function Get-TargetResource

<#
    .SYNOPSIS
        Installs or uinstalls the ADCS Web Enrollment from the server.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'.

    .PARAMETER CAConfig
        CAConfig parameter string. Do not specify this if there is a local CA installed.

    .PARAMETER Credential
        If the Web Enrollment service is configured to use Standalone certification authority, then
        an account that is a member of the local Administrators on the CA is required. If the
        Web Enrollment service is configured to use an Enterprise CA, then an account that is a
        member of Domain Admins is required.

    .PARAMETER Ensure
        Specifies whether the Web Enrollment feature should be installed or uninstalled.
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

        [Parameter()]
        [System.String]
        $CAConfig,

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
            $($LocalizedData.SettingAdcsWebEnrollmentStatusMessage)
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
                    $($LocalizedData.InstallingAdcsWebEnrollmentMessage)
                ) -join '' )

            $errorMessage = (Install-AdcsWebEnrollment @adcsParameters -Force).ErrorString
        }

        'Absent'
        {
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.UninstallingAdcsWebEnrollmentMessage)
                ) -join '' )

            $errorMessage = (Uninstall-AdcsWebEnrollment -Force).ErrorString
        }
    } # switch

    if (-not [System.String]::IsNullOrEmpty($errorMessage))
    {
        New-InvalidOperationException -Message $errorMessage
    }
} # Function Set-TargetResource

<#
    .SYNOPSIS
        Tests is the ADCS Web Enrollment is in the desired state.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'.

    .PARAMETER CAConfig
        CAConfig parameter string. Do not specify this if there is a local CA installed.

    .PARAMETER Credential
        If the Web Enrollment service is configured to use Standalone certification authority, then
        an account that is a member of the local Administrators on the CA is required. If the
        Web Enrollment service is configured to use an Enterprise CA, then an account that is a
        member of Domain Admins is required.

    .PARAMETER Ensure
        Specifies whether the Web Enrollment feature should be installed or uninstalled.

    .OUTPUTS
        Returns true if the ADCS Web Enrollment is in the desired state.
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

        [Parameter()]
        [System.String]
        $CAConfig,

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
            $($LocalizedData.TestingAdcsWebEnrollmentStatusMessage -f $CAConfig)
        ) -join '' )

    $adcsParameters = @{} + $PSBoundParameters
    $null = $adcsParameters.Remove('IsSingleInstance')
    $null = $adcsParameters.Remove('Ensure')
    $null = $adcsParameters.Remove('Debug')
    $null = $adcsParameters.Remove('ErrorAction')

    try
    {
        $null = Install-AdcsWebEnrollment @adcsParameters -WhatIf
        # Web Enrollment is not installed
        switch ($Ensure)
        {
            'Present'
            {
                # Web Enrollment is not installed but should be - change required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsWebEnrollmentNotInstalledButShouldBeMessage)
                    ) -join '' )

                return $false
            }

            'Absent'
            {
                # Web Enrollment is not installed and should not be - change not required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsWebEnrollmentNotInstalledAndShouldNotBeMessage)
                    ) -join '' )

                return $true
            }
        } # switch
    }
    catch [Microsoft.CertificateServices.Deployment.Common.WEP.WebEnrollmentSetupException]
    {
        # Web Enrollment is already installed
        switch ($Ensure)
        {
            'Present'
            {
                # Web Enrollment is installed and should be - change not required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsWebEnrollmentInstalledAndShouldBeMessage)
                    ) -join '' )

                return $true
            }

            'Absent'
            {
                # Web Enrollment is installed and should not be - change required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsWebEnrollmentInstalledButShouldNotBeMessage)
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
