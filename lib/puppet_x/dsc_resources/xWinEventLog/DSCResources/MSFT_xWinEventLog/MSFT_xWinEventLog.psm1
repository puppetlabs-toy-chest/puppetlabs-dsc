function New-TerminatingError
{
    param
    (
        [Parameter(Mandatory = $true)]
        [String]$errorId,

        [Parameter(Mandatory = $true)]
        [String]$errorMessage,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.ErrorCategory]$errorCategory
    )

    $exception   = New-Object System.InvalidOperationException $errorMessage
    $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception, $errorId, $errorCategory, $null
    throw $errorRecord
}

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $LogName
    )

    try
    {
        $log = Get-WinEvent -ListLog $logName
        $returnValue = @{
            LogName = [System.String]$LogName
            LogFilePath = [system.String]$log.LogFilePath
            MaximumSizeInBytes = [System.Int64]$log.MaximumSizeInBytes
            IsEnabled = [System.Boolean]$log.IsEnabled
            LogMode = [System.String]$log.LogMode
            SecurityDescriptor = [System.String]$log.SecurityDescriptor
        }

        return $returnValue
    }
    catch
    {
        write-Debug "ERROR: $($_ | Format-List * -force | Out-String)"
        New-TerminatingError -errorId 'GetWinEventLogFailed' -errorMessage $_.Exception -errorCategory InvalidOperation
    }
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $LogName,

        [Parameter()]
        [System.Int64]
        $MaximumSizeInBytes,

        [Parameter()]
        [System.Boolean]
        $IsEnabled,

        [Parameter()]
        [ValidateSet("AutoBackup","Circular","Retain")]
        [System.String]
        $LogMode,

        [Parameter()]
        [System.String]
        $SecurityDescriptor,

        [Parameter()]
        [System.String]
        $LogFilePath
    )

    try
    {
        $log = Get-WinEvent -ListLog $logName
        $update = $false

        if ($PSBoundParameters.ContainsKey('MaximumSizeInBytes') -and $MaximumSizeInBytes -ne $log.MaximumSizeInBytes)
        {
            Set-MaximumSizeInBytes -LogName $LogName -MaximumSizeInBytes $MaximumSizeInBytes
        }

        if ($PSBoundParameters.ContainsKey('LogMode') -and $LogMode -ne $log.LogMode)
        {
            Set-LogMode -LogName $LogName -LogMode $LogMode
        }

        if ($PSBoundParameters.ContainsKey('SecurityDescriptor') -and $SecurityDescriptor -ne $log.SecurityDescriptor)
        {
            Set-SecurityDescriptor -LogName $LogName -SecurityDescriptor $SecurityDescriptor
        }

        if ($PSBoundParameters.ContainsKey("IsEnabled") -and $IsEnabled -ne $log.IsEnabled)
        {
            Set-IsEnabled -LogName $LogName -IsEnabled $IsEnabled
        }

        if ($PSBoundParameters.ContainsKey("LogFilePath") -and $LogFilePath -ne $log.LogFilePath)
        {
            Set-LogFilePath -LogName $LogName -LogFilePath $LogFilePath
        }


    }
    catch
    {
        write-Debug "ERROR: $($_ | Format-List * -force | Out-String)"
        New-TerminatingError -errorId 'SetWinEventLogFailed' -errorMessage $_.Exception -errorCategory InvalidOperation
    }


}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $LogName,

        [Parameter()]
        [System.Int64]
        $MaximumSizeInBytes,

        [Parameter()]
        [System.Boolean]
        $IsEnabled,

        [Parameter()]
        [ValidateSet("AutoBackup","Circular","Retain")]
        [System.String]
        $LogMode,

        [Parameter()]
        [System.String]
        $SecurityDescriptor,

        [Parameter()]
        [System.String]
        $LogFilePath
    )

    try
    {
        $log = Get-WinEvent -ListLog $logName
        if ($PSBoundParameters.ContainsKey("MaximumSizeInBytes") -and $log.MaximumSizeInBytes -ne $MaximumSizeInBytes)
        {
            return $false
        }
        if ($PSBoundParameters.ContainsKey("IsEnabled") -and $log.IsEnabled -ne $IsEnabled)
        {
            return $false
        }
        if ($PSBoundParameters.ContainsKey("LogMode") -and $log.LogMode -ne $LogMode)
        {
            return $false
        }
        if ($PSBoundParameters.ContainsKey("SecurityDescriptor") -and $log.SecurityDescriptor -ne $SecurityDescriptor)
        {
            return $false
        }
        if ($PSBoundParameters.ContainsKey("LogFilePath") -and $log.LogFilePath -ne $LogFilePath)
        {
            return $false
        }
        return $true
    }
    catch
    {
        write-Debug "ERROR: $($_ | Format-List * -force | Out-String)"
        New-TerminatingError -errorId 'TestWinEventLogFailed' -errorMessage $_.Exception -errorCategory InvalidOperation
    }

}

Function Set-MaximumSizeInBytes
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $LogName,

        [Parameter()]
        [System.Int64]
        $MaximumSizeInBytes

    )

    $log = Get-WinEvent -ListLog $logName
    $log.MaximumSizeInBytes = $MaximumSizeInBytes
    $log.SaveChanges()

}

Function Set-LogMode
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $LogName,

        [Parameter()]
        [System.String]
        $LogMode
    )

    $log = Get-WinEvent -ListLog $LogName
    $log.LogMode = $LogMode
    $log.SaveChanges()
}

Function Set-SecurityDescriptor
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $LogName,

        [Parameter()]
        [System.String]
        $SecurityDescriptor
    )

    $log = Get-WinEvent -ListLog $LogName
    $log.SecurityDescriptor = $SecurityDescriptor
    $log.SaveChanges()
}


Function Set-IsEnabled
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $LogName,

        [Parameter()]
        [System.Boolean]
        $IsEnabled
    )

    $log = Get-WinEvent -ListLog $LogName
    $log.IsEnabled = $IsEnabled
    $log.SaveChanges()

}

Function Set-LogFilePath
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $LogName,

        [Parameter()]
        [System.String]
        $LogFilePath
    )

    $log = Get-WinEvent -ListLog $LogName
    $log.LogFilePath = $LogFilePath
    $log.SaveChanges()
}

Export-ModuleMember -Function *-TargetResource



