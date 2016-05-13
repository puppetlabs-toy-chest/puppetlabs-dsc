# This module only supports a subset of the possible database privileges
# A global variable that contains localized messages of MySqlGrant.
data LocalizedData
{
# culture="en-US"
ConvertFrom-StringData @'
GrantCreated=Grant {0} for user {1} created successfully.
GrantRemoved=Grant {0} for user {1} removed successfully.
InvalidUserName=The name {0} does not exist.
InvalidPermissionType=The permission type {0} cannot be used.
GrantExists=A user with the name {0} exists.
GrantDoesNotExist=A user with the name {0} does not exist.
'@
}

Import-LocalizedData LocalizedData -FileName MSFT_xMySqlGrant.strings.psd1

$ErrorPath = Join-Path -Path "$env:Temp" -ChildPath "MySQLErrors.txt"

function Get-TargetResource
{
    [OutputType([Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $UserName,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $DatabaseName,
      
        [parameter(Mandatory = $true)]
        [pscredential] $RootCredential,

        [parameter(Mandatory = $true)]
        [ValidateSet("ALL PRIVILEGES", "CREATE", "DROP", "DELETE", "INSERT", "SELECT", "UPDATE", "EXECUTE")]
        [ValidateNotNullOrEmpty()]
        [string] $PermissionType,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $MySqlVersion
    )
    
    if (Test-Path $ErrorPath)
    {
        Remove-Item -Path $ErrorPath
    }
  
    $arguments = "--execute=SHOW GRANTS FOR '$UserName'@localhost", "--user=root", "--password=$($RootCredential.GetNetworkCredential().Password)", `
        "--port=$(Get-MySqlPort -MySqlVersion $MySqlVersion)", "--silent"
    $results = Invoke-MySqlCommand -CommandPath $(Get-MySqlExe -MySqlVersion $MySqlVersion) -Arguments $arguments 2>$ErrorPath
    
    Read-ErrorFile -ErrorFilePath $ErrorPath

    $ensureResult = "Absent"

    ForEach ($result in $results)
    {
        if ($result -match $DatabaseName)
        {
            if (($result -match $PermissionType) -or ($result -match "ALL PRIVILEGES"))
            {
                $ensureResult = "Present"
                break
            }
        }
    }

    return @{
        UserName         = $UserName
        DatabaseName     = $DatabaseName
        Ensure           = $ensureResult
        PermissionType   = $PermissionType
    }
}

function Set-TargetResource 
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $UserName,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $DatabaseName,
      
        [ValidateSet("Present", "Absent")]
        [string] $Ensure = "Present",  
       
        [parameter(Mandatory = $true)]
        [pscredential] $RootCredential,

        [parameter(Mandatory = $true)]
        [ValidateSet("ALL PRIVILEGES", "CREATE", "DROP", "DELETE", "INSERT", "SELECT", "UPDATE", "EXECUTE")]
        [ValidateNotNullOrEmpty()]
        [string] $PermissionType,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $MySqlVersion
    )
    
    if (Test-Path $ErrorPath)
    {
        Remove-Item -Path $ErrorPath
    }
  
    if($Ensure -eq "Present")
    {        
        Write-Verbose "Granting $PermissionType on $DatabaseName to $UserName..."

        $arguments = "--execute=GRANT $PermissionType ON $DatabaseName.* TO '$UserName'@localhost", "--user=root", `
            "--password=$($RootCredential.GetNetworkCredential().Password)", "--port=$(Get-MySqlPort -MySqlVersion $MySqlVersion)", "--silent"
        $null = Invoke-MySqlCommand -CommandPath $(Get-MySqlExe -MySqlVersion $MySqlVersion) -Arguments $arguments 2>$ErrorPath
                   
        $msg = $($LocalizedData.GrantCreated) -f $PermissionType, $UserName
    }
    else
    {        
        Write-Verbose "Revoking $PermissionType on $DatabaseName to $UserName..."

        $arguments = "--execute=REVOKE $PermissionType ON $DatabaseName.* FROM '$UserName'@localhost", "--user=root", `
            "--password=$($RootCredential.GetNetworkCredential().Password)", "--port=$(Get-MySqlPort -MySqlVersion $MySqlVersion)", "--silent"
        $null = Invoke-MySqlCommand -CommandPath $(Get-MySqlExe -MySqlVersion $MySqlVersion) -Arguments $arguments 2>$ErrorPath

        $msg = $($LocalizedData.GrantRemoved) -f $PermissionType, $UserName
    }

    Read-ErrorFile -ErrorFilePath $ErrorPath

    Write-Verbose -Message $msg   
}

function Test-TargetResource 
{
    [OutputType([Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $UserName,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $DatabaseName,
       
        [ValidateSet("Present", "Absent")]
        [string] $Ensure = "Present",  
       
        [parameter(Mandatory = $true)]
        [pscredential] $RootCredential,

        [parameter(Mandatory = $true)]
        [ValidateSet("ALL PRIVILEGES", "CREATE", "DROP", "DELETE", "INSERT", "SELECT", "UPDATE", "EXECUTE")]
        [ValidateNotNullOrEmpty()]
        [string] $PermissionType,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $MySqlVersion
    )
    
    Write-Verbose "Ensure is $Ensure"

    $status = Get-TargetResource -UserName $UserName -DatabaseName $DatabaseName -RootCredential $RootCredential -PermissionType $PermissionType -MySqlVersion $MySqlVersion
    
    if($status['Ensure'] -eq $Ensure)
    {
        return $true
    }
    else
    {
        return $false
    }
}

Export-ModuleMember -function Get-TargetResource, Set-TargetResource, Test-TargetResource

