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
        $InstallPath,

        [parameter(Mandatory = $true)]
        [System.String]
        $ManagementServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $SRSInstance,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $DataReader,

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
            $IdentifyingNumber = "{D6E655E7-6318-4C50-B184-55E70DB179C1}"
            $InstallRegVersion = "12"
            $RegVersion = "3.0"
        }
        "7.2.10015.0"
        {
            $IdentifyingNumber = "{49AD38CD-4502-4CE5-83DE-73A76B28F14B}"
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
        $ManagementServer = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Operations Manager\$RegVersion\Reporting" -Name "DefaultSDKServiceMachine").DefaultSDKServiceMachine
        $SRSInstance = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Operations Manager\$RegVersion\Reporting" -Name "SRSInstance").SRSInstance
        $InstanceName = $SRSInstance.Split("\")[1]
        if(($InstanceName -eq "MSSQLSERVER") -or ($InstanceName -eq $null))
        {
            $RSServiceName = "ReportServer"
        }
        else
        {
            $RSServiceName = "ReportServer`$$InstanceName"
        }
        $DataReaderUsername = (Get-WmiObject -Class Win32_Service | Where-Object {$_.Name -eq $RSServiceName}).StartName

        $returnValue = @{
            Ensure = "Present"
            SourcePath = $SourcePath
            SourceFolder = $SourceFolder
            InstallPath = $InstallPath
            ManagementServer = $ManagementServer
            SRSInstance = $SRSInstance
            DataReaderUsername = $DataReaderUsername
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
        $InstallPath,

        [parameter(Mandatory = $true)]
        [System.String]
        $ManagementServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $SRSInstance,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $DataReader,

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
            $IdentifyingNumber = "{D6E655E7-6318-4C50-B184-55E70DB179C1}"
            $MSIdentifyingNumber = "{C92727BE-BD12-4140-96A6-276BA4F60AC1}"
        }
        "7.2.10015.0"
        {
            $IdentifyingNumber = "{49AD38CD-4502-4CE5-83DE-73A76B28F14B}"
            $MSIdentifyingNumber = "{43C498CB-D391-4B07-9C03-85C4E8239102}"
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
            $SRSInstance = $SRSInstance.Replace("\MSSQLSERVER","")

            # Create install arguments
            $Arguments = "/silent /install /AcceptEndUserLicenseAgreement:1 /components:OMReporting"
            $ArgumentVars = @(
                "InstallPath",
                "UseMicrosoftUpdate",
                "SendCEIPReports",
                "EnableErrorReporting",
                "SendODRReports"
            )
            if(!(Get-WmiObject -Class Win32_Product | Where-Object {$_.IdentifyingNumber -eq $MSIdentifyingNumber}))
            {
                $ArgumentVars += @("ManagementServer")
            }
            $ArgumentVars += @("SRSInstance")
            $Arguments += " /DataReaderUser:" + $DataReader.UserName
            $Arguments += " /DataReaderPassword:" + $DataReader.GetNetworkCredential().Password
            foreach($ArgumentVar in $ArgumentVars)
            {
                if(!([String]::IsNullOrEmpty((Get-Variable -Name $ArgumentVar).Value)))
                {
                    $Arguments += " /$ArgumentVar`:" + [Environment]::ExpandEnvironmentVariables((Get-Variable -Name $ArgumentVar).Value)
                }
            }

            # Replace sensitive values for verbose output
            $Log = $Arguments
            $LogVars = @("DataReader")
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
            $Arguments = "/silent /uninstall /components:OMReporting"
            $Log = $Arguments
        }
    }

    Write-Verbose "Path: $Path"
    Write-Verbose "Arguments: $Log"
    
    $Process = StartWin32Process -Path $Path -Arguments $Arguments -Credential $SetupCredential -AsTask
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
        $InstallPath,

        [parameter(Mandatory = $true)]
        [System.String]
        $ManagementServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $SRSInstance,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $DataReader,

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
