<#
    .SYNOPSIS
        Gets DSC resource configuration.

    .PARAMETER Identity
        A required string value which is used as a Key for the resource. The
        value does not matter, as long as its not empty.

    .PARAMETER AllowClear
        Indicates that the provisioning process clears the TPM, if necessary,
        to move the TPM closer to complying with Windows Server 2012 standards.

    .PARAMETER AllowPhysicalPresence
        Indicates that the provisioning process may send physical presence
        commands that require a user to be present in order to continue.

    .PARAMETER AllowImmediateReboot
        Whether the computer can rebooted immediately after initializing the
        TPM.
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
        $Identity,

        [Parameter()]
        [System.Boolean]
        $AllowClear,

        [Parameter()]
        [System.Boolean]
        $AllowPhysicalPresence,

        [Parameter()]
        [System.Boolean]
        $AllowImmediateReboot = $false
    )

    # Load helper module
    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    Assert-HasPrereqsForBitlocker

    $tpm = Get-Tpm

    if ($null -ne $tpm)
    {
        $returnValue = @{
            Identity = $Identity
        }
    }

    $returnValue
}

<#
    .SYNOPSIS
        Configures settings defined DSC resource configuration.

    .PARAMETER Identity
        A required string value which is used as a Key for the resource. The
        value does not matter, as long as its not empty.

    .PARAMETER AllowClear
        Indicates that the provisioning process clears the TPM, if necessary,
        to move the TPM closer to complying with Windows Server 2012 standards.

    .PARAMETER AllowPhysicalPresence
        Indicates that the provisioning process may send physical presence
        commands that require a user to be present in order to continue.

    .PARAMETER AllowImmediateReboot
        Whether the computer can rebooted immediately after initializing the
        TPM.
#>
function Set-TargetResource
{
    # Suppressing this rule because $global:DSCMachineStatus is used to trigger a reboot.
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '', Scope='Function', Target='DSCMachineStatus')]
    <#
        Suppressing this rule because $global:DSCMachineStatus is only set,
        never used (by design of Desired State Configuration).
    #>
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '', Scope='Function', Target='DSCMachineStatus')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSDSCUseVerboseMessageInDSCResource', '')]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $AllowClear,

        [Parameter()]
        [System.Boolean]
        $AllowPhysicalPresence,

        [Parameter()]
        [System.Boolean]
        $AllowImmediateReboot = $false
    )

    # Load helper module
    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    Assert-HasPrereqsForBitlocker

    $PSBoundParameters.Remove('Identity') | Out-Null
    $PSBoundParameters.Remove('AllowImmediateReboot') | Out-Null

    $tpm = Initialize-Tpm @PSBoundParameters

    if ($null -ne $tpm)
    {
        if ($tpm.RestartRequired -eq $true)
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
        throw 'Failed to initialize TPM'
    }
}

<#
    .SYNOPSIS
        Tests whether settings defined DSC resource configuration are in the
        expected state.

    .PARAMETER Identity
        A required string value which is used as a Key for the resource. The
        value does not matter, as long as its not empty.

    .PARAMETER AllowClear
        Indicates that the provisioning process clears the TPM, if necessary,
        to move the TPM closer to complying with Windows Server 2012 standards.

    .PARAMETER AllowPhysicalPresence
        Indicates that the provisioning process may send physical presence
        commands that require a user to be present in order to continue.

    .PARAMETER AllowImmediateReboot
        Whether the computer can rebooted immediately after initializing the
        TPM.
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
        $Identity,

        [Parameter()]
        [System.Boolean]
        $AllowClear,

        [Parameter()]
        [System.Boolean]
        $AllowPhysicalPresence,

        [Parameter()]
        [System.Boolean]
        $AllowImmediateReboot = $false
    )

    # Load helper module
    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    Assert-HasPrereqsForBitlocker

    $tpm = Get-Tpm

    if ($null -eq $tpm)
    {
        Write-Error -Message 'Failed to retrieve TPM information'

        return $false
    }
    else
    {
        return $tpm.TpmReady
    }
}


Export-ModuleMember -Function *-TargetResource
