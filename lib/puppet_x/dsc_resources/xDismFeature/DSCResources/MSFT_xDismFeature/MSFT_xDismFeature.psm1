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
        $Source
    )

    switch($Ensure)
    {
        "Present"
        {
            $dismArguments = @("/Online", "/Enable-Feature", "/FeatureName:$Name", "/Quiet", "/NoRestart")

            # Include sources directory if present
            if ($Source)
            {
                Write-Verbose "Source location set: ${Source}"

                $dismArguments += "/Source:${Source}"
                $dismArguments += "/LimitAccess"
            }

            Invoke-Dism -Arguments $dismArguments
        }
        "Absent"
        {
            Invoke-Dism -Arguments @("/Online", "/Disable-Feature", "/FeatureName:$Name", "/quiet", "/norestart")
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
    $DismGetFeatures = Invoke-Dism -Arguments @('/Online', '/Get-Features', '/English')
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


function Invoke-Dism
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String[]]
        $Arguments
    )

    & Dism.exe $Arguments
}


Export-ModuleMember -Function *-TargetResource

