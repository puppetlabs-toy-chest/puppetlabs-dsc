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
                "{16487D2C-F851-450D-AB52-1163D8057D9A}"

            )
        }
        "MgmtSvc-WebAppGallery"
        {
            return @(
                "{E33E0D2B-D289-4300-B431-CA51052E1507}"

            )
        }
        "MgmtSvc-Monitoring"
        {
            return @(
                "{EAB7C0A2-17C0-46DC-8DD5-3167FCCA3471}"

            )
        }
        "MgmtSvc-Usage"
        {
            return @(
                "{9DCEAFF9-7499-47D4-98E8-EF6877E7D5CF}"

            )
        }
        "MgmtSvc-AdminAPI"
        {
            return @(
                "{7A18CA60-6275-463A-A28F-15B3DECE9167}"

            )
        }
        "MgmtSvc-TenantAPI"
        {
            return @(
                "{57AAAF80-FED1-4574-B8A5-D67C3347B7F3}"

            )
        }
        "MgmtSvc-TenantPublicAPI"
        {
            return @(
                "{91EEF0F7-E4CA-4162-AF4F-D4D67CBFADAE}"

            )
        }
        "MgmtSvc-SQLServer"
        {
            return @(
                "{71C55DAA-0C85-4186-A1E9-5064C5CC686D}"

            )
        }
        "MgmtSvc-MySQL"
        {
            return @(
                "{ED962FFD-1998-4F03-9165-B0B0E27AF0C5}"

            )
        }
        "MgmtSvc-AdminSite"
        {
            return @(
                "{265EE8DB-FE0B-4532-AAD3-6787D6B4D91B}"

            )
        }
        "MgmtSvc-WindowsAuthSite"
        {
            return @(
                "{9381CC0F-A0B5-4DDE-8141-6E725B95919C}"

            )
        }
        "MgmtSvc-TenantSite"
        {
            return @(
                "{348B0395-AD2A-45A6-BFFA-BB502F59ABC0}"

            )
        }
        "MgmtSvc-AuthSite"
        {
            return @(
                "{6D4ABA37-50DB-4FA5-B833-D152370A4121}"

            )
        }
        "MgmtSvc-ConfigSite"
        {
            return @(
                "{72BA84F9-BAA5-4451-AFA5-89841CFDA170}"

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
