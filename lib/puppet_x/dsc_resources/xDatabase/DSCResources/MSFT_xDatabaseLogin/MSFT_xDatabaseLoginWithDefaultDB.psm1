data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
    CreateDatabaseLoginError=Failed to create SQL Login '{0}'.
    TestDatabaseLoginError=Failed to test SQL Login '{0}'.
    CreateDatabaseLoginSuccess=Success: SQL Login '{0}' either already existed or has been successfully created.
    AlterDefaultDatabaseLoginSuccess=Successfully set the default database for '{0}' to '{1}'.
    RemoveDatabaseLoginError=Failed to remove SQL Login '{0}'.
    RemoveDatabaseLoginSuccess=Success: SQL Login '{0}' either does not existed or has been successfully removed.
'@
}

Import-Module $PSScriptRoot\..\xDatabase_Common

function Get-TargetResource #Not yet working
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $LoginName,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SqlConnectionCredentials
    )

    $Connection = Construct-SqlConnection -credentials $SqlConnectionCredentials

    [string]$loginNameQuery = "SELECT * from sys.sql_logins where name='$LoginName'"
    [string]$DBNameQuery = "Select default_database_name from sys.sql_logins where name='$LoginName'"

    $PresentValue = $false

    if((ReturnSqlQuery -sqlConnection $connection -SqlQuery $loginNameQuery)[0] -gt 0)
    {
        $PresentValue = $true
    }


    $returnValue = @{
        Ensure = $PresentValue
        LoginName = $LoginName
        DefaultDatabaseName = (ReturnSqlQuery -sqlConnection $connection -SqlQuery $DBNameQuery).default_database_name
    }

    $returnValue

}

#TODO: handle absent case. example "DROP Login Toothy"

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [System.String]
        $LoginName,

        [System.String]
        $LoginPassword,
        
        [System.String]
        $DefaultDatabaseName,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SqlConnectionCredentials
    )
    
    $Connection = Construct-SqlConnection -Credentials $SqlConnectionCredentials

    if($Ensure -eq "Present")
    {
        try
        {
            # Create login if it does not already exist.
            [string]$SqlQuery = "if not exists(SELECT name FROM sys.sql_logins WHERE name='$LoginName') Begin create login $LoginName with password='$LoginPassword' END"

            $supressReturn = ExecuteSqlQuery -sqlConnection $connection -SqlQuery $SqlQuery

            Write-Verbose $($LocalizedData.CreateDatabaseLoginSuccess -f ${LoginName})

            # Set the default database if it is not already set correctly.

            if($PSBoundParameters.ContainsKey("DefaultDatabaseName"))
            {
                [string]$SqlQuery = "if not exists(SELECT name FROM sys.sql_logins WHERE name='$LoginName' AND default_database_name='$DefaultDatabaseName') BEGIN ALTER LOGIN $LoginName with default_database=$DefaultDatabaseName End"

                $supressReturn = ExecuteSqlQuery -sqlConnection $connection -SqlQuery $SqlQuery
            
                Write-Verbose $($LocalizedData.AlterDefaultDatabaseLoginSuccess -f ${LoginName}, ${DefaultDatabaseName})
            }
        
        }
        catch
        {
            $errorId = "CreateDatabaseLogin";
            $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidResult
            $errorMessage = $($LocalizedData.CreateDatabaseLoginError -f ${LoginName})
            $exception = New-Object System.InvalidOperationException $errorMessage 
            $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception, $errorId, $errorCategory, $null

            $PSCmdlet.ThrowTerminatingError($errorRecord);
        }
    }
    else # Ensure is absent so remove login.
    {
        try
        {
            # Create login if it does not already exist.
            [string]$SqlQuery = "if exists(SELECT name FROM sys.sql_logins WHERE name='$LoginName') Begin DROP LOGIN $LoginName END"

            $supressReturn = ExecuteSqlQuery -sqlConnection $connection -SqlQuery $SqlQuery

            Write-Verbose $($LocalizedData.RemoveDatabaseLoginSuccess -f ${LoginName})
        }
        catch
        {
            $errorId = "RemoveDatabaseLogin";
            $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidResult
            $errorMessage = $($LocalizedData.RemoveDatabaseLoginError -f ${LoginName})
            $exception = New-Object System.InvalidOperationException $errorMessage 
            $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception, $errorId, $errorCategory, $null

            $PSCmdlet.ThrowTerminatingError($errorRecord);
        }
    }
}


function Test-TargetResource #Not yet working
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [System.String]
        $LoginName,

        [System.String]
        $LoginPassword,

        [System.String]
        $DefaultDatabaseName,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SqlConnectionCredentials
    )

    try
    {
        $Connection = Construct-SqlConnection -Credentials $SqlConnectionCredentials
        
        [string]$SqlLoginQuery = "SELECT * from sys.sql_logins where name='$LoginName'"
        if($PSBoundParameters.ContainsKey("DefaultDatabaseName"))
        {
            $SqlDBQuery = " AND default_database_name='$DefaultDatabaseName'"
        }

        [string]$SqlQuery = "$SqlLoginQuery$SqlDBQuery"

        $LoginsReturnedByQuery = (ReturnSqlQuery -sqlConnection $connection -SqlQuery $SqlQuery)[0]

        if((($LoginsReturnedByQuery -gt 0) -and ($Ensure -eq "Present")) -or (($LoginsReturnedByQuery -eq 0) -and ($Ensure -eq "absent")))
        {
            $result = $true
        }
        else
        {
            $result = $false
        }

        return $result

    }
    catch
    {
        $errorId = "TestDatabaseLogin";
        $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidResult
        $errorMessage = $($LocalizedData.TestDatabaseLoginError -f ${LoginName})
        $exception = New-Object System.InvalidOperationException $errorMessage 
        $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception, $errorId, $errorCategory, $null

        $PSCmdlet.ThrowTerminatingError($errorRecord);
    }

}


Export-ModuleMember -Function *-TargetResource




