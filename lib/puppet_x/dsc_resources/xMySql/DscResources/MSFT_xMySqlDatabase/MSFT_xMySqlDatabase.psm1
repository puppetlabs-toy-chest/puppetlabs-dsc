# NOTE: LocalizedData isn't used in this resource as there are no interactive/user visible strings

$ErrorPath = Join-Path -Path "$env:Temp" -ChildPath "MySQLErrors.txt"

function Get-TargetResource
{
    [OutputType([Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $DatabaseName,
        
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
  
    $arguments = "--execute=SELECT IF(EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '$DatabaseName'), 'Yes','No')", `
        "--user=root", "--password=$($RootCredential.GetNetworkCredential().Password)", "--port=$(Get-MySqlPort -MySqlVersion $MySqlVersion)", "--silent"
    $result = Invoke-MySqlCommand -CommandPath $(Get-MySqlExe -MySqlVersion $MySqlVersion) -Arguments $arguments 2>$ErrorPath

    Read-ErrorFile -ErrorFilePath $ErrorPath

    if ($result -eq  "Yes")
    {
         $Ensure = "Present"
    }
    else
    {
        $Ensure = "Absent"
    }

    return @{
        Ensure = $Ensure
        DatabaseName = $DatabaseName
    }
}

function Set-TargetResource 
{
    param
    (
        [ValidateSet("Present", "Absent")]
        [string] $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $DatabaseName,
        
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
        Write-Verbose "Creating Database $DatabaseName..."
        $arguments = "--execute=CREATE DATABASE $DatabaseName", "--user=root", "--password=$($RootCredential.GetNetworkCredential().Password)", `
            "--port=$(Get-MySqlPort -MySqlVersion $MySqlVersion)", "--silent"
        $null = Invoke-MySqlCommand -CommandPath $(Get-MySqlExe -MySqlVersion $MySqlVersion) -Arguments $arguments 2>$ErrorPath
    }
    else
    {
        Write-Verbose "Dropping Database $DatabaseName..."
        $arguments = "--execute=DROP DATABASE $DatabaseName", "--user=root", "--password=$($RootCredential.GetNetworkCredential().Password)", `
            "--port=$(Get-MySqlPort -MySqlVersion $MySqlVersion)", "--silent"
        $null = Invoke-MySqlCommand -CommandPath $(Get-MySqlExe -MySqlVersion $MySqlVersion) -Arguments $arguments 2>$ErrorPath
    }

    Read-ErrorFile -ErrorFilePath $ErrorPath
}

function Test-TargetResource 
{
    [OutputType([Boolean])]
    [CmdletBinding(SupportsShouldProcess=$true)]
    param
    (
        [ValidateSet("Present", "Absent")]
        [string] $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $DatabaseName,
        
        [parameter(Mandatory = $true)]
        [pscredential] $RootCredential,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $MySqlVersion
    )
    
    Write-Verbose "Ensure is $Ensure"

    $status = Get-TargetResource -DatabaseName $DatabaseName -RootCredential $RootCredential -MySqlVersion $MySqlVersion
    
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

