data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
DacFxInstallationError=Please ensure that DacFx is installed.
SmoFxInstallationError=Please ensure that Smo is installed.
DacPacExtractionError=Extracting DacPac for Db failed, continuing with Dac Deployment.
'@
}

Import-Module -DisableNameChecking $PSScriptRoot\..\xDatabase_Common

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

Export-ModuleMember -Function *-TargetResource

