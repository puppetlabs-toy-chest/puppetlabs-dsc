function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Admin API","Tenant API","Tenant Public API","SQL Server Extension","MySQL Extension","Admin Site","Admin Authentication Site","Tenant Site","Tenant Authentication Site")]
        [System.String]
        $Role,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = "\WindowsAzurePack2013\Updates",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )

    $returnValue = @{
        Role = $Role
        SourcePath = $SourcePath
        SourceFolder = $SourceFolder
    }

    $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Admin API","Tenant API","Tenant Public API","SQL Server Extension","MySQL Extension","Admin Site","Admin Authentication Site","Tenant Site","Tenant Authentication Site")]
        [System.String]
        $Role,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = "\WindowsAzurePack2013\Updates",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1
        
    $Path = "msiexec.exe"
    $Path = ResolvePath $Path
    Write-Verbose "Path: $Path"

    $TempPath = [IO.Path]::GetTempPath().TrimEnd("\")
    $Products = (Get-WmiObject -Class Win32_Product).IdentifyingNumber
    $Components = GetWAPComponents -Role $Role
    foreach($Component in $Components)
    {
        $ComponentInstalled = $true
        if($ComponentInstalled)
        {
            $IdentifyingNumbers = GetWAPComponentIdentifyingNumbers -Component $Component
            $ComponentInstalled = GetComponentInstalled -Products $Products -IdentifyingNumbers $IdentifyingNumbers
            if(!$ComponentInstalled)
            {
                $MSIPath = ResolvePath "$SourcePath\$SourceFolder\$Component.msi"
                Copy-Item -Path $MSIPath -Destination $TempPath
                $Arguments = "/q /lv $TempPath\$Component.log /i $TempPath\$Component.msi ALLUSERS=2"
                Write-Verbose "Arguments: $Arguments"
                $Process = StartWin32Process -Path $Path -Arguments $Arguments -Credential $SetupCredential
                Write-Verbose $Process
                WaitForWin32ProcessEnd -Path $Path -Arguments $Arguments -Credential $SetupCredential
                Remove-Item -Path "$TempPath\$Component.msi"
                $ComponentInstalled = GetComponentInstalled -Products $Products -IdentifyingNumbers $IdentifyingNumbers
            }
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
        [ValidateSet("Admin API","Tenant API","Tenant Public API","SQL Server Extension","MySQL Extension","Admin Site","Admin Authentication Site","Tenant Site","Tenant Authentication Site")]
        [System.String]
        $Role,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = "\WindowsAzurePack2013\Updates",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )

    $result = $true
    $Products = (Get-WmiObject -Class Win32_Product).IdentifyingNumber
    $Components = GetWAPComponents -Role $Role
    foreach($Component in $Components)
    {
        if($result)
        {
            $IdentifyingNumbers = GetWAPComponentIdentifyingNumbers -Component $Component
            $ComponentInstalled = GetComponentInstalled -Products $Products -IdentifyingNumbers $IdentifyingNumbers
            if(!$ComponentInstalled)
            {
                $result = $false
            }
        }
    }

    $result
}


function GetWAPComponents
{
    param
    (
        [String]
        $Role
    )

    switch($Role)
    {
        "Admin API"
        {
            return @(
                "MgmtSvc-PowerShellAPI",
                "MgmtSvc-WebAppGallery",
                "MgmtSvc-Monitoring",
                "MgmtSvc-Usage",
                "MgmtSvc-AdminAPI",
                "MgmtSvc-ConfigSite"
            )
        }
        "Tenant API"
        {
            return @(
                "MgmtSvc-PowerShellAPI",
                "MgmtSvc-TenantAPI",
                "MgmtSvc-ConfigSite"
            )
        }
        "Tenant Public API"
        {
            return @(
                "MgmtSvc-PowerShellAPI",
                "MgmtSvc-TenantPublicAPI",
                "MgmtSvc-ConfigSite"
            )
        }
        "SQL Server Extension"
        {
            return @(
                "MgmtSvc-PowerShellAPI",
                "MgmtSvc-SQLServer",
                "MgmtSvc-ConfigSite"
            )
        }
        "MySQL Extension"
        {
            return @(
                "MgmtSvc-PowerShellAPI",
                "MgmtSvc-MySQL",
                "MgmtSvc-ConfigSite"
            )
        }
        "Admin Site"
        {
            return @(
                "MgmtSvc-PowerShellAPI",
                "MgmtSvc-AdminSite",
                "MgmtSvc-ConfigSite"
            )
        }
        "Admin Authentication Site"
        {
            return @(
                "MgmtSvc-PowerShellAPI",
                "MgmtSvc-WindowsAuthSite",
                "MgmtSvc-ConfigSite"
            )
        }
        "Tenant Site"
        {
            return @(
                "MgmtSvc-PowerShellAPI",
                "MgmtSvc-TenantSite",
                "MgmtSvc-ConfigSite"
            )
        }
        "Tenant Authentication Site"
        {
            return @(
                "MgmtSvc-PowerShellAPI",
                "MgmtSvc-AuthSite",
                "MgmtSvc-ConfigSite"
            )
        }
    }
}


function GetWAPComponentIdentifyingNumbers
{
    param
    (
        [String]
        $Component
    )

    switch($Component)
    {
        "MgmtSvc-PowerShellAPI"
        {
            return @(
                "{567EE4F8-35CA-4111-A2F9-9AFE911959B1}"

            )
        }
        "MgmtSvc-WebAppGallery"
        {
            return @(
                "{95BD63BE-88C5-4F43-9CC8-31A1903C3D75}"

            )
        }
        "MgmtSvc-Monitoring"
        {
            return @(
                "{BD31C44E-1E91-4C61-8955-CC4386EB31CB}"

            )
        }
        "MgmtSvc-Usage"
        {
            return @(
                "{D8AFA6F8-7CF5-4C6F-BE6E-5EBEB9A5EE3D}"

            )
        }
        "MgmtSvc-AdminAPI"
        {
            return @(
                "{7CA2FE56-D216-431D-AD9B-96F2EFA0060F}"

            )
        }
        "MgmtSvc-TenantAPI"
        {
            return @(
                "{5FB651B3-5247-450F-B459-903602EF90AB}"

            )
        }
        "MgmtSvc-TenantPublicAPI"
        {
            return @(
                "{90C2701B-6410-4C6D-B595-30D19DD8BD48}"

            )
        }
        "MgmtSvc-SQLServer"
        {
            return @(
                "{24AB07BB-750C-4CC4-959A-69D68F03B672}"

            )
        }
        "MgmtSvc-MySQL"
        {
            return @(
                "{6FF0D21B-C7CC-4881-9463-4CFFFA5143F9}"

            )
        }
        "MgmtSvc-AdminSite"
        {
            return @(
                "{713C3A58-010A-4DA4-8FA3-E1012C844F6C}"

            )
        }
        "MgmtSvc-WindowsAuthSite"
        {
            return @(
                "{C36C12EA-71F5-46EB-8BAB-F32C53161B2E}"

            )
        }
        "MgmtSvc-TenantSite"
        {
            return @(
                "{FC2F4900-7DEF-4314-B838-1A47B4DB09DD}"

            )
        }
        "MgmtSvc-AuthSite"
        {
            return @(
                "{9AD3BB15-3471-4A0F-A0CD-BB1408F598B8}"

            )
        }
        "MgmtSvc-ConfigSite"
        {
            return @(
                "{A3A5D3F7-C18E-4BE9-B792-9699B3B334DE}"

            )
        }
    }
}


function GetComponentInstalled
{
    param
    (
        [String[]]
        $Products,

        [String[]]
        $IdentifyingNumbers
    )

    $ComponentInstalled = $false
    foreach($IdentifyingNumber in $IdentifyingNumbers)
    {
        if(!$ComponentInstalled)
        {
            if($Products | Where-Object {$_ -eq $IdentifyingNumber})
            {
                $ComponentInstalled = $true
            }
        }
    }

    return $ComponentInstalled
}


Export-ModuleMember -Function *-TargetResource