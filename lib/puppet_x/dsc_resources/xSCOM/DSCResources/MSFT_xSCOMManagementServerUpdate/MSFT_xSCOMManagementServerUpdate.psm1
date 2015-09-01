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
        $SourceFolder = "\SystemCenter2012R2\OperationsManager.en\Updates",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )
   
    $Version = (Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "System Center Operations Manager 2012 Server"}).Version
    
    switch($Version)
    {
        "7.1.10226.0"
        {
            $ProductCode = "{C92727BE-BD12-4140-96A6-276BA4F60AC1}"
            $PatchID = "{F6930A3E-016D-4F88-9186-440090A836DF}"
            $Update = "Update Rollup 4"
        }
        "7.2.10015.0"
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
            throw "Unknown version of Operations Manager!"
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
        $SourceFolder = "\SystemCenter2012R2\OperationsManager.en\Updates",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )

    $Version = (Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "System Center Operations Manager 2012 Server"}).Version
       
    switch($Version)
    {
        "7.1.10226.0"
        {
            $UpdateFile = "KB2992020-AMD64-Server.msp"
        }
        "7.2.10015.0"
        {
            Write-Verbose "No update for this version of Operations Manager!"
        }
        $null
        {
            Write-Verbose "Operations Manager Management Server not installed!"
        }
        Default
        {
            throw "Unknown version of Operations Manager!"
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
        $SourceFolder = "\SystemCenter2012R2\OperationsManager.en\Updates",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)
    
    $result
}


Export-ModuleMember -Function *-TargetResource
