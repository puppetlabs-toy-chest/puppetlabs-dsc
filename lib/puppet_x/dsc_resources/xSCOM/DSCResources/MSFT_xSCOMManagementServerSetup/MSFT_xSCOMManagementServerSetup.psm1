function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = "\SystemCenter2012R2\OperationsManager.en",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.String]
        $ProductKey,

        [System.String]
        $InstallPath,

        [parameter(Mandatory = $true)]
        [System.String]
        $ManagementGroupName,

        [parameter(Mandatory = $true)]
        [System.Boolean]
        $FirstManagementServer,

        [System.UInt16]
        $ManagementServicePort = 5723,

        [System.Management.Automation.PSCredential]
        $ActionAccount,

        [System.Management.Automation.PSCredential]
        $DASAccount,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $DataReader,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $DataWriter,

        [parameter(Mandatory = $true)]
        [System.String]
        $SqlServerInstance,

        [System.String]
        $DatabaseName = "OperationsManager",

        [System.UInt16]
        $DatabaseSize = 1000,

        [parameter(Mandatory = $true)]
        [System.String]
        $DwSqlServerInstance,

        [System.String]
        $DwDatabaseName = "OperationsManagerDW",

        [System.UInt16]
        $DwDatabaseSize = 1000,

        [System.Byte]
        $UseMicrosoftUpdate,

        [System.Byte]
        $SendCEIPReports,

        [ValidateSet("Never","Queued","Always")]
        [System.String]
        $EnableErrorReporting = "Never",

        [System.Byte]
        $SendODRReports
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1
        
    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "setup.exe"
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion

    switch($Version)
    {
        "7.1.10226.0"
        {
            $IdentifyingNumber = "{C92727BE-BD12-4140-96A6-276BA4F60AC1}"
            $InstallRegVersion = "12"
            $RegVersion = "3.0"
        }
        "7.2.10015.0"
        {
            $IdentifyingNumber = "{43C498CB-D391-4B07-9C03-85C4E8239102}"
            $InstallRegVersion = "12"
            $RegVersion = "3.0"
        }
        Default
        {
            throw "Unknown version of Operations Manager!"
        }
    }

    if(Get-WmiObject -Class Win32_Product | Where-Object {$_.IdentifyingNumber -eq $IdentifyingNumber})
    {
        $InstallPath = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\System Center Operations Manager\$InstallRegVersion\Setup" -Name "InstallDirectory").InstallDirectory
        $MGs = Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Operations Manager\$RegVersion\Server Management Groups"
        foreach($MG in $MGs)
        {
            $MGReg = $MG.Name.Replace("HKEY_LOCAL_MACHINE\","HKLM:")
            if ((Get-ItemProperty -Path $MGReg -Name "IsServer").IsServer -eq 1)
            {
                $ManagementGroupName = $MG.Name.Split("\")[$MG.Name.Split("\").Count - 1]
                $ManagementServicePort = (Get-ItemProperty -Path $MGReg -Name "Port").Port
            }
        }
        $ComputerName = $env:COMPUTERNAME + "." + (Get-WmiObject -Class Win32_ComputerSystem).Domain
        if(!(Get-Module -Name OperationsManager))
        {
            Import-Module "$InstallPath\PowerShell\OperationsManager"
        }
        if(Get-Module -Name OperationsManager)
        {
            $ManagementServer = Get-SCOMManagementServer -Name $ComputerName
            $ActionAccountUsername = $ManagementServer.ActionAccountIdentity
            $DRA = (Get-SCOMRunAsAccount -Name "Data Warehouse Report Deployment Account")
            $DataReaderUsername = $DRA.Domain + "\" + $DRA.UserName
            $DWA = (Get-SCOMRunAsAccount -Name "Data Warehouse Action Account")
            $DataWriterUsername = $DWA.Domain + "\" + $DWA.UserName
        }
        $DASAccountUsername = (Get-WmiObject -Class Win32_Service | Where-Object {$_.Name -eq "OMSDK"}).StartName
        $SqlServerInstance = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Operations Manager\$RegVersion\Setup" -Name "DatabaseServerName").DatabaseServerName
        $DatabaseName = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Operations Manager\$RegVersion\Setup" -Name "DatabaseName").DatabaseName
        $DwSqlServerInstance = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Operations Manager\$RegVersion\Setup" -Name "DataWarehouseDBServerName").DataWarehouseDBServerName
        $DwDatabaseName = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Operations Manager\$RegVersion\Setup" -Name "DataWarehouseDBName").DataWarehouseDBName

        $returnValue = @{
            Ensure = "Present"
            SourcePath = $SourcePath
            SourceFolder = $SourceFolder
            InstallPath = $InstallPath
            ManagementGroupName = $ManagementGroupName
            ManagementServicePort = $ManagementServicePort
            ActionAccountUsername = $ActionAccountUsername
            DASAccountUsername = $DASAccountUsername
            DataReaderUsername = $DataReaderUsername
            DataWriterUsername = $DataWriterUsername
            SqlServerInstance = $SqlServerInstance
            DatabaseName = $DatabaseName
            DwSqlServerInstance = $DwSqlServerInstance
            DwDatabaseName = $DwDatabaseName
        }
    }
    else
    {
        $returnValue = @{
            Ensure = "Absent"
            SourcePath = $SourcePath
            SourceFolder = $SourceFolder
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
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = "\SystemCenter2012R2\OperationsManager.en",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.String]
        $ProductKey,

        [System.String]
        $InstallPath,

        [parameter(Mandatory = $true)]
        [System.String]
        $ManagementGroupName,

        [parameter(Mandatory = $true)]
        [System.Boolean]
        $FirstManagementServer,

        [System.UInt16]
        $ManagementServicePort = 5723,

        [System.Management.Automation.PSCredential]
        $ActionAccount,

        [System.Management.Automation.PSCredential]
        $DASAccount,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $DataReader,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $DataWriter,

        [parameter(Mandatory = $true)]
        [System.String]
        $SqlServerInstance,

        [System.String]
        $DatabaseName = "OperationsManager",

        [System.UInt16]
        $DatabaseSize = 1000,

        [parameter(Mandatory = $true)]
        [System.String]
        $DwSqlServerInstance,

        [System.String]
        $DwDatabaseName = "OperationsManagerDW",

        [System.UInt16]
        $DwDatabaseSize = 1000,

        [System.Byte]
        $UseMicrosoftUpdate,

        [System.Byte]
        $SendCEIPReports,

        [ValidateSet("Never","Queued","Always")]
        [System.String]
        $EnableErrorReporting = "Never",

        [System.Byte]
        $SendODRReports
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1
        
    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "setup.exe"
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion

    switch($Version)
    {
        "7.1.10226.0"
        {
            $IdentifyingNumber = "{C92727BE-BD12-4140-96A6-276BA4F60AC1}"
            $InstallRegVersion = "12"
        }
        "7.2.10015.0"
        {
            $IdentifyingNumber = "{43C498CB-D391-4B07-9C03-85C4E8239102}"
            $InstallRegVersion = "12"
        }
        Default
        {
            throw "Unknown version of Operations Manager!"
        }
    }

    switch($Ensure)
    {
        "Present"
        {
            # Set defaults, if they couldn't be set in param due to null configdata input
            if($ManagementServicePort -eq 0)
            {
                $ManagementServicePort = 5723
            }
            if($DatabaseSize -eq 0)
            {
                $DatabaseSize = 1000
            }
            if($DwDatabaseSize -eq 0)
            {
                $DwDatabaseSize = 1000
            }
            if($UseMicrosoftUpdate -ne 1)
            {
                $UseMicrosoftUpdate = 0
            }
            if($SendCEIPReports -ne 1)
            {
                $SendCEIPReports = 0
            }
            if($SendODRReports -ne 1)
            {
                $SendODRReports = 0
            }

            # Remove default instance name
            $SqlServerInstance = $SqlServerInstance.Replace("\MSSQLSERVER","")
            $DwSqlServerInstance = $DwSqlServerInstance.Replace("\MSSQLSERVER","")

            # Create install arguments
            $Arguments = "/silent /install /AcceptEndUserLicenseAgreement:1 /components:OMServer"
            $ArgumentVars = @(
                "InstallPath",
                "UseMicrosoftUpdate",
                "SendCEIPReports",
                "EnableErrorReporting",
                "SendODRReports",
                "ManagementServicePort",
                "SqlServerInstance",
                "DatabaseName"
            )
            if($FirstManagementServer)
            {
                $ArgumentVars += @(
                    "ManagementGroupName",
                    "DatabaseSize",
                    "DwSqlServerInstance",
                    "DwDatabaseName",
                    "DwDatabaseSize"
                )
            }
            foreach($ArgumentVar in $ArgumentVars)
            {
                if(!([String]::IsNullOrEmpty((Get-Variable -Name $ArgumentVar).Value)))
                {
                    $Arguments += " /$ArgumentVar`:" + [Environment]::ExpandEnvironmentVariables((Get-Variable -Name $ArgumentVar).Value)
                }
            }
            $AccountVars = @("ActionAccount","DASAccount","DataReader","DataWriter")
            foreach($AccountVar in $AccountVars)
            {
                if($PSBoundParameters.ContainsKey("ActionAccount") -or $PSBoundParameters.ContainsKey($AccountVar))
                {
                    $Arguments += " /$AccountVar`User:" + (Get-Variable -Name $AccountVar).Value.UserName
                    $Arguments += " /$AccountVar`Password:" + (Get-Variable -Name $AccountVar).Value.GetNetworkCredential().Password
                }
                else
                {
                    if(($AccountVar -eq "ActionAccount") -or ($AccountVar -eq "DASAccount"))
                    {
                        $Arguments += " /UseLocalSystem$AccountVar"
                    }
                }
            }
            
            # Replace sensitive values for verbose output
            $Log = $Arguments
            $LogVars = @("ActionAccount","DASAccount","DataReader","DataWriter")
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
            # Create uninstall arguments
            $Arguments = "/silent /uninstall /components:OMServer"
            $Log = $Arguments
        }
    }

    Write-Verbose "Path: $Path"
    Write-Verbose "Arguments: $Log"
    
    $Process = StartWin32Process -Path $Path -Arguments $Arguments -Credential $SetupCredential -AsTask
    Write-Verbose $Process
    WaitForWin32ProcessEnd -Path $Path -Arguments $Arguments -Credential $SetupCredential

    # Additional first Management Server "Present" actions
    if(($Ensure -eq "Present") -and $FirstManagementServer -and (Get-WmiObject -Class Win32_Product | Where-Object {$_.IdentifyingNumber -eq $IdentifyingNumber}))
    {
        # Set ProductKey
        if($PSBoundParameters.ContainsKey("ProductKey"))
        {
            Write-Verbose "Set product key"
            Invoke-Command -ComputerName . -Credential $SetupCredential -Authentication Credssp -ScriptBlock {
                $ProductKey = $args[0]
                $InstallRegVersion = $args[1]
                $InstallPath = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\System Center Operations Manager\$InstallRegVersion\Setup" -Name "InstallDirectory").InstallDirectory
                Import-Module "$([Environment]::ExpandEnvironmentVariables($InstallPath))\Powershell\OperationsManager"
                Set-SCOMLicense -ProductID $ProductKey -Confirm:$false
            } -ArgumentList @($ProductKey,$InstallRegVersion)
            Restart-Service omsdk
            Restart-Service cshost
        }
        # Wait for Management Service
        $ErrorActionPreference = "SilentlyContinue"
        foreach($Port in @($ManagementServicePort,5724))
        {
            $MSOpen = $false
            while(!$MSOpen)
            {
                $Socket = New-Object Net.Sockets.TcpClient
                $Socket.Connect("localhost",$Port)
                if($Socket.Connected)
                {
                    $MSOpen = $true
                }
                else
                {
                    Write-Verbose "Wait for Management Server port $Port to open"
                    Start-Sleep 60
                }
                $Socket = $null
            }
        }
        $ErrorActionPreference = "Continue"
        # Allow MS to initialize
        Start-Sleep 300
    }

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
        [parameter(Mandatory = $true)]
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = "\SystemCenter2012R2\OperationsManager.en",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.String]
        $ProductKey,

        [System.String]
        $InstallPath,

        [parameter(Mandatory = $true)]
        [System.String]
        $ManagementGroupName,

        [parameter(Mandatory = $true)]
        [System.Boolean]
        $FirstManagementServer,

        [System.UInt16]
        $ManagementServicePort = 5723,

        [System.Management.Automation.PSCredential]
        $ActionAccount,

        [System.Management.Automation.PSCredential]
        $DASAccount,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $DataReader,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $DataWriter,

        [parameter(Mandatory = $true)]
        [System.String]
        $SqlServerInstance,

        [System.String]
        $DatabaseName = "OperationsManager",

        [System.UInt16]
        $DatabaseSize = 1000,

        [parameter(Mandatory = $true)]
        [System.String]
        $DwSqlServerInstance,

        [System.String]
        $DwDatabaseName = "OperationsManagerDW",

        [System.UInt16]
        $DwDatabaseSize = 1000,

        [System.Byte]
        $UseMicrosoftUpdate,

        [System.Byte]
        $SendCEIPReports,

        [ValidateSet("Never","Queued","Always")]
        [System.String]
        $EnableErrorReporting = "Never",

        [System.Byte]
        $SendODRReports
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)
    
    $result
}


Export-ModuleMember -Function *-TargetResource
