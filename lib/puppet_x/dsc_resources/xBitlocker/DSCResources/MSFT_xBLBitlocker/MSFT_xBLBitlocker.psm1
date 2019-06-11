<#
    .SYNOPSIS
        Gets DSC resource configuration.

    .PARAMETER MountPoint
        The MountPoint name as reported in Get-BitLockerVolume.

    .PARAMETER PrimaryProtector
        The type of key protector that will be used as the primary key
        protector.

    .PARAMETER AdAccountOrGroup
        Specifies an account using the format Domain\User.

    .PARAMETER AdAccountOrGroupProtector
        Indicates that BitLocker uses an AD DS account as a protector for the
        volume encryption key.

    .PARAMETER AllowImmediateReboot
        Whether the computer can be immediately rebooted after enabling
        Bitlocker on an OS drive. Defaults to false.

    .PARAMETER AutoUnlock
        Whether volumes should be enabled for auto unlock using
        Enable-BitlockerAutoUnlock.

    .PARAMETER EncryptionMethod
        Indicates that BitLocker uses the TPM as a protector for the volume
        encryption key.

    .PARAMETER HardwareEncryption
        Indicates that the volume uses hardware encryption.

    .PARAMETER Password
        Specifies a secure string object that contains a password.

    .PARAMETER PasswordProtector
        Indicates that BitLocker uses a password as a protector for the volume
        encryption key.

    .PARAMETER Pin
        Specifies a secure string object that contains a PIN.

    .PARAMETER RecoveryKeyPath
        Specifies a path to a recovery key.

    .PARAMETER RecoveryKeyProtector
        Indicates that BitLocker uses a recovery key as a protector for the
        volume encryption key.

    .PARAMETER RecoveryPasswordProtector
        Indicates that BitLocker uses a recovery password as a protector for
        the volume encryption key.

    .PARAMETER Service
        Indicates that the system account for this computer unlocks the
        encrypted volume.

    .PARAMETER SkipHardwareTest
        Indicates that BitLocker does not perform a hardware test before it
        begins encryption.

    .PARAMETER StartupKeyPath
        Specifies a path to a startup key.

    .PARAMETER StartupKeyProtector
        Indicates that BitLocker uses a startup key as a protector for the
        volume encryption key.

    .PARAMETER TpmProtector
        Indicates that BitLocker uses the TPM as a protector for the volume
        encryption key.

    .PARAMETER UsedSpaceOnly
        Indicates that BitLocker does not encrypt disk space which contains
        unused data.
#>
function Get-TargetResource
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSDSCUseVerboseMessageInDSCResource', '')]
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $MountPoint,

        [Parameter(Mandatory = $true)]
        [ValidateSet('PasswordProtector', 'RecoveryPasswordProtector', 'StartupKeyProtector', 'TpmProtector')]
        [System.String]
        $PrimaryProtector,

        [Parameter()]
        [System.String]
        $AdAccountOrGroup,

        [Parameter()]
        [System.Boolean]
        $AdAccountOrGroupProtector,

        [Parameter()]
        [System.Boolean]
        $AllowImmediateReboot = $false,

        [Parameter()]
        [System.Boolean]
        $AutoUnlock = $false,

        [Parameter()]
        [ValidateSet('Aes128', 'Aes256')]
        [System.String]
        $EncryptionMethod,

        [Parameter()]
        [System.Boolean]
        $HardwareEncryption,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Password,

        [Parameter()]
        [System.Boolean]
        $PasswordProtector,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Pin,

        [Parameter()]
        [System.String]
        $RecoveryKeyPath,

        [Parameter()]
        [System.Boolean]
        $RecoveryKeyProtector,

        [Parameter()]
        [System.Boolean]
        $RecoveryPasswordProtector,

        [Parameter()]
        [System.Boolean]
        $Service,

        [Parameter()]
        [System.Boolean]
        $SkipHardwareTest,

        [Parameter()]
        [System.String]
        $StartupKeyPath,

        [Parameter()]
        [System.Boolean]
        $StartupKeyProtector,

        [Parameter()]
        [System.Boolean]
        $TpmProtector,

        [Parameter()]
        [System.Boolean]
        $UsedSpaceOnly
    )

    # Load helper module
    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    Assert-HasPrereqsForBitlocker

    $returnValue = @{
        MountPoint = $MountPoint
    }

    $returnValue
}

<#
    .SYNOPSIS
        Configures settings defined DSC resource configuration.

    .PARAMETER MountPoint
        The MountPoint name as reported in Get-BitLockerVolume.

    .PARAMETER PrimaryProtector
        The type of key protector that will be used as the primary key
        protector.

    .PARAMETER AdAccountOrGroup
        Specifies an account using the format Domain\User.

    .PARAMETER AdAccountOrGroupProtector
        Indicates that BitLocker uses an AD DS account as a protector for the
        volume encryption key.

    .PARAMETER AllowImmediateReboot
        Whether the computer can be immediately rebooted after enabling
        Bitlocker on an OS drive. Defaults to false.

    .PARAMETER AutoUnlock
        Whether volumes should be enabled for auto unlock using
        Enable-BitlockerAutoUnlock.

    .PARAMETER EncryptionMethod
        Indicates that BitLocker uses the TPM as a protector for the volume
        encryption key.

    .PARAMETER HardwareEncryption
        Indicates that the volume uses hardware encryption.

    .PARAMETER Password
        Specifies a secure string object that contains a password.

    .PARAMETER PasswordProtector
        Indicates that BitLocker uses a password as a protector for the volume
        encryption key.

    .PARAMETER Pin
        Specifies a secure string object that contains a PIN.

    .PARAMETER RecoveryKeyPath
        Specifies a path to a recovery key.

    .PARAMETER RecoveryKeyProtector
        Indicates that BitLocker uses a recovery key as a protector for the
        volume encryption key.

    .PARAMETER RecoveryPasswordProtector
        Indicates that BitLocker uses a recovery password as a protector for
        the volume encryption key.

    .PARAMETER Service
        Indicates that the system account for this computer unlocks the
        encrypted volume.

    .PARAMETER SkipHardwareTest
        Indicates that BitLocker does not perform a hardware test before it
        begins encryption.

    .PARAMETER StartupKeyPath
        Specifies a path to a startup key.

    .PARAMETER StartupKeyProtector
        Indicates that BitLocker uses a startup key as a protector for the
        volume encryption key.

    .PARAMETER TpmProtector
        Indicates that BitLocker uses the TPM as a protector for the volume
        encryption key.

    .PARAMETER UsedSpaceOnly
        Indicates that BitLocker does not encrypt disk space which contains
        unused data.
#>
function Set-TargetResource
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSDSCUseVerboseMessageInDSCResource', '')]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $MountPoint,

        [Parameter(Mandatory = $true)]
        [ValidateSet('PasswordProtector', 'RecoveryPasswordProtector', 'StartupKeyProtector', 'TpmProtector')]
        [System.String]
        $PrimaryProtector,

        [Parameter()]
        [System.String]
        $AdAccountOrGroup,

        [Parameter()]
        [System.Boolean]
        $AdAccountOrGroupProtector,

        [Parameter()]
        [System.Boolean]
        $AllowImmediateReboot = $false,

        [Parameter()]
        [System.Boolean]
        $AutoUnlock = $false,

        [Parameter()]
        [ValidateSet('Aes128', 'Aes256')]
        [System.String]
        $EncryptionMethod,

        [Parameter()]
        [System.Boolean]
        $HardwareEncryption,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Password,

        [Parameter()]
        [System.Boolean]
        $PasswordProtector,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Pin,

        [Parameter()]
        [System.String]
        $RecoveryKeyPath,

        [Parameter()]
        [System.Boolean]
        $RecoveryKeyProtector,

        [Parameter()]
        [System.Boolean]
        $RecoveryPasswordProtector,

        [Parameter()]
        [System.Boolean]
        $Service,

        [Parameter()]
        [System.Boolean]
        $SkipHardwareTest,

        [Parameter()]
        [System.String]
        $StartupKeyPath,

        [Parameter()]
        [System.Boolean]
        $StartupKeyProtector,

        [Parameter()]
        [System.Boolean]
        $TpmProtector,

        [Parameter()]
        [System.Boolean]
        $UsedSpaceOnly
    )

    # Load helper module
    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    Assert-HasPrereqsForBitlocker

    Enable-BitlockerInternal @PSBoundParameters -VerbosePreference $VerbosePreference
}

<#
    .SYNOPSIS
        Tests whether settings defined DSC resource configuration are in the
        expected state.

    .PARAMETER MountPoint
        The MountPoint name as reported in Get-BitLockerVolume.

    .PARAMETER PrimaryProtector
        The type of key protector that will be used as the primary key
        protector.

    .PARAMETER AdAccountOrGroup
        Specifies an account using the format Domain\User.

    .PARAMETER AdAccountOrGroupProtector
        Indicates that BitLocker uses an AD DS account as a protector for the
        volume encryption key.

    .PARAMETER AllowImmediateReboot
        Whether the computer can be immediately rebooted after enabling
        Bitlocker on an OS drive. Defaults to false.

    .PARAMETER AutoUnlock
        Whether volumes should be enabled for auto unlock using
        Enable-BitlockerAutoUnlock.

    .PARAMETER EncryptionMethod
        Indicates that BitLocker uses the TPM as a protector for the volume
        encryption key.

    .PARAMETER HardwareEncryption
        Indicates that the volume uses hardware encryption.

    .PARAMETER Password
        Specifies a secure string object that contains a password.

    .PARAMETER PasswordProtector
        Indicates that BitLocker uses a password as a protector for the volume
        encryption key.

    .PARAMETER Pin
        Specifies a secure string object that contains a PIN.

    .PARAMETER RecoveryKeyPath
        Specifies a path to a recovery key.

    .PARAMETER RecoveryKeyProtector
        Indicates that BitLocker uses a recovery key as a protector for the
        volume encryption key.

    .PARAMETER RecoveryPasswordProtector
        Indicates that BitLocker uses a recovery password as a protector for
        the volume encryption key.

    .PARAMETER Service
        Indicates that the system account for this computer unlocks the
        encrypted volume.

    .PARAMETER SkipHardwareTest
        Indicates that BitLocker does not perform a hardware test before it
        begins encryption.

    .PARAMETER StartupKeyPath
        Specifies a path to a startup key.

    .PARAMETER StartupKeyProtector
        Indicates that BitLocker uses a startup key as a protector for the
        volume encryption key.

    .PARAMETER TpmProtector
        Indicates that BitLocker uses the TPM as a protector for the volume
        encryption key.

    .PARAMETER UsedSpaceOnly
        Indicates that BitLocker does not encrypt disk space which contains
        unused data.
#>
function Test-TargetResource
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSDSCUseVerboseMessageInDSCResource', '')]
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $MountPoint,

        [Parameter(Mandatory = $true)]
        [ValidateSet('PasswordProtector', 'RecoveryPasswordProtector', 'StartupKeyProtector', 'TpmProtector')]
        [System.String]
        $PrimaryProtector,

        [Parameter()]
        [System.String]
        $AdAccountOrGroup,

        [Parameter()]
        [System.Boolean]
        $AdAccountOrGroupProtector,

        [Parameter()]
        [System.Boolean]
        $AllowImmediateReboot = $false,

        [Parameter()]
        [System.Boolean]
        $AutoUnlock = $false,

        [Parameter()]
        [ValidateSet('Aes128', 'Aes256')]
        [System.String]
        $EncryptionMethod,

        [Parameter()]
        [System.Boolean]
        $HardwareEncryption,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Password,

        [Parameter()]
        [System.Boolean]
        $PasswordProtector,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Pin,

        [Parameter()]
        [System.String]
        $RecoveryKeyPath,

        [Parameter()]
        [System.Boolean]
        $RecoveryKeyProtector,

        [Parameter()]
        [System.Boolean]
        $RecoveryPasswordProtector,

        [Parameter()]
        [System.Boolean]
        $Service,

        [Parameter()]
        [System.Boolean]
        $SkipHardwareTest,

        [Parameter()]
        [System.String]
        $StartupKeyPath,

        [Parameter()]
        [System.Boolean]
        $StartupKeyProtector,

        [Parameter()]
        [System.Boolean]
        $TpmProtector,

        [Parameter()]
        [System.Boolean]
        $UsedSpaceOnly
    )

    # Load helper module
    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    Assert-HasPrereqsForBitlocker

    $testResult = Test-BitlockerEnabled @PSBoundParameters -VerbosePreference $VerbosePreference

    return $testResult
}

Export-ModuleMember -Function *-TargetResource
