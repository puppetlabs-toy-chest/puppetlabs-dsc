$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Networking Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'FSRMDsc.ResourceHelper' `
            -ChildPath 'FSRMDsc.ResourceHelper.psm1'))

# Import Localization Strings
$LocalizedData = Get-LocalizedData `
    -ResourceName 'DSR_FSRMClassification' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
        Retrieves the current state of the FSRM Classification with the specified Id.

    .PARAMETER Id
        This is a unique identifier for this resource.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Id
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingClassificationMessage) `
                -f $Id
        ) -join '' )

    $classification = Get-FSRMClassification -ErrorAction Stop

    $returnValue = @{
        Id                  = $Id
        Continuous          = $classification.Continuous
        ContinuousLog       = $classification.ContinuousLog
        ContinuousLogSize   = $classification.ContinuousLogSize
        ExcludeNamespace    = $classification.ExcludeNamespace
        ScheduleMonthly     = [System.Uint32[]] @($classification.Schedule.Monthly)
        ScheduleWeekly      = [String[]] @($classification.Schedule.Weekly)
        ScheduleRunDuration = [System.Uint32] $classification.Schedule.RunDuration
        ScheduleTime        = $classification.Schedule.Time
        LastError           = $classification.LastError
        Status              = $classification.Status
    }

    return $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
        Sets the current state of the FSRM Classification with the specified Id.

    .PARAMETER Id
        This is a unique identifier for this resource.

    .PARAMETER Continuous
        Enable FSRM Classification continuous mode for new files.

    .PARAMETER ContinuousLog
        Enable FSRM Classification continuous mode logging."

    .PARAMETER ContinuousLogSize
        The maximum number of KB that can be used for the continuous mode log file.

    .PARAMETER ExcludeNamespace
        An array of Namespaces that will be excluded from FSRM Classification.

    .PARAMETER ScheduleMonthly
        An array of days of the month the FSRM Classification should run on.

    .PARAMETER ScheduleWeekly
        An array of named days of the week the FSRM Classification should run on.

    .PARAMETER ScheduleRunDuration
        The maximum number of hours the FSRM Classification can run for. Setting this to -1
        will disable this.

    .PARAMETER ScheduleTime
        A string containing the time of day the FSRM Classification should run at.
#>
function Set-TargetResource
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding(SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Id,

        [Parameter()]
        [System.Boolean]
        $Continuous,

        [Parameter()]
        [System.Boolean]
        $ContinuousLog,

        [Parameter()]
        [System.Uint32]
        $ContinuousLogSize,

        [Parameter()]
        [System.String[]]
        $ExcludeNamespace,

        [Parameter()]
        [System.Uint32[]]
        $ScheduleMonthly,

        [Parameter()]
        [System.String[]]
        $ScheduleWeekly,

        [Parameter()]
        [System.Int32]
        $ScheduleRunDuration,

        [Parameter()]
        [System.String]
        $ScheduleTime
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingClassificationMessage) `
                -f $Id
        ) -join '' )

    # Remove any parameters that can't be splatted.
    $null = $PSBoundParameters.Remove('Id')

    # Are there any schedule parameters?
    if ($PSBoundParameters.ContainsKey('ScheduleMonthly') `
            -or $PSBoundParameters.ContainsKey('ScheduleWeekly') `
            -or $PSBoundParameters.ContainsKey('ScheduleRunDuration') `
            -or $PSBoundParameters.ContainsKey('ScheduleTime'))
    {
        # There are so a scheduled task object needs to be modified or created
        $schedule = (Get-FSRMClassification).Schedule

        # Create a splat to use to create the new Scheduled Task
        $newScheduledTaskParameters = @{}

        if ($PSBoundParameters.ContainsKey('ScheduleMonthly'))
        {
            <#
                The Schedule monthly is passed in as [System.Uint32[]].
                DSC does not support [System.Int32[]] types as parameters.
                But the New-FSRMScheduledTask Monthly parameter only supports [System.Int32[]] types.
                So this must be converted manually. Cast does not seem to work here.
            #>
            $convertedScheduleMonthly = `
                [System.Array]::CreateInstance([System.Int32], $ScheduleMonthly.Length)

            for ($counter = 0; $counter -lt $ScheduleMonthly.Length; $counter++)
            {
                $convertedScheduleMonthly[$counter] = $ScheduleMonthly[$counter]
            }

            $newScheduledTaskParameters += @{ Monthly = $convertedScheduleMonthly }
        }
        elseif ( $schedule.Monthly )
        {
            $newScheduledTaskParameters += @{ Monthly = $schedule.Monthly }
        }

        if ($PSBoundParameters.ContainsKey('ScheduleWeekly'))
        {
            $newScheduledTaskParameters += @{ Weekly = $ScheduleWeekly }
        }
        elseif ( $schedule.Weekly )
        {
            $newScheduledTaskParameters += @{ Weekly = $schedule.Weekly }
        }

        if ($PSBoundParameters.ContainsKey('ScheduleRunDuration'))
        {
            $newScheduledTaskParameters += @{ RunDuration = $ScheduleRunDuration }
        }
        elseif ( $schedule.RunDuration )
        {
            $newScheduledTaskParameters += @{ RunDuration = $schedule.RunDuration }
        }

        if ($PSBoundParameters.ContainsKey('ScheduleTime'))
        {
            $newScheduledTaskParameters += @{ Time = $ScheduleTime }
        }
        elseif ( $schedule.Time )
        {
            $newScheduledTaskParameters += @{ Time = $schedule.Time }
        }

        # Remove the schedule parameters
        $null = $PSBoundParameters.Remove('ScheduleMonthly')
        $null = $PSBoundParameters.Remove('ScheduleWeekly')
        $null = $PSBoundParameters.Remove('ScheduleRunDuration')
        $null = $PSBoundParameters.Remove('ScheduleTime')

        # Add the new scheduled task parameter
        $newSchedule = New-FSRMScheduledTask @newScheduledTaskParameters -ErrorAction Stop

        $null = $PSBoundParameters.Add('Schedule', $newSchedule)

        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ClassificationScheduleUpdatedMessage) `
                    -f $Id
            ) -join '' )
    }

    # Set the existing Classification with a from the existing bound parameters
    Set-FSRMClassification @PSBoundParameters -ErrorAction Stop

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ClassificationUpdatedMessage) `
                -f $Id
        ) -join '' )
} # Set-TargetResource

<#
    .SYNOPSIS
        Tests the current state of the FSRM Classification with the specified Id.

    .PARAMETER Id
        This is a unique identifier for this resource.

    .PARAMETER Continuous
        Enable FSRM Classification continuous mode for new files.

    .PARAMETER ContinuousLog
        Enable FSRM Classification continuous mode logging."

    .PARAMETER ContinuousLogSize
        The maximum number of KB that can be used for the continuous mode log file.

    .PARAMETER ExcludeNamespace
        An array of Namespaces that will be excluded from FSRM Classification.

    .PARAMETER ScheduleMonthly
        An array of days of the month the FSRM Classification should run on.

    .PARAMETER ScheduleWeekly
        An array of named days of the week the FSRM Classification should run on.

    .PARAMETER ScheduleRunDuration
        The maximum number of hours the FSRM Classification can run for. Setting this to -1
        will disable this.

    .PARAMETER ScheduleTime
        A string containing the time of day the FSRM Classification should run at.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Id,

        [Parameter()]
        [System.Boolean]
        $Continuous,

        [Parameter()]
        [System.Boolean]
        $ContinuousLog,

        [Parameter()]
        [System.Uint32]
        $ContinuousLogSize,

        [Parameter()]
        [System.String[]]
        $ExcludeNamespace,

        [Parameter()]
        [System.Uint32[]]
        $ScheduleMonthly,

        [Parameter()]
        [System.String[]]
        $ScheduleWeekly,

        [Parameter()]
        [System.Int32]
        $ScheduleRunDuration,

        [Parameter()]
        [System.String]
        $ScheduleTime
    )

    # Flag to signal whether settings are correct
    [Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingClassificationMessage) `
                -f $Id
        ) -join '' )

    # Lookup the existing Classification
    $classification = Get-FSRMClassification

    # The Classification exists already - check the parameters
    if (($Continuous) -and ($classification.Continuous -ne $Continuous))
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ClassificationNeedsUpdateMessage) `
                    -f $Id, 'Continuous'
            ) -join '' )

        $desiredConfigurationMatch = $false
    }

    if (($ContinuousLog) -and ($classification.ContinuousLog -ne $ContinuousLog))
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ClassificationNeedsUpdateMessage) `
                    -f $Id, 'ContinuousLog'
            ) -join '' )

        $desiredConfigurationMatch = $false
    }

    if (($ContinuousLogSize) -and ($classification.ContinuousLogSize -ne $ContinuousLogSize))
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ClassificationNeedsUpdateMessage) `
                    -f $Id, 'ContinuousLogSize'
            ) -join '' )

        $desiredConfigurationMatch = $false
    }

    $existingExcludeNamespace = @()
    if ($classification.ExcludeNamespace)
    {
        $existingExcludeNamespace = $classification.ExcludeNamespace
    }

    if (($ExcludeNamespace) `
            -and (Compare-Object `
                -ReferenceObject $ExcludeNamespace `
                -DifferenceObject $existingExcludeNamespace).Count -ne 0)
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ClassificationNeedsUpdateMessage) `
                    -f $Id, 'ExcludeNamespace'
            ) -join '' )

        $desiredConfigurationMatch = $false
    }

    $existingScheduleMonthly = @()

    if ($classification.Schedule.Monthly)
    {
        $existingScheduleMonthly = $classification.Schedule.Monthly
    }

    if (($ScheduleMonthly) `
            -and (Compare-Object `
                -ReferenceObject $ScheduleMonthly `
                -DifferenceObject $existingScheduleMonthly).Count -ne 0)
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ClassificationNeedsUpdateMessage) `
                    -f $Id, 'ScheduleMonthly'
            ) -join '' )
        $desiredConfigurationMatch = $false
    }

    $existingScheduleWeekly = @()

    if ($classification.Schedule.Weekly)
    {
        $existingScheduleWeekly = $classification.Schedule.Weekly
    }

    if (($ScheduleWeekly) `
            -and (Compare-Object `
                -ReferenceObject $ScheduleWeekly `
                -DifferenceObject $existingScheduleWeekly).Count -ne 0)
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ClassificationNeedsUpdateMessage) `
                    -f $Id, 'ScheduleWeekly'
            ) -join '' )

        $desiredConfigurationMatch = $false
    }

    if (($ScheduleRunDuration) -and ($classification.Schedule.RunDuration -ne $ScheduleRunDuration))
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ClassificationNeedsUpdateMessage) `
                    -f $Id, 'ScheduleRunDuration'
            ) -join '' )

        $desiredConfigurationMatch = $false
    }

    if (($ScheduleTime) -and ($classification.Schedule.Time -ne $ScheduleTime))
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ClassificationNeedsUpdateMessage) `
                    -f $Id, 'ScheduleTime'
            ) -join '' )
        $desiredConfigurationMatch = $false
    }

    return $desiredConfigurationMatch
} # Test-TargetResource

Export-ModuleMember -Function *-TargetResource
