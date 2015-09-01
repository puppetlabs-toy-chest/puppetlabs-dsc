data localizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
DatabaseServerCouldNotBeCreatedError=Could not create database in the following location: "{0}". Verify you did not exceed database server limit.
DatabaseServerNotExistsError=Database server "{0}" does not exist. You have to specify name of existing server.
'@
}

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $ServerCredential,
        
        [parameter(Mandatory = $true)]
        [System.String]
        $ServerName,

        [System.String]
        $AzureSubscriptionName,

        [System.String]
        $AzurePublishSettingsFile
    )
    
    # Select Azure subscription
    if ($AzureSubscriptionName -and $AzurePublishSettingsFile)
    {
        Write-Verbose "Azure Publish Setting provided. AzureSubscriptionName = $AzureSubscriptionName,  AzurePublishSettingsFile = $AzurePublishSettingsFile. Selecting Azure subscription."
        Import-AzurePublishSettingsFile $AzurePublishSettingsFile
        Select-AzureSubscription -SubscriptionName $AzureSubscriptionName -Current -ErrorAction SilentlyContinue
        $currentSubscription = Get-AzureSubscription -Current
        Write-Verbose "The selected Azure subscription ID is $($currentSubscription.SubscriptionID)"
    }

    # Verify that database server with given name exists
    Write-Verbose "Verifying that server '$ServerName' exists"
    
    try {
        $server = Get-AzureSqlDatabaseServer -ServerName $ServerName -ErrorAction Stop
        Write-Verbose "Server '$ServerName' exists"
    } catch [System.Exception] {
        # Throw exception if specified ServerName does not exist
        $errorMessage = $($LocalizedData.DatabaseServerNotExistsError) -f ${ServerName} 
        $errorMessage += "`nException message: `n" + $_
        Throw-InvalidOperationException -errorId "DatabaseServerNotExistsFailure" -errorMessage $errorMessage
    }

    $nameState = $Name
    $maxSizeGBState = $null
    $collationState = $null
    $editionState = $null
    $serverCredentialState = $null
    $serverNameState = $ServerName
    $ensureState = $null

    # Get database state
    Write-Verbose "Creating database server context for $ServerName"
    $databaseServerContext = New-AzureSqlDatabaseServerContext -ServerName $ServerName -Credential $ServerCredential

    Write-Verbose "Checking whether Azure SQL database '$Name' exists"
    $currentDatabase = Get-AzureSqlDatabase -ConnectionContext $databaseServerContext -DatabaseName $Name -ErrorAction SilentlyContinue

    Write-Verbose "Getting status of database '$Name'"
    if ($currentDatabase) {
        $maxSizeGBState = $currentDatabase.MaxSizeGB
        $collationState = $currentDatabase.CollationName
        $editionState = $currentDatabase.Edition
        $ensureState = "Present"
        
    } else {
        $ensureState = "Absent"
    }

    $returnValue = @{
        Name = $nameState
        MaximumSizeInGB = $maxSizeGBState
        Collation = $collationState
        Edition = $editionState
        ServerCredential = $serverCredentialState
        ServerName = $serverNameState
        Ensure = $ensureState
    }

    $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [System.UInt32]
        $MaximumSizeInGB = 1,

        [System.String]
        $Collation = "SQL_Latin1_General_CP1_CI_AS",

        [System.String]
        $Edition = "Web",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $ServerCredential,

        [parameter(Mandatory = $true)]
        [System.String]
        $ServerName,

        [System.String]
        $AzureSubscriptionName,

        [System.String]
        $AzurePublishSettingsFile,

        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present"
    )
    # Verify that database server with given name exists
    Write-Verbose "Verifying that server '$ServerName' exists"
    
    try {
        $server = Get-AzureSqlDatabaseServer -ServerName $ServerName -ErrorAction Stop
        Write-Verbose "Server '$ServerName' exists"
    } catch [System.Exception] {
        # Throw exception if specified ServerName does not exist
        $errorMessage = $($LocalizedData.DatabaseServerNotExistsError) -f ${ServerName} 
        $errorMessage += "`nException message: `n" + $_
        Throw-InvalidOperationException -errorId "DatabaseServerNotExistsFailure" -errorMessage $errorMessage
    }

    # If we want to ensure database is present
    if ($Ensure -eq "Present")
    {     
        # Create database server context
        Write-Verbose "Creating database server context for $ServerName"
        $databaseServerContext = New-AzureSqlDatabaseServerContext -ServerName $ServerName -Credential $ServerCredential

        Write-Verbose "Checking whether Azure SQL database '$Name' exists"
        $database = Get-AzureSqlDatabase -ConnectionContext $databaseServerContext -DatabaseName $Name -ErrorAction SilentlyContinue

        if ($database) {
            Write-Verbose "Azure SQL database '$Name' exists."
            
            # Get passed values
            $splat = @{}
            $value = $null

            $paramName = "MaximumSizeInGB"
            if ($PSBoundParameters.TryGetValue($paramName, [ref]$value)) {
                $splat.Add("MaxSizeGB", $value)
            }
            
            $paramName = "Edition"
            if ($PSBoundParameters.TryGetValue($paramName, [ref]$value)) {
                $splat.Add($paramName, $value)
            }

            if ($splat.Count -ne 0) {
                # Update database with passed values
                Write-Verbose "Updating database '$Name' with properties specified by user."
                $database = Set-AzureSqlDatabase -ConnectionContext $databaseServerContext -DatabaseName $Name @splat -ErrorAction Stop
            } else {
                Write-Verbose "No need for updating database '$Name' cause no additional properties were passed by the user."
            }

            # If user specified collation which is different than current one, delete and recreate database (collation cannot be changed)
            $paramName = "Collation"
            if ($PSBoundParameters.TryGetValue($paramName, [ref]$value)) {
                if ($value -ne $database.CollationName) {
                    Write-Verbose "Collation was specified with value '$value' which is different than current collation: '$($database.CollationName)'. Will remove and recreate database."
                    Remove-AzureSqlDatabase -ConnectionContext $databaseServerContext -DatabaseName $Name -Force
                    Write-Verbose "Azure SQL database '$Name' has been removed. Recreating it..."
                    $database = New-AzureSqlDatabase -ConnectionContext $databaseServerContext -DatabaseName $Name -MaxSizeGB $MaximumSizeInGB -Collation $Collation -Edition $Edition -ErrorAction Stop
                    Write-Verbose "Azure SQL database '$Name' has been created"
                }
            }

        } else {
            Write-Verbose "Azure SQL database '$Name' does not exist. Creating it..."
            if ($Collation) {
                $database = New-AzureSqlDatabase -ConnectionContext $databaseServerContext -DatabaseName $Name -MaxSizeGB $MaximumSizeInGB -Collation $Collation -Edition $Edition -ErrorAction Stop
            } else {
                $database = New-AzureSqlDatabase -ConnectionContext $databaseServerContext -DatabaseName $Name -MaxSizeGB $MaximumSizeInGB -Edition $Edition -ErrorAction Stop
            }
            Write-Verbose "Azure SQL database '$Name' has been created"
        }
    }
    # If we want to ensure database is absent
    elseif ($Ensure -eq "Absent")
    {
        # Create database server context
        Write-Verbose "Creating database server context for $ServerName"
        $databaseServerContext = New-AzureSqlDatabaseServerContext -ServerName $ServerName -Credential $ServerCredential

        # Remove database
        Write-Verbose "Checking whether Azure SQL database '$Name' exists."
        $database = Get-AzureSqlDatabase -ConnectionContext $databaseServerContext -DatabaseName $Name -ErrorAction SilentlyContinue

        if ($database) {
            Write-Verbose "Azure SQL database '$Name' exists. Removing it..."
            Remove-AzureSqlDatabase -ConnectionContext $databaseServerContext -DatabaseName $Name -Force
            Write-Verbose "Azure SQL database '$Name' has been removed."
        } else {
            Write-Verbose "Azure SQL database '$Name' does not exist. No need to remove."
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
        [System.String]
        $Name,

        [System.UInt32]
        $MaximumSizeInGB = 1,

        [System.String]
        $Collation = "SQL_Latin1_General_CP1_CI_AS",

        [System.String]
        $Edition = "Web",

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $ServerCredential,

        [parameter(Mandatory = $true)]
        [System.String]
        $ServerName,

        [System.String]
        $AzureSubscriptionName,

        [System.String]
        $AzurePublishSettingsFile,

        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present"
    )
    
    $testResult = $true;

    # Select Azure subscription
    if ($AzureSubscriptionName -and $AzurePublishSettingsFile)
    {
        Write-Verbose "Azure Publish Setting provided. AzureSubscriptionName = $AzureSubscriptionName,  AzurePublishSettingsPath = $AzurePublishSettingsFile. Selecting Azure subscription."
        Import-AzurePublishSettingsFile -PublishSettingsFile $AzurePublishSettingsFile -ErrorAction SilentlyContinue
        Select-AzureSubscription -SubscriptionName $AzureSubscriptionName -Current -ErrorAction SilentlyContinue
        $currentSubscription = Get-AzureSubscription -Current
        Write-Verbose "The selected Azure subscription ID is $($currentSubscription.SubscriptionID)"
    }

    # Select Azure subscription
    if ($AzureSubscriptionName -and $AzurePublishSettingsFile)
    {
        Write-Verbose "Azure Publish Setting provided. AzureSubscriptionName = $AzureSubscriptionName,  AzurePublishSettingsFile = $AzurePublishSettingsFile. Selecting Azure subscription."
        Import-AzurePublishSettingsFile $AzurePublishSettingsFile
        Select-AzureSubscription -SubscriptionName $AzureSubscriptionName -Current -ErrorAction SilentlyContinue
        $currentSubscription = Get-AzureSubscription -Current
        Write-Verbose "The selected Azure subscription ID is $($currentSubscription.SubscriptionID)"
    }

    if ($Ensure -eq "Present")
    {
        # Verify that database server with given name exists
        Write-Verbose "Verifying that server '$ServerName' exists"

        try {
            $server = Get-AzureSqlDatabaseServer -ServerName $ServerName #-ErrorAction Stop
            Write-Verbose "Server '$ServerName' exists"
        } catch [System.Exception] {
            # Throw exception if specified ServerName does not exist
            $errorMessage = $($LocalizedData.DatabaseServerNotExistsError) -f ${ServerName} 
            $errorMessage += "`nException message: `n" + $_
            Throw-InvalidOperationException -errorId "DatabaseServerNotExistsFailure" -errorMessage $errorMessage
        }

        # Check whether database is in desired state
        Write-Verbose "Creating database server context for $ServerName"
        $databaseServerContext = New-AzureSqlDatabaseServerContext -ServerName $ServerName -Credential $ServerCredential

        Write-Verbose "Checking whether Azure SQL database '$Name' exists"
        $currentDatabase = Get-AzureSqlDatabase -ConnectionContext $databaseServerContext -DatabaseName $Name -ErrorAction SilentlyContinue

        if ($currentDatabase) {
        
            # Check whether current database properties match the specified ones
            $editionMatches = $currentDatabase.Edition.Equals($Edition)
            $maximumSizeInGBMatches = ($currentDatabase.MaxSizeGB -eq $MaximumSizeInGB)
            $collationMatches = $currentDatabase.CollationName.Equals($Collation)

            if ($editionMatches -and $maximumSizeInGBMatches -and $collationMatches) {
                Write-Verbose "Azure SQL database '$Name' exists and properties match."
            } else {
                # Check whether some of specified properties don't match
                $value = $null
                $paramNames = @("Edition", "MaximumSizeInGB", "Collation")
                $specifiedPropertiesMatch = $true
                foreach ($paramName in $paramNames) {
                    $paramMatches = (Get-Variable -Name ("$paramName" + "Matches"))
                    if (($PSBoundParameters.TryGetValue($paramName, [ref]$value)) -and (-not ($paramMatches.Value))) {
                        $testResult = $false
                        $specifiedPropertiesMatch = $false
                        Write-Verbose "Azure SQL database '$Name' exists but current $paramName value does not match desired value: $value. Resource is not in desired state."
                    }
                }  
                
                if ($specifiedPropertiesMatch) {
                    Write-Verbose "Azure SQL database '$Name' exists and specified properties match!"
                }            
            }

        } else {
            Write-Verbose "Azure SQL database '$Name' does not exist. Resource is not in desired state."
            $testResult = $false
        }
    } 
    elseif ($Ensure -eq "Absent") 
    {
        # Check whether database is in desired state
        Write-Verbose "Creating database server context for $ServerName"
        $databaseServerContext = New-AzureSqlDatabaseServerContext -ServerName $ServerName -Credential $ServerCredential

        Write-Verbose "Checking whether Azure SQL database '$Name' exists"
        $currentDatabase = Get-AzureSqlDatabase -ConnectionContext $databaseServerContext -DatabaseName $Name -ErrorAction SilentlyContinue

        if ($currentDatabase) {
            Write-Verbose "Azure SQL database '$Name' exists. Resource is not in desired state."
            $testResult = $false
        }
    }

    return $testResult
}

# Throws terminating error of category InvalidOperation with specified errorId and errorMessage
function Throw-InvalidOperationException
{
    param(
        [parameter(Mandatory = $true)]
        [System.String] 
        $errorId,
        [parameter(Mandatory = $true)]
        [System.String]
        $errorMessage
    )
    
    $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidOperation
    $exception = New-Object System.InvalidOperationException $errorMessage 
    $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception, $errorId, $errorCategory, $null
    throw $errorRecord
}

Export-ModuleMember -Function *-TargetResource



