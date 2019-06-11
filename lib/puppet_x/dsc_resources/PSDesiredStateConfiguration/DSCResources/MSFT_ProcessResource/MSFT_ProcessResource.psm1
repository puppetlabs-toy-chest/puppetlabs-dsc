data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
FileNotFound=File not found in the environment path.
AbsolutePathOrFileName=Absolute path or file name expected.
InvalidArgument=Invalid argument: '{0}' with value: '{1}'.
InvalidArgumentAndMessage={0} {1}
ProcessStarted=Process matching path '{0}' started
ProcessesStopped=Proceses matching path '{0}' with Ids '({1})' stopped.
ProcessAlreadyStarted=Process matching path '{0}' found running and no action required.
ProcessAlreadyStopped=Process matching path '{0}' not found running and no action required.
ErrorStopping=Failure stopping processes matching path '{0}' with IDs '({1})'. Message: {2}.
ErrorStarting=Failure starting process matching path '{0}'. Message: {1}.
StartingProcessWhatif=Start-Process
ProcessNotFound=Process matching path '{0}' not found
PathShouldBeAbsolute=The path should be absolute
PathShouldExist=The path should exist
ParameterShouldNotBeSpecified=Parameter {0} should not be specified.
FailureWaitingForProcessesToStart=Failed to wait for processes to start
FailureWaitingForProcessesToStop=Failed to wait for processes to stop
ErrorParametersNotSupportedWithCredential=Can't specify StandardOutputPath, StandardInputPath or WorkingDirectory when trying to run a process under a user context.
VerboseInProcessHandle=In process handle {0}
ErrorRunAsCredentialParameterNotSupported= The PsDscRunAsCredential parameter is not supported by the Process resource. To start the process with user '{0}', add the Credential parameter.
ErrorCredentialParameterNotSupportedWithRunAsCredential= The PsDscRunAsCredential parameter is not supported by the Process resource, and cannot be used with the Credential parameter. To start the process with user '{0}', use only the Credential parameter, not the PsDscRunAsCredential parameter.
'@
}

Import-LocalizedData  LocalizedData -filename MSFT_ProcessResource.strings.psd1

Import-Module "$PSScriptRoot\..\RunAsHelper.psm1"

function ExtractArguments($functionBoundParameters,[string[]]$argumentNames,[string[]]$newArgumentNames)
{
    $returnValue=@{}
    for($i=0;$i -lt $argumentNames.Count;$i++)
    {
        $argumentName=$argumentNames[$i]

        if($newArgumentNames -eq $null)
        {   
            $newArgumentName=$argumentName
        }
        else
        {
            $newArgumentName=$newArgumentNames[$i]
        }

        if($functionBoundParameters.ContainsKey($argumentName))
        {
            $null=$returnValue.Add($newArgumentName,$functionBoundParameters[$argumentName])
        }
    }

    return $returnValue
}

function IsRunFromLocalSystemUser()
{
    (New-Object Security.Principal.WindowsPrincipal ( [Security.Principal.WindowsIdentity]::GetCurrent())).Identity.IsSystem
}

function Get-TargetResource
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Path,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [System.String]
        $Arguments,

        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential
    )
    
    $Path=(ResolvePath $Path)
    $PSBoundParameters["Path"] = $Path
    $getArguments = ExtractArguments $PSBoundParameters ("Path","Arguments","Credential")
    $processes = @(GetWin32_Process @getArguments)

    if($processes.Count -eq 0)
    {
        return @{
            Path=$Path
            Arguments=$Arguments
            Ensure='Absent'
        }
    }

    foreach($process in $processes)
    {
        # in case the process was killed between GetWin32_Process and this point, we should
        # ignore errors which will generate empty entries in the return
        $gpsProcess = (get-process -id $process.ProcessId -ErrorAction Ignore)

        @{
            Path=$process.Path
            Arguments=(GetProcessArgumentsFromCommandLine $process.CommandLine)
            PagedMemorySize=$gpsProcess.PagedMemorySize64
            NonPagedMemorySize=$gpsProcess.NonpagedSystemMemorySize64
            VirtualMemorySize=$gpsProcess.VirtualMemorySize64
            HandleCount=$gpsProcess.HandleCount
            Ensure='Present'
            ProcessId=$process.ProcessId
        }
    }
}


function Set-TargetResource
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Path,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [System.String]
        $Arguments,

        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [System.String]
        [ValidateSet("Present", "Absent")]
        $Ensure="Present",

        [System.String]
        $StandardOutputPath,

        [System.String]
        $StandardErrorPath,

        [System.String]
        $StandardInputPath,

        [System.String]
        $WorkingDirectory
    )

    $Path=ResolvePath $Path
    $PSBoundParameters["Path"] = $Path
    $getArguments = ExtractArguments $PSBoundParameters ("Path","Arguments","Credential")
    $processes = @(GetWin32_Process @getArguments)

    if($Ensure -eq 'Absent')
    {
        "StandardOutputPath","StandardErrorPath","StandardInputPath","WorkingDirectory" | AssertParameterIsNotSpecified $PSBoundParameters

        if ($processes.Count -gt 0)
        {
           $processIds=$processes.ProcessId

           $err=Stop-Process -Id $processIds -force 2>&1
           
           if($err -eq $null)
           {
               Write-Log ($LocalizedData.ProcessesStopped -f $Path,($processIds -join ","))
           }
           else
           {
               Write-Log ($LocalizedData.ErrorStopping -f $Path,($processIds -join ","),($err | out-string))
               throw $err
           }

           # Before returning from Set-TargetResource we have to ensure a subsequent Test-TargetResource is going to work
           if (!(WaitForProcessCount @getArguments -waitCount 0))
           {
                $message = $LocalizedData.ErrorStopping -f $Path,($processIds -join ","),$LocalizedData.FailureWaitingForProcessesToStop
                Write-Log $message
                ThrowInvalidArgumentError "FailureWaitingForProcessesToStop" $message
           }
        }
        else
        {
            Write-Log ($LocalizedData.ProcessAlreadyStopped -f $Path)
        }
    }
    else
    {
        "StandardInputPath","WorkingDirectory" |  AssertAbsolutePath $PSBoundParameters -Exist
        "StandardOutputPath","StandardErrorPath" | AssertAbsolutePath $PSBoundParameters

        if ($processes.Count -eq 0)
        {
            $startArguments = ExtractArguments $PSBoundParameters `
                 ("Path",     "Arguments",    "Credential", "StandardOutputPath",     "StandardErrorPath",     "StandardInputPath", "WorkingDirectory") `
                 ("FilePath", "ArgumentList", "Credential",  "RedirectStandardOutput", "RedirectStandardError", "RedirectStandardInput", "WorkingDirectory")

            if([string]::IsNullOrEmpty($Arguments))
            {
                $null=$startArguments.Remove("ArgumentList")
            }

            if($PSCmdlet.ShouldProcess($Path,$LocalizedData.StartingProcessWhatif))
            {
                #
                # Start-Process calls .net Process.Start()
                # If -Credential is present Process.Start() uses win32 api CreateProcessWithLogonW http://msdn.microsoft.com/en-us/library/0w4h05yb(v=vs.110).aspx
                # CreateProcessWithLogonW cannot be called as LocalSystem user.
                # Details http://msdn.microsoft.com/en-us/library/windows/desktop/ms682431(v=vs.85).aspx (section Remarks/Windows XP with SP2 and Windows Server 2003)
                #
                # In this case we call another api.
                #
                if($PSBoundParameters.ContainsKey("Credential") -and (IsRunFromLocalSystemUser))
                {
                    if($PSBoundParameters.ContainsKey("StandardOutputPath") -or $PSBoundParameters.ContainsKey("StandardInputPath") -or $PSBoundParameters.ContainsKey("WorkingDirectory"))
                    {
                        $exception = New-Object System.ArgumentException $LocalizedData.ErrorParametersNotSupportedWithCredential
                        $err = New-Object System.Management.Automation.ErrorRecord $exception, "InvalidCombinationOfArguments", InvalidArgument, $null
                    }
                    else 
                    {
                        $Domain, $UserName = Get-DomainAndUserName $Credential
                        try
                        {
                            #
                            # Internally we use win32 api LogonUser() with dwLogonType == LOGON32_LOGON_NETWORK_CLEARTEXT. 
                            # It grants process ability for second-hop.
                            #
                            Import-DscNativeMethods
                            [PSDesiredStateConfiguration.NativeMethods]::CreateProcessAsUser( "$Path $Arguments", $Domain, $UserName, $Credential.Password, $false, [ref] $null )
                        }
                        catch
                        {
                            throw  New-Object System.Management.Automation.ErrorRecord $_, "Win32Exception", OperationStopped, $null
                        }
                    }
                }
                else
                {
                    $err=Start-Process @startArguments 2>&1
                }
                if($err -eq $null)
                {
                    Write-Log ($LocalizedData.ProcessStarted -f $Path)
                }
                else
                {
                    Write-Log ($LocalizedData.ErrorStarting -f $Path,($err | Out-String))
                    throw $err
                }

                # Before returning from Set-TargetResource we have to ensure a subsequent Test-TargetResource is going to work
                if (!(WaitForProcessCount @getArguments -waitCount 1))
                {
                    $message = $LocalizedData.ErrorStarting -f $Path,$LocalizedData.FailureWaitingForProcessesToStart
                    Write-Log $message
                    ThrowInvalidArgumentError "FailureWaitingForProcessesToStart" $message
                }
            }
        }
        else
        {
            Write-Log ($LocalizedData.ProcessAlreadyStarted -f $Path)
        }
    }
}

function Test-TargetResource
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Path,

        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [System.String]
        $Arguments,

        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [System.String]
        [ValidateSet("Present", "Absent")]
        $Ensure="Present",

        [System.String]
        $StandardOutputPath,

        [System.String]
        $StandardErrorPath,

        [System.String]
        $StandardInputPath,

        [System.String]
        $WorkingDirectory
    )

    if($PsDscContext.RunAsUser)
    {
	    if($PSBoundParameters.ContainsKey("Credential"))
	    {
	        $exception = New-Object System.ArgumentException ($LocalizedData.ErrorCredentialParameterNotSupportedWithRunAsCredential -f $PsDscContext.RunAsUser)
            $err = New-Object System.Management.Automation.ErrorRecord $exception, "InvalidArgument", InvalidArgument, $null
	    }
	    else
	    {
	        $exception = New-Object System.ArgumentException ($LocalizedData.ErrorRunAsCredentialParameterNotSupported -f $PsDscContext.RunAsUser)
            $err = New-Object System.Management.Automation.ErrorRecord $exception, "InvalidCombinationOfArguments", InvalidArgument, $null
	    }

	    Write-Log ($LocalizedData.ErrorStarting -f $Path,($err | Out-String))
        throw $err
    }    

    $Path=ResolvePath $Path
    $PSBoundParameters["Path"] = $Path
    $getArguments = ExtractArguments $PSBoundParameters ("Path","Arguments","Credential")
    $processes = @(GetWin32_Process @getArguments)


    if($Ensure -eq 'Absent')
    {
        return ($processes.Count -eq 0)
    }
    else
    {
        return ($processes.Count -gt 0)
    }
}

function GetWin32ProcessOwner
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNull()]
        $process
    )

    # if the process was killed by the time this is called, GetOwner 
    # will throw a WMIMethodException "Not found"
    try
    {
        $owner = $process.GetOwner()
    }
    catch
    {
    }
    
    if($owner.Domain -ne $null)
    {
        return $owner.Domain + "\" + $owner.User
    }
    else                
    {
        return $owner.User
    }
}

function WaitForProcessCount
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Path,

        [System.String]
        $Arguments,

        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [parameter(Mandatory=$true)]
        $waitCount
    )

    $start = [DateTime]::Now
    do
    {
        $getArguments = ExtractArguments $PSBoundParameters ("Path","Arguments","Credential")
        $value = @(GetWin32_Process @getArguments).Count -eq $waitCount
    } while(!$value -and ([DateTime]::Now - $start).TotalMilliseconds -lt 2000)
    
    return $value
}

function GetWin32_Process
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    param
    (
        
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Path,

        [System.String]
        $Arguments,

        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential,

        $useWmiObjectCount=8
    )



    $fileName = [io.path]::GetFileNameWithoutExtension($Path)

    $gpsProcesses = @(get-process -Name $fileName -ErrorAction SilentlyContinue)
    
    if($gpsProcesses.Count -ge $useWmiObjectCount)
    {
        # if there are many processes it is faster to perform a Get-WmiObject
        # in order to get Win32_Process objects for all processes
        $Path=WQLEscape $Path
        $filter = "ExecutablePath = '$Path'"
        $processes = Get-WmiObject Win32_Process -Filter $filter
    }
    else
    {
        # if there are few processes, building a Win32_Process for
        # each matching result of get-process is faster
        $processes = foreach($gpsProcess in $gpsProcesses)
        {
            if(!($gpsProcess.Path -ieq $Path))
            {
                continue
            }

            try
            {
                Write-Verbose ($LocalizedData.VerboseInProcessHandle -f $gpsProcess.Id)
                [wmi]"Win32_Process.Handle='$($gpsProcess.Id)'"
            }
            catch
            {
                #ignore if could not retrieve process
            }
        }
    }

    if($PSBoundParameters.ContainsKey('Credential'))
    {
        $Domain, $UserName = Get-DomainAndUserName $Credential
        # Since there are credentials we need to call the GetOwner method in each process to search for matches
        $processes = $processes | where { (GetWin32ProcessOwner $_) -eq "$Domain\$UserName" }

    }

    if($Arguments -eq $null) {$Arguments = ""}
    $processes = $processes | where { (GetProcessArgumentsFromCommandLine $_.CommandLine) -eq $Arguments }

    return $processes
}

<#
.Synopsis
   Strips the Arguments part of a commandLine. In "c:\temp\a.exe X Y Z" the Arguments part is "X Y Z".
#>
function GetProcessArgumentsFromCommandLine
{
    param
    (
        [System.String]
        $commandLine
    )

    if($commandLine -eq $null)
    {
        return ""
    }
    
    $commandLine=$commandLine.Trim()

    if($commandLine.Length -eq 0)
    {
        return ""
    }

    if($commandLine[0] -eq '"')
    {
        $charToLookfor=[char]'"'
    }
    else
    {
        $charToLookfor=[char]' '
    }

    $endofCommand=$commandLine.IndexOf($charToLookfor ,1)
    if($endofCommand -eq -1)
    {
        return ""
    }

    return $commandLine.Substring($endofCommand+1).Trim()
}

<#
.Synopsis
   Escapes a string to be used in a WQL filter as the one passed to get-wmiobject
#>
function WQLEscape
{
    param
    (
        
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $query
    )

    return $query.Replace("\","\\").Replace('"','\"').Replace("'","\'")
}

function ThrowInvalidArgumentError
{
    [CmdletBinding()]
    param
    (
        
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $errorId,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $errorMessage
    )

    $errorCategory=[System.Management.Automation.ErrorCategory]::InvalidArgument
    $exception = New-Object System.ArgumentException $errorMessage;
    $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception, $errorId, $errorCategory, $null
    throw $errorRecord
}

function ResolvePath
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Path
    )

    $Path = [Environment]::ExpandEnvironmentVariables($Path)

    if(IsRootedPath $Path)
    {
        if(!(Test-Path $Path -PathType Leaf))
        {
            ThrowInvalidArgumentError "CannotFindRootedPath" ($LocalizedData.InvalidArgumentAndMessage -f ($LocalizedData.InvalidArgument -f "Path",$Path), $LocalizedData.FileNotFound)
        }

        return $Path
    }

    if([string]::IsNullOrEmpty($env:Path))
    {
        ThrowInvalidArgumentError "EmptyEnvironmentPath" ($LocalizedData.InvalidArgumentAndMessage -f ($LocalizedData.InvalidArgument -f "Path",$Path), $LocalizedData.FileNotFound)
    }

    # This will block relative paths. The statement is only true id $Path contains a plain file name.
    # Checking a relative path against segments of the $env:Path does not make sense
    if((Split-Path $Path -Leaf) -ne $Path)
    {
        ThrowInvalidArgumentError "NotAbsolutePathOrFileName" ($LocalizedData.InvalidArgumentAndMessage -f ($LocalizedData.InvalidArgument -f "Path",$Path), $LocalizedData.AbsolutePathOrFileName)
    }

    foreach($rawSegment in $env:Path.Split(";"))
    {
        $segment = [Environment]::ExpandEnvironmentVariables($rawSegment)

        # if an exception causes $segmentedRooted not to be set, we will consider it $false
        $segmentRooted = $false
        try
        {
            # If the whole path passed through [IO.Path]::IsPathRooted with no exceptions, it does not have
            # invalid characters, so segment has no invalid characters and will not throw as well 
            $segmentRooted=[IO.Path]::IsPathRooted($segment)
        }
        catch {}
        
        if(!$segmentRooted)
        {
            continue
        }

        $candidate = join-path $segment $Path
        
        if(Test-Path $candidate -PathType Leaf)
        {
            return $candidate
        }
    }

    ThrowInvalidArgumentError "CannotFindRelativePath" ($LocalizedData.InvalidArgumentAndMessage -f ($LocalizedData.InvalidArgument -f "Path",$Path), $LocalizedData.FileNotFound)
}


function AssertAbsolutePath
{
    [CmdletBinding()]
    param
    (
        $ParentBoundParameters,

        [System.String]
        [Parameter (ValueFromPipeline=$true)]
        $ParameterName,

        [switch]
        $Exist
    )

    Process
    {
        if(!$ParentBoundParameters.ContainsKey($ParameterName)) 
        {
            return
        }

        $path=$ParentBoundParameters[$ParameterName]
        
        if(!(IsRootedPath $Path))
        {
            ThrowInvalidArgumentError "PathShouldBeAbsolute" ($LocalizedData.InvalidArgumentAndMessage -f ($LocalizedData.InvalidArgument -f $ParameterName,$Path), 
                $LocalizedData.PathShouldBeAbsolute)
        }

        if(!$Exist.IsPresent)
        {
            return
        }

        if(!(Test-Path $Path))
        {
            ThrowInvalidArgumentError "PathShouldExist" ($LocalizedData.InvalidArgumentAndMessage -f ($LocalizedData.InvalidArgument -f $ParameterName,$Path), 
                $LocalizedData.PathShouldExist)
        }
    }
}

function AssertParameterIsNotSpecified
{
    [CmdletBinding()]
    param
    (
        $ParentBoundParameters,

        [System.String]
        [Parameter (ValueFromPipeline=$true)]
        $ParameterName
    )

    Process
    {
        if($ParentBoundParameters.ContainsKey($ParameterName)) 
        {
            ThrowInvalidArgumentError "ParameterShouldNotBeSpecified" ($LocalizedData.ParameterShouldNotBeSpecified -f $ParameterName)
        }
    }
}

function IsRootedPath
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Path
    )

    try
    {
        return [IO.Path]::IsPathRooted($Path)
    }
    catch
    {
        # if the Path has invalid characters like >, <, etc, we cannot determine if it is rooted so we do not go on
        ThrowInvalidArgumentError "CannotGetIsPathRooted" ($LocalizedData.InvalidArgumentAndMessage -f ($LocalizedData.InvalidArgument -f "Path",$Path), $_.Exception.Message)
    }
}

function Write-Log
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    param
    (    
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Message
    )

    if ($PSCmdlet.ShouldProcess($Message, $null, $null))
    {
        Write-Verbose $Message        
    }  
}  

Export-ModuleMember -function Get-TargetResource, Set-TargetResource, Test-TargetResource
