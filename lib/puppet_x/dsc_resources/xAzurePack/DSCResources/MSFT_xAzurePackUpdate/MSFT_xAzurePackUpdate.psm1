function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet('Admin API','Tenant API','Tenant Public API','SQL Server Extension','MySQL Extension','Admin Site','Admin Authentication Site','Tenant Site','Tenant Authentication Site')]
        [System.String]
        $Role,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = '\WindowsAzurePack2013\Updates',

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
        [ValidateSet('Admin API','Tenant API','Tenant Public API','SQL Server Extension','MySQL Extension','Admin Site','Admin Authentication Site','Tenant Site','Tenant Authentication Site')]
        [System.String]
        $Role,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = '\WindowsAzurePack2013\Updates',

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential
    )

    Import-Module $PSScriptRoot\..\..\xPDT.psm1
        
    $Path = 'msiexec.exe'
    $Path = ResolvePath $Path
    Write-Verbose "Path: $Path"

    $TempPath = [IO.Path]::GetTempPath().TrimEnd('\')
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
            throw 'Set-TargetResouce failed'
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
        [ValidateSet('Admin API','Tenant API','Tenant Public API','SQL Server Extension','MySQL Extension','Admin Site','Admin Authentication Site','Tenant Site','Tenant Authentication Site')]
        [System.String]
        $Role,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = '\WindowsAzurePack2013\Updates',

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
        'Admin API'
        {
            return @(
                'MgmtSvc-PowerShellAPI',
                'MgmtSvc-WebAppGallery',
                'MgmtSvc-Monitoring',
                'MgmtSvc-Usage',
                'MgmtSvc-AdminAPI',
                'MgmtSvc-ConfigSite'
            )
        }
        'Tenant API'
        {
            return @(
                'MgmtSvc-PowerShellAPI',
                'MgmtSvc-TenantAPI',
                'MgmtSvc-ConfigSite'
            )
        }
        'Tenant Public API'
        {
            return @(
                'MgmtSvc-PowerShellAPI',
                'MgmtSvc-TenantPublicAPI',
                'MgmtSvc-ConfigSite'
            )
        }
        'SQL Server Extension'
        {
            return @(
                'MgmtSvc-PowerShellAPI',
                'MgmtSvc-SQLServer',
                'MgmtSvc-ConfigSite'
            )
        }
        'MySQL Extension'
        {
            return @(
                'MgmtSvc-PowerShellAPI',
                'MgmtSvc-MySQL',
                'MgmtSvc-ConfigSite'
            )
        }
        'Admin Site'
        {
            return @(
                'MgmtSvc-PowerShellAPI',
                'MgmtSvc-AdminSite',
                'MgmtSvc-ConfigSite'
            )
        }
        'Admin Authentication Site'
        {
            return @(
                'MgmtSvc-PowerShellAPI',
                'MgmtSvc-WindowsAuthSite',
                'MgmtSvc-ConfigSite'
            )
        }
        'Tenant Site'
        {
            return @(
                'MgmtSvc-PowerShellAPI',
                'MgmtSvc-TenantSite',
                'MgmtSvc-ConfigSite'
            )
        }
        'Tenant Authentication Site'
        {
            return @(
                'MgmtSvc-PowerShellAPI',
                'MgmtSvc-AuthSite',
                'MgmtSvc-ConfigSite'
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
        'MgmtSvc-PowerShellAPI'
        {
            return @(
                '{F525AB73-3F65-4AF7-AE32-C6E732B9A7E0}'

            )
        }
        'MgmtSvc-WebAppGallery'
        {
            return @(
                '{9C9D2734-902A-4F41-8C56-AC21E216745F}'

            )
        }
        'MgmtSvc-Monitoring'
        {
            return @(
                '{649E3CE3-4F85-4F49-B850-1A4B00BDF944}'

            )
        }
        'MgmtSvc-Usage'
        {
            return @(
                '{946B0B96-13AF-404E-98F0-D38BF3828E8E}'

            )
        }
        'MgmtSvc-AdminAPI'
        {
            return @(
                '{DAB5A87F-32D0-4E96-B7FD-47DBDC6EAEED}'

            )
        }
        'MgmtSvc-TenantAPI'
        {
            return @(
                '{CF41308C-9BC3-46C1-8B39-135D00E491E8}'

            )
        }
        'MgmtSvc-TenantPublicAPI'
        {
            return @(
                '{7442368E-A20A-4B4A-9304-104B7191CD82}'

            )
        }
        'MgmtSvc-SQLServer'
        {
            return @(
                '{FFE3B7AD-BED4-4F9C-98CC-D75E64B770EE}'

            )
        }
        'MgmtSvc-MySQL'
        {
            return @(
                '{038DEB00-87C2-483D-B303-3732A6CE6280}'

            )
        }
        'MgmtSvc-AdminSite'
        {
            return @(
                '{8DFE1C24-EF33-4DE8-A8F2-192C7E1FECE0}'

            )
        }
        'MgmtSvc-WindowsAuthSite'
        {
            return @(
                '{42A86301-91AA-4CF2-95AB-C305052ECEFD}'

            )
        }
        'MgmtSvc-TenantSite'
        {
            return @(
                '{78E38778-C952-4B53-96D8-A65DB9683269}'

            )
        }
        'MgmtSvc-AuthSite'
        {
            return @(
                '{B2D82054-D973-4447-BDDF-AE7D11E86585}'

            )
        }
        'MgmtSvc-ConfigSite'
        {
            return @(
                '{53DA6693-27E7-438C-A4C1-BE2FCA1811DC}'

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