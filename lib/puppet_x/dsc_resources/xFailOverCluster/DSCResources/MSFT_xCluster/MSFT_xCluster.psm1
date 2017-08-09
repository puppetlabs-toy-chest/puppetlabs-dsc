<#
    .SYNOPSIS
        Returns the current state of the failover cluster.

    .PARAMETER Name
        Name of the failover cluster.

    .PARAMETER StaticIPAddress
        Static IP Address of the failover cluster.

    .PARAMETER DomainAdministratorCredential
        Credential used to create the failover cluster in Active Directory.
#>
function Get-TargetResource
{
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $StaticIPAddress,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $DomainAdministratorCredential
    )

    $computerInformation = Get-WmiObject -Class Win32_ComputerSystem
    if (($null -eq $computerInformation) -or ($null -eq $computerInformation.Domain))
    {
        throw 'Can''t find machine''s domain name'
    }

    try
    {
        ($oldToken, $context, $newToken) = Set-ImpersonateAs -Credential $DomainAdministratorCredential

        $cluster = Get-Cluster -Name $Name -Domain $computerInformation.Domain
        if ($null -eq $cluster)
        {
            throw "Can't find the cluster $Name"
        }

        $address = Get-ClusterGroup -Cluster $Name -Name 'Cluster IP Address' | Get-ClusterParameter -Name 'Address'
    }
    finally
    {
        if ($context)
        {
            $context.Undo()
            $context.Dispose()
            Close-UserToken -Token $newToken
        }
    }

    @{
        Name                          = $Name
        StaticIPAddress               = $address.Value
        DomainAdministratorCredential = $DomainAdministratorCredential
    }
}

<#
    .SYNOPSIS
        Creates the failover cluster and adds a node to the failover cluster.

    .PARAMETER Name
        Name of the failover cluster.

    .PARAMETER StaticIPAddress
        Static IP Address of the failover cluster.

    .PARAMETER DomainAdministratorCredential
        Credential used to create the failover cluster in Active Directory.

    .NOTES
        If the cluster does not exist, it will be created in the domain and the
        static IP address will be assigned to the cluster.
        When the cluster exist (either it was created or already existed), it
        will add the target node ($env:COMPUTERNAME) to the cluster.
        If the target node already is a member of the failover cluster but has
        status down, it will be removed and then added again to the failover
        cluster.
#>
function Set-TargetResource
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $StaticIPAddress,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $DomainAdministratorCredential
    )

    $bCreate = $true

    Write-Verbose -Message "Checking if Cluster $Name is present ..."

    $computerInformation = Get-WmiObject -Class Win32_ComputerSystem
    if (($null -eq $computerInformation) -or ($null -eq $computerInformation.Domain))
    {
        throw 'Can''t find machine''s domain name'
    }

    try
    {
        $cluster = Get-Cluster -Name $Name -Domain $computerInformation.Domain

        if ($cluster)
        {
            $bCreate = $false
        }
    }
    catch
    {
        $bCreate = $true
    }

    try
    {
        ($oldToken, $context, $newToken) = Set-ImpersonateAs -Credential $DomainAdministratorCredential

        if ($bCreate)
        {
            Write-Verbose -Message "Cluster $Name is NOT present"

            New-Cluster -Name $Name -Node $env:COMPUTERNAME -StaticAddress $StaticIPAddress -NoStorage -Force -ErrorAction Stop

            if ( -not (Get-Cluster))
            {
                throw 'Cluster creation failed. Please verify output of ''Get-Cluster'' command'
            }

            Write-Verbose -Message "Created Cluster $Name"
        }
        else
        {
            Write-Verbose -Message "Add node to Cluster $Name ..."

            Write-Verbose -Message "Add-ClusterNode $env:COMPUTERNAME to cluster $Name"

            $list = Get-ClusterNode -Cluster $Name
            foreach ($node in $list)
            {
                if ($node.Name -eq $env:COMPUTERNAME)
                {
                    if ($node.State -eq 'Down')
                    {
                        Write-Verbose -Message "Node $env:COMPUTERNAME was down, need remove it from the list."

                        Remove-ClusterNode -Name $env:COMPUTERNAME -Cluster $Name -Force
                    }
                }
            }

            Add-ClusterNode -Name $env:COMPUTERNAME -Cluster $Name -NoStorage

            Write-Verbose -Message "Added node to Cluster $Name"
        }
    }
    finally
    {
        if ($context)
        {
            $context.Undo()
            $context.Dispose()
            Close-UserToken -Token $newToken
        }
    }
}

<#
    .SYNOPSIS
        Test the failover cluster exist and that the node is a member of the
        failover cluster.

    .PARAMETER Name
        Name of the failover cluster.

    .PARAMETER StaticIPAddress
        Static IP Address of the failover cluster.

    .PARAMETER DomainAdministratorCredential
        Credential used to create the failover cluster in Active Directory.

    .NOTES
        The code will check the following in order:

          1. Is target node a member of the Active Directory domain?
          2. Does the failover cluster exist in the Active Directory domain?
          3. Is the target node a member of the failover cluster?
          4. Does the cluster node have the status UP?

        If the first return false an error will be thrown. If either of the
        other return $false, then the cluster will be created, if it does not
        exist and then the node will be added to the failover cluster.
#>
function Test-TargetResource
{
    [OutputType([Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $StaticIPAddress,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $DomainAdministratorCredential
    )

    $returnValue = $false

    Write-Verbose -Message "Checking if Cluster $Name is present ..."

    $ComputerInfo = Get-WmiObject -Class Win32_ComputerSystem
    if (($null -eq $ComputerInfo) -or ($null -eq $ComputerInfo.Domain))
    {
        throw "Can't find machine's domain name"
    }

    try
    {
        ($oldToken, $context, $newToken) = Set-ImpersonateAs -Credential $DomainAdministratorCredential

        $cluster = Get-Cluster -Name $Name -Domain $ComputerInfo.Domain

        Write-Verbose -Message "Cluster $Name is present"

        if ($cluster)
        {
            Write-Verbose -Message "Checking if the node is in cluster $Name ..."

            $allNodes = Get-ClusterNode -Cluster $Name

            foreach ($node in $allNodes)
            {
                if ($node.Name -eq $env:COMPUTERNAME)
                {
                    if ($node.State -eq 'Up')
                    {
                        $returnValue = $true
                    }
                    else
                    {
                        Write-Verbose -Message "Node is in cluster $Name but is NOT up, treat as NOT in cluster."
                    }

                    break
                }
            }

            if ($returnValue)
            {
                Write-Verbose -Message "Node is in cluster $Name"
            }
            else
            {
                Write-Verbose -Message "Node is NOT in cluster $Name"
            }
        }
    }
    catch
    {
        Write-Verbose -Message "Cluster $Name is NOT present with Error $_.Message"
    }
    finally
    {
        if ($context)
        {
            $context.Undo()
            $context.Dispose()

            Close-UserToken -Token $newToken
        }
    }

    $returnValue
}

<#
    .SYNOPSIS
        Loads and returns a reference to the impersonation library.

#>
function Get-ImpersonateLib
{
    if ($script:ImpersonateLib)
    {
        return $script:ImpersonateLib
    }

    $sig = @'
[DllImport("advapi32.dll", SetLastError = true)]
public static extern bool LogonUser(string lpszUsername, string lpszDomain, string lpszPassword, int dwLogonType, int dwLogonProvider, ref IntPtr phToken);

[DllImport("kernel32.dll")]
public static extern Boolean CloseHandle(IntPtr hObject);
'@
    $script:ImpersonateLib = Add-Type -PassThru -Namespace 'Lib.Impersonation' -Name ImpersonationLib -MemberDefinition $sig

    return $script:ImpersonateLib
}

<#
    .SYNOPSIS
        Starts to impersonate the credentials provided in parameter Credential on the current user context.

    .PARAMETER Credential
        The credentials that should be impersonated.

    .OUTPUTS
        Returns three values.

        First value: The current user token before impersonation.
        Second value: The impersonation context returned when impersonation is started.
        Third value: The impersonated user token.

    .NOTES
        LogonUser function
        https://msdn.microsoft.com/en-us/library/windows/desktop/aa378184(v=vs.85).aspx

        WindowsIdentity.Impersonate Method ()
        https://msdn.microsoft.com/en-us/library/w070t6ka(v=vs.110).aspx
#>
function Set-ImpersonateAs
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    [IntPtr] $userToken = [Security.Principal.WindowsIdentity]::GetCurrent().Token
    $userToken
    $ImpersonateLib = Get-ImpersonateLib

    $bLogin = $ImpersonateLib::LogonUser($Credential.GetNetworkCredential().UserName, $Credential.GetNetworkCredential().Domain, $Credential.GetNetworkCredential().Password,
        9, 0, [ref]$userToken)

    if ($bLogin)
    {
        $Identity = New-Object Security.Principal.WindowsIdentity $userToken
        $context = $Identity.Impersonate()
    }
    else
    {
        throw "Can't Logon as User $($Credential.GetNetworkCredential().UserName)."
    }

    $context, $userToken
}

<#
    .SYNOPSIS
        Closes a (impersonation) user token.

    .PARAMETER Token
        The user token to close.

    .NOTES
        CloseHandle function
        https://msdn.microsoft.com/en-us/library/windows/desktop/ms724211(v=vs.85).aspx
#>
function Close-UserToken
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.IntPtr]
        $Token
    )

    $ImpersonateLib = Get-ImpersonateLib

    $bLogin = $ImpersonateLib::CloseHandle($Token)
    if (-not $bLogin)
    {
        throw 'Can''t close token'
    }
}
