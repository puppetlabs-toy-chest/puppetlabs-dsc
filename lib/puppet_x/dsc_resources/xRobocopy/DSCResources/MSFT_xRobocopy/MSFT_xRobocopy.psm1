function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Source,

        [parameter(Mandatory = $true)]
        [System.String]
        $Destination,

        [System.String]
        $Files,

        [System.UInt32]
        $Retry,

        [System.UInt32]
        $Wait,

        [System.Boolean]
        $SubdirectoriesIncludingEmpty = $False,

        [System.Boolean]
        $Restartable = $False,

        [System.Boolean]
        $MultiThreaded = $False,

        [System.String]
        $ExcludeFiles,

        [System.String]
        $LogOutput,

        [System.Boolean]
        $AppendLog = $False,

        [System.String[]]
        $AdditionalArgs
    )

    $result = Test-TargetResource $Source $Destination $Files $Retry $Wait $SubdirectoriesIncludingEmpty $Restartable $MultiThreaded $ExcludeFiles $LogOutput $AppendLog $AdditionalArgs
    $ensure = 'Absent'
    if($result -eq $true)
    {
        $ensure = 'Present'
    }

    $returnValue = @{
        Source = $Source
        Destination = $Destination
        Files = $Files
        Retry = $Retry
        Wait = $Wait
        SubdirectoriesIncludingEmpty = $SubdirectoriesIncludingEmpty
        Restartable = $Restartable
        MultiThreaded = $MultiThreaded
        ExcludeFiles = $ExcludeFiles
        LogOutput = $LogOutput
        AppendLog = $AppendLog
        AdditionalArgs = $AdditionalArgs
        Ensure = $ensure
    }

    return $returnValue
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Source,

        [parameter(Mandatory = $true)]
        [System.String]
        $Destination,

        [System.String]
        $Files,

        [System.UInt32]
        $Retry,

        [System.UInt32]
        $Wait,

        [System.Boolean]
        $SubdirectoriesIncludingEmpty = $False,

        [System.Boolean]
        $Restartable = $False,

        [System.Boolean]
        $MultiThreaded = $False,

        [System.String]
        $ExcludeFiles,

        [System.String]
        $LogOutput,

        [System.Boolean]
        $AppendLog = $False,

        [System.String[]]
        $AdditionalArgs
    )

    $arguments = Get-RobocopyArguments $Source $Destination $Files $Retry $Wait $SubdirectoriesIncludingEmpty $Restartable $MultiThreaded $ExcludeFiles $LogOutput $AppendLog $AdditionalArgs

    Write-Verbose "Executing robocopy.exe with: $arguments"
    &robocopy $arguments | Out-Null
    if($LASTEXITCODE -ge 8)
    {
        throw "robocopy returned with errors! Exit code: $LASTEXITCODE! More info here:https://support.microsoft.com/en-us/kb/954404"
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
        $Source,

        [parameter(Mandatory = $true)]
        [System.String]
        $Destination,

        [System.String]
        $Files,

        [System.UInt32]
        $Retry,

        [System.UInt32]
        $Wait,

        [System.Boolean]
        $SubdirectoriesIncludingEmpty = $False,

        [System.Boolean]
        $Restartable = $False,

        [System.Boolean]
        $MultiThreaded = $False,

        [System.String]
        $ExcludeFiles,

        [System.String]
        $LogOutput,

        [System.Boolean]
        $AppendLog = $False,

        [System.String[]]
        $AdditionalArgs
    )

    $arguments = Get-RobocopyArguments $Source $Destination $Files $Retry $Wait $SubdirectoriesIncludingEmpty $Restartable $MultiThreaded $ExcludeFiles $LogOutput $AppendLog $AdditionalArgs

    if(!$arguments.Contains('/L') -and !$arguments.Contains('/l'))
    {
        $arguments += '/L'
    }
    
    &robocopy $arguments | Out-Null

    # https://support.microsoft.com/en-us/kb/954404
    # ROBOCOPY $LASTEXITCODE is a bitflag:
    #  0: Source and destination are completely synchronized
    #  1: One or more files were copied successfully (new files present)
    #  2: extra files/directories detected
    #  4: mismatched files/directories
    #  8: copy errors and retries exceeded
    # 16: serious error
    if ($LASTEXITCODE -ge 1 -and $LASTEXITCODE -lt 8) 
    {
        Write-Verbose "Source and destination are out of sync"
        $result = $false
    }
    elseif ($LASTEXITCODE -eq 0)
    {
        Write-Verbose "Source and destination are completely synchronized"
        $result = $true
    }
    else
    {
        throw "robocopy returned with errors! Exit code: $result! More info here:https://support.microsoft.com/en-us/kb/954404"
    }
    
    return $result
}

# Helper Functions
function Get-RobocopyArguments
{
    [CmdletBinding()]
    [OutputType([System.String[]])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Source,

        [parameter(Mandatory = $true)]
        [System.String]
        $Destination,

        [System.String]
        $Files,

        [System.UInt32]
        $Retry,

        [System.UInt32]
        $Wait,

        [System.Boolean]
        $SubdirectoriesIncludingEmpty,

        [System.Boolean]
        $Restartable,

        [System.Boolean]
        $MultiThreaded,

        [System.String]
        $ExcludeFiles,

        [System.String]
        $LogOutput,

        [System.Boolean]
        $AppendLog,

        [System.String[]]
        $AdditionalArgs
    )

    [System.String[]]$arguments = @($Source, $Destination)
    if($Files)
    {
        $arguments += $Files
    }
    if ($Retry) 
    {
        $arguments += "/R:$Retry"
    }
    if ($Wait) 
    {
        $arguments += "/W:$Wait"
    }
    if ($SubdirectoriesIncludingEmpty) 
    {
        $arguments += '/E'
    }
    if ($Restartable) 
    {
        $arguments += '/Z'
    }
    if ($MultiThreaded) 
    {
        $arguments += '/MT'
    }
    if ($ExcludeFiles) 
    {
        $arguments += @('/XF', $ExcludeFiles)
    }
    if ($ExcludeDirs) 
    {
        $arguments += @('/XD', $ExcludeDirs)
    }
    if ($LogOutput -AND $AppendLog) 
    {
        $arguments += "/LOG+:$LogOutput"
    }
    if ($LogOutput -AND !$AppendLog) 
    {
        $arguments += "/LOG:$LogOutput"
    }
    if ($AdditionalArgs) 
    {
        $arguments += $AdditionalArgs
    }

    return $arguments
}

Export-ModuleMember -Function *-TargetResource
