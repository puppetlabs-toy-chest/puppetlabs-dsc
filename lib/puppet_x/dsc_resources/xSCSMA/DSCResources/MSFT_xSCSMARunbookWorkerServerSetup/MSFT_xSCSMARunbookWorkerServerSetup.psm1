function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [Parameter()]
        [System.String]
        $SourceFolder = '\SystemCenter2012R2\Orchestrator',

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $Service,

        [Parameter(Mandatory = $true)]
        [System.String]
        $SqlServer,

        [Parameter(Mandatory = $true)]
        [System.String]
        $SqlInstance,

        [Parameter()]
        [System.String]
        $SqlDatabase = 'SMA',

        [Parameter()]
        [System.String]
        $InstallFolder,

        [Parameter()]
        [System.String]
        $ETWManifest = 'Yes',

        [Parameter()]
        [System.String]
        $SendTelemetryReports = 'No',

        [Parameter()]
        [System.String]
        $MSUpdate = 'No',

        [Parameter()]
        [System.String]
        $ProductKey
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1

    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\SMA\WorkerSetup.exe"
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion

    switch($Version)
    {
        "7.2.1563.0"
        {
            # System Center 2012 R2
            $IdentifyingNumber = "{B2FA6B22-1DDF-4BD4-8B92-ADF17D48262F}"
        }
        "7.3.345.0"
        {
            # System Center 2016
            $IdentifyingNumber = "{B2FA6B22-1DDF-4BD4-8B92-ADF17D48262F}"
        }
        Default
        {
            throw "Unknown version of Service Management Automation!"
        }
    }

    if(Get-WmiObject -Class Win32_Product -Filter "IdentifyingNumber ='$IdentifyingNumber'")
    {
        $ServiceUsername = (Get-WmiObject -Class Win32_Service -Filter "Name ='rbsvc'").StartName
        $SqlServer = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\ServiceManagementAutomation\RunbookWorker" -Name "DatabaseServerName").DatabaseServerName
        $SqlInstance = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\ServiceManagementAutomation\RunbookWorker" -Name "DatabaseServerInstance").DatabaseServerInstance
        if([String]::IsNullOrEmpty($SqlInstance))
        {
            $SqlInstance = "MSSQLSERVER"
        }
        $SqlDatabase = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\ServiceManagementAutomation\RunbookWorker" -Name "DatabaseName").DatabaseName
        $InstallFolder = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\ServiceManagementAutomation\RunbookWorker" -Name "InstallationFolder").InstallationFolder

        $returnValue = @{
            Ensure = 'Present'
            SourcePath = $SourcePath
            SourceFolder = $SourceFolder
            ServiceUsername = $ServiceUsername
            SqlServer = $SqlServer
            SqlInstance = $SqlInstance
            SqlDatabase = $SqlDatabase
            InstallFolder = $InstallFolder
            SendTelemetryReports = $SendTelemetryReports
        }
    }
    else
    {
        $returnValue = @{
            Ensure = 'Absent'
            SourcePath = $SourcePath
            SourceFolder = $SourceFolder
            ServiceUsername = $null
            SqlServer = $null
            SqlInstance = $null
            SqlDatabase = $null
            InstallFolder = $null
            SendTelemetryReports = $null
        }
    }

    $returnValue
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [Parameter()]
        [System.String]
        $SourceFolder = '\SystemCenter2012R2\Orchestrator',

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $Service,

        [Parameter(Mandatory = $true)]
        [System.String]
        $SqlServer,

        [Parameter(Mandatory = $true)]
        [System.String]
        $SqlInstance,

        [Parameter()]
        [System.String]
        $SqlDatabase = 'SMA',

        [Parameter()]
        [System.String]
        $InstallFolder,

        [Parameter()]
        [System.String]
        $ETWManifest = 'Yes',

        [Parameter()]
        [System.String]
        $SendTelemetryReports = 'No',

        [Parameter()]
        [System.String]
        $MSUpdate = 'No',

        [Parameter()]
        [System.String]
        $ProductKey,

        [System.String]
        $LogMsiInstall = $false,

        [System.String]
        $MsiLogPath = $env:LOCALAPPDATA + "\SystemCenter2016\SMA",

        [System.String]
        $MsiLogName = "SMAinstall.log"
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1

    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\SMA\WorkerSetup.exe"
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion

    switch($Version)
    {
        "7.2.1563.0"
        {
            # System Center 2012 R2
            $IdentifyingNumber = "{B2FA6B22-1DDF-4BD4-8B92-ADF17D48262F}"
            $SCVersion = "System Center 2012 R2"
            $SendCEIPReports = $SendTelemetryReports
        }
        "7.3.345.0"
        {
            # System Center 2016
            $IdentifyingNumber = "{B2FA6B22-1DDF-4BD4-8B92-ADF17D48262F}"
            $SCVersion = "System Center 2016"
        }
        Default
        {
            throw "Unknown version of Service Management Automation!"
        }
    }

    $Path = "$env:windir\system32\msiexec.exe"
    $Path = ResolvePath $Path

    switch($Ensure)
    {
        "Present"
        {
            # Set defaults, if they couldn't be set in param due to null configdata input
            foreach ($ArgumentVar in ('ETWManifest','SendCEIPReports','SendTelemetryReports','MSUpdate'))
            {
                if ((Get-Variable -Name $ArgumentVar).Value -ne 'Yes')
                {
                    Set-Variable -Name $ArgumentVar -Value 'No'
                }

            }

            $MSIPath = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\SMA\WorkerInstaller.msi"
            $MSIPath = ResolvePath $MSIPath
            Write-Verbose "MSIPath: $MSIPath"

            # Create install arguments
            $Arguments = "/q /i $MSIPath"
            if(($PSVersionTable.PSVersion.Major -eq 5) -and ($SCVersion -eq "System Center 2012 R2"))
            {
                $MSTPath = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\SMA\WMF5Worker.mst"
                $MSTPath = ResolvePath $MSTPath
                Write-Verbose "MSTPath: $MSTPath"
                $Arguments += " TRANSFORMS=$MSTPath"
            }
            $Arguments += " ALLUSERS=2 CreateDatabase=No DatabaseAuthentication=Windows"
            $ArgumentVars = @(
                "SqlServer",
                "SqlDatabase",
                "InstallFolder",
                "ETWManifest"
                "MSUpdate",
                "ProductKey"
            )
            if($SCVersion -eq "System Center 2012 R2")
            {
                $ArgumentVars += @(
                    "SendCEIPReports"
                )
            }
            else
            {
                $ArgumentVars += @(
                    "SendTelemetryReports"
                )
            }
            if($SQLInstance -ne "MSSQLSERVER")
            {
                $ArgumentVars += @(
                    "SqlInstance"
                )
            }
            foreach($ArgumentVar in $ArgumentVars)
            {
                if(!([String]::IsNullOrEmpty((Get-Variable -Name $ArgumentVar).Value)))
                {
                    $Arguments += " $ArgumentVar=`"" + [Environment]::ExpandEnvironmentVariables((Get-Variable -Name $ArgumentVar).Value) + "`""
                }
            }
            $AccountVars = @("Service")
            foreach($AccountVar in $AccountVars)
            {
                $Arguments += " $AccountVar`Account=`"" + (Get-Variable -Name $AccountVar).Value.UserName + "`""
                $Arguments += " $AccountVar`Password=`"" + (Get-Variable -Name $AccountVar).Value.GetNetworkCredential().Password + "`""
            }
            # Check if logging is wanted
            if($LogMsiInstall) {
                # Create Path if not exist
                $logPathName = Join-Path -Path $MsiLogPath -ChildPath $MSIlogName
                Write-Verbose "MSI install log location: $logPathName"
                if(!(Test-Path -Path $MsiLogPath))
                {
                    New-Item -ItemType Directory -Force -Path $MsiLogPath
                }
                else
                {
                    if(Test-Path -Path $logPathName)
                    {
                        # Remove logfile if exist
                        Remove-Item -Path $logPathName -Force
                    }
                }
                Write-Verbose -Message "MSI logfile: $logPathName"
                $Arguments += " /L*V ""$logPathName"""
            }
            # Replace sensitive values for verbose output
            $Log = $Arguments
            $LogVars = @("Service")
            foreach($LogVar in $LogVars)
            {
                if((Get-Variable -Name $LogVar).Value -ne "")
                {
                    $Log = $Log.Replace((Get-Variable -Name $LogVar).Value.GetNetworkCredential().Password,"********")
                }
            }
        }
        "Absent"
        {
            $Arguments = "/q /x $IdentifyingNumber"
            $Log = $Arguments
        }
    }

    Write-Verbose "Path: $Path"
    Write-Verbose "Arguments: $Log"

    $Process = StartWin32Process -Path $Path -Arguments $Arguments -Credential $SetupCredential
    Write-Verbose $Process
    WaitForWin32ProcessEnd -Path $Path -Arguments $Arguments -Credential $SetupCredential

    if((Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager' -Name 'PendingFileRenameOperations' -ErrorAction SilentlyContinue) -ne $null)
    {
        $global:DSCMachineStatus = 1
    }
    else
    {
        if(!(Test-TargetResource @PSBoundParameters))
        {
            throw "Set-TargetResouce failed"
        }
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [Parameter()]
        [System.String]
        $SourceFolder = '\SystemCenter2012R2\Orchestrator',

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $Service,

        [Parameter(Mandatory = $true)]
        [System.String]
        $SqlServer,

        [Parameter(Mandatory = $true)]
        [System.String]
        $SqlInstance,

        [Parameter()]
        [System.String]
        $SqlDatabase = 'SMA',

        [Parameter()]
        [System.String]
        $InstallFolder,

        [Parameter()]
        [System.String]
        $ETWManifest = 'Yes',

        [Parameter()]
        [System.String]
        $SendTelemetryReports = 'No',

        [Parameter()]
        [System.String]
        $MSUpdate = 'No',

        [Parameter()]
        [System.String]
        $ProductKey,

        [System.String]
        $LogMsiInstall = $false,

        [System.String]
        $MsiLogPath = $env:LOCALAPPDATA + "\SystemCenter2016\SMA",

        [System.String]
        $MsiLogName = "SMAinstall.log"
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)

    $result
}

Export-ModuleMember -Function *-TargetResource
