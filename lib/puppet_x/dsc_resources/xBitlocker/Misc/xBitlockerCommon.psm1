<#
    .SYNOPSIS
        Enables Bitlocker and Bitlocker features on the requested disk.

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

    .PARAMETER VerbosePreference
        Used to modify the default VerbosePreference for the function.
#>
function Enable-BitlockerInternal
{
    # Suppressing this rule because $global:DSCMachineStatus is used to trigger a reboot.
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '', Scope='Function', Target='DSCMachineStatus')]
    <#
        Suppressing this rule because $global:DSCMachineStatus is only set,
        never used (by design of Desired State Configuration).
    #>
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '', Scope='Function', Target='DSCMachineStatus')]
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
        $UsedSpaceOnly,

        [Parameter()]
        $VerbosePreference
    )

    Write-Verbose "Beginning processing of MountPoint: $($MountPoint)"

    $blv = Get-BitLockerVolume -MountPoint $MountPoint -ErrorAction SilentlyContinue

    if ($null -ne $blv)
    {
        if ($PSBoundParameters.ContainsKey('TpmProtector') -and $PrimaryProtector -ne 'TpmProtector')
        {
            throw 'If TpmProtector is used, it must be the PrimaryProtector.'
        }

        if ($PSBoundParameters.ContainsKey('Pin') -and !($PSBoundParameters.ContainsKey('TpmProtector')))
        {
            throw 'A TpmProtector must be used if Pin is used.'
        }

        Add-MissingBitLockerKeyProtector @PSBoundParameters

        # Now enable Bitlocker with the primary key protector
        if ($blv.VolumeStatus -eq 'FullyDecrypted')
        {
            # First add non-key related parameters
            $params = @{}
            $params.Add('MountPoint', $MountPoint)

            if ($PSBoundParameters.ContainsKey('EncryptionMethod'))
            {
                $params.Add('EncryptionMethod', $EncryptionMethod)
            }

            if ($PSBoundParameters.ContainsKey('HardwareEncryption'))
            {
                $params.Add('HardwareEncryption', $HardwareEncryption)
            }

            if ($PSBoundParameters.ContainsKey('Service'))
            {
                $params.Add('Service', $Service)
            }

            if ($PSBoundParameters.ContainsKey('SkipHardwareTest'))
            {
                $params.Add('SkipHardwareTest', $SkipHardwareTest)
            }

            if ($PSBoundParameters.ContainsKey('UsedSpaceOnly'))
            {
                $params.Add('UsedSpaceOnly', $UsedSpaceOnly)
            }

            # Now add the primary protector
            $handledTpmAlready = $false

            # Deal with a couple one off cases
            if ($PSBoundParameters.ContainsKey('Pin'))
            {
                $handledTpmAlready = $true

                $params.Add('Pin', $Pin.Password)

                if ($PSBoundParameters.ContainsKey('StartupKeyProtector'))
                {
                    $params.Add('TpmAndPinAndStartupKeyProtector', $true)
                    $params.Add('StartupKeyPath', $StartupKeyPath)
                }
                else
                {
                    $params.Add('TpmAndPinProtector', $true)
                }
            }

            if ($PSBoundParameters.ContainsKey('StartupKeyProtector') -and $PrimaryProtector -like 'TpmProtector' -and $handledTpmAlready -eq $false)
            {
                $handledTpmAlready = $true

                $params.Add('TpmAndStartupKeyProtector', $true)
                $params.Add('StartupKeyPath', $StartupKeyPath)
            }


            # Now deal with the standard primary protectors
            if ($PrimaryProtector -like 'PasswordProtector')
            {
                $params.Add('PasswordProtector', $true)
                $params.Add('Password', $Password.Password)
            }
            elseif ($PrimaryProtector -like 'RecoveryPasswordProtector')
            {
                $params.Add('RecoveryPasswordProtector', $true)
            }
            elseif ($PrimaryProtector -like 'StartupKeyProtector')
            {
                $params.Add('StartupKeyProtector', $true)
                $params.Add('StartupKeyPath', $StartupKeyPath)
            }
            elseif ($PrimaryProtector -like 'TpmProtector' -and $handledTpmAlready -eq $false)
            {
                $params.Add('TpmProtector', $true)
            }

            # Run Enable-Bitlocker
            Write-Verbose 'Running Enable-Bitlocker'

            $blv = Enable-Bitlocker @params

            # Check if the Enable succeeded
            if ($null -ne $blv)
            {
                # Only initiate reboot if this is an OS drive
                if ($blv.VolumeType -eq 'OperatingSystem')
                {
                    $global:DSCMachineStatus = 1

                    if ($AllowImmediateReboot -eq $true)
                    {
                        Write-Verbose 'Forcing an immediate reboot of the computer in 30 seconds'

                        Start-Sleep -Seconds 30
                        Restart-Computer -Force
                    }
                }
            }
            else
            {
                throw "Failed to successfully enable Bitlocker on MountPoint $($MountPoint)"
            }
        }

        # Finally, enable AutoUnlock if requested
        if ($AutoUnlock -eq $true -and $blv.VolumeType -ne 'OperatingSystem' -and !$blv.AutoUnlockEnabled)
        {
            Enable-BitlockerAutoUnlock -MountPoint $MountPoint
        }
    }
    else
    {
        throw "Unable to find Bitlocker Volume associated with Mount Point '$($MountPoint)'"
    }
}

<#
    .SYNOPSIS
        Checks if any required secondary Key Protectors are missing, and adds
        them to the requested volume.

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

    .PARAMETER VerbosePreference
        Used to modify the default VerbosePreference for the function.
#>
function Add-MissingBitLockerKeyProtector
{
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
        $UsedSpaceOnly,

        [Parameter()]
        $VerbosePreference
    )

    if ($PSBoundParameters.ContainsKey('AdAccountOrGroupProtector') -and $PrimaryProtector -notlike 'AdAccountOrGroupProtector' -and !(Test-CollectionContainsKeyProtector -Type 'AdAccountOrGroup' -KeyProtectorCollection $blv.KeyProtector))
    {
        Write-Verbose 'Adding AdAccountOrGroupProtector'
        Add-BitLockerKeyProtector -MountPoint $MountPoint -AdAccountOrGroupProtector -AdAccountOrGroup $AdAccountOrGroup
    }

    if ($PSBoundParameters.ContainsKey('PasswordProtector') -and $PrimaryProtector -notlike 'PasswordProtector' -and !(Test-CollectionContainsKeyProtector -Type 'Password' -KeyProtectorCollection $blv.KeyProtector))
    {
        Write-Verbose 'Adding PasswordProtector'
        Add-BitLockerKeyProtector -MountPoint $MountPoint -PasswordProtector -Password $Password.Password
    }

    if ($PSBoundParameters.ContainsKey('RecoveryKeyProtector') -and $PrimaryProtector -notlike 'RecoveryKeyProtector' -and !(Test-CollectionContainsKeyProtector -Type 'ExternalKey' -KeyProtectorCollection $blv.KeyProtector))
    {
        Write-Verbose 'Adding RecoveryKeyProtector'
        Add-BitLockerKeyProtector -MountPoint $MountPoint -RecoveryKeyProtector -RecoveryKeyPath $RecoveryKeyPath
    }

    if ($PSBoundParameters.ContainsKey('RecoveryPasswordProtector') -and $PrimaryProtector -notlike 'RecoveryPasswordProtector' -and !(Test-CollectionContainsKeyProtector -Type 'RecoveryPassword' -KeyProtectorCollection $blv.KeyProtector))
    {
        Write-Verbose 'Adding RecoveryPasswordProtector'
        Add-BitLockerKeyProtector -MountPoint $MountPoint -RecoveryPasswordProtector
    }

    if ($PSBoundParameters.ContainsKey('StartupKeyProtector') -and $PrimaryProtector -notlike 'TpmProtector' -and $PrimaryProtector -notlike 'StartupKeyProtector' -and !(Test-CollectionContainsKeyProtector -Type 'ExternalKey' -KeyProtectorCollection $blv.KeyProtector))
    {
        Write-Verbose 'Adding StartupKeyProtector'
        Add-BitLockerKeyProtector -MountPoint $MountPoint -StartupKeyProtector -StartupKeyPath $StartupKeyPath
    }
}

<#
    .SYNOPSIS
        Tests whether Bitlocker and the requested features have been enabled
        on the target disk.

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

    .PARAMETER VerbosePreference
        Used to modify the default VerbosePreference for the function.
#>
function Test-BitlockerEnabled
{
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
        $UsedSpaceOnly,

        [Parameter()]
        $VerbosePreference
    )

    $blv = Get-BitLockerVolume -MountPoint $MountPoint -ErrorAction SilentlyContinue

    if ($null -eq $blv)
    {
        Write-Verbose "Unable to locate MountPoint: $($MountPoint)"
        return $false
    }
    elseif ($blv.VolumeStatus -eq 'FullyDecrypted')
    {
        Write-Verbose "MountPoint: $($MountPoint) Not Encrypted"
        return $false
    }
    elseif ($null -eq $blv.KeyProtector -or $blv.KeyProtector.Count -eq 0)
    {
        Write-Verbose "No key protectors on MountPoint: $($MountPoint)"
        return $false
    }
    elseif ($AutoUnlock -eq $true -and $blv.AutoUnlockEnabled -ne $true -and $blv.VolumeType -ne 'OperatingSystem')
    {
        Write-Verbose "AutoUnlock is not enabled for MountPoint: $($MountPoint)"
        return $false
    }
    else
    {
        if ($PSBoundParameters.ContainsKey('AdAccountOrGroupProtector') -and !(Test-CollectionContainsKeyProtector -Type 'AdAccountOrGroup' -KeyProtectorCollection $blv.KeyProtector))
        {
            Write-Verbose "MountPoint '$($MountPoint) 'does not have AdAccountOrGroupProtector (AdAccountOrGroup)"
            return $false
        }

        if ($PSBoundParameters.ContainsKey('PasswordProtector') -and !(Test-CollectionContainsKeyProtector -Type 'Password' -KeyProtectorCollection $blv.KeyProtector))
        {
            Write-Verbose "MountPoint '$($MountPoint) 'does not have PasswordProtector (Password)"
            return $false
        }

        if ($PSBoundParameters.ContainsKey('Pin') -and !(Test-CollectionContainsKeyProtector -Type 'TpmPin' -KeyProtectorCollection $blv.KeyProtector -StartsWith $true))
        {
            Write-Verbose "MountPoint '$($MountPoint) 'does not have TpmPin assigned."
            return $false
        }

        if ($PSBoundParameters.ContainsKey('RecoveryKeyProtector') -and !(Test-CollectionContainsKeyProtector -Type 'ExternalKey' -KeyProtectorCollection $blv.KeyProtector))
        {
            Write-Verbose "MountPoint '$($MountPoint) 'does not have RecoveryKeyProtector (ExternalKey)"
            return $false
        }

        if ($PSBoundParameters.ContainsKey('RecoveryPasswordProtector') -and !(Test-CollectionContainsKeyProtector -Type 'RecoveryPassword' -KeyProtectorCollection $blv.KeyProtector))
        {
            Write-Verbose "MountPoint '$($MountPoint) 'does not have RecoveryPasswordProtector (RecoveryPassword)"
            return $false
        }

        if ($PSBoundParameters.ContainsKey('StartupKeyProtector'))
        {
            if ($PrimaryProtector -notlike 'TpmProtector')
            {
                if (!(Test-CollectionContainsKeyProtector -Type 'ExternalKey' -KeyProtectorCollection $blv.KeyProtector))
                {
                    Write-Verbose "MountPoint '$($MountPoint) 'does not have StartupKeyProtector (ExternalKey)"
                    return $false
                }
            }
            else # TpmProtector is primary
            {
                if(!(Test-CollectionContainsKeyProtector -Type 'Tpm' -KeyProtectorCollection $blv.KeyProtector -StartsWith $true) -and !(Test-CollectionContainsKeyProtector -Type 'StartupKey' -KeyProtectorCollection $blv.KeyProtector -Contains $true))
                {
                    Write-Verbose "MountPoint '$($MountPoint) 'does not have TPM + StartupKey protector."
                    return $false
                }
            }
        }

        if ($PSBoundParameters.ContainsKey('TpmProtector') -and !(Test-CollectionContainsKeyProtector -Type 'Tpm' -KeyProtectorCollection $blv.KeyProtector -StartsWith $true))
        {
            Write-Verbose "MountPoint '$($MountPoint) 'does not have TpmProtector"
            return $false
        }
    }

    return $true
}

<#
    .SYNOPSIS
        Tests whether the requires prerequisite features for Bitlocker are
        installed, and throws an exception if they are not.
#>
function Assert-HasPrereqsForBitlocker
{
    [CmdletBinding()]
    param()

    $hasAllPreReqs = $true

    $blFeature = Get-WindowsFeature BitLocker
    $blAdminToolsFeature = Get-WindowsFeature RSAT-Feature-Tools-BitLocker
    $blAdminToolsRemoteFeature = Get-WindowsFeature RSAT-Feature-Tools-BitLocker-RemoteAdminTool

    if ($blFeature.InstallState -ne 'Installed')
    {
        $hasAllPreReqs = $false

        Write-Error 'The Bitlocker feature needs to be installed before the xBitlocker module can be used'
    }

    if ($blAdminToolsFeature.InstallState -ne 'Installed')
    {
        $hasAllPreReqs = $false

        Write-Error 'The RSAT-Feature-Tools-BitLocker feature needs to be installed before the xBitlocker module can be used'
    }

    if ($blAdminToolsRemoteFeature.InstallState -ne 'Installed' -and (Get-OSEdition) -notmatch 'Core')
    {
        $hasAllPreReqs = $false

        Write-Error 'The RSAT-Feature-Tools-BitLocker-RemoteAdminTool feature needs to be installed before the xBitlocker module can be used'
    }

    if ($hasAllPreReqs -eq $false)
    {
        throw 'Required Bitlocker features need to be installed before xBitlocker can be used'
    }
}

<#
    .SYNOPSIS
        Tests whether the KeyProtectorCollection returned from
        Get-BitlockerVolume contains the specified KeyProtector type.

    .PARAMETER Type
        The KeyProtector type to look for in the KeyProtectorCollection.

    .PARAMETER KeyProtectorCollection
        The KeyProtectorCollection to look for the KeyProtector type within.

    .PARAMETER StartsWith
        Whether to look for a KeyProtector type that only StartsWith the input
        Type.

    .PARAMETER Contains
        Whether to look for a KeyProtector type that only Contains the input
        Type.
#>
function Test-CollectionContainsKeyProtector
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Type,

        [Parameter()]
        [System.Object[]]
        $KeyProtectorCollection,

        [Parameter()]
        [System.Boolean]
        $StartsWith = $false,

        [Parameter()]
        [System.Boolean]
        $Contains = $false
    )

    if ($null -ne $KeyProtectorCollection)
    {
        foreach ($keyProtector in $KeyProtectorCollection)
        {
            if ($keyProtector.KeyProtectorType -eq $Type)
            {
                return $true
            }
            elseif ($StartsWith -eq $true -and $keyProtector.KeyProtectorType.ToString().StartsWith($Type))
            {
                return $true
            }
            elseif ($Contains -eq $true -and $keyProtector.KeyProtectorType.ToString().Contains($Type))
            {
                return $true
            }
        }
    }

    return $false
}

<#
    .SYNOPSIS
        Takes $PSBoundParameters from another function and adds in the keys and
        values from the given Hashtable.

    .PARAMETER PSBoundParametersIn
        The $PSBoundParameters Hashtable from the calling function.

    .PARAMETER ParamsToAdd
        A Hashtable containing new Key/Value pairs to add to the given
        PSBoundParametersIn Hashtable.
#>
function Add-ToPSBoundParametersFromHashtable
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $PSBoundParametersIn,

        [Parameter()]
        [System.Collections.Hashtable]
        $ParamsToAdd
    )

    foreach ($key in $ParamsToAdd.Keys)
    {
        if (!($PSBoundParametersIn.ContainsKey($key))) # Key doesn't exist, so add it with value
        {
            $PSBoundParametersIn.Add($key, $ParamsToAdd[$key]) | Out-Null
        }
        else # Key already exists, so just replace the value
        {
            $PSBoundParametersIn[$key] = $ParamsToAdd[$key]
        }
    }
}

<#
    .SYNOPSIS
        Takes $PSBoundParameters from another function, and modifies it based
        on the contents of the ParamsToRemove or ParamsToKeep parameters. If
        ParamsToRemove is specified, it will remove each param. If ParamsToKeep
        is specified, everything but those params will be removed.

    .PARAMETER PSBoundParametersIn
        The $PSBoundParameters Hashtable from the calling function.

    .PARAMETER ParamsToKeep
        A String array containing the list of parameter names to keep in the
        given PSBoundParametersIn HashTable.

    .PARAMETER ParamsToRemove
        A String array containing the list of parameter names to remove in the
        given PSBoundParametersIn HashTable.
#>
function Remove-FromPSBoundParametersUsingHashtable
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $PSBoundParametersIn,

        [Parameter(Mandatory = $true, ParameterSetName = 'KeepParameters')]
        [System.String[]]
        $ParamsToKeep,

        [Parameter(Mandatory = $true, ParameterSetName = 'RemoveParameters')]
        [System.String[]]
        $ParamsToRemove
    )

    if ($ParamsToKeep.Count -gt 0)
    {
        $ParamsToKeep = $ParamsToKeep.ToLower()

        foreach ($key in $PSBoundParametersIn.Keys)
        {
            if (!($ParamsToKeep.Contains($key.ToLower())))
            {
                $ParamsToRemove += $key
            }
        }
    }

    if ($ParamsToRemove.Count -gt 0)
    {
        foreach ($param in $ParamsToRemove)
        {
            $null = $PSBoundParametersIn.Remove($param)
        }
    }
}

<#
    .SYNOPSIS
        Returns the OS edition we are currently running on
#>
function Get-OSEdition
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param()

    return (Get-ItemProperty -Path 'HKLM:/software/microsoft/windows nt/currentversion' -Name InstallationType).InstallationType
}

Export-ModuleMember -Function *
