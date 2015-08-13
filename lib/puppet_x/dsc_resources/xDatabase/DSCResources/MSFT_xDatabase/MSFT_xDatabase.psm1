data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
DacFxInstallationError=Please ensure that DacFx is installed.
SmoFxInstallationError=Please ensure that Smo is installed.
DacPacExtractionError=Extracting DacPac for Db failed, continuing with Dac Deployment.
'@
}

$SmoServerLocation = "${env:ProgramFiles(x86)}\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.Smo.dll"

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [System.Management.Automation.PSCredential]
        $Credentials,

        [parameter(Mandatory = $true)]
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

        [parameter(Mandatory = $true)]
        [System.String]
        $SqlServer,

        [parameter(Mandatory = $true)]
        [ValidateSet("2008-R2","2012","2014")]
        [System.String]
        $SqlServerVersion,

        [parameter(Mandatory = $true)]
        [System.String]
        $DatabaseName
    )

        if($PSBoundParameters.ContainsKey('Credentials'))
    {
        $ConnectionString = Construct-ConnectionString -sqlServer $SqlServer -credentials $Credentials
    }
    else
    {
        $ConnectionString = Construct-ConnectionString -sqlServer $SqlServer
    }

    $dbExists = CheckIfDbExists $ConnectionString $DatabaseName
    $Ensure = if ($dbExists) { "Present" } else { "Absent" }

    $result = @{
        Ensure = $Ensure
        DatabaseName = $DatabaseName
        SqlServer = $SqlServer
        SqlServerVersion = $SqlServerVersion
    }
    return $result
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [System.Management.Automation.PSCredential]
        $Credentials,

        [parameter(Mandatory = $true)]
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

        [System.String]
        $SqlServer,

        [parameter(Mandatory = $true)]
        [ValidateSet("2008-R2","2012","2014")]
        [System.String]
        $SqlServerVersion,

        [System.String]
        $BacPacPath,

        [parameter(Mandatory = $true)]
        [System.String]
        $DatabaseName,

        [System.String]
        $DacPacPath,

        [System.String]
        $DacPacApplicationName,

        [System.String]
        $DacPacApplicationVersion
    )

    if($PSBoundParameters.ContainsKey('Credentials'))
    {
        $ConnectionString = Construct-ConnectionString -sqlServer $SqlServer -credentials $Credentials
    }
    else
    {
        $ConnectionString = Construct-ConnectionString -sqlServer $SqlServer
    }

    if($Ensure -eq "Present")
    {
        if($PSBoundParameters.ContainsKey('BacPacPath'))
        {
            Perform-Restore -DbName $DatabaseName -connectionString $ConnectionString -sqlserverVersion $SqlServerVersion -bacpacFilePath $BacPacPath
        }
        elseif($PSBoundParameters.ContainsKey('DacPacPath'))
        {
            if(!$PSBoundParameters.ContainsKey('DacPacApplicationName'))
            {
                Throw "Application Name Needed for DAC Registration, else upgrade is unsupported"
            }
            DeployDac -databaseName $DatabaseName -connectionString $ConnectionString -sqlserverVersion $SqlServerVersion -dacpacPath $DacPacPath -dacpacApplicationName $DacPacApplicationName -dacpacApplicationVersion $DacPacApplicationVersion
        }
        else
        {
            CreateDb -databaseName $DatabaseName -connectionString $ConnectionString
        }
    }
    else
    {
        DeleteDb -databaseName $DatabaseName -connectionString $ConnectionString -sqlServerVersion $SqlServerVersion
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
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

        [System.String]
        $SqlServer,

        [parameter(Mandatory = $true)]
        [ValidateSet("2008-R2","2012","2014")]
        [System.String]
        $SqlServerVersion,

        [System.String]
        $BacPacPath,

        [parameter(Mandatory = $true)]
        [System.String]
        $DatabaseName,

        [System.String]
        $DacPacPath,

        [System.String]
        $DacPacApplicationName,

        [System.String]
        $DacPacApplicationVersion
    )

    if($PSBoundParameters.ContainsKey('DacPacPath') -and $PSBoundParameters.ContainsKey('BacPacPath'))
    {
        throw "Specify only one out of dacpac or bacpac"
    }

    if($PSBoundParameters.ContainsKey('Credentials'))
    {
        $ConnectionString = Construct-ConnectionString -sqlServer $SqlServer -credentials $Credentials
    }
    else
    {
        $ConnectionString = Construct-ConnectionString -sqlServer $SqlServer
    }

    $dbExists = CheckIfDbExists $ConnectionString $DatabaseName

    if($Ensure -eq "Present")
    {
        if($PSBoundParameters.ContainsKey('BacPacPath'))
        {
            if($dbExists)
            {
                return $true
            }
  
            return $false
        }
        if($dbExists -eq $false)
        {
            return $false
        }
        if($dbExists -eq $true -and !$PSBoundParameters.ContainsKey('DacPacPath'))
        {
            return $true
        }
        else
        {
            return $false
        }
    }
    else
    {
        if($dbExists)
        {
            return $false
        }

        return $true
    }
}

function CheckIfDbExists([string]$connectionString, [string]$databaseName)
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

function DeployDac([string] $databaseName, [string]$connectionString, [string]$sqlserverVersion, [string]$dacpacPath, [string]$dacpacApplicationName, [string]$dacpacApplicationVersion)
{
    $defaultDacPacApplicationVersion = "1.0.0.0"

    if($PSBoundParameters.ContainsKey('dacpacApplicationVersion'))
    {
        $defaultDacPacApplicationVersion = $defaultDacPacApplicationVersion
    }

    try
    {
        Load-DacFx -sqlserverVersion $sqlserverVersion
    }
    catch
    {
        Throw "$LocalizedData.DacFxInstallationError"
    }

    $dacServicesObject = new-object Microsoft.SqlServer.Dac.DacServices ($connectionString)

    $dacpacInstance = [Microsoft.SqlServer.Dac.DacPackage]::Load($dacpacPath)

    try
    {
        $dacServicesObject.Deploy($dacpacInstance, $databaseName,$true) 

        $dacServicesObject.Register($databaseName, $dacpacApplicationName,$defaultDacPacApplicationVersion)

        Write-Verbose("Dac Deployed")
    }
    catch
    {
        Write-Verbose("Dac Deploy Failed")
    }
}

function CreateDb([string] $databaseName, [string]$connectionString)
{
    $sqlConnection = new-object system.data.SqlClient.SQLConnection($connectionString);

    $query = "create database $databaseName"

    ExecuteSqlQuery $sqlConnection $query

    $sqlConnection.Close()
}

function DeleteDb([string] $databaseName, [string]$connectionString, [string]$sqlServerVersion)
{

    Load-SmoAssembly -sqlserverVersion $sqlServerVersion

    $sqlConnection = new-object system.data.SqlClient.SQLConnection($connectionString);

    $smo = New-Object Microsoft.SqlServer.Management.Smo.Server $sqlConnection.DataSource

    $smo.KillAllProcesses($databaseName)

    $query = "drop database $databaseName"

    $result = ExecuteSqlQuery $sqlConnection $query

    $sqlConnection.Close()
}

function ExecuteSqlQuery([system.data.SqlClient.SQLConnection]$sqlConnection, [string]$SqlQuery)
{
    $sqlCommand = new-object system.data.sqlclient.sqlcommand($SqlQuery, $sqlConnection);

    $sqlConnection.Open()

    if ($sqlCommand.ExecuteNonQuery() -ne -1)
    {
        return $true
    }

    return $false
}

function Construct-ConnectionString([string]$sqlServer, [System.Management.Automation.PSCredential]$credentials)
{

    $server = "Server=$sqlServer;"

    if($PSBoundParameters.ContainsKey('credentials'))
    {
        $uid = $credentials.UserName
        $pwd = $credentials.GetNetworkCredential().Password
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

function Perform-Restore([string]$DbName, [string]$connectionString, [string]$sqlserverVersion, [string]$bacpacFilePath)
{
    Load-DacFx -sqlserverVersion $sqlserverVersion

    $dacServiceInstance = new-object Microsoft.SqlServer.Dac.DacServices ($connectionString)

    $bacpacPackageInstance = [Microsoft.SqlServer.Dac.BacPackage]::Load($bacpacFilePath)

    try
    {
        $dacServiceInstance.ImportBacpac($bacpacPackageInstance, $DbName)
    }
    catch
    {
        Throw "Restore Failed"
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
        Throw "$LocalizedData.DacFxInstallationError"
    }
}

function Load-SmoAssembly([string]$sqlserverVersion)
{
    $majorVersion = Get-SqlServerMajoreVersion -sqlServerVersion $sqlserverVersion

    $SmoLocation = "${env:ProgramFiles(x86)}\Microsoft SQL Server\$majorVersion\SDK\Assemblies\Microsoft.SqlServer.Smo.dll"
    try
    {  
        [System.Reflection.Assembly]::LoadFrom($SmoLocation) | Out-Null
    }
    catch
    {
        Throw "$LocalizedData.SmoFxInstallationError"
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


