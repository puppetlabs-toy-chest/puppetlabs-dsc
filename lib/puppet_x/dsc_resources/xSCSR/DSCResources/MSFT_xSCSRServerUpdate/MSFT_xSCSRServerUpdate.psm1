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
        $SourceFolder = "\SystemCenter2012R2\Orchestrator\Service Reporting\Updates",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )
   
    $Version = (Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "System Center 2012 R2 Service Reporting MSI"}).Version
    
    switch($Version)
    {
        "7.2.462.0"
        {
            $ProductCode = "{643E2225-E1BB-4586-9CBE-8BC2DED6D12E}"
            $PatchID = "{1C2F9B0C-83D4-4820-8AD9-AEBCE05D6D13}"
            $Update = "Update Rollup 4"
        }
        "7.2.3002.0"
        {
            $returnValue = @{
                Ensure = "Present"
                SourcePath = $SourcePath
                SourceFolder = $SourceFolder
                Update = "None"
            }
        }
        $null
        {
            $returnValue = @{
                Ensure = "Absent"
                SourcePath = $SourcePath
                SourceFolder = $SourceFolder
            }
        }
        Default
        {
            throw "Unknown version of Service Reporting!"
        }
    }

    if($ProductCode -and $PatchID -and (Get-WmiObject -Class Win32_PatchPackage | Where-Object {($_.ProductCode -eq $ProductCode) -and ($_.PatchID -eq $PatchID)}))
    {
        $returnValue = @{
            Ensure = "Present"
            SourcePath = $SourcePath
            SourceFolder = $SourceFolder
            Update = $Update
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
        $SourceFolder = "\SystemCenter2012R2\Orchestrator\Service Reporting\Updates",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )

    $Version = (Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "System Center 2012 R2 Service Reporting MSI"}).Version
       
    switch($Version)
    {
        "7.2.462.0"
        {
            $UpdateFile = "kb2992025_Microsoft.SystemCenter.SMR.Setup_x64.msp"
        }
        "7.2.3002.0"
        {
            Write-Verbose "No update for this version of Service Reporting!"
        }
        $null
        {
            Write-Verbose "Service Reporting not installed!"
        }
        Default
        {
            throw "Unknown version of Service Reporting!"
        }
    }

    if($UpdateFile)
    {
        Import-Module $PSScriptRoot\..\..\xPDT.psm1
        $Path = "msiexec.exe"
        $Path = ResolvePath $Path
        Write-Verbose "Path: $Path"
    
        $MSPPath = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath $UpdateFile
        $MSPPath = ResolvePath $MSPPath
        $Arguments = "/update `"$MSPPath`" /norestart"
        Write-Verbose "Arguments: $Arguments"

        $Process = StartWin32Process -Path $Path -Arguments $Arguments -Credential $SetupCredential
        Write-Verbose $Process
        WaitForWin32ProcessEnd -Path $Path -Arguments $Arguments -Credential $SetupCredential
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
        $SourceFolder = "\SystemCenter2012R2\Orchestrator\Service Reporting\Updates",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)
    
    $result
}


Export-ModuleMember -Function *-TargetResource
