# Localized messages
data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
CheckEndpointMessage       = Checking if session configuration {0} exists ...
EndpointNameMessage        = Session configuration {0} is {1}

CheckPropertyMessage       = Checking if session configuration {0} is {1} ...
NotDesiredPropertyMessage  = Session configuration {0} is NOT {1}, but {2}
DesiredPropertyMessage     = Session configuration {0} is {1}
SetPropertyMessage         = Session configuration {0} is now {1}

WhitespacedStringMessage   = The session configuration {0} should not be white-spaced string
StartupPathNotFoundMessage = Startup path {0} not found
EmptyCredentialMessage     = The value of RunAsCredential can not be an empty credential
WrongStartupScriptExtensionMessage = The startup script should have a 'ps1' extension, and not '{0}'
'@
}

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [String]$Name
    )

    # Try getting the specified endpoint 
    $endpoint = Get-PSSessionConfiguration -Name $Name -ErrorAction SilentlyContinue -Verbose:$false

    # If endpoint is null, it is absent
    if($endpoint -eq $null)
    {
        $ensure = 'Absent'
    }

    # If endpoint is present, check other properties
    else 
    {
        $ensure = 'Present'

        # If runAsUser is specified, return only the username in the credential property
        if($($endpoint.RunAsUser))
        {
            $convertToCimCredential = New-CimInstance -ClassName MSFT_Credential -Property @{Username = [String]$($endpoint.RunAsUser); Password = [String]$null} `
                                                        -Namespace root/microsoft/windows/desiredstateconfiguration -ClientOnly
        }
        $accessMode = Get-EndpointAccessMode -Endpoint $endpoint
    }

    @{
        Name                   = $Name
        RunAsCredential        = [CimInstance]$convertToCimCredential
        SecurityDescriptorSDDL = $endpoint.Permission
        StartupScript          = $endpoint.StartupScript
        AccessMode             = $accessMode
        Ensure                 = $ensure
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [String]$Name,

        [AllowEmptyString()]
        [String]$StartupScript,

        [PSCredential]$RunAsCredential,

        [String]$SecurityDescriptorSDDL,

        [ValidateSet('Local','Remote', 'Disabled')]
        [String]$AccessMode = 'Remote',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )

    #Check if the session configuration exists
    $queryNameMessage = $($LocalizedData.CheckEndpointMessage) -f $Name
    Write-Verbose -Message $queryNameMessage
    
    # Try to get a named session configuration
    $endpoint = Get-PSSessionConfiguration -Name $Name -ErrorAction SilentlyContinue -Verbose:$false
    
    # If endpoint is present, set ensure correctly
    if($endpoint)
    {
        $namePresentMessage = $($LocalizedData.EndpointNameMessage) -f $Name,'present'
        Write-Verbose -Message $namePresentMessage

        # If the endpoint should be absent, delete the endpoint
        if($Ensure -eq 'Absent')
        {
            try
            {
                # Set the following preference so the functions inside Unregister-PSSessionConfig doesn't get these settings
                $oldDebugPrefernce = $DebugPreference; $oldVerbosePreference = $VerbosePreference
                $DebugPreference = $VerbosePreference = "SilentlyContinue"

                $null = Unregister-PSSessionConfiguration -Name $Name -Force -NoServiceRestart -ErrorAction Stop

                # Reset the following preference to older values 
                $DebugPreference = $oldDebugPrefernce; $VerbosePreference = $oldVerbosePreference

                $namePresentMessage = $($LocalizedData.EndpointNameMessage) -f $Name,'absent'
                Write-Verbose -Message $namePresentMessage 

                $restartNeeded = $true
            }
            catch
            {
                New-TerminatingError -errorId 'UnregisterPSSessionConfigurationFailed' -errorMessage $_.Exception -errorCategory InvalidOperation
            }

        }

        # else validate endpoint properties and return the result
        else
        {
            # Remove Name and Ensure from the bound parameters for splatting
            if($PSBoundParameters.ContainsKey('Name')){$null = $PSBoundParameters.Remove('Name')}
            if($PSBoundParameters.ContainsKey('Ensure')){$null = $PSBoundParameters.Remove('Ensure')}

            [Hashtable]$parameters = (Validate-ResourceProperties -Endpoint $endpoint @PSBoundParameters -Apply)
            $null = $parameters.Add('Name',$Name)

            # If the $parameters contain more than 1 key, something needs to be changed
            if($parameters.count -gt 1)
            { 
                try
                {
                    $null = Set-PSSessionConfiguration @parameters -Force -NoServiceRestart -Verbose:$false
                    $restartNeeded = $true

                    # Write verbose message for all the properties, except Name, that are changing
                    Write-EndpointMessage -parameters $parameters -keysToSkip 'Name'
                }
                catch
                {
                    New-TerminatingError -errorId 'SetPSSessionConfigurationFailed' -errorMessage $_.Exception -errorCategory InvalidOperation
                }
            }
        }
    }
    else
    {
        # Named session configuration is absent
        $nameAbsentMessage = $($LocalizedData.EndpointNameMessage) -f $Name,'absent'
        Write-Verbose -Message $nameAbsentMessage

        # If the endpoint should have been present, create it
        if($Ensure -eq 'Present')
        {
            # Remove Ensure,Verbose,Debug from the bound parameters for splatting
            if($PSBoundParameters.ContainsKey('Ensure')){$null = $PSBoundParameters.Remove('Ensure')}
            if($PSBoundParameters.ContainsKey('Verbose')){$null = $PSBoundParameters.Remove('Verbose')}
            if($PSBoundParameters.ContainsKey('Debug')){$null = $PSBoundParameters.Remove('Debug')}

            # Register the endpoint with specified properties
            try
            {
                # Set the following preference so the functions inside Unregister-PSSessionConfig doesn't get these settings
                $oldDebugPrefernce = $DebugPreference; $oldVerbosePreference = $VerbosePreference
                $DebugPreference = $VerbosePreference = "SilentlyContinue"

                $null = Register-PSSessionConfiguration @PSBoundParameters -Force -NoServiceRestart
           
                # Reset the following preference to older values 
                $DebugPreference = $oldDebugPrefernce; $VerbosePreference = $oldVerbosePreference

                # If access mode is specified, set it on the endpoint
                if($PSBoundParameters.ContainsKey('AccessMode') -and $AccessMode -ne 'Remote')
                {              
                        $null = Set-PSSessionConfiguration -Name $Name -AccessMode $AccessMode -Force -NoServiceRestart -Verbose:$false
                }

                $restartNeeded = $true

                # If the $parameters contain more than 1 key, something needs to be changed
                if($parameters.count -gt 1)
                { 
                    Write-EndpointMessage -parameters $parameters -keysToSkip 'Name'
                }

                $namePresentMessage = $($LocalizedData.EndpointNameMessage) -f $Name,'present'
                Write-Verbose -Message $namePresentMessage
            }
            catch
            {
                New-TerminatingError -errorId 'RegisterOrSetPSSessionConfigurationFailed' -errorMessage $_.Exception -errorCategory InvalidOperation
            }            
        }
    }

    # Any change to existing endpoint or creating new endpoint requires WinRM restart. 
    # Since DSC(CIM) uses WSMan as well it will stop responding. 
    # Hence telling the DSC Engine to restart the machine
    if($restartNeeded) {$global:DscMachineStatus = 1}
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [String]$Name,

        [AllowEmptyString()]
        [String]$StartupScript,

        [PSCredential]$RunAsCredential,

        [String]$SecurityDescriptorSDDL,

        [ValidateSet('Local','Remote', 'Disabled')]
        [String]$AccessMode = 'Remote',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )

#region Input Validation
    # Check if the endpoint name is blank/whitespaced string
    if([String]::IsNullOrWhiteSpace($Name))
    {
        $whitespacedEndpointNameMessage = $($LocalizedData.WhitespacedStringMessage) -f 'name'
        New-TerminatingError -errorId 'BlankString' -errorMessage $whitespacedEndpointNameMessage -errorCategory SyntaxError
    }

    # Check for Startup script path and extension
    if($PSBoundParameters.ContainsKey('StartupScript'))
    {
        # Check if startup script path is valid
        if(!(Test-Path $StartupScript))
        {
            $startupPathAbsentMessage = $($LocalizedData.StartupPathNotFoundMessage) -f $StartupScript
            New-TerminatingError -errorId 'PathNotFound' -errorMessage $startupPathAbsentMessage -errorCategory ObjectNotFound
        }

        # Check the startup script extension
        $startupScriptFileExtension = $StartupScript.Split('.')[-1]
        if( $startupScriptFileExtension -ne 'ps1')
        {
            $wrongExtensionMessage = $($LocalizedData.WrongStartupScriptExtensionMessage) -f $startupScriptFileExtension
            New-TerminatingError -errorId 'WrongFileExtension' -errorMessage $wrongExtensionMessage -errorCategory InvalidData
        }
    }

    # Check if SecurityDescriptorSDDL is whitespaced 
    if($PSBoundParameters.ContainsKey('SecurityDescriptorSDDL') -and [String]::IsNullOrWhiteSpace($SecurityDescriptorSDDL))
    {
        $whitespacedSDDLMessage = $($LocalizedData.WhitespacedStringMessage) -f 'securityDescriptorSddl'
        New-TerminatingError -errorId 'BlankString' -errorMessage $whitespacedSDDLMessage -errorCategory SyntaxError
    }

    # Check if the RunAsCredential is not empty
    if($PSBoundParameters.ContainsKey('RunAsCredential') -and ($RunAsCredential -eq [PSCredential]::Empty))
    {
        $emptyCredentialMessage = $($LocalizedData.EmptyCredentialMessage)
        New-TerminatingError -errorId 'EmptyCredential' -errorMessage $emptyCredentialMessage -errorCategory InvalidArgument
    }
#endregion

    #Check if the session configuration exists
    $queryNameMessage = $($LocalizedData.CheckEndpointMessage) -f $Name
    Write-Verbose -Message $queryNameMessage

    try
    {
        # Try to get a named session configuration
        $endpoint = Get-PSSessionConfiguration -Name $Name -ErrorAction Stop -Verbose:$false
    
        $namePresentMessage = $($LocalizedData.EndpointNameMessage) -f $Name,'present'
        Write-Verbose -Message $namePresentMessage

        # If the endpoint shouldn't be present, return false
        if($Ensure -eq 'Absent')
        {
            return $false
        }
        # else validate endpoint properties and return the result
        else
        {
            # Remove Name and Ensure from the bound parameters for splatting
            if($PSBoundParameters.ContainsKey('Name')){$null = $PSBoundParameters.Remove('Name')}
            if($PSBoundParameters.ContainsKey('Ensure')){$null = $PSBoundParameters.Remove('Ensure')}

            return (Validate-ResourceProperties -Endpoint $endpoint @PSBoundParameters)
        }
    }
    catch [Microsoft.PowerShell.Commands.WriteErrorException]
    {
        $nameAbsentMessage = $($LocalizedData.EndpointNameMessage) -f $Name,'absent'
        Write-Verbose -Message $nameAbsentMessage

        return ($Ensure -eq 'Absent')
    }
}

# Internal function to translate the endpoint's accessmode to the "Disabled","Local","Remote" values
function Get-EndpointAccessMode
{
    param
    (
        [Parameter(Mandatory)]
        $Endpoint
    )
    if($($endpoint.Enabled) -eq $false) {return 'Disabled'}
    elseif($endpoint.Permission -and ($endpoint.Permission).contains('NT AUTHORITY\NETWORK AccessDenied')){return 'Local'}
    else{return 'Remote'}
}

# Internal function to write set verbose messages for collection of properties
function Write-EndpointMessage
{
    param
    (
        [Parameter(Mandatory)]
        [Hashtable]$parameters,

        [Parameter(Mandatory)]
        [String[]]$keysToSkip
    )

    foreach($key in $parameters.keys)
    {
        if($keysToSkip -notcontains $key)
        {
            $setPropertyMessage = $($LocalizedData.SetPropertyMessage) -f $key,$($parameters[$key])
            Write-Verbose -Message $setPropertyMessage
        }
    }
}

# Internal function to validate an endpoint's properties
function Validate-ResourceProperties
{
    param
    (
        [Parameter(Mandatory)]
        $Endpoint,

        [String]$StartupScript,

        [PSCredential]$RunAsCredential,

        [String]$SecurityDescriptorSDDL,

        [ValidateSet('Local','Remote','Disabled')]
        [String]$AccessMode,

        [Switch]$Apply
    )

    if($Apply)
    {
        $parameters = @{}
    }

    # Check if the SDDL is same as specified
    if($PSBoundParameters.ContainsKey('SecurityDescriptorSDDL'))
    { 
            $querySDDLMessage = $($LocalizedData.CheckPropertyMessage) -f 'SDDL',$SecurityDescriptorSDDL  
            Write-Verbose -Message $querySDDLMessage

            # If endpoint SDDL is not same as specified
            if($endpoint.SecurityDescriptorSddl -and ($endpoint.SecurityDescriptorSddl -ne $SecurityDescriptorSDDL))
            {
                $notDesiredSDDLMessage = $($LocalizedData.NotDesiredPropertyMessage) -f 'SDDL',$SecurityDescriptorSDDL,$($endpoint.SecurityDescriptorSddl)
                Write-Verbose -Message $notDesiredSDDLMessage

                if($Apply)
                {
                    $parameters['SecurityDescriptorSddl'] = $SecurityDescriptorSDDL
                }
                else
                {
                    return $false
                }
            }
            # If endpoint SDDL is same as specified
            else
            {
                $desiredSDDLMessage = $($LocalizedData.DesiredPropertyMessage) -f 'SDDL',$SecurityDescriptorSDDL
                Write-Verbose -Message $desiredSDDLMessage
            }
        }

    # Check the RunAs user is same as specified
    if($PSBoundParameters.ContainsKey('RunAsCredential'))
    {
            $queryRunAsMessage = $($LocalizedData.CheckPropertyMessage) -f 'RunAs user',$($RunAsCredential.UserName) 
            Write-Verbose -Message $queryRunAsMessage

            # If endpoint RunAsUser is not same as specified
            if($endpoint.RunAsUser -ne $RunAsCredential.UserName)
            {
                $notDesiredRunAsMessage = $($LocalizedData.NotDesiredPropertyMessage) -f 'RunAs user',$($RunAsCredential.UserName),$($endpoint.RunAsUser)
                Write-Verbose -Message $notDesiredRunAsMessage
                
                if($Apply)
                {
                    $parameters['RunAsCredential'] = $RunAsCredential
                }
                else
                {
                    return $false
                }
            }
            # If endpoint RunAsUser is same as specified
            else
            {
                $desiredRunAsMessage = $($LocalizedData.DesiredPropertyMessage) -f 'RunAs user',$($RunAsCredential.UserName)
                Write-Verbose -Message $desiredRunAsMessage
            }
        }

    # Check if the StartupScript is same as specified
    if($PSBoundParameters.ContainsKey('StartupScript'))
    {
        $queryStartupScriptMessage = $($LocalizedData.CheckPropertyMessage) -f 'startup script',$StartupScript
        Write-Verbose -Message $queryStartupScriptMessage

        # If endpoint StartupScript is not same as specified
        if($endpoint.StartupScript -ne $StartupScript)
        {
            $notDesiredStartupScriptMessage = $($LocalizedData.NotDesiredPropertyMessage) -f 'startup script',$StartupScript,$($endpoint.StartupScript)
            Write-Verbose -Message $notDesiredStartupScriptMessage

            if($Apply)
            {   
                $parameters['StartupScript'] = $StartupScript
            }
            else
            {
                return $false
            }
        }
        # If endpoint StartupScript is same as specified
        else
        {
            $desiredStartupScriptMessage = $($LocalizedData.DesiredPropertyMessage) -f 'startup script',$StartupScript
            Write-Verbose -Message $desiredStartupScriptMessage
        }
    }

    # Check if AccessMode is same as specified
    if($PSBoundParameters.ContainsKey('AccessMode'))
    {
        $queryAccessModeMessage = $($LocalizedData.CheckPropertyMessage) -f 'acess mode',$AccessMode
        Write-Verbose -Message $queryAccessModeMessage

        $curAccessMode = Get-EndpointAccessMode -Endpoint $Endpoint
                
        # If endpoint access mode is not same as specified
        if($curAccessMode -ne $AccessMode)
        {            
            $notDesiredAccessModeMessage = $($LocalizedData.NotDesiredPropertyMessage) -f 'access mode',$AccessMode,$curAccessMode
            Write-Verbose -Message $notDesiredAccessModeMessage

            if($Apply)
            {   
                $parameters['AccessMode'] = $AccessMode
            }
            else
            {
                return $false
            }
        }
        # If endpoint access mode is same as specified
        else
        {
            $desiredAccessModeMessage = $($LocalizedData.DesiredPropertyMessage) -f 'access mode',$AccessMode
            Write-Verbose -Message $desiredAccessModeMessage
        }
    }

    if($Apply)
    {
        return $parameters
    }
    else
    {
        return ($Ensure -eq 'Present')
    }
}

# Internal function to throw terminating error with specified errroCategory, errorId and errorMessage
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
    
    $exception = New-Object System.InvalidOperationException $errorMessage 
    $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception, $errorId, $errorCategory, $null
    throw $errorRecord
}

Export-ModuleMember -Function *-TargetResource

