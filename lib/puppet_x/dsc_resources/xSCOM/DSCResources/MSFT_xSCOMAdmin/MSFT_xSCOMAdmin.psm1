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
        $Principal,

        [parameter(Mandatory = $true)]
        [System.String]
        $UserRole,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCOMAdminCredential
    )

    $Ensure = Invoke-Command -ComputerName . -Credential $SCOMAdminCredential -Authentication Credssp {
        $Ensure = $args[0]
        $Principal = $args[1]
        $UserRole = $args[2]
        $InstallPath = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\System Center Operations Manager\12\Setup" -Name "InstallDirectory").InstallDirectory
        if(!(Get-Module -Name OperationsManager))
        {
            Import-Module "$InstallPath\PowerShell\OperationsManager"
        }
        if(Get-Module -Name OperationsManager)
        {
            if(Get-SCOMUserRole -Name $UserRole | ForEach-Object {$_.Users} | Where-Object {$_ -eq $Principal})
            {
                "Present"
            }
            else
            {
                "Absent"
            }
        }
    } -ArgumentList @($Ensure,$Principal,$UserRole)

    $returnValue = @{
        Ensure = $Ensure
        Principal = $Principal
        UserRole = $UserRole
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
        $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [System.String]
        $Principal,

        [parameter(Mandatory = $true)]
        [System.String]
        $UserRole,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCOMAdminCredential
    )

    Invoke-Command -ComputerName . -Credential $SCOMAdminCredential -Authentication Credssp {
        $Ensure = $args[0]
        $Principal = $args[1]
        $UserRole = $args[2]
        $InstallPath = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\System Center Operations Manager\12\Setup" -Name "InstallDirectory").InstallDirectory
        if(!(Get-Module -Name OperationsManager))
        {
            Import-Module "$InstallPath\PowerShell\OperationsManager"
        }
        if(Get-Module -Name OperationsManager)
        {
            $UR = Get-SCOMUserRole -Name $UserRole
            switch($Ensure)
            {
                "Present"
                {
                    if(!(Get-SCOMUserRole -Name $UserRole | ForEach-Object {$_.Users} | Where-Object {$_ -eq $Principal}))
                    {
                        $NewUsers = ($UR.Users + $Principal)
                    }
                }
                "Absent"
                {
                    if(Get-SCOMUserRole -Name $UserRole | ForEach-Object {$_.Users} | Where-Object {$_ -eq $Principal})
                    {
                        $NewUsers = $UR.Users | Where-Object {$_ -ne $Principal}
                    }
                }
            }
            Set-SCOMUserRole -UserRole $UR -User $NewUsers
        }
    } -ArgumentList @($Ensure,$Principal,$UserRole)

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
        $Principal,

        [parameter(Mandatory = $true)]
        [System.String]
        $UserRole,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCOMAdminCredential
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)

    $result
}


Export-ModuleMember -Function *-TargetResource
