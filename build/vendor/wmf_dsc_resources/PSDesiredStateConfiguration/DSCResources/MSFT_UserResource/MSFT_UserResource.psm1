# A global variable that contains localized messages.
data LocalizedData
{
# culture="en-US"
ConvertFrom-StringData @'
UserWithName=User: {0}
RemoveOperation=Remove
AddOperation=Add
SetOperation=Set
ConfigurationStarted=Configuration of user {0} started.
ConfigurationCompleted=Configuration of user {0} completed successfully.
UserCreated=User {0} created successfully.
UserUpdated=User {0} properties updated successfully.
UserRemoved=User {0} removed successfully.
NoConfigurationRequired=User {0} exists on this node with the desired properties. No action required.
NoConfigurationRequiredUserDoesNotExist=User {0} does not exist on this node. No action required.
InvalidUserName=The name {0} cannot be used. Names may not consist entirely of periods and/or spaces, or contain these characters: {1}
UserExists=A user with the name {0} exists.
UserDoesNotExist=A user with the name {0} does not exist.
PropertyMismatch=The value of the {0} property is expected to be {1} but it is {2}.
PasswordPropertyMismatch=The value of the {0} property does not match.
AllUserPropertisMatch=All {0} {1} properties match.
ConnectionError = There could be a possible connection error while trying to use the System.DirectoryServices API's.
MultipleMatches = There could be a possible multiple matches exception while trying to use the System.DirectoryServices API's.
'@
}

Add-Type -AssemblyName 'System.DirectoryServices.AccountManagement'
Import-LocalizedData LocalizedData -FileName MSFT_UserResource.strings.psd1

<#
.Synopsys
The Get-TargetResource cmdlet.
#>
function Get-TargetResource
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $UserName
    )

    Set-StrictMode -Version Latest

    ValidateUserName -UserName $UserName

    # Try to find a user by a name.
    $principalContext = New-Object System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Machine)

    try
    {
        $user = [System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($principalContext, $UserName);
        if($user -ne $null)
        {
            # The user is found. Return all user properties and Ensure="Present".
            $returnValue = @{
    	                        UserName = $user.Name; 
                                Ensure = "Present";
                                FullName = $user.DisplayName;
                                Description = $user.Description;
                                Disabled = -not $user.Enabled;
                                PasswordNeverExpires = $user.PasswordNeverExpires;
                                PasswordChangeRequired = $null;
                                PasswordChangeNotAllowed = $user.UserCannotChangePassword;
                            }

            return $returnValue;
        }

        # The user is not found. Return Ensure=Absent.
        return @{
    	            UserName = $UserName; 
                    Ensure = "Absent";
                }
    }
    catch
    {
         ThrowExceptionDueToDirectoryServicesError -ErrorId "MultipleMatches" -ErrorMessage ($LocalizedData.MultipleMatches + $_)
    }
    finally
    {
        if($user -ne $null)
        {
            $user.Dispose();
        }

        $principalContext.Dispose();
    }
}

<#
.Synopsys
The Set-TargetResource cmdlet.
#>
function Set-TargetResource
{
    [CmdletBInding(SupportsShouldProcess=$true)]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $UserName,

        [ValidateSet("Present", "Absent")]
        [System.String]
        $Ensure = "Present",

        [System.String]
        $FullName,

        [System.String]
        $Description,

        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $Password,

        [System.Boolean]
        $Disabled,

        [System.Boolean]
        $PasswordNeverExpires,

        [System.Boolean]
        $PasswordChangeRequired,

        [System.Boolean]
        $PasswordChangeNotAllowed
    )

    Set-StrictMode -Version Latest

    Write-Verbose -Message ($LocalizedData.ConfigurationStarted -f $UserName)

    ValidateUserName -UserName $UserName


    # Try to find a user by a name.
    $principalContext = New-Object System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Machine)

    try
    {
        $user = [System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($principalContext, $UserName);
        if($Ensure -eq "Present")
        {
            # Ensure is set to "Present".

            $whatIfShouldProcess = $true;
            $userExists = $false;
            $saveChanges = $false;

            if($user -eq $null)
            {
                # A user does not exist. Check WhatIf for adding a user.
                $whatIfShouldProcess = $pscmdlet.ShouldProcess($LocalizedData.UserWithName -f $UserName, $LocalizedData.AddOperation);
            }
            else
            {
                # A user exists.
                $userExists = $true;

                # Check WhatIf for setting a user.
                $whatIfShouldProcess = $pscmdlet.ShouldProcess($LocalizedData.UserWithName -f $UserName, $LocalizedData.SetOperation);
            }

            if($whatIfShouldProcess)
            {
                if(-not $userExists)
                {
                    # The user with the provided name does not exist. Add a new user.
                    $user = New-Object System.DirectoryServices.AccountManagement.UserPrincipal -ArgumentList $principalContext
                    $user.Name = $UserName;
                    $saveChanges = $true;
                }

                # Set user properties.
                if($PSBoundParameters.ContainsKey('FullName') -and (-not $userExists -or $FullName -ne $user.DisplayName))
                {
                    $user.DisplayName = $FullName;
                    $saveChanges = $true;
                }
                else
                {
                    if(-not $userExists)
                    {
                        # For a newly created user, set the DisplayName property to an empty string. By default DisplayName is set to user's name.
                        $user.DisplayName = [String]::Empty;
                    }
                }

                if($PSBoundParameters.ContainsKey('Description') -and (-not $userExists -or $Description -ne $user.Description))
                {
                    $user.Description = $Description;
                    $saveChanges = $true;
                }

                # Password. Set the password regardless of the state of the user.
                if($PSBoundParameters.ContainsKey('Password'))
                {
                    $user.SetPassword($Password.GetNetworkCredential().Password);
                    $saveChanges = $true;
                }

                if($PSBoundParameters.ContainsKey('Disabled') -and (-not $userExists -or $Disabled -eq $user.Enabled))
                {
                    $user.Enabled = -not $Disabled;
                    $saveChanges = $true;
                }

                if($PSBoundParameters.ContainsKey('PasswordNeverExpires') -and (-not $userExists -or $PasswordNeverExpires -ne $user.PasswordNeverExpires))
                {
                    $user.PasswordNeverExpires = $PasswordNeverExpires;
                    $saveChanges = $true;
                }

                if($PSBoundParameters.ContainsKey('PasswordChangeRequired'))
                {
                    if($PasswordChangeRequired)
                    {
                        # Expire the password. This will force the user to change the password at the next logon.
                        $user.ExpirePasswordNow();
                        $saveChanges = $true;
                    }
                }

                if($PSBoundParameters.ContainsKey('PasswordChangeNotAllowed') -and (-not $userExists -or $PasswordChangeNotAllowed -ne $user.UserCannotChangePassword))
                {
                    $user.UserCannotChangePassword = $PasswordChangeNotAllowed;
                    $saveChanges = $true;

                }

                if($saveChanges)
                {
                    $user.Save();

                    # Send an operation success verbose message.
                    if($userExists)
                    {
                        Write-Verbose -Message ($LocalizedData.UserUpdated -f $UserName)
                    }
                    else
                    {
                        Write-Verbose -Message ($LocalizedData.UserCreated -f $UserName)
                    }
                }
                else
                {
                    Write-Verbose -Message ($LocalizedData.NoConfigurationRequired -f $UserName)
                }
            }
        }
        else
        {
            # Ensure is set to "Absent".
            if($user -ne $null)
            {
                # The user exists.
                if($pscmdlet.ShouldProcess($LocalizedData.UserWithName -f $UserName, $LocalizedData.RemoveOperation))
                {
                    # Remove the user by the provided name.
                    $user.Delete();
                }

                Write-Verbose -Message ($LocalizedData.UserRemoved -f $UserName)
            }
            else
            {
                Write-Verbose -Message ($LocalizedData.NoConfigurationRequiredUserDoesNotExist -f $UserName)
            }
        }
    }
    catch
    {
         ThrowExceptionDueToDirectoryServicesError -ErrorId "MultipleMatches" -ErrorMessage ($LocalizedData.MultipleMatches + $_)
    }
    finally
    {
        if($user -ne $null)
        {
            $user.Dispose();
        }

        $principalContext.Dispose();
    }

    Write-Verbose -Message ($LocalizedData.ConfigurationCompleted -f $UserName)
}

<#
.Synopsys
The Test-TargetResource cmdlet is used to validate if the resource is in a state as expected in the instance document.
#>
function Test-TargetResource
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $UserName,

        [ValidateSet("Present", "Absent")]
        [System.String]
        $Ensure = "Present",

        [System.String]
        $FullName,

        [System.String]
        $Description,

        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $Password,

        [System.Boolean]
        $Disabled,

        [System.Boolean]
        $PasswordNeverExpires,

        [System.Boolean]
        $PasswordChangeRequired,

        [System.Boolean]
        $PasswordChangeNotAllowed
    )

    Set-StrictMode -Version Latest

    ValidateUserName -UserName $UserName

    # Try to find a user by a name.
    $principalContext = New-Object System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Machine)

    try
    {
        $user = [System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($principalContext, $UserName);
        if($user -eq $null)
        {
            # A user with the provided name does not exist.
            Write-Log -Message ($LocalizedData.UserDoesNotExist -f $UserName)

            if($Ensure -eq "Absent")
            {
                return $true;
            }
            else
            {
                return $false;
            }
        }

        # A user with the provided name exists.
        Write-Log -Message ($LocalizedData.UserExists -f $UserName)

        # Validate separate properties.
        if($Ensure -eq "Absent")
        {
            Write-Log -Message ($LocalizedData.PropertyMismatch -f "Ensure", "Absent", "Present")
            return $false; # The Ensure property does not match. Return $false;
        }

        if($PSBoundParameters.ContainsKey('FullName') -and $FullName -ne $user.DisplayName)
        {
            Write-Log -Message ($LocalizedData.PropertyMismatch -f "FullName", $FullName, $user.DisplayName)
            return $false; # The FullName property does not match. Return $false;
        }

        if($PSBoundParameters.ContainsKey('Description') -and $Description -ne $user.Description)
        {
            Write-Log -Message ($LocalizedData.PropertyMismatch -f "Description", $Description, $user.Description)
            return $false; # The Description property does not match. Return $false;
        }

        # Password
        if($PSBoundParameters.ContainsKey('Password'))
        {
            if(-not $principalContext.ValidateCredentials($UserName, $Password.GetNetworkCredential().Password))
            {
                Write-Log -Message ($LocalizedData.PasswordPropertyMismatch -f "Password")
                return $false; # The Password property does not match. Return $false;
            }
        }

        if($PSBoundParameters.ContainsKey('Disabled') -and $Disabled -eq $user.Enabled)
        {
            Write-Log -Message ($LocalizedData.PropertyMismatch -f "Disabled", $Disabled, $user.Enabled)
            return $false; # The Disabled property does not match. Return $false;
        }

        if($PSBoundParameters.ContainsKey('PasswordNeverExpires') -and $PasswordNeverExpires -ne $user.PasswordNeverExpires)
        {
            Write-Log -Message ($LocalizedData.PropertyMismatch -f "PasswordNeverExpires", $PasswordNeverExpires, $user.PasswordNeverExpires)
            return $false; # The PasswordNeverExpires property does not match. Return $false;
        }

        if($PSBoundParameters.ContainsKey('PasswordChangeNotAllowed') -and $PasswordChangeNotAllowed -ne $user.UserCannotChangePassword)
        {
            Write-Log -Message ($LocalizedData.PropertyMismatch -f "PasswordChangeNotAllowed", $PasswordChangeNotAllowed, $user.UserCannotChangePassword)
            return $false; # The PasswordChangeNotAllowed property does not match. Return $false;
        }
    }
    catch
    {
         ThrowExceptionDueToDirectoryServicesError -ErrorId "ConnectionError" -ErrorMessage ($LocalizedData.ConnectionError + $_)
    }
        
    finally
    {
        if($user -ne $null)
        {
            $user.Dispose();
        }

        $principalContext.Dispose();
       
    }

    # All properties match. Return $true.
    Write-Log -Message ($LocalizedData.AllUserPropertisMatch -f "User", $UserName)
    return $true;
}

<#
.Synopsis
Validates the User name for invalid charecters.
#>
function ValidateUserName
{
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $UserName
    )

    # Check if the name consists of only periods and/or white spaces.
    $wrongName = $true;
    for($i = 0; $i -lt $UserName.Length; $i++)
    {
        if(-not [Char]::IsWhiteSpace($UserName, $i) -and $UserName[$i] -ne '.')
        {
            $wrongName = $false;
            break;
        }
    }

    $invalidChars = @('\','/','"','[',']',':','|','<','>','+','=',';',',','?','*','@')

    if($wrongName)
    {
        ThrowInvalidArgumentError -ErrorId "UserNameHasOnlyWhiteSpacesAndDots" -ErrorMessage ($LocalizedData.InvalidUserName -f $UserName, [string]::Join(" ", $invalidChars))
    }

    if($UserName.IndexOfAny($invalidChars) -ne -1)
    {
        ThrowInvalidArgumentError -ErrorId "UserNameHasInvalidCharachter" -ErrorMessage ($LocalizedData.InvalidUserName -f $UserName, [string]::Join(" ", $invalidChars))
    }
}

<#
.Synopsis
Throws an argument error.
#>
function ThrowInvalidArgumentError
{
    [CmdletBinding()]
    param
    (
        
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $ErrorId,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $ErrorMessage
    )

    $errorCategory=[System.Management.Automation.ErrorCategory]::InvalidArgument
    $exception = New-Object System.ArgumentException $ErrorMessage;
    $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception, $ErrorId, $errorCategory, $null
    throw $errorRecord
}

function ThrowExceptionDueToDirectoryServicesError
{
    [CmdletBinding()]
    param
    (
        
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $ErrorId,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $ErrorMessage
    )

    $errorCategory = [System.Management.Automation.ErrorCategory]::ConnectionError
    $exception = New-Object System.ArgumentException $ErrorMessage
    $errorRecord = New-Object System.Management.Automation.ErrorRecord $exception, $ErrorId, $errorCategory, $null
    throw $errorRecord
}

<#
.Synopsis
Writes either to Verbose or ShouldProcess channel.
#>
function Write-Log
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    param
    (    
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Message
    )

    if ($PSCmdlet.ShouldProcess($Message, $null, $null))
    {
        Write-Verbose $Message        
    }    
}

Export-ModuleMember -function Get-TargetResource, Set-TargetResource, Test-TargetResource
