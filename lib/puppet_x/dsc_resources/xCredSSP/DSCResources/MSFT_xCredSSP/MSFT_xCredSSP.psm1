function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Server","Client")]
        [System.String]
        $Role
    )

    switch($Role)
    {
        "Server"
        {
            $RegKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WSMAN\Service"
        }
        "Client"
        {
            $RegKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WSMAN\Client"
        }
    }

    if(Get-ItemProperty -Path $RegKey -Name "auth_credssp" -ErrorAction SilentlyContinue)
    {
        $Setting = (Get-ItemProperty -Path $RegKey -Name "auth_credssp").auth_credssp
    }
    else
    {
        $Setting = 0
    }

    switch($Role)
    {
        "Server"
        {
            switch($Setting)
            {
                1
                {
                    $returnValue = @{
                        Ensure = "Present";
                        Role = "Server"
                    }
                }
                0
                {
                    $returnValue = @{
                        Ensure = "Absent";
                        Role = "Server"
                    }
                }
            }
        }
        "Client"
        {
            switch($Setting)
            {
                1
                {   
                    $DelegateComputers = @()
                    foreach($DelegateComputer in (Get-WSManCredSSP)[0].Split(","))
                    {
                        $DelegateComputers += $DelegateComputer.Split("/")[1]
                    }
                    $DelegateComputers = $DelegateComputers | Sort-Object -Unique

                    $returnValue = @{
                        Ensure = "Present";
                        Role = "Client";
                        DelegateComputers = @($DelegateComputers)
                    }
                }
                0
                {
                    $returnValue = @{
                        Ensure = "Absent";
                        Role = "Client"
                    }
                }
            }
        }
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
        [ValidateSet("Server","Client")]
        [System.String]
        $Role,

        [System.String[]]
        $DelegateComputers
    )

    switch($Role)
    {
        "Server"
        {
            switch($Ensure)
            {
                "Present"
                {
                    Enable-WSManCredSSP -Role Server -Force
                    $global:DSCMachineStatus = 1
                }
                "Absent"
                {
                    Disable-WSManCredSSP -Role Server
                }
            }
        }
        "Client"
        {
            switch($Ensure)
            {
                "Present"
                {
                    if($DelegateComputers)
                    {
                        $CurrentDelegateComputer = (Get-WSManCredSSP)[0]
                        foreach($DelegateComputer in $DelegateComputers)
                        {
                            if(!$CurrentDelegateComputer.Contains("wsman/$DelegateComputer"))
                            {
                                Enable-WSManCredSSP -Role Client -DelegateComputer $DelegateComputer -Force
                                $global:DSCMachineStatus = 1
                            }
                        }
                    }
                    else
                    {
                        Throw "DelegateComputers is required!"
                    }
                }
                "Absent"
                {
                    Disable-WSManCredSSP -Role Client
                }
            }
        }
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
        [ValidateSet("Server","Client")]
        [System.String]
        $Role,

        [System.String[]]
        $DelegateComputers
    )

    $CredSSP = Get-TargetResource -Role $Role

    switch($Role)
    {
        "Server"
        {
            return ($CredSSP.Ensure -eq $Ensure)
        }
        "Client"
        {
            switch($Ensure)
            {
                "Present"
                {
                    $CorrectDelegateComputers = $true
                    if($DelegateComputers)
                    {
                        foreach($DelegateComputer in $DelegateComputers)
                        {
                            if(!($CredSSP.DelegateComputers | Where-Object {$_ -eq $DelegateComputer}))
                            {
                                $CorrectDelegateComputers = $false
                            }
                        }
                    }
                    $result = (($CredSSP.Ensure -eq $Ensure) -and $CorrectDelegateComputers)
                }
                "Absent"
                {
                    $result = ($CredSSP.Ensure -eq $Ensure)
                }
            }
        }
    }

    $result
}


Export-ModuleMember -Function *-TargetResource

