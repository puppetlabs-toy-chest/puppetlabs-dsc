function Get-TargetResource
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
        $ServerName,

        [parameter(Mandatory = $true)]
        [ValidateSet("DatabaseConnectionString","EndPointConnectionString")]
        [System.String]
        $SettingType,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String]
        $Value,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCSPFAdminCredential
    )

    $returnValue = Invoke-Command -ComputerName . -Credential $SCSPFAdminCredential -Authentication Credssp {
        $ServerName = $args[0]
        $Name = $args[1]
        $Value = $args[2]
        $SettingType = $args[3]
        if(!(Get-Module spfadmin))
        {
            Import-Module spfadmin
        }
        if(Get-Module spfadmin)
        {
            $SpfSetting = Get-SCSpfSetting -ServerName $ServerName -SettingType $SettingType | Where-Object {$_.Name -eq $Name}
            if($SpfSetting.Value -eq $Value)
            {
                $Ensure = "Present"
            }
            else
            {
                $Ensure = "Absent"
            }
        }
        else
        {
            $Ensure = "Absent"
        }
        @{
            Ensure = $Ensure
            ServerName = $ServerName
            Name = $Name
            Value = $SpfSetting.Value
            SettingType = $SettingType
        }
    } -ArgumentList @($ServerName,$Name,$Value,$SettingType)

    $returnValue
}


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
        $ServerName,

        [parameter(Mandatory = $true)]
        [ValidateSet("DatabaseConnectionString","EndPointConnectionString")]
        [System.String]
        $SettingType,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String]
        $Value,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCSPFAdminCredential
    )

    Invoke-Command -ComputerName . -Credential $SCSPFAdminCredential -Authentication Credssp {
        $Ensure = $args[0]
        $ServerName = $args[1]
        $Name = $args[2]
        $Value = $args[3]
        $SettingType = $args[4]
        if(!(Get-Module spfadmin))
        {
            Import-Module spfadmin
        }
        if(Get-Module spfadmin)
        {
            if(Get-SCSpfSetting -ServerName $ServerName -SettingType $SettingType | Where-Object {$_.Name -eq $Name})
            {
                Get-SCSpfSetting -ServerName $ServerName -SettingType $SettingType | Where-Object {$_.Name -eq $Name} | Remove-SCSpfSetting
            }
            if($Ensure -eq "Present")
            {
                New-SCSpfSetting -ServerName $ServerName -SettingType $SettingType -Name $Name -Value $Value.ToLower()
            }
        }
    } -ArgumentList @($Ensure,$ServerName,$Name,$Value,$SettingType)


    if(!(Test-TargetResource @PSBoundParameters))
    {
        throw "Set-TargetResouce failed"
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
        $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [System.String]
        $ServerName,

        [parameter(Mandatory = $true)]
        [ValidateSet("DatabaseConnectionString","EndPointConnectionString")]
        [System.String]
        $SettingType,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String]
        $Value,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCSPFAdminCredential
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)
    
    $result
}


Export-ModuleMember -Function *-TargetResource
