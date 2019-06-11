data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
    LoginModeSuccess=Successfully set loginMode to '{0}'.
    LoginModeError=Failed to set loginMode to '{0}'. Ensure SQL Server is properly installed.
    LoginModeTestError=Failed to find current loginMode. Ensure SQL Server is properly installed.
    LoginModeTestTrue=The current LoginMode value '{0}' matches the desired loginMode value '{1}'.
    LoginModeTestFalse=The current LoginMode value '{0}' does NOT match the desired loginMode value '{1}'.
'@
}

Import-Module $PSScriptRoot\..\xDatabase_Common


function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Windows","Mixed")]        
        [System.String]
        $LoginMode
    )

        try
        {
            $RegPath = (dir 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\' -Recurse | where property -eq "LoginMode").PSPath
            $ActualLoginModeValue = (Get-ItemProperty $RegPath -Name LoginMode).LoginMode 
            $ActualLoginMode = if($ActualLoginModeValue -eq 1){"Windows"}else{"Mixed"}
        }
        catch
        {
            $errorId = "LoginModeTest";
            $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidResult
            $errorMessage = $($LocalizedData.LoginModeTestError) 
            $exception = New-Object System.InvalidOperationException $errorMessage 
            $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception, $errorId, $errorCategory, $null

            $PSCmdlet.ThrowTerminatingError($errorRecord);
        }

        $returnValue = 
        @{
            LoginMode = $ActualLoginMode
         }

       $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Windows","Mixed")]
        [System.String]
        $LoginMode
    )

    
    if($PSBoundParameters.ContainsKey('LoginMode')) # Set SQL authentication to Mixed: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQLServer\LoginMode
    {
        try
        {
            $RegPath = (dir 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\' -Recurse | where property -eq "LoginMode").PSPath
            
            $LoginModeValue = if($LoginMode -eq "Windows"){1}else{2}
    
            set-itemproperty $RegPath LoginMode $LoginModeValue

            # restart SQL instance for above to take affect: 
            net stop MSSQLServer
            net start MSSQLServer

            Write-Verbose $($LocalizedData.LoginModeSuccess -f $LoginMode)
        }
        catch
        {
            $errorId = "LoginMode";
            $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidResult
            $errorMessage = $($LocalizedData.LoginModeError) -f ${LoginMode} 
            $exception = New-Object System.InvalidOperationException $errorMessage 
            $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception, $errorId, $errorCategory, $null

            $PSCmdlet.ThrowTerminatingError($errorRecord);
        }
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]        
        [ValidateSet("Windows","Mixed")]
        [System.String]
        $LoginMode
    )
    
    $ReturnValue = $true

    if($PSBoundParameters.ContainsKey('LoginMode'))
    {
        $LoginModeValue = if($LoginMode -eq "Windows"){1}else{2}

        try
        {
            $RegPath = (dir 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\' -Recurse | where property -eq "LoginMode").PSPath
            
            $ActualLoginModeValue = (Get-ItemProperty $RegPath -Name LoginMode).LoginMode
            
            $ActualLoginMode = if($ActualLoginModeValue -eq 1){"Windows"}else{"Mixed"}
            
        }
        catch
        {
            $errorId = "LoginModeTest";
            $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidResult
            $errorMessage = $($LocalizedData.LoginModeTestError) 
            $exception = New-Object System.InvalidOperationException $errorMessage 
            $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception, $errorId, $errorCategory, $null

            $PSCmdlet.ThrowTerminatingError($errorRecord);
        }

        if ($ActualLoginModeValue -ne $LoginModeValue)
        {
            $ReturnValue = $false
            
            Write-Verbose $($LocalizedData.LoginModeTestFalse -f $ActualLoginMode, $LoginMode)
        }
        else
        {
            Write-Verbose $($LocalizedData.LoginModeTestTrue -f $ActualLoginMode, $LoginMode)
        }
    }

    return $ReturnValue

}


Export-ModuleMember -Function *-TargetResource




