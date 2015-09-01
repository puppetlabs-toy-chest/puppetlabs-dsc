function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Identity
    )

    #Load helper module    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    CheckForPreReqs

    $tpm = Get-Tpm
    
    if ($tpm -ne $null)
    {
        $returnValue = @{
            Identity = $Identity
        }
    }

    $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Identity,

        [System.Boolean]
        $AllowClear,

        [System.Boolean]
        $AllowPhysicalPresence,

        [System.Boolean]
        $AllowImmediateReboot = $false
    )

    #Load helper module    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    CheckForPreReqs

    $PSBoundParameters.Remove("Identity") | Out-Null
    $PSBoundParameters.Remove("AllowImmediateReboot") | Out-Null
    
    $tpm = Initialize-Tpm @PSBoundParameters

    if ($tpm -ne $null)
    {
        if ($tpm.RestartRequired -eq $true)
        {
            $global:DSCMachineStatus = 1

            if ($AllowImmediateReboot -eq $true)
            {
                Write-Verbose "Forcing an immediate reboot of the computer in 30 seconds"

                Start-Sleep -Seconds 30
                Restart-Computer -Force
            }
        }
    }
    else
    {
        throw "Failed to initialize TPM"
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Identity,

        [System.Boolean]
        $AllowClear,

        [System.Boolean]
        $AllowPhysicalPresence,

        [System.Boolean]
        $AllowImmediateReboot = $false
    )

    #Load helper module    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\xBitlockerCommon.psm1" -Verbose:0

    CheckForPreReqs

    $tpm = Get-Tpm

    if ($tpm -eq $null)
    {
        return $false
    }
    else
    {
        return $tpm.TpmReady
    }
}


Export-ModuleMember -Function *-TargetResource


