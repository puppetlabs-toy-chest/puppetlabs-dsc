# Composite configuration to provision MySql
configuration xMySqlProvision
{
    param
    (
        [Parameter(Mandatory = $true)]
        [string] $ServiceName,

        [Parameter(Mandatory = $true)]
        [string] $DownloadUri,

        [Parameter(Mandatory = $true)]
        [PSCredential] $RootCredential,

        [Parameter(Mandatory = $true)]
        [String] $DatabaseName,

        [Parameter(Mandatory = $true)]
        [PSCredential] $UserCredential
    )
        # Make sure the mySqlServer installer package is present
        Package mySqlInstaller
        {
                    
            Path      = $DownloadURI
            ProductId = "{437AC169-780B-47A9-86F6-14D43C8F596B}"
            Name      = "MySQL Installer"
        }

        # Make sure the mySqlServer exists with the correct root credential
        xMySqlServer mySQLServer
        {
           ServiceName          = $ServiceName
           Ensure               = "Present"
           RootPassword         = $RootCredential
           DependsOn            = "[Package]mySqlInstaller"
        }

        # Make sure the MySql WordPress database exists
        xMySqlDatabase mySQLDatabase
        {
           Ensure               = "Present"
           Name                 = $DatabaseName
           ConnectionCredential = $RootCredential
           DependsOn            = "[xMySqlServer]mySQLServer"
        }

        # Make sure the MySql WordPress user exists
        xMySqlUser mySQLUser
        {
            Name                 = $UserCredential.UserName
            Ensure               = "Present"
            Credential           = $UserCredential
            ConnectionCredential = $RootCredential
            DependsOn            = "[xMySqlDatabase]mySQLDatabase"
        }

        # Make sure the MySql WordPress user has access to tho WordPress database
        xMySqlGrant mySQLGrant
        {
            UserName             = $UserCredential.UserName
            DatabaseName         = $DatabaseName
            Ensure               = "Present"               
            ConnectionCredential = $RootCredential
            DependsOn            = "[xMySqlUser]mySQLUser"
        }
}


