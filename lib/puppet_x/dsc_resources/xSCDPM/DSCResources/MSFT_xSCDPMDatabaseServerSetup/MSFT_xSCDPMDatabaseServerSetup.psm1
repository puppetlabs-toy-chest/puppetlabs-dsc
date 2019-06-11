function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = "\SystemCenter2012R2\DataProtectionManager",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1
        
    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "SCDPM\SQLPrepInstaller\SQLPrepInstaller_x64.exe"
    if(!(Test-Path -Path $Path))
    {
        $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "SQLPrepInstaller\SQLPrepInstaller_x64.exe"
    }
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.FileVersion

    switch($Version)
    {
        "4.2.1205.0"
        {
            $IdentifyingNumber = "{1CAEC48E-A90B-4AA2-BB81-ACAA3795430D}"
        }
        "4.3.1012.0"
        {
            $IdentifyingNumber = "{47FC5EEB-8197-4D77-8131-3FBA29508825}"
        }
        Default
        {
            throw "Unknown version of Data Protection Manager!"
        }
    }

    if(Get-WmiObject -Class Win32_Product | Where-Object {$_.IdentifyingNumber -eq $IdentifyingNumber})
    {
        $returnValue = @{
            Ensure = "Present"
            SourcePath = $SourcePath
            SourceFolder = $SourceFolder
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
        $SetupCredential
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1

    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "SCDPM\SQLPrepInstaller\SQLPrepInstaller_x64.exe"
    if(!(Test-Path -Path $Path))
    {
        $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "SQLPrepInstaller\SQLPrepInstaller_x64.exe"
    }
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.FileVersion

    switch($Version)
    {
        "4.2.1205.0"
        {
            $IdentifyingNumber = "{1CAEC48E-A90B-4AA2-BB81-ACAA3795430D}"
        }
        "4.3.1012.0"
        {
            $IdentifyingNumber = "{47FC5EEB-8197-4D77-8131-3FBA29508825}"
        }
        Default
        {
            throw "Unknown version of Data Protection Manager!"
        }
    }

    switch($Ensure)
    {
        "Present"
        {
            $Arguments = "/q"
        }
        "Absent"
        {
            $Path = "msiexec.exe"
            $Path = ResolvePath $Path

            $Arguments = "/qn /x $IdentifyingNumber"
        }
    }

    Write-Verbose "Path: $Path"
    Write-Verbose "Arguments: $Arguments"

    $Process = StartWin32Process -Path $Path -Arguments $Arguments -Credential $SetupCredential
    Write-Verbose $Process
    WaitForWin32ProcessEnd -Path $Path -Arguments $Arguments -Credential $SetupCredential

    if(Test-Path -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\PendingFileRenameOperations')
    {
        $global:DSCMachineStatus = 1
    }
    else
    {
        if(!(Test-TargetResource -SourcePath $SourcePath -SourceFolder $SourceFolder -SetupCredential $SetupCredential))
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
        $SetupCredential
    )


    $result = ((Get-TargetResource -SourcePath $SourcePath -SourceFolder $SourceFolder -SetupCredential $SetupCredential).Ensure -eq $Ensure)
    
    $result
}


Export-ModuleMember -Function *-TargetResource
