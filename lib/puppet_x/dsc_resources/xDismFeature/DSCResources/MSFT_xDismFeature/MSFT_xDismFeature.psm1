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

    $DismFeatures = Get-DismFeatures

    if($DismFeatures."$Name" -eq $null)
    {
        Throw "Unknown feature!"
    }
    
    if($DismFeatures."$Name" -eq "Enabled")
    {
        $returnValue = @{
            Ensure = "Present"
            Name = $Name
        }
    }
    else
    {
        $returnValue = @{
            Ensure = "Absent"
            Name = $Name
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
        [System.String]
        $Name,

        [parameter(Mandatory = $false)]
        [System.String]
        $Source = $null
    )

    switch($Ensure)
    {
        "Present"
        {
            $dismParameters = @("/Online", "/Enable-Feature", "/FeatureName:$Name", "/Quiet", "/NoRestart")

            # Include sources directory if present
            if ($Source -ne $null)
            {
                Write-Verbose "Source location set: ${Source}"

                $dismParameters += "/Source:${Source}"
                $dismParameters += "/LimitAccess"
            }

            & dism.exe $dismParameters
        }
        "Absent"
        {
            & dism.exe /Online /Disable-Feature /FeatureName:$Name /quiet /norestart
        }
    }

    if(Test-Path -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending')
    {
        $global:DSCMachineStatus = 1
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
        $Name,

        [parameter(Mandatory = $false)]
        [System.String]
        $Source = $null
    )

    $result = ((Get-TargetResource -Name $Name).Ensure -eq $Ensure)
    
    $result
}


function Get-DismFeatures
{
    $DismGetFeatures = & dism.exe /Online /Get-Features
    $DismFeatures = @{}
    foreach($Line in $DismGetFeatures)
    {
        switch($Line.Split(":")[0].Trim())
        {
            "Feature Name"
            {
                $FeatureName = $Line.Split(":")[1].Trim()
            }
            "State"
            {
                $DismFeatures += @{$FeatureName = $Line.Split(":")[1].Trim()}         
            }
        }
    }

    $DismFeatures
}


Export-ModuleMember -Function *-TargetResource

