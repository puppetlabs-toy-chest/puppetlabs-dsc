$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the ADCS Deployment Resource Helper Module.
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'AdcsDeploymentDsc.ResourceHelper' `
            -ChildPath 'AdcsDeploymentDsc.ResourceHelper.psm1'))

# Import Localization Strings.
$LocalizedData = Get-LocalizedData `
    -ResourceName 'MSFT_xAdcsCertificationAuthority' `
    -ResourcePath (Split-Path -Parent $script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
        Returns an object containing the current state information for the ADCS CA on the server.
    .PARAMETER CAType
        Specifies the type of certification authority to install.

    .PARAMETER Credential
        To install an enterprise certification authority, the computer must be joined to an Active
        Directory Domain Services domain and a user account that is a member of the Enterprise Admin
        group is required. To install a standalone certification authority, the computer can be in a
        workgroup or AD DS domain. If the computer is in a workgroup, a user account that is a member
        of Administrators is required. If the computer is in an AD DS domain, a user account that is
        a member of Domain Admins is required.

    .PARAMETER Ensure
        Specifies whether the Certificate Authority should be installed or uninstalled.

    .PARAMETER CACommonName
        Specifies the certification authority common name.

    .PARAMETER CADistinguishedNameSuffix
        Specifies the certification authority distinguished name suffix.

    .PARAMETER CertFile
        Specifies the file name of certification authority PKCS 12 formatted certificate file.

    .PARAMETER CertFilePassword
        Specifies the password for certification authority certificate file.

    .PARAMETER CertificateID
        Specifies the thumbprint or serial number of certification authority certificate.

    .PARAMETER CryptoProviderName
        The name of the cryptographic service provider or key storage provider that is used to generate
        or store the private key for the CA.

    .PARAMETER DatabaseDirectory
        Specifies the folder location of the certification authority database.

    .PARAMETER HashAlgorithmName
        Specifies the signature hash algorithm used by the certification authority.

    .PARAMETER IgnoreUnicode
        Specifies that Unicode characters are allowed in certification authority name string.

    .PARAMETER KeyContainerName
        Specifies the name of an existing private key container.

    .PARAMETER KeyLength
        Specifies the bit length for new certification authority key.

    .PARAMETER LogDirectory
        Specifies the folder location of the certification authority database log.

    .PARAMETER OutputCertRequestFile
        Specifies the folder location for certificate request file.

    .PARAMETER OverwriteExistingCAinDS
        Specifies that the computer object in the Active Directory Domain Service domain should be
        overwritten with the same computer name.

    .PARAMETER OverwriteExistingDatabase
        Specifies that the existing certification authority database should be overwritten.

    .PARAMETER OverwriteExistingKey
        Overwrite existing key container with the same name.

    .PARAMETER ParentCA
        Specifies the configuration string of the parent certification authority that will certify this
        CA.

    .PARAMETER ValidityPeriod
        Specifies the validity period of the certification authority certificate in hours, days, weeks,
        months or years. If this is a subordinate CA, do not use this parameter, because the validity
        period is determined by the parent CA.

    .PARAMETER ValidityPeriodUnits
        Validity period of the certification authority certificate. If this is a subordinate CA, do not
        specify this parameter because the validity period is determined by the parent CA.

    .OUTPUTS
        Returns an object containing the ADCS CA state information.
#>
Function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('EnterpriseRootCA', 'EnterpriseSubordinateCA', 'StandaloneRootCA', 'StandaloneSubordinateCA')]
        [System.String]
        $CAType,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String]
        $CACommonName,

        [Parameter()]
        [System.String]
        $CADistinguishedNameSuffix,

        [Parameter()]
        [System.String]
        $CertFile,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $CertFilePassword,

        [Parameter()]
        [System.String]
        $CertificateID,

        [Parameter()]
        [System.String]
        $CryptoProviderName,

        [Parameter()]
        [System.String]
        $DatabaseDirectory,

        [Parameter()]
        [System.String]
        $HashAlgorithmName,

        [Parameter()]
        [System.Boolean]
        $IgnoreUnicode,

        [Parameter()]
        [System.String]
        $KeyContainerName,

        [Parameter()]
        [System.Uint32]
        $KeyLength,

        [Parameter()]
        [System.String]
        $LogDirectory,

        [Parameter()]
        [System.String]
        $OutputCertRequestFile,

        [Parameter()]
        [System.Boolean]
        $OverwriteExistingCAinDS,

        [Parameter()]
        [System.Boolean]
        $OverwriteExistingDatabase,

        [Parameter()]
        [System.Boolean]
        $OverwriteExistingKey,

        [Parameter()]
        [System.String]
        $ParentCA,

        [Parameter()]
        [ValidateSet('Hours', 'Days', 'Months', 'Years')]
        [System.String]
        $ValidityPeriod,

        [Parameter()]
        [System.Uint32]
        $ValidityPeriodUnits
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingAdcsCAStatusMessage -f $CAType)
        ) -join '' )

    $adcsParameters = @{} + $PSBoundParameters
    $null = $adcsParameters.Remove('Ensure')
    $null = $adcsParameters.Remove('Debug')
    $null = $adcsParameters.Remove('ErrorAction')
    
    if ($CertFilePassword)
    {
        $adcsParameters['CertFilePassword'] = $CertFilePassword.Password
    }
    
    try
    {
        $null = Install-AdcsCertificationAuthority @adcsParameters -WhatIf
        # CA is not installed
        $Ensure = 'Absent'
    }
    catch [Microsoft.CertificateServices.Deployment.Common.CA.CertificationAuthoritySetupException]
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
        Installs or uinstalls the ADCS CA from the server.

    .PARAMETER CAType
        Specifies the type of certification authority to install.

    .PARAMETER Credential
        To install an enterprise certification authority, the computer must be joined to an Active
        Directory Domain Services domain and a user account that is a member of the Enterprise Admin
        group is required. To install a standalone certification authority, the computer can be in a
        workgroup or AD DS domain. If the computer is in a workgroup, a user account that is a member
        of Administrators is required. If the computer is in an AD DS domain, a user account that is
        a member of Domain Admins is required.

    .PARAMETER Ensure
        Specifies whether the Certificate Authority should be installed or uninstalled.

    .PARAMETER CACommonName
        Specifies the certification authority common name.

    .PARAMETER CADistinguishedNameSuffix
        Specifies the certification authority distinguished name suffix.

    .PARAMETER CertFile
        Specifies the file name of certification authority PKCS 12 formatted certificate file.

    .PARAMETER CertFilePassword
        Specifies the password for certification authority certificate file.

    .PARAMETER CertificateID
        Specifies the thumbprint or serial number of certification authority certificate.

    .PARAMETER CryptoProviderName
        The name of the cryptographic service provider or key storage provider that is used to generate
        or store the private key for the CA.

    .PARAMETER DatabaseDirectory
        Specifies the folder location of the certification authority database.

    .PARAMETER HashAlgorithmName
        Specifies the signature hash algorithm used by the certification authority.

    .PARAMETER IgnoreUnicode
        Specifies that Unicode characters are allowed in certification authority name string.

    .PARAMETER KeyContainerName
        Specifies the name of an existing private key container.

    .PARAMETER KeyLength
        Specifies the bit length for new certification authority key.

    .PARAMETER LogDirectory
        Specifies the folder location of the certification authority database log.

    .PARAMETER OutputCertRequestFile
        Specifies the folder location for certificate request file.

    .PARAMETER OverwriteExistingCAinDS
        Specifies that the computer object in the Active Directory Domain Service domain should be
        overwritten with the same computer name.

    .PARAMETER OverwriteExistingDatabase
        Specifies that the existing certification authority database should be overwritten.

    .PARAMETER OverwriteExistingKey
        Overwrite existing key container with the same name.

    .PARAMETER ParentCA
        Specifies the configuration string of the parent certification authority that will certify this
        CA.

    .PARAMETER ValidityPeriod
        Specifies the validity period of the certification authority certificate in hours, days, weeks,
        months or years. If this is a subordinate CA, do not use this parameter, because the validity
        period is determined by the parent CA.

    .PARAMETER ValidityPeriodUnits
        Validity period of the certification authority certificate. If this is a subordinate CA, do not
        specify this parameter because the validity period is determined by the parent CA.
#>
Function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('EnterpriseRootCA', 'EnterpriseSubordinateCA', 'StandaloneRootCA', 'StandaloneSubordinateCA')]
        [System.String]
        $CAType,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String]
        $CACommonName,

        [Parameter()]
        [System.String]
        $CADistinguishedNameSuffix,

        [Parameter()]
        [System.String]
        $CertFile,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $CertFilePassword,

        [Parameter()]
        [System.String]
        $CertificateID,

        [Parameter()]
        [System.String]
        $CryptoProviderName,

        [Parameter()]
        [System.String]
        $DatabaseDirectory,

        [Parameter()]
        [System.String]
        $HashAlgorithmName,

        [Parameter()]
        [System.Boolean]
        $IgnoreUnicode,

        [Parameter()]
        [System.String]
        $KeyContainerName,

        [Parameter()]
        [System.Uint32]
        $KeyLength,

        [Parameter()]
        [System.String]
        $LogDirectory,

        [Parameter()]
        [System.String]
        $OutputCertRequestFile,

        [Parameter()]
        [System.Boolean]
        $OverwriteExistingCAinDS,

        [Parameter()]
        [System.Boolean]
        $OverwriteExistingDatabase,

        [Parameter()]
        [System.Boolean]
        $OverwriteExistingKey,

        [Parameter()]
        [System.String]
        $ParentCA,

        [Parameter()]
        [ValidateSet('Hours', 'Days', 'Months', 'Years')]
        [System.String]
        $ValidityPeriod,

        [Parameter()]
        [System.Uint32]
        $ValidityPeriodUnits
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingAdcsCAStatusMessage -f $CAType)
        ) -join '' )

    $adcsParameters = @{} + $PSBoundParameters
    $null = $adcsParameters.Remove('Ensure')
    $null = $adcsParameters.Remove('Debug')
    $null = $adcsParameters.Remove('ErrorAction')

    $errorMessage = ''
    
    if ($CertFilePassword)
    {
        $adcsParameters['CertFilePassword'] = $CertFilePassword.Password
    }
    
    switch ($Ensure)
    {
        'Present'
        {
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.InstallingAdcsCAMessage -f $CAType)
                ) -join '' )

            $errorMessage = (Install-AdcsCertificationAuthority @adcsParameters -Force).ErrorString
        }

        'Absent'
        {
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.UninstallingAdcsCAMessage -f $CAType)
                ) -join '' )

            $errorMessage = (Uninstall-AdcsCertificationAuthority -Force).ErrorString
        }
    } # switch

    if (-not [System.String]::IsNullOrEmpty($errorMessage))
    {
        New-InvalidOperationException -Message $errorMessage
    }
} # Function Set-TargetResource

<#
    .SYNOPSIS
        Tests is the ADCS CA is in the desired state.
    .PARAMETER CAType
        Specifies the type of certification authority to install.

    .PARAMETER Credential
        To install an enterprise certification authority, the computer must be joined to an Active
        Directory Domain Services domain and a user account that is a member of the Enterprise Admin
        group is required. To install a standalone certification authority, the computer can be in a
        workgroup or AD DS domain. If the computer is in a workgroup, a user account that is a member
        of Administrators is required. If the computer is in an AD DS domain, a user account that is
        a member of Domain Admins is required.

    .PARAMETER Ensure
        Specifies whether the Certificate Authority should be installed or uninstalled.

    .PARAMETER CACommonName
        Specifies the certification authority common name.

    .PARAMETER CADistinguishedNameSuffix
        Specifies the certification authority distinguished name suffix.

    .PARAMETER CertFile
        Specifies the file name of certification authority PKCS 12 formatted certificate file.

    .PARAMETER CertFilePassword
        Specifies the password for certification authority certificate file.

    .PARAMETER CertificateID
        Specifies the thumbprint or serial number of certification authority certificate.

    .PARAMETER CryptoProviderName
        The name of the cryptographic service provider or key storage provider that is used to generate
        or store the private key for the CA.

    .PARAMETER DatabaseDirectory
        Specifies the folder location of the certification authority database.

    .PARAMETER HashAlgorithmName
        Specifies the signature hash algorithm used by the certification authority.

    .PARAMETER IgnoreUnicode
        Specifies that Unicode characters are allowed in certification authority name string.

    .PARAMETER KeyContainerName
        Specifies the name of an existing private key container.

    .PARAMETER KeyLength
        Specifies the bit length for new certification authority key.

    .PARAMETER LogDirectory
        Specifies the folder location of the certification authority database log.

    .PARAMETER OutputCertRequestFile
        Specifies the folder location for certificate request file.

    .PARAMETER OverwriteExistingCAinDS
        Specifies that the computer object in the Active Directory Domain Service domain should be
        overwritten with the same computer name.

    .PARAMETER OverwriteExistingDatabase
        Specifies that the existing certification authority database should be overwritten.

    .PARAMETER OverwriteExistingKey
        Overwrite existing key container with the same name.

    .PARAMETER ParentCA
        Specifies the configuration string of the parent certification authority that will certify this
        CA.

    .PARAMETER ValidityPeriod
        Specifies the validity period of the certification authority certificate in hours, days, weeks,
        months or years. If this is a subordinate CA, do not use this parameter, because the validity
        period is determined by the parent CA.

    .PARAMETER ValidityPeriodUnits
        Validity period of the certification authority certificate. If this is a subordinate CA, do not
        specify this parameter because the validity period is determined by the parent CA.

    .OUTPUTS
        Returns true if the ADCS CA is in the desired state.
#>
Function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('EnterpriseRootCA', 'EnterpriseSubordinateCA', 'StandaloneRootCA', 'StandaloneSubordinateCA')]
        [System.String]
        $CAType,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String]
        $CACommonName,

        [Parameter()]
        [System.String]
        $CADistinguishedNameSuffix,

        [Parameter()]
        [System.String]
        $CertFile,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $CertFilePassword,

        [Parameter()]
        [System.String]
        $CertificateID,

        [Parameter()]
        [System.String]
        $CryptoProviderName,

        [Parameter()]
        [System.String]
        $DatabaseDirectory,

        [Parameter()]
        [System.String]
        $HashAlgorithmName,

        [Parameter()]
        [System.Boolean]
        $IgnoreUnicode,

        [Parameter()]
        [System.String]
        $KeyContainerName,

        [Parameter()]
        [System.Uint32]
        $KeyLength,

        [Parameter()]
        [System.String]
        $LogDirectory,

        [Parameter()]
        [System.String]
        $OutputCertRequestFile,

        [Parameter()]
        [System.Boolean]
        $OverwriteExistingCAinDS,

        [Parameter()]
        [System.Boolean]
        $OverwriteExistingDatabase,

        [Parameter()]
        [System.Boolean]
        $OverwriteExistingKey,

        [Parameter()]
        [System.String]
        $ParentCA,

        [Parameter()]
        [ValidateSet('Hours', 'Days', 'Months', 'Years')]
        [System.String]
        $ValidityPeriod,

        [Parameter()]
        [System.Uint32]
        $ValidityPeriodUnits
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingAdcsCAStatusMessage -f $CAType)
        ) -join '' )

    $adcsParameters = @{} + $PSBoundParameters
    $null = $adcsParameters.Remove('Ensure')
    $null = $adcsParameters.Remove('Debug')
    $null = $adcsParameters.Remove('ErrorAction')
    
    if ($CertFilePassword)
    {
        $adcsParameters['CertFilePassword'] = $CertFilePassword.Password
    }
    
    try
    {
        $null = Install-AdcsCertificationAuthority @adcsParameters -WhatIf
        # CA is not installed
        switch ($Ensure)
        {
            'Present'
            {
                # CA is not installed but should be - change required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsCANotInstalledButShouldBeMessage -f $CAType)
                    ) -join '' )

                return $false
            }

            'Absent'
            {
                # CA is not installed and should not be - change not required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsCANotInstalledAndShouldNotBeMessage -f $CAType)
                    ) -join '' )

                return $true
            }
        } # switch
    }
    catch [Microsoft.CertificateServices.Deployment.Common.CA.CertificationAuthoritySetupException]
    {
        # CA is already installed
        switch ($Ensure)
        {
            'Present'
            {
                # CA is installed and should be - change not required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsCAInstalledAndShouldBeMessage -f $CAType)
                    ) -join '' )

                return $true
            }

            'Absent'
            {
                # CA is installed and should not be - change required
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.AdcsCAInstalledButShouldNotBeMessage -f $CAType)
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
