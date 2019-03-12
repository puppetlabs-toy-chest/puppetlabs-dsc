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
        $SetupCredential
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1

    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\SetupOrchestrator.exe"
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion
    Write-Verbose -Message "Checking for version: $Version"
    switch($Version)
    {
        "7.2.84.0"
        {
            # System Center 2012 R2
            $IdentifyingNumber = "{EF2760C1-FED5-45FD-B067-D9419F7DEBEF}"
        }
        "7.3.149.0"
        {
            # System Center Orcehestrator 2016 RTM
            $IdentifyingNumber = "{EF2760C1-FED5-45FD-B067-D9419F7DEBEF}"
        }
        Default
        {
            throw "Unknown version of Service Management Automation!"
        }
    }

    if(Get-WmiObject -Class Win32_Product -filter "IdentifyingNumber ='$IdentifyingNumber'")
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
        $SetupCredential
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1

    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\SetupOrchestrator.exe"
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion
    Write-Verbose -Message "Checking for version: $Version"
    switch($Version)
    {
        "7.2.84.0"
        {
            # System Center 2012 R2
            $IdentifyingNumber = "{EF2760C1-FED5-45FD-B067-D9419F7DEBEF}"
        }
        "7.3.149.0"
        {
            # System Center Orcehestrator 2016 RTM
            $IdentifyingNumber = "{EF2760C1-FED5-45FD-B067-D9419F7DEBEF}"
        }
        Default
        {
            throw "Unknown version of Service Management Automation!"
        }
    }

    $Path = "msiexec.exe"
    $Path = ResolvePath $Path
    Write-Verbose "Path: $Path"

    switch($Ensure)
    {
        "Present"
        {
            $MSIPath = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "\SMA\PowerShellModuleInstaller.msi"
            $MSIPath = ResolvePath $MSIPath
            Write-Verbose "MSIPath: $MSIPath"
            $Arguments = "/q /i $MSIPath ALLUSERS=2"
        }
        "Absent"
        {
            $Arguments = "/q /x $IdentifyingNumber"
        }
    }

    Write-Verbose "Arguments: $Arguments"

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
        $SourceFolder = "\SystemCenter2012R2\Orchestrator",

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)

    $result
}

Export-ModuleMember -Function *-TargetResource
