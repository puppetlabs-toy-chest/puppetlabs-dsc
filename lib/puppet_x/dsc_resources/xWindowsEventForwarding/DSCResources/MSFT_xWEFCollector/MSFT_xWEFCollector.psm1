function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name
    )

    $ServiceStartMode = (Get-WmiObject -Query "Select * From Win32_Service Where Name='Wecsvc'").StartMode
    $Ensure = if ($ServiceStartMode -eq 'Auto') {'Present'} else {'Absent'}


    $returnValue = @{
        Ensure = [System.String]$Ensure
        Name = [System.String]$Name
    }

    $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name
    )
    
    if ($Ensure -eq 'Present') {wecutil qc /q}
    if ($Ensure -eq 'Absent') {
        Stop-Service Wecsvc
        $Service = Get-WmiObject -Query "Select * From Win32_Service Where Name='Wecsvc'"
        $Service.ChangeStartMode("Disabled")
        }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name
    )

    $ServiceStartMode = (Get-WmiObject -Query "Select * From Win32_Service Where Name='Wecsvc'").StartMode
    
    if ($Ensure -eq 'Present') {
        if ($ServiceStartMode -eq 'Auto') {$result = [System.Boolean]$true} else {$result = [System.Boolean]$false}
        }
    if ($Ensure -eq 'Absent') {
        if ($ServiceStartMode -eq 'Disabled') {$result = [System.Boolean]$true} else {$result = [System.Boolean]$false}
    }
    
    $result
}


Export-ModuleMember -Function *-TargetResource

