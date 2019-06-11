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
        $SourceFolder = "\SystemCenter2012R2\DataProtectionManager",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.String]
        $UserName,

        [System.String]
        $CompanyName,

        [System.String]
        $ProductKey,

        [System.String]
        $ProgramFiles,

        [parameter(Mandatory = $true)]
        [System.String]
        $YukonMachineName,

        [parameter(Mandatory = $true)]
        [System.String]
        $YukonInstanceName,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $YukonMachineCredential,

        [parameter(Mandatory = $true)]
        [System.String]
        $ReportingMachineName,

        [parameter(Mandatory = $true)]
        [System.String]
        $ReportingInstanceName,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $ReportingMachineCredential
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1
        
    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "SCDPM\setup.exe"
    if(!(Test-Path -Path $Path))
    {
        $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "setup.exe"
    }
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion

    switch($Version)
    {
        "4.2.1205.0"
        {
            $IdentifyingNumber = "{99EFD904-A89C-4116-91C9-80FD7FD40DA7}"
        }
        "4.3.1012.0"
        {
            $IdentifyingNumber = "{F8CD20E6-186D-4F7D-AAAB-5A3190DA8356}"
        }
        Default
        {
            throw "Unknown version of Data Protection Manager!"
        }
    }

    if(Get-WmiObject -Class Win32_Product | Where-Object {$_.IdentifyingNumber -eq $IdentifyingNumber})
    {
        $UserName = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Data Protection Manager\Setup" -Name "RegisteredUserName").RegisteredUserName
        $CompanyName = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Data Protection Manager\Setup" -Name "RegisteredOrgName").RegisteredOrgName
        $ProgramFiles = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Data Protection Manager\Setup" -Name "InstallPath").InstallPath
        $YukonMachineName = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Data Protection Manager\DB" -Name "SqlServer").SqlServer
        $YukonInstanceName = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Data Protection Manager\DB" -Name "InstanceName").InstanceName
        $ReportingMachineName = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Data Protection Manager\DB" -Name "ReportingServer").ReportingServer
        $ReportingInstanceName = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft Data Protection Manager\DB" -Name "ReportingInstanceName").ReportingInstanceName

        $returnValue = @{
            Ensure = "Present"
            SourcePath = $SourcePath
            SourceFolder = $SourceFolder
            UserName = $UserName
            CompanyName = $CompanyName
            ProgramFiles = $ProgramFiles
            YukonMachineName = $YukonMachineName
            YukonInstanceName = $YukonInstanceName
            ReportingMachineName = $ReportingMachineName
            ReportingInstanceName = $ReportingInstanceName
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
        $SourceFolder = "\SystemCenter2012R2\DataProtectionManager",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.String]
        $UserName = "UserName",

        [System.String]
        $CompanyName = "CompanyName",

        [System.String]
        $ProductKey,

        [System.String]
        $ProgramFiles,

        [parameter(Mandatory = $true)]
        [System.String]
        $YukonMachineName,

        [parameter(Mandatory = $true)]
        [System.String]
        $YukonInstanceName,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $YukonMachineCredential,

        [parameter(Mandatory = $true)]
        [System.String]
        $ReportingMachineName,

        [parameter(Mandatory = $true)]
        [System.String]
        $ReportingInstanceName,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $ReportingMachineCredential
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1

    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "SCDPM\setup.exe"
    if(!(Test-Path -Path $Path))
    {
        $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "setup.exe"
    }
    $Path = ResolvePath $Path

    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion

    switch($Version)
    {
        "4.2.1205.0"
        {
            $IdentifyingNumber = "{99EFD904-A89C-4116-91C9-80FD7FD40DA7}"
        }
        "4.3.1012.0"
        {
            $IdentifyingNumber = "{F8CD20E6-186D-4F7D-AAAB-5A3190DA8356}"
        }
        Default
        {
            throw "Unknown version of Data Protection Manager!"
        }
    }
    
    if ($PSBoundParameters.ContainsKey("ProgramFiles") -and (!($ProgramFiles -contains "%ProgramFiles%")))
    {
        $ProgramFiles = $ProgramFiles.Replace("\Microsoft System Center 2012 R2\DPM","")
    }
    else
    {
        $ProgramFiles = [Environment]::ExpandEnvironmentVariables($ProgramFiles)
    }
    if($PSBoundParameters.ContainsKey("ProductKey"))
    {
        $autorun = Get-Content (Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "autorun.inf")
        if ($autorun -contains "sku=evaluation")
        {
            Throw "ProductKey cannot be used with evaluation media!"
        }
    }
    $TempFile = [IO.Path]::GetTempFileName()
    $INIFile = @()
    $INIFile += "[Options]"
    $INIFileVars = @(
        "UserName",
        "CompanyName",
        "ProductKey",
        "ProgramFiles",
        "YukonInstanceName",
        "ReportingInstanceName"
    )
    foreach($INIFileVar in $INIFileVars)
    {
        if((Get-Variable -Name $INIFileVar).Value -ne "")
        {
            $INIFile += "$INIFileVar=" + (Get-Variable -Name $INIFileVar).Value
        }
    }
    $INIFileVars = @(
        "YukonMachineName",
        "ReportingMachineName"
    )
    foreach($INIFileVar in $INIFileVars)
    {
        if((Get-Variable -Name $INIFileVar).Value -ne "")
        {
            $INIFile += "$INIFileVar=" + (Get-Variable -Name $INIFileVar).Value.Split(".")[0]
        }
    }
    $AccountVars = @("YukonMachineCredential","ReportingMachineCredential")
    foreach($AccountVar in $AccountVars)
    {
        $INIFile += $AccountVar.Replace("Credential","UserName") + "=" + (Get-Variable -Name $AccountVar).Value.GetNetworkCredential().UserName
        $INIFile += $AccountVar.Replace("Credential","Password") + "=" + (Get-Variable -Name $AccountVar).Value.GetNetworkCredential().Password
        $INIFile += $AccountVar.Replace("Credential","DomainName") + "=" + (Get-Variable -Name $AccountVar).Value.GetNetworkCredential().Domain
    }
    Write-Verbose "INIFile: $TempFile"
    foreach($Line in $INIFile)
    {
        Add-Content -Path $TempFile -Value $Line -Encoding Ascii
        # Replace sensitive values for verbose output
        $LogLine = $Line
        if($ProductKey -ne "")
        {
            $LogLine = $LogLine.Replace($ProductKey,"*****-*****-*****-*****-*****")
        }
        $LogVars = @("YukonMachineCredential","ReportingMachineCredential")
        foreach($LogVar in $LogVars)
        {
            if((Get-Variable -Name $LogVar).Value -ne "")
            {
                $LogLine = $LogLine.Replace((Get-Variable -Name $LogVar).Value.GetNetworkCredential().Password,"********")
            }
        }
        Write-Verbose $LogLine
    }

    switch($Ensure)
    {
        "Present"
        {
            $Arguments = " /i /f $TempFile /q"
        }
        "Absent"
        {
            $Arguments = " /x /f $TempFile /q"
        }
    }

    Write-Verbose "Path: $Path"
    Write-Verbose "Arguments: $Arguments"

    $Process = StartWin32Process -Path $Path -Arguments $Arguments -Credential $SetupCredential
    Write-Verbose $Process
    WaitForWin32ProcessEnd -Path $Path -Arguments $Arguments -Credential $SetupCredential

    Remove-Item $TempFile

    if(Test-Path -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\PendingFileRenameOperations')
    {
        $global:DSCMachineStatus = 1
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
        $SourceFolder = "\SystemCenter2012R2\DataProtectionManager",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.String]
        $UserName,

        [System.String]
        $CompanyName,

        [System.String]
        $ProductKey,

        [System.String]
        $ProgramFiles,

        [parameter(Mandatory = $true)]
        [System.String]
        $YukonMachineName,

        [parameter(Mandatory = $true)]
        [System.String]
        $YukonInstanceName,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $YukonMachineCredential,

        [parameter(Mandatory = $true)]
        [System.String]
        $ReportingMachineName,

        [parameter(Mandatory = $true)]
        [System.String]
        $ReportingInstanceName,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $ReportingMachineCredential
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)

    $result
}


Export-ModuleMember -Function *-TargetResource
