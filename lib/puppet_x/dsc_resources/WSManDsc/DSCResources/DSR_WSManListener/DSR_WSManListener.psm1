$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Networking Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'WSManDsc.ResourceHelper' `
            -ChildPath 'WSManDsc.ResourceHelper.psm1'))

# Import Localization Strings
$script:localizedData = Get-LocalizedData `
    -ResourceName 'DSR_WSManListener' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

# Standard Transport Ports
$Default_HTTP_Port = 5985
$Default_HTTPS_Port = 5986

<#
    .SYNOPSIS
        Returns the current WS-Man Listener details.

    .PARAMETER Transport
        The transport type of WS-Man Listener.

    .PARAMETER Ensure
        Specifies whether the WS-Man Listener should exist.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('HTTP', 'HTTPS')]
        [System.String]
        $Transport,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($script:localizedData.GettingListenerMessage)
        ) -join '' )

    $returnValue = @{
        Transport = $Transport
    }

    # Lookup the existing Listener
    $listener = Get-Listener -Transport $Transport

    if ($listener)
    {
        # An existing listener matching the transport was found
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($script:localizedData.ListenerExistsMessage) `
                    -f $Transport
            ) -join '' )

        if ($listener.CertificateThumbprint)
        {
            $certificate = Find-Certificate -CertificateThumbprint $listener.CertificateThumbprint
        }

        $returnValue += @{
            Ensure                = 'Present'
            Port                  = $listener.Port
            Address               = $listener.Address
            Issuer                = $certificate.Issuer
            SubjectFormat         = $null
            MatchAlternate        = $null
            DN                    = $null
            Hostname              = $listener.Hostname
            Enabled               = $listener.Enabled
            URLPrefix             = $listener.URLPrefix
            CertificateThumbprint = $listener.CertificateThumbprint
        }
    }
    else
    {
        # An existing listener matching the transport was not found
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($script:localizedData.ListenerDoesNotExistMessage) `
                    -f $Transport
            ) -join '' )

        $returnValue += @{
            Ensure                = 'Absent'
            Port                  = $null
            Address               = $null
            Issuer                = $null
            SubjectFormat         = $null
            MatchAlternate        = $null
            DN                    = $null
            Hostname              = $null
            Enabled               = $null
            URLPrefix             = $null
            CertificateThumbprint = $null
        }
    } # if

    return $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
    Sets the state of a WS-Man Listener.

    .PARAMETER Transport
        The transport type of WS-Man Listener.

    .PARAMETER Ensure
        Specifies whether the WS-Man Listener should exist.

    .PARAMETER Port
        The port the WS-Man Listener should use. Defaults to 5985 for HTTP and 5986 for HTTPS listeners.

    .PARAMETER Address
        The Address that the WS-Man Listener will be bound to. The default is * (any address).

    .PARAMETER Issuer
        The Issuer of the certificate to use for the HTTPS WS-Man Listener if a thumbprint is
        not specified.

    .PARAMETER SubjectFormat
        The format used to match the certificate subject to use for an HTTPS WS-Man Listener
        if a thumbprint is not specified.

    .PARAMETER MatchAlternate
        Should the FQDN/Name be used to also match the certificate alternate subject for an HTTPS WS-Man
        Listener if a thumbprint is not specified.

    .PARAMETER DN
        This is a Distinguished Name component that will be used to identify the certificate to use
        for the HTTPS WS-Man Listener if a thumbprint is not specified.

    .PARAMETER CertificateThumbprint
        The Thumbprint of the certificate to use for the HTTPS WS-Man Listener.
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('HTTP', 'HTTPS')]
        [System.String]
        $Transport,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure,

        [Parameter()]
        [System.UInt16]
        $Port,

        [Parameter()]
        [System.String]
        $Address = '*',

        [Parameter()]
        [System.String]
        $Issuer,

        [Parameter()]
        [ValidateSet('Both', 'FQDNOnly', 'NameOnly')]
        [System.String]
        $SubjectFormat = 'Both',

        [Parameter()]
        [System.Boolean]
        $MatchAlternate,

        [Parameter()]
        [System.String]
        $DN,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [System.String]
        $Hostname
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($script:localizedData.SettingListenerMessage)
        ) -join '' )

    # Lookup the existing Listener
    $listener = Get-Listener -Transport $Transport

    # Get the default port for the transport if none was provided
    $Port = Get-DefaultPort -Transport $Transport -Port $Port

    if ($Ensure -eq 'Present')
    {
        # The listener should exist
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($script:localizedData.EnsureListenerExistsMessage) `
                    -f $Transport, $Port
            ) -join '' )

        if ($listener)
        {
            # The Listener exists already - delete it
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($script:localizedData.ListenerExistsRemoveMessage) `
                        -f $Transport, $Port
                ) -join '' )

            Remove-WSManInstance `
                -ResourceURI 'winrm/config/Listener' `
                -SelectorSet @{
                Transport = $listener.Transport
                Address   = $listener.Address
            }
        }
        else
        {
            # Ths listener doesn't exist - do nothing
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($script:localizedData.ListenerOnPortDoesNotExistMessage) `
                        -f $Transport, $Port
                ) -join '' )
        }

        # Create the listener
        if ($Transport -eq 'HTTPS')
        {
            # Find the certificate to use for the HTTPS Listener
            $null = $PSBoundParameters.Remove('Transport')
            $null = $PSBoundParameters.Remove('Ensure')
            $null = $PSBoundParameters.Remove('Port')
            $null = $PSBoundParameters.Remove('Address')

            $certificate = Find-Certificate @PSBoundParameters
            [System.String] $thumbprint = $certificate.thumbprint

            if ($thumbprint)
            {
                # A certificate was found, so use it to enable the HTTPS WinRM listener
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($script:localizedData.CreatingListenerMessage) `
                            -f $Transport, $Port
                    ) -join '' )

                if ([System.String]::IsNullOrEmpty($Hostname))
                {
                    $Hostname = [System.Net.Dns]::GetHostByName($ENV:computerName).Hostname
                }

                New-WSManInstance `
                    -ResourceURI 'winrm/config/Listener' `
                    -SelectorSet @{
                        Address   = $Address
                        Transport = $Transport
                    } `
                    -ValueSet @{
                        Hostname              = $Hostname
                        CertificateThumbprint = $thumbprint
                        Port                  = $Port
                    } `
                    -ErrorAction Stop
            }
            else
            {
                # A certificate could not be found to use for the HTTPS listener
                New-InvalidArgumentException `
                    -Message ($script:localizedData.ListenerCreateFailNoCertError -f `
                        $Transport, $Port) `
                    -Argument 'Issuer'
            } # if
        }
        else
        {
            # Create a plain HTTP listener
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($script:localizedData.CreatingListenerMessage) `
                        -f $Transport, $Port
                ) -join '' )

            New-WSManInstance `
                -ResourceURI 'winrm/config/Listener' `
                -SelectorSet @{
                Address   = $Address
                Transport = $Transport
            } `
                -ValueSet @{
                Port = $Port
            } `
                -ErrorAction Stop
        }
    }
    else
    {
        # The listener should not exist
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($script:localizedData.EnsureListenerDoesNotExistMessage) `
                    -f $Transport, $Port
            ) -join '' )

        if ($listener)
        {
            # The listener does exist - so delete it
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($script:localizedData.ListenerExistsRemoveMessage) `
                        -f $Transport, $Port
                ) -join '' )

            Remove-WSManInstance `
                -ResourceURI 'winrm/config/Listener' `
                -SelectorSet @{
                Transport = $listener.Transport
                Address   = $listener.Address
            }
        }
    } # if
} # Set-TargetResource

<#
    .SYNOPSIS
        Tests the state of a WS-Man Listener.

    .PARAMETER Transport
        The transport type of WS-Man Listener.

    .PARAMETER Ensure
        Specifies whether the WS-Man Listener should exist.

    .PARAMETER Port
        The port the WS-Man Listener should use. Defaults to 5985 for HTTP and 5986 for HTTPS listeners.

    .PARAMETER Address
        The Address that the WS-Man Listener will be bound to. The default is * (any address).

    .PARAMETER Issuer
        The Issuer of the certificate to use for the HTTPS WS-Man Listener if a thumbprint is
        not specified.

    .PARAMETER SubjectFormat
        The format used to match the certificate subject to use for an HTTPS WS-Man Listener
        if a thumbprint is not specified.

    .PARAMETER MatchAlternate
        Should the FQDN/Name be used to also match the certificate alternate subject for an HTTPS WS-Man
        Listener if a thumbprint is not specified.

    .PARAMETER DN
        This is a Distinguished Name component that will be used to identify the certificate to use
        for the HTTPS WS-Man Listener if a thumbprint is not specified.

    .PARAMETER CertificateThumbprint
        The Thumbprint of the certificate to use for the HTTPS WS-Man Listener.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('HTTP', 'HTTPS')]
        [System.String]
        $Transport,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure,

        [Parameter()]
        [System.UInt16]
        $Port,

        [Parameter()]
        [System.String]
        $Address = '*',

        [Parameter()]
        [System.String]
        $Issuer,

        [Parameter()]
        [ValidateSet('Both', 'FQDNOnly', 'NameOnly')]
        [System.String]
        $SubjectFormat = 'Both',

        [Parameter()]
        [System.Boolean]
        $MatchAlternate,

        [Parameter()]
        [System.String]
        $DN,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [System.String]
        $Hostname
    )

    # Flag to signal whether settings are correct
    [System.Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($script:localizedData.TestingListenerMessage)
        ) -join '' )

    # Lookup the existing Listener
    $listener = Get-Listener -Transport $Transport

    # Get the default port for the transport if none was provided
    $Port = Get-DefaultPort -Transport $Transport -Port $Port

    if ($Ensure -eq 'Present')
    {
        # The listener should exist
        if ($listener)
        {
            # The Listener exists already
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($script:localizedData.ListenerExistsMessage) `
                        -f $Transport
                ) -join '' )

            # Check it is setup as per parameters
            if ($listener.Port -ne $Port)
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($script:localizedData.ListenerOnWrongPortMessage) `
                            -f $Transport, $listener.Port, $Port
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }

            if ($listener.Address -ne $Address)
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($script:localizedData.ListenerOnWrongAddressMessage) `
                            -f $Transport, $listener.Address, $Address
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }
        }
        else
        {
            # Ths listener doesn't exist but should
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($script:localizedData.ListenerDoesNotExistButShouldMessage) `
                        -f $Transport
                ) -join '' )
            $desiredConfigurationMatch = $false
        }
    }
    else
    {
        # The listener should not exist
        if ($listener)
        {
            # The listener exists but should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($script:localizedData.ListenerExistsButShouldNotMessage) `
                        -f $Transport
                ) -join '' )
            $desiredConfigurationMatch = $false
        }
        else
        {
            # The listener does not exist and should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($script:localizedData.ListenerDoesNotExistAndShouldNotMessage) `
                        -f $Transport
                ) -join '' )
        }
    } # if

    return $desiredConfigurationMatch
} # Test-TargetResource

<#
    .SYNOPSIS
        Looks up a WS-Man listener on the machine and returns the details.

    .PARAMETER Transport
        The transport type of WS-Man Listener.
#>
function Get-Listener
{
    [CmdletBinding()]
    [OutputType([Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('HTTP', 'HTTPS')]
        [System.String]
        $Transport
    )

    $listeners = @(Get-WSManInstance `
            -ResourceURI 'winrm/config/Listener' `
            -Enumerate)

    if ($listeners)
    {
        return $listeners.Where( { ($_.Transport -eq $Transport) `
                    -and ($_.Source -ne 'Compatibility') } )
    }
} # Get-Listener

<#
    .SYNOPSIS
        Returns the port to use for the listener based on the transport and port.

    .PARAMETER Transport
        The transport type of WS-Man Listener.

    .PARAMETER Port
        The port the WS-Man Listener should use. Defaults to 5985 for HTTP and 5986 for HTTPS listeners.
#>
function Get-DefaultPort
{
    [CmdletBinding()]
    [OutputType([System.UInt16])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('HTTP', 'HTTPS')]
        [System.String]
        $Transport,

        [Parameter()]
        [System.UInt16]
        $Port
    )

    if (-not $Port)
    {
        # Set the default port because none was provided
        if ($Transport -eq 'HTTP')
        {
            $Port = $Default_HTTP_Port
        }
        else
        {
            $Port = $Default_HTTPS_Port
        }
    }
    return $Port
}

<#
    .SYNOPSIS
        Finds the certificate to use for the HTTPS WS-Man Listener

    .PARAMETER Issuer
        The Issuer of the certificate to use for the HTTPS WS-Man Listener if a thumbprint is
        not specified.

    .PARAMETER SubjectFormat
        The format used to match the certificate subject to use for an HTTPS WS-Man Listener
        if a thumbprint is not specified.

    .PARAMETER MatchAlternate
        Should the FQDN/Name be used to also match the certificate alternate subject for an HTTPS WS-Man
        Listener if a thumbprint is not specified.

    .PARAMETER DN
        This is a Distinguished Name component that will be used to identify the certificate to use
        for the HTTPS WS-Man Listener if a thumbprint is not specified.

    .PARAMETER CertificateThumbprint
        The Thumbprint of the certificate to use for the HTTPS WS-Man Listener.
#>
function Find-Certificate
{
    [CmdletBinding()]
    [OutputType([System.Security.Cryptography.X509Certificates.X509Certificate2])]
    param
    (
        [Parameter()]
        [System.String]
        $Issuer,

        [Parameter()]
        [ValidateSet('Both', 'FQDNOnly', 'NameOnly')]
        [System.String]
        $SubjectFormat = 'Both',

        [Parameter()]
        [System.Boolean]
        $MatchAlternate,

        [Parameter()]
        [System.String]
        $DN,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [System.String]
        $Hostname
    )

    [System.String] $thumbprint = ''

    if ($PSBoundParameters.ContainsKey('CertificateThumbprint'))
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($script:localizedData.FindCertificateByThumbprintMessage) `
                    -f $CertificateThumbprint
            ) -join '' )

        $certificate = Get-ChildItem -Path Cert:\localmachine\my | Where-Object -FilterScript {
                ($_.Thumbprint -eq $CertificateThumbprint)
            } | Select-Object -First 1
    }
    else
    {
        # First try and find a certificate that is used to the FQDN of the machine
        if ($SubjectFormat -in 'Both', 'FQDNOnly')
        {
            # Lookup the certificate using the FQDN of the machine
            if ([System.String]::IsNullOrEmpty($Hostname))
            {
                $Hostname = [System.Net.Dns]::GetHostByName($ENV:computerName).Hostname
            }
            $Subject = "CN=$Hostname"

            if ($PSBoundParameters.ContainsKey('DN'))
            {
                $Subject = "$Subject, $DN"
            } # if

            if ($MatchAlternate)
            {
                # Try and lookup the certificate using the subject and the alternate name
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($script:localizedData.FindCertificateAlternateMessage) `
                            -f $Issuer, $Subject, $Hostname
                    ) -join '' )

                $certificate = (Get-ChildItem -Path Cert:\localmachine\my | Where-Object -FilterScript {
                        ($_.Extensions.EnhancedKeyUsages.FriendlyName `
                                -contains 'Server Authentication') -and
                        ($_.Issuer -eq $Issuer) -and
                        ($Hostname -in $_.DNSNameList.Unicode) -and
                        ($_.Subject -eq $Subject)
                    } | Select-Object -First 1)
            }
            else
            {
                # Try and lookup the certificate using the subject name
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($script:localizedData.FindCertificateMessage) `
                            -f $Issuer, $Subject
                    ) -join '' )

                $certificate = Get-ChildItem -Path Cert:\localmachine\my | Where-Object -FilterScript {
                        ($_.Extensions.EnhancedKeyUsages.FriendlyName `
                                -contains 'Server Authentication') -and
                        ($_.Issuer -eq $Issuer) -and
                        ($_.Subject -eq $Subject)
                    } | Select-Object -First 1
            } # if
        }

        if (-not $certificate `
                -and ($SubjectFormat -in 'Both', 'NameOnly'))
        {
            # If could not find an FQDN cert, try for one issued to the computer name
            [System.String] $Hostname = $ENV:ComputerName
            [System.String] $Subject = "CN=$Hostname"

            if ($PSBoundParameters.ContainsKey('DN'))
            {
                $Subject = "$Subject, $DN"
            } # if

            if ($MatchAlternate)
            {
                # Try and lookup the certificate using the subject and the alternate name
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($script:localizedData.FindCertificateAlternateMessage) `
                            -f $Issuer, $Subject, $Hostname
                    ) -join '' )

                $certificate = Get-ChildItem -Path Cert:\localmachine\my | Where-Object -FilterScript {
                        ($_.Extensions.EnhancedKeyUsages.FriendlyName `
                                -contains 'Server Authentication') -and
                        ($_.Issuer -eq $Issuer) -and
                        ($Hostname -in $_.DNSNameList.Unicode) -and
                        ($_.Subject -eq $Subject)
                    } | Select-Object -First 1
            }
            else
            {
                # Try and lookup the certificate using the subject name
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($script:localizedData.FindCertificateMessage) `
                            -f $Issuer, $Subject
                    ) -join '' )

                $certificate = Get-ChildItem -Path Cert:\localmachine\my | Where-Object -FilterScript {
                        ($_.Extensions.EnhancedKeyUsages.FriendlyName `
                                -contains 'Server Authentication') -and
                        ($_.Issuer -eq $Issuer) -and
                        ($_.Subject -eq $Subject)
                    } | Select-Object -First 1
            } # if
        } # if
    } # if

    if ($certificate)
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($script:localizedData.CertificateFoundMessage) `
                    -f $certificate.thumbprint
            ) -join '' )
    }
    else
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($script:localizedData.CertificateNotFoundMessage) `
            ) -join '' )
    } # if

    return $certificate
} # Find-Certificate

Export-ModuleMember -Function *-TargetResource
