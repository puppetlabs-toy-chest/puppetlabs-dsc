# Composite configuration to provision MySql
configuration xMySqlProvision
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $DownloadUri,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $MySQLVersion,

        [Parameter(Mandatory = $true)]
        [PSCredential] $RootCredential,

        [String] $Port,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $DatabaseName,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $UserName,

        [Parameter(Mandatory = $true)]
        [PSCredential] $UserCredential,

        [parameter(Mandatory = $true)]
        [ValidateSet("ALL PRIVILEGES", "CREATE", "DROP", "DELETE", "INSERT", "SELECT", "UPDATE", "EXECUTE")]
        [ValidateNotNullOrEmpty()]
        [string[]] $PermissionType
    )

        # Make sure the MySQL Installer Console is installed
        Package mySqlInstaller
        {
            Ensure    = "Present"
            Path      = $DownloadURI
            ProductId = "{5848D524-F8CF-4A46-A3E4-B9BDB979A0FE}"
            Name      = "MySQL Installer - Community"
        }

        # Make sure MySQL is installed with the correct port and root credential
        xMySqlServer mySqlServer
        {
            Ensure       = "Present"
            MySQLVersion = $MySQLVersion
            RootPassword = $RootCredential
            Port         = $Port
            DependsOn    = "[Package]mySqlInstaller"
        }

        # Make sure the MySQL database exists
        xMySqlDatabase mySqlDatabase
        {
            Ensure         = "Present"
            DatabaseName   = $DatabaseName
            RootCredential = $RootCredential
            MySQLVersion   = $MySQLVersion
            DependsOn      = "[xMySqlServer]mySqlServer"
        }

        # Make sure the MySQL user exists
        xMySqlUser mySqlUser
        {
            Ensure         = "Present"
            UserName       = $UserName
            UserCredential = $UserCredential
            RootCredential = $RootCredential
            MySQLVersion   = $MySQLVersion
            DependsOn      = "[xMySqlDatabase]mySqlDatabase"
        }

        # Make sure the MySQL user has access to the MySQL database
        xMySqlGrant mySqlGrant
        {
            Ensure         = "Present"               
            UserName       = $UserName
            DatabaseName   = $DatabaseName
            RootCredential = $RootCredential
            PermissionType = $PermissionType
            MySQLVersion   = $MySQLVersion
            DependsOn      = "[xMySqlUser]mySqlUser"
        }
}


