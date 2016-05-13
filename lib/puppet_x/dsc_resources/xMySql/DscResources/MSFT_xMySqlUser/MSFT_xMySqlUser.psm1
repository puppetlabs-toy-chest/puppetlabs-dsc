# A global variable that contains localized messages of MySqlUser.
data LocalizedData
{
# culture="en-US"
ConvertFrom-StringData @'
UserCreated=User {0} created successfully.
UserRemoved=User {0} removed successfully.
UserExists=A user with the name {0} exists.
UserDoesNotExist=A user with the name {0} does not exist.
'@
}

Import-LocalizedData LocalizedData -FileName MSFT_xMySqlUser.strings.psd1

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
        [pscredential] $UserCredential,

        [parameter(Mandatory = $true)]
        [pscredential] $RootCredential,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $MySqlVersion    
    )
    
    if (Test-Path $ErrorPath)
    {
        Remove-Item -Path $ErrorPath
    }

    $arguments = "--execute=SELECT IF(EXISTS (SELECT USER FROM MYSQL.USER WHERE USER = '$UserName' AND HOST = 'localhost'), 'Yes','No')", "--user=root", `
        "--password=$($RootCredential.GetNetworkCredential().Password)", "--port=$(Get-MySqlPort -MySqlVersion $MySqlVersion)", "--silent"
    $result = Invoke-MySqlCommand -CommandPath $(Get-MySqlExe -MySqlVersion $MySqlVersion) -Arguments $arguments 2>$ErrorPath

    Read-ErrorFile -ErrorFilePath $ErrorPath

    if($result -ieq  "Yes")
    {
        $msg = $($LocalizedData.UserExists) -f "$UserName"
        Write-Verbose -Message $msg          
        $ensureResult = "Present"
    }
    else
    {
        $msg = $($LocalizedData.UserDoesNotExist) -f "$UserName"
        Write-Verbose -Message $msg          
        $ensureResult = "Absent"
    }

    return @{
        UserName = $UserName
        Ensure = $ensureResult
    }
}

function Set-TargetResource 
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $UserName,

        [ValidateSet("Present", "Absent")]
        [string] $Ensure = "Present",
        
        [parameter(Mandatory = $true)]
        [pscredential] $UserCredential,

        [parameter(Mandatory = $true)]
        [pscredential] $RootCredential,

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
        Write-Verbose -Message "Adding user $UserName..."           
        $arguments = "--execute=CREATE USER '$UserName'@'localhost' IDENTIFIED BY '$($UserCredential.GetNetworkCredential().Password)'", "--user=root", `
            "--password=$($RootCredential.GetNetworkCredential().Password)", "--port=$(Get-MySqlPort -MySqlVersion $MySqlVersion)", "--silent"
        $null = Invoke-MySqlCommand -CommandPath $(Get-MySqlExe -MySqlVersion $MySqlVersion) -Arguments $arguments 2>$ErrorPath
        $msg = $($LocalizedData.UserCreated) -f "$UserName"
        Write-Verbose -Message $msg       
    }
    else
    {        
        Write-Verbose "Dropping user $UserName..."
        $arguments = "--execute=DROP USER '$UserName'@'localhost'", "--user=root", "--password=$($RootCredential.GetNetworkCredential().Password)", `
            "--port=$(Get-MySqlPort -MySqlVersion $MySqlVersion)", "--silent"
        $null = Invoke-MySqlCommand -CommandPath $(Get-MySqlExe -MySqlVersion $MySqlVersion) -Arguments $arguments 2>$ErrorPath
        $msg = $($LocalizedData.UserRemoved) -f "$UserName"
        Write-Verbose -Message $msg  
    }

    Read-ErrorFile -ErrorFilePath $ErrorPath
}

function Test-TargetResource 
{
    [OutputType([Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $UserName,
      
        [ValidateSet("Present", "Absent")]
        [string] $Ensure = "Present",
       
        [parameter(Mandatory = $true)]
        [pscredential] $UserCredential,

        [parameter(Mandatory = $true)]
        [pscredential] $RootCredential,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $MySqlVersion
    )
    
    Write-Verbose "Ensure is $Ensure"

    $status = Get-TargetResource -UserName $UserName -UserCredential $UserCredential -RootCredential $RootCredential -MySqlVersion $MySqlVersion
    
    if($status.Ensure -eq $Ensure)
    {
        return $true
    }
    else
    {
        return $false
    }
}

Export-ModuleMember -function Get-TargetResource, Set-TargetResource, Test-TargetResource

