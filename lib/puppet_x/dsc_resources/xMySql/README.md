[![Build status](https://ci.appveyor.com/api/projects/status/ji440gfk30kxn4ri/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xmysql/branch/master)

# xMySql

The **xMySql** module contains the **xMySqlServer, xMySqlDatabase, xMySqlUser, xMySqlGrant, xMySqlProvision** DSC resources allowing you to setup and configure a MySQL servers, databases, users, and grants.


## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources 

* **xMySqlServer** configures MySQL servers
* **xMySqlDatabase** configures MySQL databases.
* **xMySqlUser** configures MySQL users.
* **xMySqlGrant** configures MySQL grants.
* **xMySqlProvison** is a composite resource that provisions a set of MySQL servers, databases, users, and permission grants using the other resources. 

### xMySqlServer

* **ServiceName:** Provides the service name to use during setup of MySQL.
* **Ensure**: Ensures that the server is Present or Absent.
* **RootPassword**:  The root password that is used to install a MySQL server.
Note: a PSCredential object is used to store the password securely.
The user name can be any non-zero length string, but it will be ignored. 

### xMySqlDatabase

* **Name**: Name of the database to create.
* **Ensure**: Ensures that the database is Present or Absent.
* **ConnectionCredential:** The credential that is used to create the MySQL database.

### xMySqlUser

* **Name**: Name of the MySQL user to create or remove.
* **Ensure**: Ensures that the user is Present or Absent.
* **Credential**: Credential for the MySQL user.
* **ConnectionCredential:** The credential that is used to create or remove the user.

### xMySqlGrant

* **UserName**: Name of MySQL user.
* **DatabaseName**: MySQL database name to grant permissions.
* **Ensure**: Ensure permission grant is Present or Absent
* **PermissionType**: MySQL user permission type.
* **ConnectionCredential**: The credential that is used to create the grant.

### xMySqlProvision

* **ServiceName**: Provides the service name to use during setup of MySQL.
* **DownloadUri**: The URL/URI used for downloading the MySQL MSI. 
* **RootCredential**:The MySQL root credentials, user name and password.
* **DatabaseName**: The MySQL database name.
* **UserCredential**:The credentials, user name and password, for the MySQL user.


## Versions

### 1.0.0.0

* Initial release with the following resources :
    * xMySqlServer
    * xMySqlDatabase
    * xMySqlUser
    * xMySqlGrant
    * xMySqlProvision

# Setup a MySQL server on a single node

This configuration will setup a MySQL server on a single node.  

```powershell
Configuration SQLInstanceInstallationConfiguration
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $MySQLInstancePackagePath,
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $MySQLInstancePackageName
    )

    Import-DscResource -Module xMySql
    node $AllNodes.NodeName
    {

        xPackage mySqlInstaller
        {

            Path = $MySQLInstancePackagePath
            ProductId = $Node.PackageProductID 
            Name = $MySQLInstancePackageName
        }

        xMySqlServer MySQLInstance
        {
            Ensure = "Present"
            RootPassword = $global:cred
            ServiceName = "MySQLServerInstanceName"
            DependsOn = "[xPackage]mySqlInstaller"
        }
    }
}
# Sample use (parameter values need to be changed according to your scenario):
$global:pwd = ConvertTo-SecureString "pass@word1" -AsPlainText -Force
$global:usrName = "administrator"
$global:cred = New-Object -TypeName System.Management.Automation.PSCredential ($global:usrName,$global:pwd)
SQLInstanceInstallationConfiguration `
    -MySQLInstancePackagePath "http://dev.mysql.com/get/Downloads/MySQLInstaller/mysql-installer-community-5.6.17.0.msi" `
    -MySQLInstancePackageName "MySQL Installer" -ConfigurationData .\nodedata.psd1
```

### Setup a MySQL server database

This configuration will setup a MySQL server and create a database.  

```powershell
Configuration SQLInstanceAndDatabaseInstallationConfiguration
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $MySQLInstancePackagePath,
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $MySQLInstancePackageName
    )
    Import-DscResource -Module xMySql

    node $AllNodes.NodeName
    {

        xPackage mySqlInstaller
        {

            Path = $MySQLInstancePackagePath
            ProductId = $Node.PackageProductID 
            Name = $MySQLInstancePackageName
            Ensure = "Present"
        }

        xMySqlServer MySQLInstance
        {
            Ensure = "Present"
            RootPassword= $global:cred
            ServiceName = "MySQLInstanceServiceName"
            DependsOn = "[xPackage]mySqlInstaller"
        }
        xMySqlDatabase MySQLDatabase
        {
            Ensure = "Present"
            Name = "TestDB"
            ConnectionCredential = $global:cred
            DependsOn = "[xMySqlInstance]MySQLInstance"
        }
    }
}
# Sample use (parameter values need to be changed according to your scenario):
$global:pwd = ConvertTo-SecureString "pass@word1" -AsPlainText -Force
$global:usrName = "administrator"
$global:cred = New-Object -TypeName System.Management.Automation.PSCredential ($global:usrName,$global:pwd)
SQLInstanceAndDatabaseInstallationConfiguration `
    -MySQLInstancePackagePath "http://dev.mysql.com/get/Downloads/MySQLInstaller/mysql-installer-community-5.6.17.0.msi" `
    -MySQLInstancePackageName "MySQL Installer" -ConfigurationData .\nodedata.psd1
```

### Setup a MySQL server user

This configuration will setup a MySQL user, assuming mySQL is installed on a local machine with root user $RootUser and root password $global:pwd. 

```
Configuration CreateMySQLUserConfiguration
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $Name
    )

    Import-DscResource -Module xMySql
    $mySQLUserCredential = New-Object -TypeName System.Management.Automation.PSCredential ($Name,$global:pwd)
    node ("localhost")
    {                  
        xMySqlUser NewMySqlUser1
        {
            Name = $Name
            Credential = $mySQLUserCredential
            Ensure = "Present"
            ConnectionCredential = $global:MySQLRootCredential

        }
    }
}
$global:pwd = ConvertTo-SecureString "pass@word1" -AsPlainText -Force
$global:RootUser = "root"
$global:MySQLRootCredential = New-Object -TypeName System.Management.Automation.PSCredential ($global:RootUser,$global:pwd)
# Create localhost.mof
CreateMySQLUserConfiguration -output "$env:temp\CreateMySQLUserConfiguration"
```

### Setup a MySQL server grant

This configuration will grant full acesss to a given MySQL database for a given user.
It assumes that mySQL is installed on a local machine with root user $RootUser and root password $global:pwd. 

```powershell
configuration MySQLGrantConfiguration
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $UserName,
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $DatabaseName
    )

    Import-DscResource -Module xMySql

    node ("localhost")
    {                  
        xMySqlGrant mySQLGrant
        {
            UserName = $UserName
            DatabaseName = $DatabaseName
            PermissionType = "ALL PRIVILEGES"
            Ensure = "Present"               
            ConnectionCredential = $global:MySQLRootCredential

        }
    }
}
$global:pwd = ConvertTo-SecureString "pass@word1" -AsPlainText -Force
$global:RootUser = "root"
$global:MySQLRootCredential = New-Object -TypeName System.Management.Automation.PSCredential ($global:RootUser,$global:pwd)
# Create localhost.mof
CreateMySQLUserConfiguration -output "$env:temp\MySQLGrantConfiguration"
```
