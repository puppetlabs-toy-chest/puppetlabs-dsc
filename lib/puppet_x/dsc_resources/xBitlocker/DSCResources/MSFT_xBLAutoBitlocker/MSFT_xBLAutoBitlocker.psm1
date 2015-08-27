function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Fixed","Removable")]
        [System.String]
        $DriveType,

        [System.Int32]
        $MinDiskCapacityGB,

        [ValidateSet("PasswordProtector","RecoveryPasswordProtector","StartupKeyProtector","TpmProtector")]
        [parameter(Mandatory = $true)]
        [System.String]
        $PrimaryProtector,

        [System.String]
        $AdAccountOrGroup,

        [System.Boolean]
        $AdAccountOrGroupProtector,

        [System.Boolean]
        $AutoUnlock = $false,

        [ValidateSet("Aes128","Aes256")]
        [System.String]
        $EncryptionMethod,

        [System.Boolean]
        $HardwareEncryption,

        [System.Management.Automation.PSCredential]
        $Password,

        [System.Boolean]
        $PasswordProtector,

        [System.Management.Automation.PSCredential]
        $Pin,

        [System.String]
        $RecoveryKeyPath,

        [System.Boolean]
        $RecoveryKeyProtector,

        [System.Boolean]
        $RecoveryPasswordProtector,

        [System.Boolean]
        $Service,

        [System.Boolean]
        $SkipHardwareTest,

        [System.String]
        $StartupKeyPath,

        [System.Boolean]
        $StartupKeyProtector,

        [System.Boolean]
        $TpmProtector,

        [System.Boolean]
        $UsedSpaceOnly
    )

    #Load helper module    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    CheckForPreReqs

    $returnValue = @{
        DriveType = $DriveType
    }

    $returnValue
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Fixed","Removable")]
        [System.String]
        $DriveType,

        [System.Int32]
        $MinDiskCapacityGB,

        [ValidateSet("PasswordProtector","RecoveryPasswordProtector","StartupKeyProtector","TpmProtector")]
        [parameter(Mandatory = $true)]
        [System.String]
        $PrimaryProtector,

        [System.String]
        $AdAccountOrGroup,

        [System.Boolean]
        $AdAccountOrGroupProtector,

        [System.Boolean]
        $AutoUnlock = $false,

        [ValidateSet("Aes128","Aes256")]
        [System.String]
        $EncryptionMethod,

        [System.Boolean]
        $HardwareEncryption,

        [System.Management.Automation.PSCredential]
        $Password,

        [System.Boolean]
        $PasswordProtector,

        [System.Management.Automation.PSCredential]
        $Pin,

        [System.String]
        $RecoveryKeyPath,

        [System.Boolean]
        $RecoveryKeyProtector,

        [System.Boolean]
        $RecoveryPasswordProtector,

        [System.Boolean]
        $Service,

        [System.Boolean]
        $SkipHardwareTest,

        [System.String]
        $StartupKeyPath,

        [System.Boolean]
        $StartupKeyProtector,

        [System.Boolean]
        $TpmProtector,

        [System.Boolean]
        $UsedSpaceOnly
    )
    
    #Load helper module    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    CheckForPreReqs

    $autoBlVols = GetAutoBitlockerStatus @PSBoundParameters

    if ($autoBlVols -eq $null)
    {
        throw "No Auto Bitlocker volumes were found"
    }
    else
    {
        RemoveParameters -PSBoundParametersIn $PSBoundParameters -ParamsToRemove "DriveType","MinDiskCapacityGB"
        AddParameters -PSBoundParametersIn $PSBoundParameters -ParamsToAdd @{"MountPoint" = ""}

        #Loop through each potential AutoBitlocker volume, see whether they are enabled for Bitlocker, and if not, enable it
        foreach ($key in $autoBlVols.Keys)
        {
            $PSBoundParameters["MountPoint"] = $key

            $testResult = TestBitlocker @PSBoundParameters

            if ($testResult -eq $false)
            {
                EnableBitlocker @PSBoundParameters -VerbosePreference $VerbosePreference
            }
        }
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Fixed","Removable")]
        [System.String]
        $DriveType,

        [System.Int32]
        $MinDiskCapacityGB,

        [ValidateSet("PasswordProtector","RecoveryPasswordProtector","StartupKeyProtector","TpmProtector")]
        [parameter(Mandatory = $true)]
        [System.String]
        $PrimaryProtector,

        [System.String]
        $AdAccountOrGroup,

        [System.Boolean]
        $AdAccountOrGroupProtector,

        [System.Boolean]
        $AutoUnlock = $false,

        [ValidateSet("Aes128","Aes256")]
        [System.String]
        $EncryptionMethod,

        [System.Boolean]
        $HardwareEncryption,

        [System.Management.Automation.PSCredential]
        $Password,

        [System.Boolean]
        $PasswordProtector,

        [System.Management.Automation.PSCredential]
        $Pin,

        [System.String]
        $RecoveryKeyPath,

        [System.Boolean]
        $RecoveryKeyProtector,

        [System.Boolean]
        $RecoveryPasswordProtector,

        [System.Boolean]
        $Service,

        [System.Boolean]
        $SkipHardwareTest,

        [System.String]
        $StartupKeyPath,

        [System.Boolean]
        $StartupKeyProtector,

        [System.Boolean]
        $TpmProtector,

        [System.Boolean]
        $UsedSpaceOnly
    )

    #Load helper module    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    CheckForPreReqs

    $autoBlVols = GetAutoBitlockerStatus @PSBoundParameters

    if ($autoBlVols -eq $null)
    {
        return $false
    }
    else
    {
        RemoveParameters -PSBoundParametersIn $PSBoundParameters -ParamsToRemove "DriveType","MinDiskCapacityGB"
        AddParameters -PSBoundParametersIn $PSBoundParameters -ParamsToAdd @{"MountPoint" = ""}

        #Check whether any potential AutoBitlocker volume is not currently enabled for Bitlocker, or doesn't have the correct settings
        foreach ($key in $autoBlVols.Keys)
        {
            $PSBoundParameters["MountPoint"] = $key

            $testResult = TestBitlocker @PSBoundParameters -VerbosePreference $VerbosePreference

            if ($testResult -eq $false)
            {
                return $testResult
            }
        }
    }

    return $true
}

function GetAutoBitlockerStatus
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Fixed","Removable")]
        [System.String]
        $DriveType,

        [System.Int32]
        $MinDiskCapacityGB,

        [ValidateSet("PasswordProtector","RecoveryPasswordProtector","StartupKeyProtector","TpmProtector")]
        [parameter(Mandatory = $true)]
        [System.String]
        $PrimaryProtector,

        [System.String]
        $AdAccountOrGroup,

        [System.Boolean]
        $AdAccountOrGroupProtector,

        [System.Boolean]
        $AutoUnlock = $false,

        [ValidateSet("Aes128","Aes256")]
        [System.String]
        $EncryptionMethod,

        [System.Boolean]
        $HardwareEncryption,

        [System.Management.Automation.PSCredential]
        $Password,

        [System.Boolean]
        $PasswordProtector,

        [System.Management.Automation.PSCredential]
        $Pin,

        [System.String]
        $RecoveryKeyPath,

        [System.Boolean]
        $RecoveryKeyProtector,

        [System.Boolean]
        $RecoveryPasswordProtector,

        [System.Boolean]
        $Service,

        [System.Boolean]
        $SkipHardwareTest,

        [System.String]
        $StartupKeyPath,

        [System.Boolean]
        $StartupKeyProtector,

        [System.Boolean]
        $TpmProtector,

        [System.Boolean]
        $UsedSpaceOnly
    )

    #First get all Bitlocker Volumes of type Data
    $allBlvs = Get-BitLockerVolume | where {$_.VolumeType -eq "Data"}

    #Filter on size if it was specified
    if ($PSBoundParameters.ContainsKey("MinDiskCapacityGB"))
    {
        $allBlvs = $allBlvs | where {$_.CapacityGB -ge $MinDiskCapacityGB}
    }

    #Now find disks of the appropriate drive type, and add them to the collection
    if ($allBlvs -ne $null)
    {
        [Hashtable]$returnValue = @{}

        foreach ($blv in $allBlvs)
        {
            $vol = $null
            $vol = Get-Volume -Path $blv.MountPoint -ErrorAction SilentlyContinue | where {$_.DriveType -like $DriveType}

            if ($vol -ne $null)
            {
                [Hashtable]$props = @{
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


