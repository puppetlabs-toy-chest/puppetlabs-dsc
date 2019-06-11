<#
    .SYNOPSIS Get state of the resource
    .EXAMPLE
        Get-TargetResource -Name DefenderPreferences -HighThreatDefaultAction Quarantine
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [System.String[]]
        $ExclusionPath,

        [System.String[]]
        $ExclusionExtension,

        [System.String[]]
        $ExclusionProcess,

        [ValidateSet("Both","Incoming","Outgoing")]
        [System.String]
        $RealTimeScanDirection,

        [System.UInt32]
        $QuarantinePurgeItemsAfterDelay,

        [ValidateSet("Everyday","Never","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")]
        [System.String]
        $RemediationScheduleDay,

        [System.DateTime]
        $RemediationScheduleTime,

        [System.UInt32]
        $ReportingAdditionalActionTimeOut,

        [System.UInt32]
        $ReportingNonCriticalTimeOut,

        [System.UInt32]
        $ReportingCriticalFailureTimeOut,

        [System.UInt32]
        $ScanAvgCPULoadFactor,

        [System.Boolean]
        $CheckForSignaturesBeforeRunningScan,

        [System.UInt32]
        $ScanPurgeItemsAfterDelay,

        [System.Boolean]
        $ScanOnlyIfIdleEnabled,

        [ValidateSet("FullSCan","QuickScan")]
        [System.String]
        $ScanParameters,

        [ValidateSet("Everyday","Never","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")]
        [System.String]
        $ScanScheduleDay,

        [System.DateTime]
        $ScanScheduleQuickScanTime,

        [System.DateTime]
        $ScanScheduleTime,

        [System.UInt32]
        $SignatureFirstAuGracePeriod,

        [System.UInt32]
        $SignatureAuGracePeriod,

        [System.String]
        $SignatureDefinitionUpdateFileSharesSources,

        [System.Boolean]
        $SignatureDisableUpdateOnStartupWithoutEngine,

        [System.String]
        $SignatureFallbackOrder,

        [ValidateSet("Everyday","Never","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")]
        [System.String]
        $SignatureScheduleDay,

        [System.DateTime]
        $SignatureScheduleTime,

        [System.UInt32]
        $SignatureUpdateCatchupInterval,

        [System.UInt32]
        $SignatureUpdateInterval,

        [ValidateSet("Advanced","Basic","Disabled")]
        [System.String]
        $MAPSReporting,

        [System.Boolean]
        $DisablePrivacyMode,

        [System.Boolean]
        $RandomizeScheduleTaskTimes,

        [System.Boolean]
        $DisableBehaviorMonitoring,

        [System.Boolean]
        $DisableIntrusionPreventionSystem,

        [System.Boolean]
        $DisableIOAVProtection,

        [System.Boolean]
        $DisableRealtimeMonitoring,

        [System.Boolean]
        $DisableScriptScanning,

        [System.Boolean]
        $DisableArchiveScanning,

        [System.Boolean]
        $DisableAutoExclusions,

        [System.Boolean]
        $DisableCatchupFullScan,

        [System.Boolean]
        $DisableCatchupQuickScan,

        [System.Boolean]
        $DisableEmailScanning,

        [System.Boolean]
        $DisableRemovableDriveScanning,

        [System.Boolean]
        $DisableRestorePoint,

        [System.Boolean]
        $DisableScanningMappedNetworkDrivesForFullScan,

        [System.Boolean]
        $DisableScanningNetworkFiles,

        [System.Boolean]
        $UILockdown,

        [System.UInt64]
        $ThreatIDDefaultAction_Ids,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $ThreatIDDefaultAction_Actions,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $UnknownThreatDefaultAction,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $LowThreatDefaultAction,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $ModerateThreatDefaultAction,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $HighThreatDefaultAction,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $SevereThreatDefaultAction,

        [ValidateSet("Allways Prompt","Send safe samples automatically","Never send","Send all samples automatically")]
        [System.String]
        $SubmitSamplesConsent
    )

    $mpp = Get-MpPreference
    $exclude = 'PSComputerName','ComputerID'
    $MPPreference = $mpp | Get-Member -MemberType Property | ? {$_.Name -notin $exclude} | % Name

    foreach ($pref in $MPPreference)
    {
        $value = switch ($pref) {
            'RealTimeScanDirection' {Convert-ScanDirectionText $mpp.$pref}
            {$_ -in 'RemediationScheduleDay','ScanScheduleDay','SignatureScheduleDay'} {Convert-ScheduleDayText $mpp.$pref}
            'ScanParameters' {Convert-ScanParametersText $mpp.$pref}
            'MAPSReporting' {Convert-ReportingText $mpp.$pref}
            'SubmitSamplesConsent' {Convert-SubmitSamplesConsentText $mpp.$pref}
            {$_ -in 'ThreatIDDefaultAction_Actions','UnknownThreatDefaultAction','LowThreatDefaultAction','ModerateThreatDefaultAction','HighThreatDefaultAction','SevereThreatDefaultAction'} {Convert-ActionText $mpp.$pref}
            Default {$mpp.$pref}
            }
       $return += @{$pref = $value}
    }
    $return += @{Name = $Name}
 
    $return
}

<#
    .SYNOPSIS Set state of the resource
    .EXAMPLE
        Set-TargetResource -Name DefenderPreferences -HighThreatDefaultAction Quarantine
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [System.String[]]
        $ExclusionPath,

        [System.String[]]
        $ExclusionExtension,

        [System.String[]]
        $ExclusionProcess,

        [ValidateSet("Both","Incoming","Outgoing")]
        [System.String]
        $RealTimeScanDirection,

        [System.UInt32]
        $QuarantinePurgeItemsAfterDelay,

        [ValidateSet("Everyday","Never","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")]
        [System.String]
        $RemediationScheduleDay,

        [System.DateTime]
        $RemediationScheduleTime,

        [System.UInt32]
        $ReportingAdditionalActionTimeOut,

        [System.UInt32]
        $ReportingNonCriticalTimeOut,

        [System.UInt32]
        $ReportingCriticalFailureTimeOut,

        [System.UInt32]
        $ScanAvgCPULoadFactor,

        [System.Boolean]
        $CheckForSignaturesBeforeRunningScan,

        [System.UInt32]
        $ScanPurgeItemsAfterDelay,

        [System.Boolean]
        $ScanOnlyIfIdleEnabled,

        [ValidateSet("FullSCan","QuickScan")]
        [System.String]
        $ScanParameters,

        [ValidateSet("Everyday","Never","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")]
        [System.String]
        $ScanScheduleDay,

        [System.DateTime]
        $ScanScheduleQuickScanTime,

        [System.DateTime]
        $ScanScheduleTime,

        [System.UInt32]
        $SignatureFirstAuGracePeriod,

        [System.UInt32]
        $SignatureAuGracePeriod,

        [System.String]
        $SignatureDefinitionUpdateFileSharesSources,

        [System.Boolean]
        $SignatureDisableUpdateOnStartupWithoutEngine,

        [System.String]
        $SignatureFallbackOrder,

        [ValidateSet("Everyday","Never","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")]
        [System.String]
        $SignatureScheduleDay,

        [System.DateTime]
        $SignatureScheduleTime,

        [System.UInt32]
        $SignatureUpdateCatchupInterval,

        [System.UInt32]
        $SignatureUpdateInterval,

        [ValidateSet("Advanced","Basic","Disabled")]
        [System.String]
        $MAPSReporting,

        [System.Boolean]
        $DisablePrivacyMode,

        [System.Boolean]
        $RandomizeScheduleTaskTimes,

        [System.Boolean]
        $DisableBehaviorMonitoring,

        [System.Boolean]
        $DisableIntrusionPreventionSystem,

        [System.Boolean]
        $DisableIOAVProtection,

        [System.Boolean]
        $DisableRealtimeMonitoring,

        [System.Boolean]
        $DisableScriptScanning,

        [System.Boolean]
        $DisableArchiveScanning,

        [System.Boolean]
        $DisableAutoExclusions,

        [System.Boolean]
        $DisableCatchupFullScan,

        [System.Boolean]
        $DisableCatchupQuickScan,

        [System.Boolean]
        $DisableEmailScanning,

        [System.Boolean]
        $DisableRemovableDriveScanning,

        [System.Boolean]
        $DisableRestorePoint,

        [System.Boolean]
        $DisableScanningMappedNetworkDrivesForFullScan,

        [System.Boolean]
        $DisableScanningNetworkFiles,

        [System.Boolean]
        $UILockdown,

        [System.UInt64]
        $ThreatIDDefaultAction_Ids,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $ThreatIDDefaultAction_Actions,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $UnknownThreatDefaultAction,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $LowThreatDefaultAction,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $ModerateThreatDefaultAction,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $HighThreatDefaultAction,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $SevereThreatDefaultAction,

        [ValidateSet("Allways Prompt","Send safe samples automatically","Never send","Send all samples automatically")]
        [System.String]
        $SubmitSamplesConsent
    )

    $Params = $PSBoundParameters
    $output = $Params.Remove('Name')
    $output = $Params.Remove('Debug')
    $output = $Params.Remove('Verbose')

    Set-MpPreference @Params
}

<#
    .SYNOPSIS Test state of the resource
    .EXAMPLE
        Test-TargetResource -Name DefenderPreferences -HighThreatDefaultAction Quarantine -Verbose
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [System.String[]]
        $ExclusionPath,

        [System.String[]]
        $ExclusionExtension,

        [System.String[]]
        $ExclusionProcess,

        [ValidateSet("Both","Incoming","Outgoing")]
        [System.String]
        $RealTimeScanDirection,

        [System.UInt32]
        $QuarantinePurgeItemsAfterDelay,

        [ValidateSet("Everyday","Never","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")]
        [System.String]
        $RemediationScheduleDay,

        [System.DateTime]
        $RemediationScheduleTime,

        [System.UInt32]
        $ReportingAdditionalActionTimeOut,

        [System.UInt32]
        $ReportingNonCriticalTimeOut,

        [System.UInt32]
        $ReportingCriticalFailureTimeOut,

        [System.UInt32]
        $ScanAvgCPULoadFactor,

        [System.Boolean]
        $CheckForSignaturesBeforeRunningScan,

        [System.UInt32]
        $ScanPurgeItemsAfterDelay,

        [System.Boolean]
        $ScanOnlyIfIdleEnabled,

        [ValidateSet("FullSCan","QuickScan")]
        [System.String]
        $ScanParameters,

        [ValidateSet("Everyday","Never","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")]
        [System.String]
        $ScanScheduleDay,

        [System.DateTime]
        $ScanScheduleQuickScanTime,

        [System.DateTime]
        $ScanScheduleTime,

        [System.UInt32]
        $SignatureFirstAuGracePeriod,

        [System.UInt32]
        $SignatureAuGracePeriod,

        [System.String]
        $SignatureDefinitionUpdateFileSharesSources,

        [System.Boolean]
        $SignatureDisableUpdateOnStartupWithoutEngine,

        [System.String]
        $SignatureFallbackOrder,

        [ValidateSet("Everyday","Never","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")]
        [System.String]
        $SignatureScheduleDay,

        [System.DateTime]
        $SignatureScheduleTime,

        [System.UInt32]
        $SignatureUpdateCatchupInterval,

        [System.UInt32]
        $SignatureUpdateInterval,

        [ValidateSet("Advanced","Basic","Disabled")]
        [System.String]
        $MAPSReporting,

        [System.Boolean]
        $DisablePrivacyMode,

        [System.Boolean]
        $RandomizeScheduleTaskTimes,

        [System.Boolean]
        $DisableBehaviorMonitoring,

        [System.Boolean]
        $DisableIntrusionPreventionSystem,

        [System.Boolean]
        $DisableIOAVProtection,

        [System.Boolean]
        $DisableRealtimeMonitoring,

        [System.Boolean]
        $DisableScriptScanning,

        [System.Boolean]
        $DisableArchiveScanning,

        [System.Boolean]
        $DisableAutoExclusions,

        [System.Boolean]
        $DisableCatchupFullScan,

        [System.Boolean]
        $DisableCatchupQuickScan,

        [System.Boolean]
        $DisableEmailScanning,

        [System.Boolean]
        $DisableRemovableDriveScanning,

        [System.Boolean]
        $DisableRestorePoint,

        [System.Boolean]
        $DisableScanningMappedNetworkDrivesForFullScan,

        [System.Boolean]
        $DisableScanningNetworkFiles,

        [System.Boolean]
        $UILockdown,

        [System.UInt64]
        $ThreatIDDefaultAction_Ids,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $ThreatIDDefaultAction_Actions,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $UnknownThreatDefaultAction,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $LowThreatDefaultAction,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $ModerateThreatDefaultAction,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $HighThreatDefaultAction,

        [ValidateSet("Allow","Block","Clean","NoAction","Quarantine","Remove","UserDefined")]
        [System.String]
        $SevereThreatDefaultAction,

        [ValidateSet("Allways Prompt","Send safe samples automatically","Never send","Send all samples automatically")]
        [System.String]
        $SubmitSamplesConsent
    )
    $Params = $PSBoundParameters
    $output = $Params.Remove('Debug')
    $output = $Params.Remove('Verbose')
    
    $Get = Get-TargetResource @Params
    $Keys = $Get.Keys | ? {$_ -in $Params.Keys}
    
    $return = $True

    foreach ($key in $Keys) {
    
        $input = $Params.$key
        $current = $Get.$key
    
        if ($input -ne $current){
            $return = $False
            Write-Verbose "$input not equal to $current for value $key"
            }
    
        }

    $return
}

Export-ModuleMember -Function *-TargetResource


# Helper Functions

function Convert-ScanDirectionText {
    param(
    [parameter(ValueFromPipeline=$true,Mandatory=$true)][Byte]$Num
    )
    switch ($Num)
    {
        0 {'Both'}
        1 {'Incoming'}
        2 {'Outgoing'}
    }
}

function Convert-ScheduleDayText {
    param(
    [parameter(ValueFromPipeline=$true,Mandatory=$true)][Byte]$Num
    )
    switch ($Num)
    {
        0 {'Everyday'}
        1 {'Sunday'}
        2 {'Monday'}
        3 {'Tuesday'}
        4 {'Wednesday'}
        5 {'Thursday'}
        6 {'Friday'}
        7 {'Saturday'}
        8 {'Never'}
    }
}

function Convert-ScanParametersText {
    param(
    [parameter(ValueFromPipeline=$true,Mandatory=$true)][Byte]$Num
    )
    switch ($Num)
    {
        1 {'Quick scan'}
        2 {'Full scan'}
    }
}

function Convert-ReportingText {
    param(
    [parameter(ValueFromPipeline=$true,Mandatory=$true)][Byte]$Num
    )
    switch ($Num)
    {
        0 {'Disabled'}
        1 {'Basic'}
        2 {'Advanced'}
    }
}

function Convert-SubmitSamplesConsentText {
    param(
    [parameter(ValueFromPipeline=$true,Mandatory=$true)][Byte]$Num
    )
    switch ($Num)
    {
        0 {'Always prompt'}
        1 {'Send safe samples automatically'}
        2 {'Never send'}
        3 {'Send all samples automatically'}
    }
}

function Convert-ActionText {
    param(
    [parameter(ValueFromPipeline=$true,Mandatory=$true)][Byte]$Num
    )
    switch ($Num)
    {
        1 {'Clean'}
        2 {'Quarantine'}
        3 {'Remove'}
        4 {'Allow'}
        8 {'UserDefined'}
        9 {'NoAction'}
        10 {'Block'}
    }
}
