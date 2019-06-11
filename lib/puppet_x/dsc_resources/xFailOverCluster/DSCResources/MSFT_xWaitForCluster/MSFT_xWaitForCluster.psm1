Import-Module -Name (Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) `
-ChildPath 'CommonResourceHelper.psm1')

$script:localizedData = Get-LocalizedData -ResourceName 'MSFT_xWaitForCluster'

<#
    .SYNOPSIS
        Get the values for which failover cluster and for how long to wait for the
        cluster to exist.

    .PARAMETER Name
        Name of the cluster to wait for.

    .PARAMETER RetryIntervalSec
        Interval to check for cluster existence. Default values is 10 seconds.

    .PARAMETER RetryCount
        Maximum number of retries to check for cluster existence. Default value
        is 50 retries.
#>
function Get-TargetResource
{
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.UInt64]
        $RetryIntervalSec = 10,

        [Parameter()]
        [System.UInt32]
        $RetryCount = 50
    )

    Write-Verbose -Message $script:localizedData.ReturnParameterValues

    @{
        Name             = $Name
        RetryIntervalSec = $RetryIntervalSec
        RetryCount       = $RetryCount
    }
}

<#
    .SYNOPSIS
        Waits for the specific failover cluster to exist. It will throw an error if the
        cluster has not been detected during the timeout period.

    .PARAMETER Name
        Name of the cluster to wait for.

    .PARAMETER RetryIntervalSec
        Interval to check for cluster existence. Default values is 10 seconds.

    .PARAMETER RetryCount
        Maximum number of retries to check for cluster existence. Default value
        is 50 retries.
#>
function Set-TargetResource
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.UInt64]
        $RetryIntervalSec = 10,

        [Parameter()]
        [System.UInt32]
        $RetryCount = 50
    )

    $clusterFound = $false
    Write-Verbose -Message ($script:localizedData.CheckClusterPresent -f $Name)

    for ($count = 0; $count -lt $RetryCount; $count++)
    {
        try
        {
            $computerObject = Get-CimInstance -ClassName Win32_ComputerSystem
            if ($null -eq $computerObject -or $null -eq $computerObject.Domain)
            {
                Write-Verbose -Message $script:localizedData.TargetNodeDomainMissing
                break
            }

            $cluster = Get-Cluster -Name $Name -Domain $computerObject.Domain

            if ($null -ne $cluster)
            {
                Write-Verbose -Message ($script:localizedData.ClusterPresent -f $Name)
                $clusterFound = $true
                break
            }
        }
        catch
        {
            Write-Verbose -Message ($script:localizedData.ClusterAbsent -f $Name, $RetryIntervalSec)
        }

        Write-Verbose -Message ($script:localizedData.ClusterAbsent -f $Name, $RetryIntervalSec)
        Start-Sleep -Seconds $RetryIntervalSec
    }

    if (-not $clusterFound)
    {
        $errorMessage = $script:localizedData.ClusterAbsentAfterTimeOut -f $Name, $count, $RetryIntervalSec
        New-InvalidOperationException -Message $errorMessage
    }
}

<#
    .SYNOPSIS
        Test if the specific failover cluster exist.

    .PARAMETER Name
        Name of the cluster to wait for.

    .PARAMETER RetryIntervalSec
        Interval to check for cluster existence. Default values is 10 seconds.

    .PARAMETER RetryCount
        Maximum number of retries to check for cluster existence. Default value
        is 50 retries.
#>
function Test-TargetResource
{
    [OutputType([Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.UInt64]
        $RetryIntervalSec = 10,

        [Parameter()]
        [System.UInt32]
        $RetryCount = 50
    )

    Write-Verbose -Message ($script:localizedData.EvaluatingClusterPresent -f $Name)

    $testTargetResourceReturnValue = $false

    try
    {
        $computerObject = Get-CimInstance -ClassName Win32_ComputerSystem
        if ($null -eq $computerObject -or $null -eq $computerObject.Domain)
        {
            Write-Verbose -Message $script:localizedData.TargetNodeDomainMissing
        }
        else
        {
            $cluster = Get-Cluster -Name $Name -Domain $computerObject.Domain
            if ($null -eq $cluster)
            {
                Write-Verbose -Message ($script:localizedData.ClusterAbsentWithDomain -f $Name, $computerObject.Domain)
            }
            else
            {
                Write-Verbose -Message ($script:localizedData.ClusterPresent -f $Name)
                $testTargetResourceReturnValue = $true
            }
        }
    }
    catch
    {
        Write-Verbose -Message ($script:localizedData.ClusterAbsentWithError -f $Name, $_.Message)
    }

    $testTargetResourceReturnValue
}

