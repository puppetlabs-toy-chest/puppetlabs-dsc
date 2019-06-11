Import-Module -Name (Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) `
                               -ChildPath 'CommonResourceHelper.psm1')

$script:localizedData = Get-LocalizedData -ResourceName 'MSFT_xClusterDisk'

<#
    .SYNOPSIS
        Returns the current state of the failover cluster disk resource.

    .PARAMETER Number
        The disk number of the cluster disk.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Number
    )

    Write-Verbose -Message ($script:localizedData.GetClusterDiskInformation -f $Number)

    if ($null -ne ($diskInstance = Get-CimInstance -ClassName MSCluster_Disk -Namespace 'Root\MSCluster' -Filter "Number = $Number"))
    {
        $diskResource = Get-ClusterResource |
                            Where-Object -FilterScript { $_.ResourceType -eq 'Physical Disk' } |
                                Where-Object -FilterScript { ($_ | Get-ClusterParameter -Name DiskIdGuid).Value -eq $diskInstance.Id }

        @{
            Number = $Number
            Ensure = 'Present'
            Label  = $diskResource.Name
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

<#
    .SYNOPSIS
        Adds or removed the failover cluster disk resource from the failover cluster.

    .PARAMETER Number
        The disk number of the cluster disk.

    .PARAMETER Ensure
        Define if the cluster disk should be added (Present) or removed (Absent).
        Default value is 'Present'.

    .PARAMETER Label
        The disk label that should be assigned to the disk on the Failover Cluster
        disk resource.
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Number,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String]
        $Label
    )

    $getTargetResourceResult = Get-TargetResource -Number $Number

    if ($Ensure -eq 'Present')
    {
        if ($getTargetResourceResult.Ensure -ne $Ensure)
        {
            Write-Verbose -Message ($script:localizedData.AddDiskToCluster -f $Number)

            Get-ClusterAvailableDisk | Where-Object -FilterScript {
                $_.Number -eq $Number
            } | Add-ClusterDisk
        }

        if ($getTargetResourceResult.Label -ne $Label)
        {
            Write-Verbose -Message ($script:localizedData.SetDiskLabel -f $Number, $Label)

            $diskInstance = Get-CimInstance -ClassName MSCluster_Disk -Namespace 'Root\MSCluster' -Filter "Number = $Number"

            $diskResource = Get-ClusterResource |
                Where-Object -FilterScript { $_.ResourceType -eq 'Physical Disk' } |
                    Where-Object -FilterScript {
                        ($_ | Get-ClusterParameter -Name DiskIdGuid).Value -eq $diskInstance.Id
                    }

            # Set the label of the cluster disk
            $diskResource.Name = $Label
            $diskResource.Update()
        }
    }
    else
    {
        if ($getTargetResourceResult.Ensure -eq 'Present' -and $Ensure -eq 'Absent')
        {
            Write-Verbose -Message ($script:localizedData.RemoveDiskFromCluster -f $Number)

            $diskInstance = Get-CimInstance -ClassName MSCluster_Disk -Namespace 'Root\MSCluster' -Filter "Number = $Number"

            $diskResource = Get-ClusterResource |
                Where-Object -FilterScript { $_.ResourceType -eq 'Physical Disk' } |
                    Where-Object -FilterScript {
                        ($_ | Get-ClusterParameter -Name DiskIdGuid).Value -eq $diskInstance.Id
                    }

            # Remove the cluster disk
            $diskResource | Remove-ClusterResource -Force
        }
    }
}

<#
    .SYNOPSIS
       Tests that the failover cluster disk resource exist in the failover cluster,
       and that is has the correct label.

    .PARAMETER Number
        The disk number of the cluster disk.

    .PARAMETER Ensure
        Define if the cluster disk should be added (Present) or removed (Absent).
        Default value is 'Present'.

    .PARAMETER Label
        The disk label that should be assigned to the disk on the Failover Cluster
        disk resource.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Number,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String]
        $Label
    )

    Write-Verbose -Message ($script:localizedData.EvaluatingClusterDiskInformation -f $Number)

    $getTargetResourceResult = Get-TargetResource -Number $Number

    if($Ensure -eq 'Present')
    {
        return (
            ($Ensure -eq $getTargetResourceResult.Ensure) -and
            (($Label -eq $getTargetResourceResult.Label) -or (-not $PSBoundParameters.ContainsKey('Label')))
        )
    }
    else
    {
        return $Ensure -eq $getTargetResourceResult.Ensure
    }
}

Export-ModuleMember -Function *-TargetResource
