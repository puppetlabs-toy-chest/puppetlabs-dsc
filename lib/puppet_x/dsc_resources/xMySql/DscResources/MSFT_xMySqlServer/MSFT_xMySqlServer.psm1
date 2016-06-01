# NOTE: LocalizedData isn't used in this resource as there are no interactive/user visible strings

function Get-TargetResource
{
    [OutputType([Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $MySqlVersion,
        
        [parameter(Mandatory = $true)]
        [pscredential] $RootPassword
    )
    
    $MySqlInstalled = (Get-MySqlVersionInstalled -MySqlVersion $MySqlVersion)

    if ($MySqlInstalled)
    {
        $ensureResult = "Present"
        $portResult = (Get-MySqlPort -MySqlVersion $MySqlVersion)
    }
    else
    {
        $ensureResult = "Absent"
        $portResult = $null
    }

    return @{
        Ensure       = $ensureResult
        MySqlVersion = $MySqlVersion
        Port         = $portResult
    }
}

function Set-TargetResource 
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $MySqlVersion,

        [ValidateSet("Present", "Absent")]
        [string] $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [pscredential] $RootPassword,

        [string] $Port = "3306"
        
    )
    
    if ($Ensure -eq "Present")
    {
        $versionsInstalled = Get-MySqlAllInstalled

        if ($versionsInstalled -eq $null)
        {
            Write-Verbose "Installing MySQL..."
            $arguments = "community", "install", `
                "server;$MySqlVersion;$(Get-ArchitectureName):*:servertype=Server;port=$Port;passwd=$($RootPassword.GetNetworkCredential().Password)", "-silent"
            $null = Invoke-MySqlCommand -CommandPath $(Get-MySqlInstallerConsole) -Arguments $arguments
        }
        else
        {
            Write-Verbose "Updating/Upgrading is not currently implemented"
        }
    }
    else
    {
        Write-Verbose "Uninstall is not currently implemented"
    }

}

function Test-TargetResource 
{
    [OutputType([Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $MySqlVersion,
        
        [ValidateSet("Present", "Absent")]
        [string] $Ensure = "Present",
        
        [parameter(Mandatory = $true)]
        [pscredential] $RootPassword,

        [string] $Port = "3306"

    )
    
    Write-Verbose "Ensure is $Ensure"

    $status = Get-TargetResource -MySqlVersion $MySqlVersion -RootPassword $RootPassword

    # don't yet check if the root password matches
    if(($status['Ensure'] -eq $Ensure) -and ($status['Port'] -eq $Port))
    {
        return $true
    }
    else
    {
        return $false
    }
}

Export-ModuleMember -function Get-TargetResource, Set-TargetResource, Test-TargetResource

