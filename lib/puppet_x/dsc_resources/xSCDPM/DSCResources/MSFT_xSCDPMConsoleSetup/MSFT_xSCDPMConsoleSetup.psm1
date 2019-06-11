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
        $SetupCredential
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
            $IdentifyingNumber = "{DFF93860-2113-4207-A7AC-3901ABCE8002}"
        }
        "4.3.1012.0"
        {
            $IdentifyingNumber = "{846183DF-CF1D-4310-BA7A-EF5EFE46616A}"
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
        $SetupCredential
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
            $IdentifyingNumber = "{DFF93860-2113-4207-A7AC-3901ABCE8002}"
        }
        "4.3.1012.0"
        {
            $IdentifyingNumber = "{846183DF-CF1D-4310-BA7A-EF5EFE46616A}"
        }
        Default
        {
            throw "Unknown version of Data Protection Manager!"
        }
    }
    
    $Path = ResolvePath "msiexec.exe"
    switch($Ensure)
    {
        "Present"
        {
            $MSIPath = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\SCDPM\DPM2012\dpmcli\dpmui.msi"
            $Arguments = "/q /i $MSIPath ALLUSERS=2 BOOTSTRAPPED=1"
        }
        "Absent"
        {
            $Arguments = ""
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
        $SourceFolder = "\SystemCenter2012R2\DataProtectionManager",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)

    $result
}


Export-ModuleMember -Function *-TargetResource
