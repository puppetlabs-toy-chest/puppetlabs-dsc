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
        $SourceFolder = "\SystemCenter2012R2\Orchestrator",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [parameter(Mandatory = $true)]
        [System.Boolean]
        $FirstWebServiceServer,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $ApPool,

        [System.String]
        $AdminGroupMembers,

        [parameter(Mandatory = $true)]
        [System.String]
        $SqlServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $SqlInstance,

        [System.String]
        $SqlDatabase = "SMA",

        [System.String]
        $SiteName = "SMA",

        [System.UInt16]
        $WebServicePort = 9090,

        [System.String]
        $InstallFolder,

        [System.String]
        $UseSSL = "Yes",

        [System.String]
        $SpecifyCertificate = "No",

        [System.String]
        $CertificateName = ($env:COMPUTERNAME + "." + (Get-WmiObject -Class Win32_ComputerSystem).Domain),

        [System.String]
        $ETWManifest = "Yes",

        [System.String]
        $SendCEIPReports = "No",

        [System.String]
        $MSUpdate = "No",

        [System.String]
        $ProductKey,

        [System.String[]]
        $RunbookWorkerServers
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1
        
    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\SMA\WorkerSetup.exe"
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion

    switch($Version)
    {
        "7.2.1563.0"
        {
            $IdentifyingNumber = "{4B76B636-AE9A-47D5-A246-E02909D97CF2}"
        }
        "7.2.5002.0"
        {
            $IdentifyingNumber = "{4B76B636-AE9A-47D5-A246-E02909D97CF2}"
        }
        Default
        {
            throw "Unknown version of Service Management Automation!"
        }
    }

    if(Get-WmiObject -Class Win32_Product | Where-Object {$_.IdentifyingNumber -eq $IdentifyingNumber})
    {
        $SqlServer = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\ServiceManagementAutomation\WebService" -Name "DatabaseServerName").DatabaseServerName
        $SqlInstance = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\ServiceManagementAutomation\WebService" -Name "DatabaseServerInstance").DatabaseServerInstance
        if([String]::IsNullOrEmpty($SqlInstance))
        {
            $SqlInstance = "MSSQLSERVER"
        }
        $SqlDatabase = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\ServiceManagementAutomation\WebService" -Name "DatabaseName").DatabaseName
        $InstallFolder = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\ServiceManagementAutomation\WebService" -Name "InstallationFolder").InstallationFolder
        $SiteName = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\ServiceManagementAutomation\WebService" -Name "IisSiteName").IisSiteName
        $ApPoolUsername = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\ServiceManagementAutomation\WebService" -Name "IisAppPoolAccount").IisAppPoolAccount
        $AdminGroupMembers = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\ServiceManagementAutomation\WebService" -Name "IisAuthorizationAdminGroupMembers").IisAuthorizationAdminGroupMembers
        if(!(Get-Module -Name Microsoft.SystemCenter.ServiceManagementAutomation))
        {
            Import-Module -Name Microsoft.SystemCenter.ServiceManagementAutomation
        }
        $RunbookWorkerServers = (Get-SmaRunbookWorkerDeployment -WebServiceEndpoint https://localhost).ComputerName

        $returnValue = @{
            Ensure = "Present"
            SourcePath = $SourcePath
            SourceFolder = $SourceFolder
            ApPoolUsername = $ApPoolUsername
            AdminGroupMembers = $AdminGroupMembers
            SqlServer = $SqlServer
            SqlInstance = $SqlInstance
            SqlDatabase = $SqlDatabase
            SiteName = $SiteName
            InstallFolder = $InstallFolder
            RunbookWorkerServers = $RunbookWorkerServers
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
        $SourceFolder = "\SystemCenter2012R2\Orchestrator",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [parameter(Mandatory = $true)]
        [System.Boolean]
        $FirstWebServiceServer,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $ApPool,

        [System.String]
        $AdminGroupMembers,

        [parameter(Mandatory = $true)]
        [System.String]
        $SqlServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $SqlInstance,

        [System.String]
        $SqlDatabase = "SMA",

        [System.String]
        $SiteName = "SMA",

        [System.UInt16]
        $WebServicePort = 9090,

        [System.String]
        $InstallFolder,

        [System.String]
        $UseSSL = "Yes",

        [System.String]
        $SpecifyCertificate = "No",

        [System.String]
        $CertificateName = ($env:COMPUTERNAME + "." + (Get-WmiObject -Class Win32_ComputerSystem).Domain),

        [System.String]
        $ETWManifest = "Yes",

        [System.String]
        $SendCEIPReports = "No",

        [System.String]
        $MSUpdate = "No",

        [System.String]
        $ProductKey,

        [System.String[]]
        $RunbookWorkerServers
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1
        
    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\SMA\WorkerSetup.exe"
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion

    switch($Version)
    {
        "7.2.1563.0"
        {
            $IdentifyingNumber = "{4B76B636-AE9A-47D5-A246-E02909D97CF2}"
            $SCVersion = "System Center 2012 R2"
        }
        "7.2.5002.0"
        {
            $IdentifyingNumber = "{4B76B636-AE9A-47D5-A246-E02909D97CF2}"
            $SCVersion = "System Center Technical Preview"
        }
        Default
        {
            throw "Unknown version of Service Management Automation!"
        }
    }

    $Path = "msiexec.exe"
    $Path = ResolvePath $Path

    switch($Ensure)
    {
        "Present"
        {
            # Set defaults, if they couldn't be set in param due to null configdata input
            if($WebServicePort -eq 0)
            {
                $WebServicePort = 9090
            }
            foreach($ArgumentVar in ("UseSSL","SpecifyCertificate","ETWManifest","SendCEIPReports","MSUpdate"))
            {
                if((Get-Variable -Name $ArgumentVar).Value -ne "Yes")
                {
                    Set-Variable -Name $ArgumentVar -Value "No"
                }
            }
            if([String]::IsNullOrEmpty($AdminGroupMembers))
            {
                $AdminGroupMembers = $ApPool.UserName
            }
            else
            {
                $AdminGroupMembers = "$AdminGroupMembers,$($ApPool.UserName)"
            }

            $MSIPath = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\SMA\WebServiceInstaller.msi"
            $MSIPath = ResolvePath $MSIPath
            Write-Verbose "MSIPath: $MSIPath"

            # Create install arguments
            $Arguments = "/q /i $MSIPath"
            if(($PSVersionTable.PSVersion.Major -eq 5) -and ($SCVersion -eq "System Center 2012 R2"))
            {
                $MSTPath = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\SMA\WMF5WebService.mst"
                $MSTPath = ResolvePath $MSTPath
                Write-Verbose "MSTPath: $MSTPath"
                $Arguments += " TRANSFORMS=$MSTPath"
            }
            $Arguments += " ALLUSERS=2 DatabaseAuthentication=Windows UseSSL=Yes"
            $ArgumentVars = @(
                "AdminGroupMembers",
                "SqlServer",
                "SqlDatabase",
                "SiteName",
                "WebServicePort",
                "InstallFolder",
                "ETWManifest"
                "SendCEIPReports",
                "MSUpdate",
                "ProductKey"
            )
            if($SQLInstance -ne "MSSQLSERVER")
            {
                $ArgumentVars += @(
                    "SqlInstance"
                )
            }
            # If SpecifyCertificate = Yes, get serial number
            if($SpecifyCertificate -eq "Yes")
            {
                $Certificates = @(Get-ChildItem -Path "Cert:\LocalMachine\My" | Where-Object {($_.Subject -eq "CN=$CertificateName") -and ($_.Issuer -ne "CN=$CertificateName")} | Where-Object {$_.EnhancedKeyUsageList.ObjectId -eq "1.3.6.1.5.5.7.3.1"})
                if($Certificates.Count -eq 0)
                {
                    $Certificates = @(Get-ChildItem -Path "Cert:\LocalMachine\My" | Where-Object {$_.Subject -eq "CN=$CertificateName"} | Where-Object {$_.EnhancedKeyUsageList.ObjectId -eq "1.3.6.1.5.5.7.3.1"})
                }
                if($Certificates.Count -eq 0)
                {
                    $null = New-SelfSignedCertificate -DnsName $CertificateName -CertStoreLocation "Cert:\LocalMachine\My"
                    $Certificates = @(Get-ChildItem -Path "Cert:\LocalMachine\My" | Where-Object {$_.Subject -eq "CN=$CertificateName"} | Where-Object {$_.EnhancedKeyUsageList.ObjectId -eq "1.3.6.1.5.5.7.3.1"})
                }
                $CertificateSerialNumber = $Certificates[0].SerialNumber
                $ArgumentVars += @("CertificateSerialNumber")
            }
            if($FirstWebServiceServer)
            {
                $Arguments += " CreateDatabase=Yes"
            }
            else
            {
                $Arguments += " CreateDatabase=No"
            }
            foreach($ArgumentVar in $ArgumentVars)
            {
                if(!([String]::IsNullOrEmpty((Get-Variable -Name $ArgumentVar).Value)))
                {
                    $Arguments += " $ArgumentVar=`"" + [Environment]::ExpandEnvironmentVariables((Get-Variable -Name $ArgumentVar).Value) + "`""
                }
            }
            $AccountVars = @("ApPool")
            foreach($AccountVar in $AccountVars)
            {
                $Arguments += " $AccountVar`Account=`"" + (Get-Variable -Name $AccountVar).Value.UserName + "`""
                $Arguments += " $AccountVar`Password=`"" + (Get-Variable -Name $AccountVar).Value.GetNetworkCredential().Password + "`""
            }
            
            # Replace sensitive values for verbose output
            $Log = $Arguments
            $LogVars = @("ApPool")
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

    # Additional first Web Service Server "Present" actions
    if(($Ensure -eq "Present") -and $FirstWebServiceServer -and (Get-WmiObject -Class Win32_Product | Where-Object {$_.IdentifyingNumber -eq $IdentifyingNumber}))
    {
        if(!(Get-Module -Name Microsoft.SystemCenter.ServiceManagementAutomation))
        {
            Import-Module -Name Microsoft.SystemCenter.ServiceManagementAutomation
            $Workers = @()
            foreach($RunbookWorkerServer in $RunbookWorkerServers)
            {
                $Workers += $RunbookWorkerServer.Split(".")[0]
            }
            New-SmaRunbookWorkerDeployment -WebServiceEndpoint https://localhost -ComputerName $Workers
        }
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
        $SourceFolder = "\SystemCenter2012R2\Orchestrator",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [parameter(Mandatory = $true)]
        [System.Boolean]
        $FirstWebServiceServer,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $ApPool,

        [System.String]
        $AdminGroupMembers,

        [parameter(Mandatory = $true)]
        [System.String]
        $SqlServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $SqlInstance,

        [System.String]
        $SqlDatabase = "SMA",

        [System.String]
        $SiteName = "SMA",

        [System.UInt16]
        $WebServicePort = 9090,

        [System.String]
        $InstallFolder,

        [System.String]
        $UseSSL = "Yes",

        [System.String]
        $SpecifyCertificate = "No",

        [System.String]
        $CertificateName = ($env:COMPUTERNAME + "." + (Get-WmiObject -Class Win32_ComputerSystem).Domain),

        [System.String]
        $ETWManifest = "Yes",

        [System.String]
        $SendCEIPReports = "No",

        [System.String]
        $MSUpdate = "No",

        [System.String]
        $ProductKey,

        [System.String[]]
        $RunbookWorkerServers
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)
    
    $result
}


Export-ModuleMember -Function *-TargetResource
