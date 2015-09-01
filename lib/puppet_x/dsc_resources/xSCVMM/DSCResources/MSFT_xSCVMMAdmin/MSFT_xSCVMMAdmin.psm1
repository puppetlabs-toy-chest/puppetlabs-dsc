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
        $SCVMMAdminCredential
    )

    $Ensure = Invoke-Command -ComputerName . -Credential $SCVMMAdminCredential {
        $Ensure = $args[0]
        $Principal = $args[1]
        $UserRole = $args[2]
        if(Get-SCUserRole -VMMServer $env:COMPUTERNAME -Name $UserRole | ForEach-Object {$_.Members} | Where-Object {$_.Name -eq $Principal})
        {
            "Present"
        }
        else
        {
            "Absent"
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
        $SCVMMAdminCredential
    )

    Invoke-Command -ComputerName . -Credential $SCVMMAdminCredential {
        $Ensure = $args[0]
        $Principal = $args[1]
        $UserRole = $args[2]
        switch($Ensure)
        {
            "Present"
            {
                if(!(Get-SCUserRole -VMMServer $env:COMPUTERNAME -Name $UserRole | ForEach-Object {$_.Members} | Where-Object {$_.Name -eq $Principal}))
                {
                    Get-SCUserRole -VMMServer $env:COMPUTERNAME -Name $UserRole | Set-SCUserRole -AddMember $Principal
                }
            }
            "Absent"
            {
                if(Get-SCUserRole -VMMServer $env:COMPUTERNAME -Name $UserRole | ForEach-Object {$_.Members} | Where-Object {$_.Name -eq $Principal})
                {
                    Get-SCUserRole -VMMServer $env:COMPUTERNAME -Name $UserRole | Set-SCUserRole -RemoveMember $Principal
                }
            }
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
        $SCVMMAdminCredential
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)

    $result
}


Export-ModuleMember -Function *-TargetResource
