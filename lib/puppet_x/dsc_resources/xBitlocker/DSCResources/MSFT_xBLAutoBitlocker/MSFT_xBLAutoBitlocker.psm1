<#
    .SYNOPSIS
        Gets DSC resource configuration.

    .PARAMETER MountPoint
        The MountPoint name as reported in Get-BitLockerVolume.

    .PARAMETER MinDiskCapacityGB
        Optional parameter specifying the minimum disk size, in GB, that should
        be considered for AutoBitlocker.

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
        [ValidateSet('Fixed', 'Removable')]
        [System.String]
        $DriveType,

        [Parameter()]
        [System.Int32]
        $MinDiskCapacityGB,

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
        DriveType = $DriveType
    }

    $returnValue
}

<#
    .SYNOPSIS
        Configures settings defined DSC resource configuration.

    .PARAMETER MountPoint
        The MountPoint name as reported in Get-BitLockerVolume.

    .PARAMETER MinDiskCapacityGB
        Optional parameter specifying the minimum disk size, in GB, that should
        be considered for AutoBitlocker.

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
        [ValidateSet('Fixed', 'Removable')]
        [System.String]
        $DriveType,

        [Parameter()]
        [System.Int32]
        $MinDiskCapacityGB,

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

    $autoBlVols = Get-AutoBitlockerStatus @PSBoundParameters

    if ($null -eq $autoBlVols)
    {
        throw 'No Auto Bitlocker volumes were found'
    }
    else
    {
        Remove-FromPSBoundParametersUsingHashtable -PSBoundParametersIn $PSBoundParameters -ParamsToRemove 'DriveType', 'MinDiskCapacityGB'
        Add-ToPSBoundParametersFromHashtable -PSBoundParametersIn $PSBoundParameters -ParamsToAdd @{'MountPoint' = ''}

        # Loop through each potential AutoBitlocker volume, see whether they are enabled for Bitlocker, and if not, enable it
        foreach ($key in $autoBlVols.Keys)
        {
            $PSBoundParameters['MountPoint'] = $key

            $testResult = Test-BitlockerEnabled @PSBoundParameters

            if ($testResult -eq $false)
            {
                Enable-BitlockerInternal @PSBoundParameters -VerbosePreference $VerbosePreference
            }
        }
    }
}

<#
    .SYNOPSIS
        Tests whether settings defined DSC resource configuration are in the
        expected state.

    .PARAMETER MountPoint
        The MountPoint name as reported in Get-BitLockerVolume.

    .PARAMETER MinDiskCapacityGB
        Optional parameter specifying the minimum disk size, in GB, that should
        be considered for AutoBitlocker.

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
        [ValidateSet('Fixed', 'Removable')]
        [System.String]
        $DriveType,

        [Parameter()]
        [System.Int32]
        $MinDiskCapacityGB,

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

    $autoBlVols = Get-AutoBitlockerStatus @PSBoundParameters

    $allEnabled = $true

    if ($null -eq $autoBlVols)
    {
        Write-Error -Message 'Failed to retrieve Bitlocker status'

        $allEnabled = $false
    }
    else
    {
        Remove-FromPSBoundParametersUsingHashtable -PSBoundParametersIn $PSBoundParameters -ParamsToRemove 'DriveType', 'MinDiskCapacityGB'
        Add-ToPSBoundParametersFromHashtable -PSBoundParametersIn $PSBoundParameters -ParamsToAdd @{'MountPoint' = ''}

        # Check whether any potential AutoBitlocker volume is not currently enabled for Bitlocker, or doesn't have the correct settings
        foreach ($key in $autoBlVols.Keys)
        {
            $PSBoundParameters['MountPoint'] = $key

            $testResult = Test-BitlockerEnabled @PSBoundParameters -VerbosePreference $VerbosePreference

            if ($testResult -eq $false)
            {
                Write-Verbose -Message "Volume with Key '$key' is not yet enabled for Bitlocker"

                $allEnabled = $false
            }
        }
    }

    return $allEnabled
}

<#
    .SYNOPSIS
        Checks the status on all volumes eligible for AutoBitlocker.

    .PARAMETER MountPoint
        The MountPoint name as reported in Get-BitLockerVolume.

    .PARAMETER MinDiskCapacityGB
        Optional parameter specifying the minimum disk size, in GB, that should
        be considered for AutoBitlocker.

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
function Get-AutoBitlockerStatus
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Fixed', 'Removable')]
        [System.String]
        $DriveType,

        [Parameter()]
        [System.Int32]
        $MinDiskCapacityGB,

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

    # First get all Bitlocker Volumes of type Data
    $allBlvs = Get-BitLockerVolume | Where-Object -FilterScript {$_.VolumeType -eq 'Data'}

    # Filter on size if it was specified
    if ($PSBoundParameters.ContainsKey('MinDiskCapacityGB'))
    {
        $allBlvs = $allBlvs | Where-Object -FilterScript {$_.CapacityGB -ge $MinDiskCapacityGB}
    }

    # Now find disks of the appropriate drive type, and add them to the collection
    if ($null -ne $allBlvs)
    {
        [Hashtable] $returnValue = @{}

        # Convert DriveType into values returned by Win32_EncryptableVolume.VolumeType
        switch ($DriveType)
        {
            'Fixed'
            {
                $driveTypeValue = 1
            }
            'Removable'
            {
                $driveTypeValue = 2
            }
        }

        foreach ($blv in $allBlvs)
        {
            $vol = $null

            $encryptableVolumes = Get-CimInstance -Namespace 'root\cimv2\security\microsoftvolumeencryption' -Class Win32_Encryptablevolume -ErrorAction SilentlyContinue

            if (Split-Path -Path $blv.MountPoint -IsAbsolute)
            {
                # MountPoint is a Drive Letter
                $vol = $encryptableVolumes | Where-Object {($_.DriveLetter -eq $blv.Mountpoint) -and ($_.VolumeType -eq $driveTypeValue)}
            }
            else
            {
                # MountPoint is a path
                $vol = $encryptableVolumes | Where-Object {($_.DeviceID -eq $blv.Mountpoint) -and ($_.VolumeType -eq $driveTypeValue)}
            }

            if ($null -ne $vol)
            {
                [Hashtable] $props = @{
                    VolumeStatus = $blv.VolumeStatus
                    KeyProtectors = $blv.KeyProtector
                    EncryptionMethod = $blv.EncryptionMethod
                }

                $returnValue.Add($blv.MountPoint, $props)
            }
        }
    }

    $returnValue
}

Export-ModuleMember -Function *-TargetResource
