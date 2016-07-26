
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [String] $Number,
        
        [Parameter(Mandatory = $false)]
        [ValidateSet('Present', 'Absent')]
        [String] $Ensure = 'Present',

        [Parameter(Mandatory = $false)]
        [String] $Label
    )
        
    if ($null -ne ($DiskInstance = Get-CimInstance -ClassName MSCluster_Disk -Namespace 'Root\MSCluster' -Filter "Number = $Number"))
    {
        $DiskResource = Get-ClusterResource |
                            Where-Object { $_.ResourceType -eq 'Physical Disk' } |
                                Where-Object { ($_ | Get-ClusterParameter -Name DiskIdGuid).Value -eq $DiskInstance.Id }

        @{
            Number = $Number
            Ensure = 'Present'
            Label  = $DiskResource.Name
        }
    }
    else
    {
        @{
            Number = $Number
            Ensure = 'Absent'
            Label  = ''
        }
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [String] $Number,
        
        [Parameter(Mandatory = $false)]
        [ValidateSet('Present', 'Absent')]
        [String] $Ensure = 'Present',

        [Parameter(Mandatory = $false)]
        [String] $Label
    )

    if (-not (Test-TargetResource -Number $Number -Ensure $Ensure -Label $Label))
    {
        $CurrentDisk = Get-TargetResource -Number $Number

        if ($Ensure -eq 'Present')
        {
            if ($CurrentDisk.Ensure -ne $Ensure)
            {
                Write-Verbose "Add the disk $Number to the cluster"

                Get-ClusterAvailableDisk | Where-Object { $_.Number -eq $Number } | Add-ClusterDisk
            }

            if ($CurrentDisk.Label -ne $Label)
            {
                Write-Verbose "Set the disk $Number label to '$Label'"

                $DiskInstance = Get-CimInstance -ClassName MSCluster_Disk -Namespace 'Root\MSCluster' -Filter "Number = $Number"

                $DiskResource = Get-ClusterResource |
                                    Where-Object { $_.ResourceType -eq 'Physical Disk' } |
                                        Where-Object { ($_ | Get-ClusterParameter -Name DiskIdGuid).Value -eq $DiskInstance.Id }

                # Set the label of the cluster disk
                $DiskResource.Name = $Label
                $DiskResource.Update()
            }
        }
        else
        {
            Write-Verbose "Remove the disk $Number from the cluster"

            $DiskInstance = Get-CimInstance -ClassName MSCluster_Disk -Namespace 'Root\MSCluster' -Filter "Number = $Number"

            $DiskResource = Get-ClusterResource |
                                Where-Object { $_.ResourceType -eq 'Physical Disk' } |
                                    Where-Object { ($_ | Get-ClusterParameter -Name DiskIdGuid).Value -eq $DiskInstance.Id }
            
            # Remove the cluster disk
            $DiskResource | Remove-ClusterResource -Force
        }
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [String] $Number,
        
        [Parameter(Mandatory = $false)]
        [ValidateSet('Present', 'Absent')]
        [String] $Ensure = 'Present',

        [Parameter(Mandatory = $false)]
        [String] $Label
    )
    
    $CurrentDisk = Get-TargetResource -Number $Number
    
    if($Ensure -eq 'Present')
    {
        return (
            ($Ensure -eq $CurrentDisk.Ensure) -and
            (($Label -eq $CurrentDisk.Label) -or (-not $PSBoundParameters.ContainsKey('Label')))
        )
    }
    else
    {
        return $Ensure -eq $CurrentDisk.Ensure
    }
}

Export-ModuleMember -Function *-TargetResource
