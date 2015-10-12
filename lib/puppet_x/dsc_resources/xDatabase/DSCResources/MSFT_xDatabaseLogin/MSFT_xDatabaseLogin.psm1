data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
    CreateDatabaseLoginError=Failed to create SQL Login '{0}'.
    TestDatabaseLoginError=Failed to test SQL Login '{0}'.
    CreateDatabaseLoginSuccess=Success: SQL Login '{0}' either already existed or has been successfully created.
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
        
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present",
        
        [parameter(Mandatory = $true)]
        [System.String]
        $LoginName,

        [System.String]
        $LoginPassword,

        [System.Management.Automation.PSCredential]
        $SqlConnectionCredential,

        [parameter(Mandatory = $true)]
        [string]
        [ValidateSet("SQL","Windows")]
        $SqlAuthType,
        
        [parameter(Mandatory = $true)]
        [System.String]
        $SqlServer

    )

    if($SqlAuthType -eq "SQL")
    {
         $Connection = Construct-SqlConnection -credentials $SqlConnectionCredential -sqlServer $SqlServer
    }
    else
    {
         $Connection = Construct-SqlConnection -sqlServer $SqlServer
    }

    [string]$loginNameQuery = "SELECT * from sys.sql_logins where name='$LoginName'"

    $PresentValue = $false

    if((ReturnSqlQuery -sqlConnection $connection -SqlQuery $loginNameQuery)[0] -gt 0)
    {
        $PresentValue = $true
    }


    $returnValue = @{
        Ensure = $PresentValue
        LoginName = $LoginName
        AuthType = $SqlAuthType
        SqlServer = $SqlServer
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
        
        [System.Management.Automation.PSCredential]
        $SqlConnectionCredential,

        [parameter(Mandatory = $true)]
        [string]
        [ValidateSet("SQL","Windows")]
        $SqlAuthType,
        
        [parameter(Mandatory = $true)]
        [System.String]
        $SqlServer
    )
    
    if($SqlAuthType -eq "SQL")
    {
         $Connection = Construct-SqlConnection -credentials $SqlConnectionCredential -sqlServer $SqlServer
    }
    else
    {
         $Connection = Construct-SqlConnection -sqlServer $SqlServer
    }

    if($Ensure -eq "Present")
    {
        try
        {
            # Create login if it does not already exist.
            [string]$SqlQuery = "if not exists(SELECT name FROM sys.sql_logins WHERE name='$LoginName') Begin create login $LoginName with password='$LoginPassword' END"

            $supressReturn = ExecuteSqlQuery -sqlConnection $connection -SqlQuery $SqlQuery

            Write-Verbose $($LocalizedData.CreateDatabaseLoginSuccess -f ${LoginName})
        
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

        [System.Management.Automation.PSCredential]
        $SqlConnectionCredential,

        [parameter(Mandatory = $true)]
        [string]
        [ValidateSet("SQL","Windows")]
        $SqlAuthType,
        
        [parameter(Mandatory = $true)]
        [System.String]
        $SqlServer
    )

        try
        {
            if($SqlAuthType -eq "SQL")
        {
                $Connection = Construct-SqlConnection -credentials $SqlConnectionCredential -sqlServer $SqlServer
        }
        else
        {
                $Connection = Construct-SqlConnection -sqlServer $SqlServer
        }
        
        [string]$SqlQuery = "SELECT * from sys.sql_logins where name='$LoginName'"
        
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




