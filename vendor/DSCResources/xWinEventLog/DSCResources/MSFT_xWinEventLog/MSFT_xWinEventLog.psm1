function New-TerminatingError
{
    param
    (
        [Parameter(Mandatory)]
        [String]$errorId,
        
        [Parameter(Mandatory)]
        [String]$errorMessage,

        [Parameter(Mandatory)]
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
        [parameter(Mandatory = $true)]
        [System.String]
        $LogName
    )

    try
    {
        $log = Get-WinEvent -ListLog $logName
        $returnValue = @{
            LogName = [System.String]$LogName
            MaximumSizeInBytes = [System.Int64]$log.MaximumSizeInBytes
            IsEnabled = [System.Boolean]$log.IsEnabled
            LogMode = [System.String]$log.LogMode
            SecurityDescriptor = [System.String]$log.SecurityDescriptor
        }

        return $returnValue
    }catch
    {
        write-Debug "ERROR: $($_|fl * -force|out-string)"
        New-TerminatingError -errorId 'GetWinEventLogFailed' -errorMessage $_.Exception -errorCategory InvalidOperation
    }
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $LogName,

        [System.Int64]
        $MaximumSizeInBytes,

        [System.Boolean]
        $IsEnabled,

        [ValidateSet("AutoBackup","Circular","Retain")]
        [System.String]
        $LogMode,

        [System.String]
        $SecurityDescriptor
    )

    try
    {
        $log = Get-WinEvent -ListLog $logName
        if ($MaximumSizeInBytes) { $log.MaximumSizeInBytes = $MaximumSizeInBytes}
        if ($LogMode)            { $log.LogMode = $LogMode}
        if ($SecurityDescriptor) { $log.SecurityDescriptor = $SecurityDescriptor}
        $log.SaveChanges()
        try
        {
            if ($PSBoundParameters.ContainsKey("IsEnabled")) 
            { $log.IsEnabled = $IsEnabled}
            $log.SaveChanges()
        }catch
        {
            New-TerminatingError -errorId 'SetWinEventLogFailed' -errorMessage "`nCannot change IsEnabled on [WinEventLog]$logName" -errorCategory InvalidOperation
        }

    }catch
    {
        write-Debug "ERROR: $($_|fl * -force|out-string)"
        New-TerminatingError -errorId 'SetWinEventLogFailed' -errorMessage $_.Exception -errorCategory InvalidOperation
    }

}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $LogName,

        [System.Int64]
        $MaximumSizeInBytes,

        [System.Boolean]
        $IsEnabled,

        [ValidateSet("AutoBackup","Circular","Retain")]
        [System.String]
        $LogMode,

        [System.String]
        $SecurityDescriptor
    )

    try
    {
        $log = Get-WinEvent -ListLog $logName
        if ($PSBoundParameters.ContainsKey("MaximumSizeInBytes") -and $log.MaximumSizeInBytes -ne $MaximumSizeInBytes ) { return $false}
        if ($PSBoundParameters.ContainsKey("IsEnabled")          -and $log.IsEnabled -ne $IsEnabled                   ) { return $false}
        if ($PSBoundParameters.ContainsKey("LogMode")            -and $log.LogMode -ne $LogMode                       ) { return $false}
        if ($PSBoundParameters.ContainsKey("SecurityDescriptor") -and $log.SecurityDescriptor -ne $SecurityDescriptor ) { return $false}
        return $true
    }catch
    {
        write-Debug "ERROR: $($_|fl * -force|out-string)"
        New-TerminatingError -errorId 'TestWinEventLogFailed' -errorMessage $_.Exception -errorCategory InvalidOperation
    }
    
}


Export-ModuleMember -Function *-TargetResource



