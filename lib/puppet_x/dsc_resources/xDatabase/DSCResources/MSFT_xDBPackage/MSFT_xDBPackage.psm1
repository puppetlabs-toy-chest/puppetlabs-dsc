function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $DatabaseName,

        [parameter(Mandatory = $true)]
        [System.String]
        $SqlServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [parameter(Mandatory = $true)]
        [ValidateSet("DACPAC","BACPAC")]
        [System.String]
        $Type,

        [parameter(Mandatory = $true)]
        [ValidateSet("2008-R2","2012","2014")]
        [System.String]
        $SqlServerVersion
    )
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [System.Management.Automation.PSCredential]
        $Credentials,

        [parameter(Mandatory = $true)]
        [System.String]
        $DatabaseName,

        [parameter(Mandatory = $true)]
        [System.String]
        $SqlServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [parameter(Mandatory = $true)]
        [ValidateSet("DACPAC","BACPAC")]
        [System.String]
        $Type,

        [parameter(Mandatory = $true)]
        [ValidateSet("2008-R2","2012","2014")]
        [System.String]
        $SqlServerVersion
    )

    $connectionString = Construct-ConnectionString -sqlServer $SqlServer -credentials $Credentials

    switch($Type)
    {
        "DACPAC"
        {
            Extract-DacPacForDb -connectionString $connectionString -sqlServerVersion $SqlServerVersion -databaseName $DatabaseName -dacpacPath $Path
        }
        "BACPAC"
        {
            Import-BacPacForDb -connectionString $connectionString -sqlServerVersion $SqlServerVersion -databaseName $DatabaseName -bacpacPath $Path
        }
    }
    
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [System.Management.Automation.PSCredential]
        $Credentials,

        [parameter(Mandatory = $true)]
        [System.String]
        $DatabaseName,

        [parameter(Mandatory = $true)]
        [System.String]
        $SqlServer,

        [parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [parameter(Mandatory = $true)]
        [ValidateSet("DACPAC","BACPAC")]
        [System.String]
        $Type,

        [parameter(Mandatory = $true)]
        [ValidateSet("2008-R2","2012","2014")]
        [System.String]
        $SqlServerVersion
    )

    $connectionString = Construct-ConnectionString -sqlServer $SqlServer -credentials $Credentials

    $dbExists = Check-IfDbExists -databaseName $DatabaseName -connectionString $connectionString

    if($dbExists)
    {
        return $false
    }

    return $true
}

function Check-IfDbExists([string]$databaseName, [string]$connectionString)
{
    $connectionString = "$connectionString database=$databaseName;"

    $connection = New-Object system.Data.SqlClient.SqlConnection

    $connection.connectionstring = $connectionString

    try
    {
        $connection.Open()
    }
    catch
    {
        return $false
    }

    $connection.Close()

    return $true
}

function Construct-ConnectionString([string]$sqlServer, [System.Management.Automation.PSCredential]$credentials)
{
    $uid = $credentials.UserName
    $pwd = $credentials.GetNetworkCredential().Password
    $server = "Server=$sqlServer;"

    if($PSBoundParameters.ContainsKey('credentials'))
    {
        $integratedSecurity = "Integrated Security=False;"
        $userName = "uid=$uid;pwd=$pwd;"
    }
    else
    {
        $integratedSecurity = "Integrated Security=SSPI;"
    }

    $connectionString = "$server$userName$integratedSecurity"

    return $connectionString
}

function Extract-DacPacForDb([string]$connectionString, [string]$sqlServerVersion, [string]$databaseName, [string]$dacpacPath)
{
    Load-DacFx -sqlserverVersion $sqlServerVersion

    $dacService = new-object Microsoft.SqlServer.Dac.DacServices($connectionString)

    try
    {
        $dacService.Extract($dacpacPath, $databaseName, "MyApplication", "1.0.0.0")
    }
    catch
    {
        Write-Verbose -Message "Extracting DacPac failed"
    }
}

function Import-BacPacForDb([string]$connectionString, [string]$sqlServerVersion, [string]$databaseName, [string]$bacpacPath)
{
    Write-Verbose "Importing bacpac"

    Load-DacFx -sqlserverVersion $sqlServerVersion

    Write-Verbose $connectionString

    $dacServiceInstance = new-object Microsoft.SqlServer.Dac.DacServices ($connectionString)

    Write-Verbose $dacServiceInstance

    try
    {
        $dacServiceInstance.ExportBacpac($bacpacPath, $databaseName)
    }
    catch
    {
        Write-Verbose -Message "Importing BacPac failed"
    }
}

function Load-DacFx([string]$sqlserverVersion)
{
    $majorVersion = Get-SqlServerMajoreVersion -sqlServerVersion $sqlserverVersion

    $DacFxLocation = "${env:ProgramFiles(x86)}\Microsoft SQL Server\$majorVersion\DAC\bin\Microsoft.SqlServer.Dac.dll"

    try
    {  
        [System.Reflection.Assembly]::LoadFrom($DacFxLocation) | Out-Null
    }
    catch
    {
        Throw "Loading DacFx Failed"
    }
}

function Get-SqlServerMajoreVersion([string]$sqlServerVersion)
{
    switch($sqlserverVersion)
    {
        "2008-R2"
        {
            $majorVersion = 100
        }
        "2012"
        {
            $majorVersion = 110
        }
        "2014"
        {
            $majorVersion = 120
        }
    }

    return $majorVersion
}

Export-ModuleMember -Function *-TargetResource


