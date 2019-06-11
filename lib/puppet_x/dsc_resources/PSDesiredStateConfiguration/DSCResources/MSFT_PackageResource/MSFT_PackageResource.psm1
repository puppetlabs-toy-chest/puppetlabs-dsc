data LocalizedData
{
    # culture="en-US"
    # TODO: Support WhatIf
    ConvertFrom-StringData @'
InvalidIdentifyingNumber=The specified IdentifyingNumber ({0}) is not a valid Guid
InvalidPath=The specified Path ({0}) is not in a valid format. Valid formats are local paths, UNC, and HTTP
InvalidNameOrId=The specified Name ({0}) and IdentifyingNumber ({1}) do not match Name ({2}) and IdentifyingNumber ({3}) in the MSI file
NeedsMoreInfo=Either Name or ProductId is required
InvalidBinaryType=The specified Path ({0}) does not appear to specify an EXE or MSI file and as such is not supported
CouldNotOpenLog=The specified LogPath ({0}) could not be opened
CouldNotStartProcess=The process {0} could not be started
UnexpectedReturnCode=The return code {0} was not expected. Configuration is likely not correct
PathDoesNotExist=The given Path ({0}) could not be found
CouldNotOpenDestFile=Could not open the file {0} for writing
CouldNotGetHttpStream=Could not get the {0} stream for file {1}
ErrorCopyingDataToFile=Encountered error while writing the contents of {0} to {1}
PackageConfigurationComplete=Package configuration finished
PackageConfigurationStarting=Package configuration starting
InstalledPackage=Installed package
UninstalledPackage=Uninstalled package
NoChangeRequired=Package found in desired state, no action required
RemoveExistingLogFile=Remove existing log file
CreateLogFile=Create log file
MountSharePath=Mount share to get media
DownloadHTTPFile=Download the media over HTTP or HTTPS
StartingProcessMessage=Starting process {0} with arguments {1}
RemoveDownloadedFile=Remove the downloaded file
PackageInstalled=Package has been installed
PackageUninstalled=Package has been uninstalled
MachineRequiresReboot=The machine requires a reboot
PackageDoesNotAppearInstalled=The package {0} is not installed
PackageAppearsInstalled=The package {0} is installed
PostValidationError=Package from {0} was installed, but the specified ProductId and/or Name does not match package details
ValidateStandardArgumentsPathwasPath = Validate-StandardArguments, Path was {0}
TheurischemewasuriScheme = The uri scheme was {0}
ThepathextensionwaspathExt = The path extension was {0}
ParsingProductIdasanidentifyingNumber = Parsing {0} as an identifyingNumber
ParsedProductIdasidentifyingNumber = Parsed {0} as {1}
EnsureisEnsure = Ensure is {0}
productisproduct = product {0} found
productasbooleanis = product as boolean is {0}
Creatingcachelocation = Creating cache location
NeedtodownloadfilefromschemedestinationwillbedestName = Need to download file from {0}, destination will be {1}
Creatingthedestinationcachefile = Creating the destination cache file
Creatingtheschemestream = Creating the {0} stream
Settingdefaultcredential = Setting default credential
Settingauthenticationlevel = Setting authentication level
Ignoringbadcertificates = Ignoring bad certificates
Gettingtheschemeresponsestream = Getting the {0} response stream
ErrorOutString = Error: {0}
Copyingtheschemestreambytestothediskcache = Copying the {0} stream bytes to the disk cache
Redirectingpackagepathtocachefilelocation = Redirecting package path to cache file location
ThebinaryisanEXE = The binary is an EXE
Userhasrequestedloggingneedtoattacheventhandlerstotheprocess = User has requested logging, need to attach event handlers to the process
StartingwithstartInfoFileNamestartInfoArguments = Starting {0} with {1}
'@
}

Import-LocalizedData LocalizedData -filename PackageProvider.psd1


$Debug = $true
Function Trace-Message
{
    param([string] $Message)
    if($Debug)
    {
        Write-Verbose $Message
    }
}

$CacheLocation = "$env:ProgramData\Microsoft\Windows\PowerShell\Configuration\BuiltinProvCache\MSFT_PackageResource"

Function Throw-InvalidArgumentException
{
    param(
        [string] $Message,
        [string] $ParamName
    )
    
    $exception = new-object System.ArgumentException $Message,$ParamName
    $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception,$ParamName,"InvalidArgument",$null
    throw $errorRecord
}

Function Throw-InvalidNameOrIdException
{
    param(
        [string] $Message
    )
    
    $exception = new-object System.ArgumentException $Message
    $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception,"NameOrIdNotInMSI","InvalidArgument",$null
    throw $errorRecord
}

Function Throw-TerminatingError
{
    param(
        [string] $Message,
        [System.Management.Automation.ErrorRecord] $ErrorRecord
    )
    
    $exception = new-object "System.InvalidOperationException" $Message,$ErrorRecord.Exception
    $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception,"MachineStateIncorrect","InvalidOperation",$null
    throw $errorRecord
}

Function Validate-StandardArguments
{
    param(
        $Path,
        $ProductId,
        $Name
    )
    
    Trace-Message ($LocalizedData.ValidateStandardArgumentsPathwasPath -f $Path)
    $uri = $null
    try
    {
        $uri = [uri] $Path
    }
    catch
    {
        Throw-InvalidArgumentException ($LocalizedData.InvalidPath -f $Path) "Path"
    }
    
    if(-not @("file", "http", "https") -contains $uri.Scheme)
    {
        Trace-Message ($Localized.TheurischemewasuriScheme -f $uri.Scheme)
        Throw-InvalidArgumentException ($LocalizedData.InvalidPath -f $Path) "Path"
    }
    
    $pathExt = [System.IO.Path]::GetExtension($Path)
    Trace-Message ($LocalizedData.ThepathextensionwaspathExt -f $pathExt)
    if(-not @(".msi",".exe") -contains $pathExt.ToLower())
    {
        Throw-InvalidArgumentException ($LocalizedData.InvalidBinaryType -f $Path) "Path"
    }
    
    $identifyingNumber = $null
    if(-not $Name -and -not $ProductId)
    {
        #It's a tossup here which argument to blame, so just pick ProductId to encourage customers to use the most efficient version
        Throw-InvalidArgumentException ($LocalizedData.NeedsMoreInfo -f $Path) "ProductId"
    }
    elseif($ProductId)
    {
        try
        {
            Trace-Message ($LocalizedData.ParsingProductIdasanidentifyingNumber -f $ProductId)
            $identifyingNumber = "{{{0}}}" -f [Guid]::Parse($ProductId).ToString().ToUpper()
            Trace-Message ($LocalizedData.ParsedProductIdasidentifyingNumber -f $ProductId, $identifyingNumber)
        }
        catch
        {
            Throw-InvalidArgumentException ($LocalizedData.InvalidIdentifyingNumber -f $ProductId) $ProductId
        }
    }
    
    return $uri, $identifyingNumber
}

Function Get-ProductEntry
{
    param
    (
        [string] $Name,
        [string] $IdentifyingNumber
    )
    
    $uninstallKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
    $uninstallKeyWow64 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
    
    if($IdentifyingNumber)
    {
        $keyLocation = "$uninstallKey\$identifyingNumber"
        $item = Get-Item $keyLocation -EA SilentlyContinue
        if(-not $item)
        {
            $keyLocation = "$uninstallKeyWow64\$identifyingNumber"
            $item = Get-Item $keyLocation -EA SilentlyContinue
        }

        return $item
    }
    
    foreach($item in (Get-ChildItem -EA Ignore $uninstallKey, $uninstallKeyWow64))
    {
        if($Name -eq (Get-LocalizableRegKeyValue $item "DisplayName"))
        {
            return $item
        }
    }
    
    return $null
}

function Test-TargetResource 
{
    param
    (
        [ValidateSet("Present", "Absent")]
        [string] $Ensure = "Present",
        
        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [string] $Name,
        
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $Path,
        
        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [string] $ProductId,
        
        [string] $Arguments,
        
        [pscredential] $Credential,
        
        [int[]] $ReturnCode,
        
        [string] $LogPath
    )
    
    $uri, $identifyingNumber = Validate-StandardArguments $Path $ProductId $Name
    $product = Get-ProductEntry $Name $identifyingNumber
    Trace-Message ($LocalizedData.EnsureisEnsure -f $Ensure)
    if($product)
    {
        Trace-Message ($LocalizedData.productisproduct -f $product)
    }
    else
    {
        Trace-Message "product installation cannot be determined"
    }
    Trace-Message ($LocalizedData.productasbooleanis -f [boolean]$product)
    $res = ($product -ne $null -and $Ensure -eq "Present") -or ($product -eq $null -and $Ensure -eq "Absent")

    if ($product -ne $null)
    {
        $name = Get-LocalizableRegKeyValue $product "DisplayName"
        Write-Verbose ($LocalizedData.PackageAppearsInstalled -f $name)
    }
    else
    {   
        $displayName = $null
        if($Name)
        {
            $displayName = $Name
        }
        else
        {
            $displayName = $ProductId
        }
    
        Write-Verbose ($LocalizedData.PackageDoesNotAppearInstalled -f $displayName)
    }

    return $res
}

function Get-LocalizableRegKeyValue
{
    param(
        [object] $RegKey,
        [string] $ValueName
    )
    
    $res = $RegKey.GetValue("{0}_Localized" -f $ValueName)
    if(-not $res)
    {
        $res = $RegKey.GetValue($ValueName)
    }
    
    return $res
}

function Get-TargetResource
{
    param
    (
        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [string] $Name,
        
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $Path,
        
        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [string] $ProductId
    )
    
    #If the user gave the ProductId then we derive $identifyingNumber
    $uri, $identifyingNumber = Validate-StandardArguments $Path $ProductId $Name
    
    $localMsi = $uri.IsFile -and -not $uri.IsUnc
    
    $product = Get-ProductEntry $Name $identifyingNumber
    
    if(-not $product)
    {
        return @{
            Ensure = "Absent"
            Name = $Name
            ProductId = $identifyingNumber
            Installed = $false
        }
    }
    
    #$identifyingNumber can still be null here (e.g. remote MSI with Name specified, local EXE)
    #If the user gave a ProductId just pass it through, otherwise fill it from the product
    if(-not $identifyingNumber)
    {
        $identifyingNumber = Split-Path -Leaf $product.Name
    }
    
    $date = $product.GetValue("InstallDate")
    if($date)
    {
        try
        {
            $date = "{0:d}" -f [DateTime]::ParseExact($date, "yyyyMMdd",[System.Globalization.CultureInfo]::CurrentCulture).Date
        }
        catch
        {
            $date = $null
        }
    }
    
    $publisher = Get-LocalizableRegKeyValue $product "Publisher"
    $size = $product.GetValue("EstimatedSize")
    if($size)
    {
        $size = $size/1024
    }
    
    $version = $product.GetValue("DisplayVersion")
    $description = $product.GetValue("Comments")
    $name = Get-LocalizableRegKeyValue $product "DisplayName"
    return @{
        Ensure = "Present"
        Name = $name
        Path = $Path
        InstalledOn = $date
        ProductId = $identifyingNumber
        Size = $size
        Installed = $true
        Version = $version
        PackageDescription = $description
        Publisher = $publisher
    }
}

Function Get-MsiTools
{
    if($script:MsiTools)
    {
        return $script:MsiTools
    }
    
    $sig = @'
    [DllImport("msi.dll", CharSet = CharSet.Unicode, PreserveSig = true, SetLastError = true, ExactSpelling = true)]
    private static extern UInt32 MsiOpenPackageW(string szPackagePath, out IntPtr hProduct);

    [DllImport("msi.dll", CharSet = CharSet.Unicode, PreserveSig = true, SetLastError = true, ExactSpelling = true)]
    private static extern uint MsiCloseHandle(IntPtr hAny);

    [DllImport("msi.dll", CharSet = CharSet.Unicode, PreserveSig = true, SetLastError = true, ExactSpelling = true)]
    private static extern uint MsiGetPropertyW(IntPtr hAny, string name, StringBuilder buffer, ref int bufferLength);

    private static string GetPackageProperty(string msi, string property)
    {
        IntPtr MsiHandle = IntPtr.Zero;
        try
        {
            var res = MsiOpenPackageW(msi, out MsiHandle);
            if (res != 0)
            {
                return null;
            }
            
            int length = 256;
            var buffer = new StringBuilder(length);
            res = MsiGetPropertyW(MsiHandle, property, buffer, ref length);
            return buffer.ToString();
        }
        finally
        {
            if (MsiHandle != IntPtr.Zero)
            {
                MsiCloseHandle(MsiHandle);
            }
        }
    }
    public static string GetProductCode(string msi)
    {
        return GetPackageProperty(msi, "ProductCode");
    }
    
    public static string GetProductName(string msi)
    {
        return GetPackageProperty(msi, "ProductName");
    }
'@
    $script:MsiTools = Add-Type -PassThru -Namespace Microsoft.Windows.DesiredStateConfiguration.PackageResource `
        -Name MsiTools -Using System.Text -MemberDefinition $sig
    return $script:MsiTools
}


Function Get-MsiProductEntry
{
    param
    (
        [string] $Path
    )

    if(-not (Test-Path -PathType Leaf $Path) -and ($fileExtension -ne ".msi"))
    {
        Throw-TerminatingError ($LocalizedData.PathDoesNotExist -f $Path)
    }
    
    $tools = Get-MsiTools

    $pn = $tools::GetProductName($Path)

    $pc = $tools::GetProductCode($Path)

    return $pn,$pc
}


function Set-TargetResource 
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    param
    (
        [ValidateSet("Present", "Absent")]
        [string] $Ensure = "Present",
        
        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [string] $Name,
        
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $Path,
        
        [parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [string] $ProductId,
        
        [string] $Arguments,
        
        [pscredential] $Credential,
        
        [int[]] $ReturnCode,
        
        [string] $LogPath
    )
    
    $ErrorActionPreference = "Stop"
    
    if (Test-TargetResource -Ensure $Ensure -Name $Name -Path $Path -ProductId $ProductId)
    {
        return
    }

    $uri, $identifyingNumber = Validate-StandardArguments $Path $ProductId $Name
    $product = Get-ProductEntry $Name $identifyingNumber
    
    #Path gets overwritten in the download code path. Retain the user's original Path in case the install succeeded
    #but the named package wasn't present on the system afterward so we can give a better message
    $OrigPath = $Path
    
    Write-Verbose $LocalizedData.PackageConfigurationStarting
    if(-not $ReturnCode)
    {
        $ReturnCode = @(0)
    }
    
    $logStream = $null
    $psdrive = $null
    $downloadedFileName = $null
    try
    {
        $fileExtension = [System.IO.Path]::GetExtension($Path).ToLower()
        if($LogPath)
        {
            try
            {
                if($fileExtension -eq ".msi")
                {
                    #We want to pre-verify the path exists and is writable ahead of time
                    #even in the MSI case, as detecting WHY the MSI log doesn't exist would
                    #be rather problematic for the user
                    if((Test-Path $LogPath) -and $PSCmdlet.ShouldProcess($LocalizedData.RemoveExistingLogFile,$null,$null))
                    {
                        rm $LogPath
                    }
                    
                    if($PSCmdlet.ShouldProcess($LocalizedData.CreateLogFile, $null, $null))
                    {
                        New-Item -Type File $LogPath | Out-Null
                    }
                }
                elseif($PSCmdlet.ShouldProcess($LocalizedData.CreateLogFile, $null, $null))
                {
                    $logStream = new-object "System.IO.StreamWriter" $LogPath,$false
                }
            }
            catch
            {
                Throw-TerminatingError ($LocalizedData.CouldNotOpenLog -f $LogPath) $_
            }
        }
        
        #Download or mount file as necessary
        if(-not ($fileExtension -eq ".msi" -and $Ensure -eq "Absent"))
        {
            if($uri.IsUnc -and $PSCmdlet.ShouldProcess($LocalizedData.MountSharePath, $null, $null))
            {
                $psdriveArgs = @{Name=([guid]::NewGuid());PSProvider="FileSystem";Root=(Split-Path $uri.LocalPath)}
                if($Credential)
                {
                    #We need to optionally include these and then splat the hash otherwise
                    #we pass a null for Credential which causes the cmdlet to pop a dialog up
                    $psdriveArgs["Credential"] = $Credential
                }
                
                $psdrive = New-PSDrive @psdriveArgs
                $Path = Join-Path $psdrive.Root (Split-Path -Leaf $uri.LocalPath) #Necessary?
            }
            elseif(@("http", "https") -contains $uri.Scheme -and $Ensure -eq "Present" -and $PSCmdlet.ShouldProcess($LocalizedData.DownloadHTTPFile, $null, $null))
            {
                $scheme = $uri.Scheme
                $outStream = $null
                $responseStream = $null

                try
                {
                    Trace-Message ($LocalizedData.Creatingcachelocation)

                    if(-not (Test-Path -PathType Container $CacheLocation))
                    {
                        mkdir $CacheLocation | Out-Null
                    }
                
                    $destName = Join-Path $CacheLocation (Split-Path -Leaf $uri.LocalPath)
                
                    Trace-Message ($LocalizedData.NeedtodownloadfilefromschemedestinationwillbedestName -f $scheme, $destName)

                    try
                    {
                        Trace-Message ($LocalizedData.Creatingthedestinationcachefile)
                        $outStream = New-Object System.IO.FileStream $destName, "Create"
                    }
                    catch
                    {
                        #Should never happen since we own the cache directory
                        Throw-TerminatingError ($LocalizedData.CouldNotOpenDestFile -f $destName) $_
                    }

                    try
                    {
                        Trace-Message ($LocalizedData.Creatingtheschemestream -f $scheme)
                        $request = [System.Net.WebRequest]::Create($uri)
                        Trace-Message ($LocalizedData.Settingdefaultcredential)
                        $request.Credentials = [System.Net.CredentialCache]::DefaultCredentials
                        if ($scheme -eq "http")
                        {
                            Trace-Message ($LocalizedData.Settingauthenticationlevel)
                            # default value is MutualAuthRequested, which applies to https scheme
                            $request.AuthenticationLevel = [System.Net.Security.AuthenticationLevel]::None                            
                        }
                        if ($scheme -eq "https")
                        {
                            Trace-Message ($LocalizedData.Ignoringbadcertificates)
                            $request.ServerCertificateValidationCallBack = {$true}
                        }
                        Trace-Message ($LocalizedData.Gettingtheschemeresponsestream -f $scheme)
                        $responseStream = (([System.Net.HttpWebRequest]$request).GetResponse()).GetResponseStream()
                    }
                    catch
                    {
                         Trace-Message ($LocalizedData.ErrorOutString -f ($_ | Out-String))
                         Throw-TerminatingError ($LocalizedData.CouldNotGetHttpStream -f $scheme, $Path) $_
                    }

                    try
                    {
                        Trace-Message ($LocalizedData.Copyingtheschemestreambytestothediskcache -f $scheme)
                        $responseStream.CopyTo($outStream)
                        $responseStream.Flush()
                        $outStream.Flush()
                    }
                    catch
                    {
                        Trace-Message ($LocalizedData.ErrorOutString -f ($_ | Out-String))
                        Throw-TerminatingError ($LocalizedData.ErrorCopyingDataToFile -f $Path,$destName) $_
                    }
                }
                finally
                {
                    if($outStream)
                    {
                        $outStream.Close()
                    }
                    
                    if($responseStream)
                    {
                        $responseStream.Close()
                    }
                }
                Trace-Message ($LocalizedData.Redirectingpackagepathtocachefilelocation)
                $Path = $downloadedFileName = $destName
            }
        }
        
        #At this point the Path ought to be valid unless it's an MSI uninstall case
        if(-not (Test-Path -PathType Leaf $Path) -and -not ($Ensure -eq "Absent" -and $fileExtension -eq ".msi"))
        {
            Throw-TerminatingError ($LocalizedData.PathDoesNotExist -f $Path)
        }
        
        $startInfo = New-Object System.Diagnostics.ProcessStartInfo
        $startInfo.UseShellExecute = $false #Necessary for I/O redirection and just generally a good idea
        $process = New-Object System.Diagnostics.Process
        $process.StartInfo = $startInfo
        $errLogPath = $LogPath + ".err" #Concept only, will never touch disk
        
        if($fileExtension -eq ".msi")
        {
            $startInfo.FileName = "$env:windir\system32\msiexec.exe"
            if($Ensure -eq "Present")
            {
                # check if Msi package contains the ProductName and Code specified

                $pName,$pCode = Get-MsiProductEntry -Path $Path

                if (
                    ( (-not [String]::IsNullOrEmpty($Name)) -and ($pName -ne $Name))  `
                -or ( (-not [String]::IsNullOrEmpty($identifyingNumber)) -and ($identifyingNumber -ne $pCode))
                )
                {
                    Throw-InvalidNameOrIdException ($LocalizedData.InvalidNameOrId -f $Name,$identifyingNumber,$pName,$pCode)
                }

                $startInfo.Arguments = '/i "{0}"' -f $Path
            }
            else
            {
                $id = Split-Path -Leaf $product.Name #We may have used the Name earlier, now we need the actual ID
                $startInfo.Arguments = ("/x{0}" -f $id)
            }
            
            if($LogPath)
            {
                $startInfo.Arguments += ' /log "{0}"' -f $LogPath
            }
            
            $startInfo.Arguments += " /quiet"
            
            if($Arguments)
            {
                $startInfo.Arguments += " " + $Arguments
            }
        }
        else #EXE
        {
            Trace-Message ($LocalizedData.ThebinaryisanEXE)
            if($Ensure -eq "Present")
            {
                $startInfo.FileName = $Path
                $startInfo.Arguments = $Arguments
                if($LogPath)
                {
                    Trace-Message ($LocalizedData.Userhasrequestedloggingneedtoattacheventhandlerstotheprocess)
                    $startInfo.RedirectStandardError = $true
                    $startInfo.RedirectStandardOutput = $true
                    Register-ObjectEvent -InputObject $process -EventName "OutputDataReceived" -SourceIdentifier $LogPath
                    Register-ObjectEvent -InputObject $process -EventName "ErrorDataReceived" -SourceIdentifier $errLogPath
                }
            } else {
                # Absent case
                $startInfo.FileName = "$env:windir\system32\msiexec.exe"
                $id = Split-Path -Leaf $product.Name
                $startInfo.Arguments = ("/x{0} /quiet" -f $id)
                if($LogPath)
                {
                    $startInfo.Arguments += ' /log "{0}"' -f $LogPath
                }
                
                if($Arguments)
                {
                    $startInfo.Arguments += " " + $Arguments
                }
            }
        }
        
        Trace-Message ($LocalizedData.StartingwithstartInfoFileNamestartInfoArguments -f $startInfo.FileName, $startInfo.Arguments)
        
        if($PSCmdlet.ShouldProcess(($LocalizedData.StartingProcessMessage -f $startInfo.FileName, $startInfo.Arguments), $null, $null))
        {
            try
            {
                $exitcode = 0
                $process.Start() | Out-Null
                if($logStream) #Identical to $fileExtension -eq ".exe" -and $logPath
                 {
                     $process.BeginOutputReadLine();
                     $process.BeginErrorReadLine();
                 }
          
                 $process.WaitForExit()

                 if($process)
                 {
                    $exitCode = $process.ExitCode
                 }

            }
            catch
            {
                Throw-TerminatingError ($LocalizedData.CouldNotStartProcess -f $Path) $_
            }

            
            if($logStream)
            {
                #We have to re-mux these since they appear to us as different streams
                #The underlying Win32 APIs prevent this problem, as would constructing a script
                #on the fly and executing it, but the former is highly problematic from PowerShell
                #and the latter doesn't let us get the return code for UI-based EXEs
                $outputEvents = Get-Event -SourceIdentifier $LogPath
                $errorEvents = Get-Event -SourceIdentifier $errLogPath
                $masterEvents = @() + $outputEvents + $errorEvents
                $masterEvents = $masterEvents | Sort-Object -Property TimeGenerated
                
                foreach($event in $masterEvents)
                {
                    $logStream.Write($event.SourceEventArgs.Data);
                }
                
                Remove-Event -SourceIdentifier $LogPath
                Remove-Event -SourceIdentifier $errLogPath
            }
            
            if(-not ($ReturnCode -contains $exitCode))
            {
                Throw-TerminatingError ($LocalizedData.UnexpectedReturnCode -f $exitCode.ToString())
            }
        }
    }
    finally
    {
        if($psdrive)
        {
            Remove-PSDrive -Force $psdrive
        }
        
        if($logStream)
        {
            $logStream.Dispose()
        }
    }
    
    if($downloadedFileName -and $PSCmdlet.ShouldProcess($LocalizedData.RemoveDownloadedFile, $null, $null))
    {
        #This is deliberately not in the Finally block. We want to leave the downloaded file on disk
        #in the error case as a debugging aid for the user
        rm $downloadedFileName
    }
    
    $operationString = $LocalizedData.PackageUninstalled
    if($Ensure -eq "Present")
    {
        $operationString = $LocalizedData.PackageInstalled
    }
    
    # Check if reboot is required, if so notify CA. The MSFT_ServerManagerTasks provider is missing on client SKUs
    $featureData = invoke-wmimethod -EA Ignore -Name GetServerFeature -namespace root\microsoft\windows\servermanager -Class MSFT_ServerManagerTasks
    $regData = Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" "PendingFileRenameOperations" -EA Ignore
    if(($featureData -and $featureData.RequiresReboot) -or $regData)
    {
        Write-Verbose $LocalizedData.MachineRequiresReboot
        $global:DSCMachineStatus = 1
    }
    
    if($Ensure -eq "Present")
    {
        $productEntry = Get-ProductEntry $Name $identifyingNumber
        if(-not $productEntry)
        {
            Throw-TerminatingError ($LocalizedData.PostValidationError -f $OrigPath)
        }
    }
    
    Write-Verbose $operationString
    Write-Verbose $LocalizedData.PackageConfigurationComplete
}

Export-ModuleMember -function Get-TargetResource, Set-TargetResource, Test-TargetResource
