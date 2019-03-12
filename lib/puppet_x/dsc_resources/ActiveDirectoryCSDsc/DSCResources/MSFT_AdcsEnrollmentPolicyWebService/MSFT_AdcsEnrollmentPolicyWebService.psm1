$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the ADCS Deployment Resource Helper Module.
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'ActiveDirectoryCSDsc.ResourceHelper' `
            -ChildPath 'ActiveDirectoryCSDsc.ResourceHelper.psm1'))

# Import Localization Strings.
$LocalizedData = Get-LocalizedData `
    -ResourceName 'MSFT_AdcsEnrollmentPolicyWebService' `
    -ResourcePath (Split-Path -Parent $script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
        Returns an object containing the current state information for the ADCS Enrollment
        Policy Web Service on the server.

    .PARAMETER AuthenticationType
        Specifies the authentication type used by the Certificate Enrollment Policy Web Service.

    .PARAMETER SslCertThumbprint
        Specifies the thumbprint of the certificate used by Internet Information Service (IIS)
        to enable support for required Secure Sockets Layer (SSL).

    .PARAMETER Credential
        If the Certificate Enrollment Policy Web service is configured to use Standalone
        certification authority, then an account that is a member of the local Administrators
        on the CA is required. If the Certificate Enrollment Policy Web service is configured
        to use an Enterprise CA, then an account that is a member of Domain Admins is
        required.

    .PARAMETER KeyBasedRenewal
        Configures the Certificate Enrollment Policy Web Service to operate in key-based renewal
        mode. Defaults to False.

    .PARAMETER Ensure
        Specifies whether the Certificate Authority should be installed or uninstalled. Defaults
        to Present.

    .OUTPUTS
        Returns an object containing the ADCS AdcsEnrollmentPolicyWebService
        state information.
#>
Function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Certificate', 'Kerberos', 'UserName')]
        [System.String]
        $AuthenticationType,

        [Parameter(Mandatory = $true)]
        [ValidateScript( { $_ | Test-Thumbprint } )]
        [System.String]
        $SslCertThumbprint,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter()]
        [System.Boolean]
        $KeyBasedRenewal = $false
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingAdcsEnrollmentPolicyWebServiceStatusMessage -f $AuthenticationType)
        ) -join '' )

    $installed = Test-AdcsEnrollmentPolicyWebServiceInstallState `
        -AuthenticationType $AuthenticationType `
        -KeyBasedRenewal $KeyBasedRenewal
    if ($installed -eq $false)
    {
        $Ensure = 'Absent'
    }
    else
    {
        $Ensure = 'Present'
    }

    return @{
        AuthenticationType = $AuthenticationType
        SslCertThumbprint  = $SslCertThumbprint
        Credential         = $Credential
        KeyBasedRenewal    = $KeyBasedRenewal
        Ensure             = $Ensure
    }
} # Function Get-TargetResource

<#
    .SYNOPSIS
        Installs or uinstalls the ADCS Enrollment Policy Web Service from the server.

    .PARAMETER AuthenticationType
        Specifies the authentication type used by the Certificate Enrollment Policy Web Service.

    .PARAMETER SslCertThumbprint
        Specifies the thumbprint of the certificate used by Internet Information Service (IIS)
        to enable support for required Secure Sockets Layer (SSL).

    .PARAMETER Credential
        If the Certificate Enrollment Policy Web service is configured to use Standalone
        certification authority, then an account that is a member of the local Administrators
        on the CA is required. If the Certificate Enrollment Policy Web service is configured
        to use an Enterprise CA, then an account that is a member of Domain Admins is
        required.

    .PARAMETER KeyBasedRenewal
        Configures the Certificate Enrollment Policy Web Service to operate in key-based renewal
        mode. Defaults to False.

    .PARAMETER Ensure
        Specifies whether the Certificate Authority should be installed or uninstalled. Defaults
        to Present.
#>
Function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Certificate', 'Kerberos', 'UserName')]
        [System.String]
        $AuthenticationType,

        [Parameter(Mandatory = $true)]
        [ValidateScript( { $_ | Test-Thumbprint } )]
        [System.String]
        $SslCertThumbprint,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter()]
        [System.Boolean]
        $KeyBasedRenewal = $false,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingAdcsEnrollmentPolicyWebServiceStatusMessage -f $AuthenticationType)
        ) -join '' )

    $adcsEnrollmentPolicyWebServiceParameters = @{} + $PSBoundParameters
    $null = $adcsEnrollmentPolicyWebServiceParameters.Remove('Ensure')
    $null = $adcsEnrollmentPolicyWebServiceParameters.Remove('Debug')
    $null = $adcsEnrollmentPolicyWebServiceParameters.Remove('ErrorAction')

    $errorMessage = ''

    try
    {
        switch ($Ensure)
        {
            'Present'
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.InstallingAdcsEnrollmentPolicyWebServiceMessage -f $AuthenticationType)
                    ) -join '' )

                $errorMessage = (Install-AdcsEnrollmentPolicyWebService @adcsEnrollmentPolicyWebServiceParameters -Force).ErrorString
            }

            'Absent'
            {
                $null = $adcsEnrollmentPolicyWebServiceParameters.Remove('SslCertThumbprint')
                $null = $adcsEnrollmentPolicyWebServiceParameters.Remove('Credential')

                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.UninstallingAdcsEnrollmentPolicyWebServiceMessage -f $AuthenticationType)
                    ) -join '' )

                $errorMessage = (Uninstall-AdcsEnrollmentPolicyWebService @adcsEnrollmentPolicyWebServiceParameters -Force).ErrorString
            }
        } # switch
    }
    catch
    {
        $errorMessage = $_.Exception.Message
    }

    if (-not [System.String]::IsNullOrEmpty($errorMessage))
    {
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.AdcsEnrollmentPolicyWebServiceErrorMessage -f $errorMessage)
        ) -join '' )
        New-InvalidOperationException -Message $errorMessage
    }
} # Function Set-TargetResource

<#
    .SYNOPSIS
        Tests is the ADCS Enrollment Policy Web Service is in the desired state.

    .PARAMETER AuthenticationType
        Specifies the authentication type used by the Certificate Enrollment Policy Web Service.

    .PARAMETER SslCertThumbprint
        Specifies the thumbprint of the certificate used by Internet Information Service (IIS)
        to enable support for required Secure Sockets Layer (SSL).

    .PARAMETER Credential
        If the Certificate Enrollment Policy Web service is configured to use Standalone
        certification authority, then an account that is a member of the local Administrators
        on the CA is required. If the Certificate Enrollment Policy Web service is configured
        to use an Enterprise CA, then an account that is a member of Domain Admins is
        required.

    .PARAMETER KeyBasedRenewal
        Configures the Certificate Enrollment Policy Web Service to operate in key-based renewal
        mode. Defaults to False.

    .PARAMETER Ensure
        Specifies whether the Certificate Authority should be installed or uninstalled. Defaults
        to Present.

    .OUTPUTS
        Returns true if the ADCS Enrollment Policy Web Service is in the correct state.
#>
Function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Certificate', 'Kerberos', 'UserName')]
        [System.String]
        $AuthenticationType,

        [Parameter(Mandatory = $true)]
        [ValidateScript( { $_ | Test-Thumbprint } )]
        [System.String]
        $SslCertThumbprint,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter()]
        [System.Boolean]
        $KeyBasedRenewal = $false,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingAdcsEnrollmentPolicyWebServiceStatusMessage -f $AuthenticationType)
        ) -join '' )

    $installed = Test-AdcsEnrollmentPolicyWebServiceInstallState `
        -AuthenticationType $AuthenticationType `
        -KeyBasedRenewal $KeyBasedRenewal

    if ($installed -eq $true)
    {
        # Enrollment Policy Web Service is already installed
        switch ($Ensure)
        {
            'Present'
            {
                # CA is installed and should be - change not required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsEnrollmentPolicyWebServiceInstalledAndShouldBeMessage -f $AuthenticationType)
                    ) -join '' )

                return $true
            }

            'Absent'
            {
                # CA is installed and should not be - change required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsEnrollmentPolicyWebServiceInstalledButShouldNotBeMessage -f $AuthenticationType)
                    ) -join '' )

                return $false
            }
        } # switch
    }
    else
    {
        # Enrollment Policy Web Service is not installed
        switch ($Ensure)
        {
            'Present'
            {
                # CA is not installed but should be - change required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsEnrollmentPolicyWebServiceNotInstalledButShouldBeMessage -f $AuthenticationType)
                    ) -join '' )

                return $false
            }

            'Absent'
            {
                # CA is not installed and should not be - change not required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsEnrollmentPolicyWebServiceNotInstalledAndShouldNotBeMessage -f $AuthenticationType)
                    ) -join '' )

                return $true
            }
        } # switch
    }
} # Function Test-TargetResource

<#
    .SYNOPSIS
        Tests the install state of the ADCS Enrollment Policy Web Service for the specified
        Authentication Type and Key Based Renewal settings. The function uses the existence
        of the IIS Web Aplication to determine it it is installed.

    .PARAMETER AuthenticationType
        Specifies the authentication type used by the Certificate Enrollment Policy Web Service.

    .PARAMETER KeyBasedRenewal
        Configures the Certificate Enrollment Policy Web Service to operate in key-based renewal
        mode. Defaults to False.

    .OUTPUTS
        Returns true if the ADCS Enrollment Policy Web Service is installed.
#>
Function Test-AdcsEnrollmentPolicyWebServiceInstallState
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Certificate', 'Kerberos', 'UserName')]
        [System.String]
        $AuthenticationType,

        [Parameter()]
        [System.Boolean]
        $KeyBasedRenewal = $false
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingAdcsEnrollmentPolicyWebServiceInstallStateMessage -f $AuthenticationType, $KeyBasedRenewal)
        ) -join '' )

    # Determine the expected name of the Web Application
    if ($AuthenticationType -eq 'UserName')
    {
        # When the AuthenticationType is UserName the Web App actually ends with USernamePassword
        $webAppAutenticationType = 'UsernamePassword'
    }
    else
    {
        $webAppAutenticationType = $AuthenticationType
    }

    if ($KeyBasedRenewal -eq $true)
    {
        $enrollmentPolicyWebServiceWebAppName = "KeyBasedRenewal_ADPolicyProvider_CEP_$webAppAutenticationType"
    }
    else
    {
        $enrollmentPolicyWebServiceWebAppName = "ADPolicyProvider_CEP_$webAppAutenticationType"
    }

    # Does the Web Application exist for the Enrollment Policy Web Service
    $enrollmentPolicyWebServiceWebApp = Get-WebApplication | Where-Object -FilterScript {
        $_.Applicationpool -eq 'WSEnrollmentPolicyServer' -and
        (Split-Path -Path $_.PhysicalPath -Leaf) -eq $enrollmentPolicyWebServiceWebAppName
    }

    if ($null -eq $enrollmentPolicyWebServiceWebApp)
    {
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.AdcsEnrollmentPolicyWebServiceInstallIsNotInstalledMessage -f $AuthenticationType, $KeyBasedRenewal)
        ) -join '' )

        return $false
    }
    else
    {
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.AdcsEnrollmentPolicyWebServiceInstallIsInstalledMessage -f $AuthenticationType, $KeyBasedRenewal)
        ) -join '' )

        return $true
    }
} # Function Test-AdcsEnrollmentPolicyWebServiceInstallState

<#
    .SYNOPSIS
    Validates whether a given certificate is valid based on the hash algoritms available on the
    system.

    .PARAMETER Thumbprint
    One or more thumbprints to Test.

    .PARAMETER Quiet
    Returns $false if the thumbprint is not valid. By default this function throws an exception if
    validation fails.

    .EXAMPLE
    Test-Thumbprint `
        -Thumbprint fd94e3a5a7991cb6ed3cd5dd01045edf7e2284de

    .EXAMPLE
    Test-Thumbprint `
        -Thumbprint fd94e3a5a7991cb6ed3cd5dd01045edf7e2284de,0000e3a5a7991cb6ed3cd5dd01045edf7e220000 `
        -Quiet

    .EXAMPLE
    Get-ChildItem -Path Cert:\LocalMachine -Recurse |
        Where-Object -FilterScript { $_.Thumbprint } |
        Select-Object -Expression Thumbprint |
        Test-Thumbprint -Verbose
#>
function Test-Thumbprint
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [System.String[]]
        $Thumbprint,

        [Parameter()]
        [Switch]
        $Quiet
    )

    Begin
    {
        # Get FIPS registry key
        $fips = [System.Int32] (Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\FipsAlgorithmPolicy' -ErrorAction SilentlyContinue).Enabled

        # Get a list of Hash Providers
        $allHashProviders = [System.AppDomain]::CurrentDomain.GetAssemblies().GetTypes()

        if ($fips -eq $true)
        {
            # Support only FIPS compliant Hash Algorithms
            $hashProviders = $allHashProviders | Where-Object -FilterScript {
                $_.BaseType.BaseType -eq [System.Security.Cryptography.HashAlgorithm] -and
                ($_.Name -cmatch 'Provider$' -and $_.Name -cnotmatch 'MD5')
            }
        }
        else
        {
            $hashProviders = $allHashProviders | Where-Object -FilterScript {
                $_.BaseType.BaseType -eq [System.Security.Cryptography.HashAlgorithm] -and
                ($_.Name -cmatch 'Managed$' -or $_.Name -cmatch 'Provider$')
            }
        }

        # Get a list of all Valid Hash types and lengths into an array
        $validHashes = @()
        foreach ($hashProvider in $hashProviders)
        {
            $bitSize = ( New-Object -TypeName $hashProvider ).HashSize
            $validHash = New-Object `
                -TypeName PSObject `
                -Property @{
                Hash      = $hashProvider.BaseType.Name
                BitSize   = $bitSize
                HexLength = $bitSize / 4
            }
            $validHashes += @( $validHash )
        }
    }

    Process
    {
        foreach ($hash in $Thumbprint)
        {
            $isValid = $false

            foreach ($algorithm in $validHashes)
            {
                if ($hash -cmatch "^[a-fA-F0-9]{$($algorithm.HexLength)}$")
                {
                    $isValid = $true
                }
            }

            if ($Quiet -or $isValid)
            {
                $isValid
            }
            else
            {
                New-InvalidOperationException `
                    -Message ($LocalizedData.InvalidHashError -f $hash)
            }
        }
    }
} # end function Test-Thumbprint

Export-ModuleMember -Function *-TargetResource
