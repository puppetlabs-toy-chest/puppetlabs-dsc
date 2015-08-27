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
        [ValidateSet("Install","Initialize")]
        [System.String]
        $Action,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = "\WindowsAzurePack2013",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.Management.Automation.PSCredential]
        $Passphrase = $SetupCredential,

        [System.String]
        $SQLServer = "localhost",

        [System.String]
        $SQLInstance = "MSSQLSERVER",

        [System.Management.Automation.PSCredential]
        $dbUser,

        [System.String]
        $EnableCeip = "No"
    )

    $returnValue = @{
        Role = $Role
        Action = $Action
        SourcePath = $SourcePath
        SourceFolder = $SourceFolder
        SQLServer = $SQLServer
        SQLInstance = $SQLInstance
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
        [ValidateSet("Install","Initialize")]
        [System.String]
        $Action,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = "\WindowsAzurePack2013",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.Management.Automation.PSCredential]
        $Passphrase = $SetupCredential,

        [System.String]
        $SQLServer = "localhost",

        [System.String]
        $SQLInstance = "MSSQLSERVER",

        [System.Management.Automation.PSCredential]
        $dbUser,

        [System.String]
        $EnableCeip = "No"
    )

    switch($Action)
    {
        "Install"
        {
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
        }
        "Initialize"
        {
            if($EnableCeip -ne "Yes")
            {
                $EnableCeip = "No"
            }
            $Features = GetWAPFeatures -Role $Role
            $ConfigStorePassphrase = $Passphrase.GetNetworkCredential().Password
            foreach($Feature in $Features)
            {
                Write-Verbose "Feature: $Feature"
                Invoke-Command -ComputerName . -Credential $SetupCredential -Authentication Credssp {
                    $Feature = $args[0]
                    $ConfigStorePassphrase = $args[1]
                    $EnableCEIP = $args[2]
                    $SQLServer = $args[3]
                    $SQLInstance = $args[4]
                    if (!(Get-MgmtSvcFeature -Name $Feature).Configured)
                    {
                        if($SQLInstance -eq "MSSQLSERVER")
                        {
                            $Server = $SQLServer
                        }
                        else
                        {
                            $Server = "$SQLServer\$SQLInstance"
                        }
                        if ([string]::IsNullOrEmpty($dbUser))
                        {
                            Initialize-MgmtSvcFeature -Name $Feature -Passphrase "$ConfigStorePassphrase" -EnableCeip $EnableCeip -Server $Server
                        }
                        else
                        {
                            Initialize-MgmtSvcFeature -Name $Feature -Passphrase "$ConfigStorePassphrase" -EnableCeip $EnableCeip -Server $Server -UserName $dbUser.UserName -Password $dbUser.GetNetworkCredential().Password
                        }
                    }
                } -ArgumentList @($Feature,$ConfigStorePassphrase,$EnableCeip,$SQLServer,$SQLInstance)
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
        [ValidateSet("Install","Initialize")]
        [System.String]
        $Action,

        [parameter(Mandatory = $true)]
        [System.String]
        $SourcePath,

        [System.String]
        $SourceFolder = "\WindowsAzurePack2013",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SetupCredential,

        [System.Management.Automation.PSCredential]
        $Passphrase = $SetupCredential,

        [System.String]
        $SQLServer = "localhost",

        [System.String]
        $SQLInstance = "MSSQLSERVER",

        [System.Management.Automation.PSCredential]
        $dbUser,

        [System.String]
        $EnableCeip = "No"
    )

    switch($Action)
    {
        "Install"
        {
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
        }
        "Initialize"
        {
            $result = $true
            $Features = GetWAPFeatures -Role $Role
            foreach($Feature in $Features)
            {
                if($result)
                {
                    Write-Verbose "Feature: $Feature"
                    $result = Invoke-Command -ComputerName . -Credential $SetupCredential -Authentication Credssp {
                        $Feature = $args[0]
                        (Get-MgmtSvcFeature -Name $Feature).Configured
                    } -ArgumentList @($Feature)
                    Write-Verbose "Configured: $result"
                }
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
                "{09AAA3CE-A0B6-4B5D-AE51-43DF1C3EB192}",
                "{C5C97081-9A6A-4FCA-BA98-F01DE7B6BAEE}",
                "{43A453AF-BE0A-4C4B-9C6C-57FFE693AFCC}",
                "{48EF1B2C-1DA3-4887-8D3D-263C2047DE20}",
                "{16487D2C-F851-450D-AB52-1163D8057D9A}"

            )
        }
        "MgmtSvc-WebAppGallery"
        {
            return @(
                "{AC29E1CB-2F30-475E-ADD8-B039DDA7DFE4}",
                "{F78A7C67-DAD0-4219-9563-DA69021F3425}",
                "{D001C96D-B5D8-47F1-A57D-0993949E086D}",
                "{A72F27D3-C1DD-4BF3-B837-45B2457E9206}",
                "{E33E0D2B-D289-4300-B431-CA51052E1507}"

            )
        }
        "MgmtSvc-Monitoring"
        {
            return @(
                "{0A45C3A5-2265-4C0F-968D-EA0AE95B6D3D}",
                "{7AFA9F9B-B776-409B-A073-43A5F2005782}",
                "{48EA248F-E9FA-48CF-9B11-65F73631BE80}",
                "{08F8076E-46A3-4A26-93EC-7EE48FD693FF}",
                "{EAB7C0A2-17C0-46DC-8DD5-3167FCCA3471}"

            )
        }
        "MgmtSvc-Usage"
        {
            return @(
                "{6939C616-4589-4115-B0F9-A43164936EC4}",
                "{E214B687-AF1B-40FE-B1CF-702395ED138D}",
                "{49DAC463-8658-4163-8ED6-4C1AE2A7AE99}",
                "{09B94677-ED88-4633-AD07-DF16115E3E13}",
                "{9DCEAFF9-7499-47D4-98E8-EF6877E7D5CF}"

            )
        }
        "MgmtSvc-AdminAPI"
        {
            return @(
                "{D52908B7-6A78-4BC7-8451-490C7BF88395}",
                "{E82D6570-E501-4CF1-B1C7-ECB62AB90694}",
                "{5002046F-645B-4316-BC6A-86AB1DF1C3FB}",
                "{5C578A41-64DD-43DC-9772-8A2EDDCA8B3A}",
                "{7A18CA60-6275-463A-A28F-15B3DECE9167}"

            )
        }
        "MgmtSvc-TenantAPI"
        {
            return @(
                "{763C3BFE-6A60-4D5D-AF6C-F167A5CF47DF}",
                "{F1E998DF-0018-49E6-947F-AF7A00CE2404}",
                "{A3DD0B04-3A0D-4211-9CE4-ED71544D2ED6}",
                "{5F2419BD-ED3D-4645-AC00-9D85F428465F}",
                "{57AAAF80-FED1-4574-B8A5-D67C3347B7F3}"

            )
        }
        "MgmtSvc-TenantPublicAPI"
        {
            return @(
                "{4D0102B7-74CD-4563-B475-45C7EC09E18C}",
                "{9BD35794-7F08-4979-A741-91E681A42DC9}",
                "{5D0CA554-B0B3-4C30-894A-D08D8543FE90}",
                "{0A29836B-8F77-4A99-8D50-925D7DA3E04B}",
                "{91EEF0F7-E4CA-4162-AF4F-D4D67CBFADAE}"

            )
        }
        "MgmtSvc-SQLServer"
        {
            return @(
                "{F16B58A7-106E-4859-929C-519F45C2423F}",
                "{FF4E91C5-9B03-427A-89B0-2FB44567CA36}",
                "{84E267A7-461F-497B-B6D5-42A8DFADD3B4}",
                "{298A4DBF-9D1D-4DEF-95C6-34DD48EAD26F}",
                "{71C55DAA-0C85-4186-A1E9-5064C5CC686D}"

            )
        }
        "MgmtSvc-MySQL"
        {
            return @(
                "{A559BC28-C942-4A1F-AEE3-8D6143EBF635}",
                "{AF2FFFAE-987A-4026-9500-768FA17F16CA}",
                "{90F5754A-2836-46FA-9B36-7014337B26A1}",
                "{1206E655-0171-4835-9A6B-91B4C2E385B8}",
                "{ED962FFD-1998-4F03-9165-B0B0E27AF0C5}"

            )
        }
        "MgmtSvc-AdminSite"
        {
            return @(
                "{2F31F894-4AC3-4A7F-9F18-D50A9B327123}",
                "{D96559C2-0C06-42D1-9D5A-27437F814191}",
                "{B349A781-813C-44E7-8A10-9055F375B3D5}",
                "{7424D4D1-A1E0-4147-88A1-739E0B51C01A}",
                "{265EE8DB-FE0B-4532-AAD3-6787D6B4D91B}"

            )
        }
        "MgmtSvc-WindowsAuthSite"
        {
            return @(
                "{85EF5065-777C-410C-857A-041B386D476C}",
                "{40A83017-F95A-49A5-AE0D-C106298E5898}",
                "{F47FFCA3-AE68-48FB-9A9E-AC4469D675E2}",
                "{FEC02487-C505-4227-A9D4-8B160BB156FE}",
                "{9381CC0F-A0B5-4DDE-8141-6E725B95919C}"

            )
        }
        "MgmtSvc-TenantSite"
        {
            return @(
                "{CAF63E4C-6859-4EF1-B531-1FFED6DEB9B5}",
                "{8FC72370-FBF0-40BB-9398-E45FB9263C51}",
                "{57382D8D-7C0D-4D8B-85DB-261363B70C3E}",
                "{A72F27D3-C1DD-4BF3-B837-45B2457E9206}",
                "{348B0395-AD2A-45A6-BFFA-BB502F59ABC0}"

            )
        }
        "MgmtSvc-AuthSite"
        {
            return @(
                "{D3AE936A-C357-4B66-870F-415FF6248424}",
                "{20141108-1261-4285-9818-9FA493FFD0D3}",
                "{A3B5F452-94AC-4138-BE55-5F78F91AFC0B}",
                "{9FA55C04-8F44-4047-9482-C359ACA91D19}",
                "{6D4ABA37-50DB-4FA5-B833-D152370A4121}"

            )
        }
        "MgmtSvc-ConfigSite"
        {
            return @(
                "{32C316B4-3E22-4E4F-BF4C-BF76D38459D4}",
                "{4950C7DA-C2FC-4FC5-8E47-76B742E8E630}",
                "{E78CDA83-404D-4C32-A09D-B58F2C1C7BF2}",
                "{91D917FC-E486-4040-8764-A2AF83776142}",
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


function GetWAPFeatures
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
                "AdminAPI",
                "WebAppGallery",
                "Monitoring",
                "UsageCollector",
                "UsageService"
            )
        }
        "Tenant API"
        {
            return @(
                "TenantAPI"
            )
        }
        "Tenant Public API"
        {
            return @(
                "TenantPublicAPI"
            )
        }
        "SQL Server Extension"
        {
            return @(
                "SQLServer"
            )
        }
        "MySQL Extension"
        {
            return @(
                "MySQL"
            )
        }
        "Admin Site"
        {
            return @(
                "AdminSite"
            )
        }
        "Admin Authentication Site"
        {
            return @(
                "WindowsAuthSite"
            )
        }
        "Tenant Site"
        {
            return @(
                "TenantSite"
            )
        }
        "Tenant Authentication Site"
        {
            return @(
                "AuthSite"
            )
        }
    }
}


Export-ModuleMember -Function *-TargetResource
