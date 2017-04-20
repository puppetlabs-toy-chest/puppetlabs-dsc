data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
DacFxInstallationError=Please ensure that DacFx is installed.
SmoFxInstallationError=Please ensure that Smo is installed.
'@
}

function CheckIfDbExists([string]$connectionString, [string]$databaseName)
{
    Write-Verbose("Inside CheckIfDbExists")
    $connectionString = "$connectionString database=$databaseName;"

    $connection = New-Object system.Data.SqlClient.SqlConnection

    $connection.connectionstring = $connectionString

    Write-Verbose($connectionString)

    try
    {
        $connection.Open()
    }
    catch
    {  
        Write-Verbose("Db does not exist")
        return $false
    }

    $connection.Close()

    return $true
}

function DeployDac([string] $databaseName, [string]$connectionString, [string]$sqlserverVersion,
                   [string]$dacpacPath, [string]$dacpacApplicationName, [string]$dacpacApplicationVersion)
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
        $errorMessage = $_.Exception.Message
        Write-Verbose('Dac Deploy Failed: ''{0}''' -f $errorMessage)
    }
}

function CreateDb([string] $databaseName, [string]$connectionString)
{
    $sqlConnection = new-object system.data.SqlClient.SQLConnection($connectionString);

    $query = "if not exists(SELECT name FROM sys.databases WHERE name='$databaseName') BEGIN create database $databaseName END"

    ExecuteSqlQuery -sqlConnection $sqlConnection -sqlQuery $query

    $sqlConnection.Close()
}

function DeleteDb([string] $databaseName, [string]$connectionString, [string]$sqlServerVersion)
{
    <#
    Load-SmoAssembly -sqlserverVersion $sqlServerVersion
    
    $smo = New-Object Microsoft.SqlServer.Management.Smo.Server $sqlConnection.DataSource

    $smo.KillAllProcesses($databaseName)

    $query = "drop database $databaseName"
    #>

    $sqlConnection = new-object system.data.SqlClient.SQLConnection($connectionString);

    #Forcibly drop database
    $Query = "If EXISTS(SELECT * FROM sys.databases WHERE name='$databaseName')
               BEGIN
                EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'$databaseName'
                ALTER DATABASE [$databaseName] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
                USE [master]
                DROP DATABASE [$databaseName]
               END"

    $result = ExecuteSqlQuery -sqlConnection $sqlConnection -sqlQuery $query

    $sqlConnection.Close()
}

function ExecuteSqlQuery([system.data.SqlClient.SQLConnection]$sqlConnection, [string]$SqlQuery)
{
    $sqlCommand = new-object system.data.sqlclient.sqlcommand($SqlQuery, $sqlConnection);

    $sqlConnection.Open()
    $queryResult = $sqlCommand.ExecuteNonQuery()
    $sqlConnection.Close()

    if ($queryResult  -ne -1)
    {
        return $true
    }

    return $false
}

function ReturnSqlQuery([system.data.SqlClient.SQLConnection]$sqlConnection, [string]$SqlQuery)
{
    $sqlCommand = new-object system.data.sqlclient.sqlcommand($SqlQuery, $sqlConnection)
    $sqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter($sqlCommand)
    $dataSet = New-Object System.Data.DataSet
    $sqlAdapter.Fill($dataSet)

    return $dataSet.Tables
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
        Throw "Restore Failed Exception: $_"
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

function Get-SqlDatabaseOwner([string]$DatabaseName, [string]$connectionString)
{
   
    [string]$SqlQuery = "SELECT SUSER_SNAME(owner_sid) [OwnerName] FROM sys.databases where name = '$DatabaseName'"

    $sqlConnection = new-object system.data.SqlClient.SQLConnection($connectionString)


    return (ReturnSqlQuery -sqlConnection $sqlConnection -SqlQuery $SqlQuery).OwnerName
            
 
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


