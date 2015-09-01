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
        $SourceFolder = "\SystemCenter2012R2\VirtualMachineManager",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.String]
        $ProgramFiles,

        [System.UInt16]
        $IndigoTcpPort = 8100,

        [System.Byte]
        $MUOptIn
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1
        
    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "setup.exe"
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion

    switch($Version)
    {
        "3.2.7510.0"
        {
            $IdentifyingNumber = "{CDFB453F-5FA4-4884-B282-F46BDFC06051}"
        }
        "3.2.9013.0"
        {
            $IdentifyingNumber = "{CDFB453F-5FA4-4884-B282-F46BDFC06051}"
        }
        Default
        {
            throw "Unknown version of Virtual Machine Manager!"
        }
    }

    if(Get-WmiObject -Class Win32_Product | Where-Object {$_.IdentifyingNumber -eq $IdentifyingNumber})
    {
        $IndigoTcpPort = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Microsoft System Center Virtual Machine Manager Administrator Console\Settings" -Name "IndigoTcpPort").IndigoTcpPort

        $returnValue = @{
            Ensure = "Present"
            SourcePath = $SourcePath
            SourceFolder = $SourceFolder
            IndigoTcpPort = $IndigoTcpPort
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
        $SourceFolder = "\SystemCenter2012R2\VirtualMachineManager",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.String]
        $ProgramFiles,

        [System.UInt16]
        $IndigoTcpPort = 8100,

        [System.Byte]
        $MUOptIn
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1
        
    $Path = Join-Path -Path (Join-Path -Path $SourcePath -ChildPath $SourceFolder) -ChildPath "setup.exe"
    $Path = ResolvePath $Path
    $Version = (Get-Item -Path $Path).VersionInfo.ProductVersion
    Write-Verbose "Path: $Path"

    switch($Version)
    {
        "3.2.7510.0"
        {
            $IdentifyingNumber = "{CDFB453F-5FA4-4884-B282-F46BDFC06051}"
            $MSIdentifyingNumber = "{59518B15-FC64-4CF9-A4D1-0EE1B4A63088}"
        }
        "3.2.9013.0"
        {
            $IdentifyingNumber = "{CDFB453F-5FA4-4884-B282-F46BDFC06051}"
            $MSIdentifyingNumber = "{59518B15-FC64-4CF9-A4D1-0EE1B4A63088}"
        }
        Default
        {
            throw "Unknown version of Virtual Machine Manager!"
        }
    }

    $TempFile = [IO.Path]::GetTempFileName()

    switch($Ensure)
    {
        "Present"
        {
            # Set defaults, if they couldn't be set in param due to null configdata input
            if ($IndigoTcpPort -eq 0)
            {
                $IndigoTcpPort = 8100
            }
            if ($MUOptIn -ne 1)
            {
                $MUOptIn = 0
            }

            # Create INI file
            $INIFile = @()
            $INIFile += "[Options]"

            $INIFileVars = @(
                "ProgramFiles",
                "IndigoTcpPort",
                "MUOptIn"
            )

            foreach($INIFileVar in $INIFileVars)
            {
                if(!([String]::IsNullOrEmpty((Get-Variable -Name $INIFileVar).Value)))
                {
                    $INIFile += "$INIFileVar=" + [Environment]::ExpandEnvironmentVariables((Get-Variable -Name $INIFileVar).Value)
                }
            }

            Write-Verbose "INIFile: $TempFile"
            foreach($Line in $INIFile)
            {
                Add-Content -Path $TempFile -Value $Line -Encoding Ascii
                Write-Verbose $Line
            }

            # Create install arguments
            $Arguments = "/i /IAcceptSCEULA /client /f $TempFile"
            $Arguments = "/i /IAcceptSCEULA /client /f $TempFile"
        }
        "Absent"
        {
            # Do not remove console from management server
            if(!(Get-WmiObject -Class Win32_Product | Where-Object {$_.IdentifyingNumber -eq $MSIdentifyingNumber}))
            {
                # Create install arguments
                $Arguments = "/x /client"
            }
            else
            {
                throw "VMM Console should not be removed from a VMM Management Server!"
            }
        }
    }

    Write-Verbose "Arguments: $Arguments"
    
    $Process = StartWin32Process -Path $Path -Arguments $Arguments -Credential $SetupCredential -AsTask
    Write-Verbose $Process
    WaitForWin32ProcessEnd -Path $Path -Arguments $Arguments -Credential $SetupCredential

    # Clean up
    if(Test-Path -Path $TempFile)
    {
        Remove-Item -Path $TempFile
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
        $SourceFolder = "\SystemCenter2012R2\VirtualMachineManager",

        [System.String]
        $ProgramFiles,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.UInt16]
        $IndigoTcpPort = 8100,

        [System.Byte]
        $MUOptIn
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)
    
    $result
}


Export-ModuleMember -Function *-TargetResource
