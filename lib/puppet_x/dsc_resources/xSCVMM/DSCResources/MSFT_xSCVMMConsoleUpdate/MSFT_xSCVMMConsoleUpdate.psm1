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
        $SourceFolder = "\SystemCenter2012R2\VirtualMachineManager\Updates",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )
   
    $Version = (Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Microsoft System Center Virtual Machine Manager Administrator Console (x64)"}).Version
    
    switch($Version)
    {
        "3.2.7510.0"
        {
            $ProductCode = "{CDFB453F-5FA4-4884-B282-F46BDFC06051}"
            $PatchID = "{E424A006-23B8-4403-A413-9EEBFB422FB2}"
            $Update = "Update Rollup 4"
        }
        "3.2.9013.0"
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
            throw "Unknown version of Virtual Machine Manager!"
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
        $SourceFolder = "\SystemCenter2012R2\VirtualMachineManager\Updates",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )

    $Version = (Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Microsoft System Center Virtual Machine Manager Administrator Console (x64)"}).Version
       
    switch($Version)
    {
        "3.2.7510.0"
        {
            $UpdateFile = "kb2992023_AdminConsole_amd64.msp"
        }
        "3.2.9013.0"
        {
            Write-Verbose "No update for this version of Virtual Machine Manager!"
        }
        $null
        {
            Write-Verbose "Virtual Machine Manager Console not installed!"
        }
        Default
        {
            throw "Unknown version of Virtual Machine Manager!"
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
        $Arguments = "/update $MSPPath /norestart"
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
        $SourceFolder = "\SystemCenter2012R2\VirtualMachineManager\Updates",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)
    
    $result
}


Export-ModuleMember -Function *-TargetResource
