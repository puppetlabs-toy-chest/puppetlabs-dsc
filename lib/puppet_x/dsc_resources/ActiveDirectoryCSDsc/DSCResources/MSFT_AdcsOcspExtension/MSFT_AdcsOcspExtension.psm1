$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the ADCS Deployment Resource Common Module.
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'ActiveDirectoryCSDsc.CommonHelper' `
            -ChildPath 'ActiveDirectoryCSDsc.CommonHelper.psm1'))

# Import the ADCS Deployment Resource Helper Module.
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'ActiveDirectoryCSDsc.ResourceHelper' `
            -ChildPath 'ActiveDirectoryCSDsc.ResourceHelper.psm1'))

# Import Localization Strings.
$LocalizedData = Get-LocalizedData `
    -ResourceName 'MSFT_AdcsOcspExtension' `
    -ResourcePath (Split-Path -Parent $script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
        Gets the current certification authority AddToCertificateOcsp (boolean) and Uniform Resource Identifiers (URI)
        settings.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'..

    .PARAMETER OcspUriPath
        Specifies the address of the OCSP responder from where revocation of this certificate can be checked.

    .PARAMETER RestartService
        Specifies if the CertSvc service should be restarted to immediately apply the settings.

    .PARAMETER Ensure
        Specifies if the OCSP responder URI should be present or absent.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance,

        [Parameter(Mandatory = $true)]
        [System.String[]]
        $OcspUriPath,

        [Parameter()]
        [System.Boolean]
        $RestartService,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    Write-Verbose -Message $localizedData.GetOcspUriPaths

    [System.Array] $currentOcspUriPathList = (Get-CAAuthorityInformationAccess).Where( {
        $_.AddToCertificateOcsp -eq $true
    } ).Uri

    return @{
        OcspUriPath      = $currentOcspUriPathList
        Ensure           = $Ensure
        IsSingleInstance = $IsSingleInstance
        RestartService   = $RestartService
    }
}

<#
    .SYNOPSIS
        Sets the certification authority AddToCertificateOcsp (boolean) and Uniform Resource Identifiers (URI) settings.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'..

    .PARAMETER OcspUriPath
        Specifies the address of the OCSP responder from where revocation of this certificate can be checked.

    .PARAMETER RestartService
        Specifies if the CertSvc service should be restarted to immediately apply the settings.

    .PARAMETER Ensure
        Specifies if the OCSP responder URI should be present or absent.
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance,

        [Parameter(Mandatory = $true)]
        [System.String[]]
        $OcspUriPath,

        [Parameter()]
        [System.Boolean]
        $RestartService,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    $currentState = Get-TargetResource @PSBoundParameters

    if ($Ensure -eq 'Present')
    {
        foreach ($oldField in $currentState.OcspUriPath)
        {
            Write-Verbose -Message ($localizedData.RemoveOcspUriPaths -f $oldField)
            Remove-CAAuthorityInformationAccess -Uri $oldField -Force -ErrorAction Stop
        }

        foreach ($newField in $OcspUriPath)
        {
            Write-Verbose -Message ($localizedData.AddOcspUriPaths -f $newField)
            Add-CAAuthorityInformationAccess -Uri $newField -AddToCertificateOcsp -Force -ErrorAction Stop
        }
    }
    else
    {
        foreach ($field in $OcspUriPath)
        {
            Write-Verbose -Message ($localizedData.RemoveOcspUriPaths -f $field)
            Remove-CAAuthorityInformationAccess -Uri $field -Force -ErrorAction Stop
        }
    }

    if ($RestartService)
    {
        Write-Verbose -Message $localizedData.RestartService
        Restart-ServiceIfExists -Name CertSvc
    }
}

<#
    .SYNOPSIS
        Tests the current certification authority AddToCertificateOcsp (boolean) and Uniform Resource Identifiers (URI)
        settings.

    .PARAMETER IsSingleInstance
        Specifies the resource is a single instance, the value must be 'Yes'..

    .PARAMETER OcspUriPath
        Specifies the address of the OCSP responder from where revocation of this certificate can be checked.

    .PARAMETER RestartService
        Specifies if the CertSvc service should be restarted to immediately apply the settings.

    .PARAMETER Ensure
        Specifies if the OCSP responder URI should be present or absent.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance,

        [Parameter(Mandatory = $true)]
        [System.String[]]
        $OcspUriPath,

        [Parameter()]
        [System.Boolean]
        $RestartService,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    $currentState = Get-TargetResource @PSBoundParameters

    $inDesiredState = $true

    if ($Ensure -eq 'Present')
    {
        if ($currentState.OcspUriPath.Count -ne $OcspUriPath.Count)
        {
            if ($null -ne $currentState.OcspUriPath)
            {
                $compareOcspUriPaths = Compare-Object -ReferenceObject $OcspUriPath -DifferenceObject $currentState.OcspUriPath -PassThru

                # Desired state OCSP URI path(s) not found in reference set.
                $desiredOcspUriPathsMissing  = $compareOcspUriPaths.Where( {
                    $_.SideIndicator -eq '<='
                } ) -join ', '

                # OCSP URI path(s) found in $currentState that do not match $OcspUriPath desired state.
                $notDesiredOcspUriPathsFound = $compareOcspUriPaths.Where( {
                    $_.SideIndicator -eq '=>'
                } ) -join ', '

                if ($desiredOcspUriPathsMissing)
                {
                    Write-Verbose -Message ($localizedData.DesiredOcspPathsMissing -f $desiredOcspUriPathsMissing)
                    $inDesiredState = $false
                }

                if ($notDesiredOcspUriPathsFound)
                {
                    Write-Verbose -Message ($localizedData.AdditionalOcspPathsFound -f $notDesiredOcspUriPathsFound)
                    $inDesiredState = $false
                }
            }
            else
            {
                $ocspUriPathList = $OcspUriPath -join ', '

                Write-Verbose -Message ($localizedData.OcspPathsNull -f $ocspUriPathList)
                $inDesiredState = $false
            }
        }

        foreach ($uri in $currentState.OcspUriPath)
        {
            if ($uri -notin $OcspUriPath)
            {
                Write-Verbose -Message ($localizedData.IncorrectOcspUriFound -f $uri)
                $inDesiredState = $false
            }
        }
    }
    else
    {
        foreach ($uri in $OcspUriPath)
        {
            if ($uri -in $currentState.OcspUriPath)
            {
                Write-Verbose -Message ($localizedData.EnsureAbsentButUriPathsExist -f $uri)
                $inDesiredState = $false
            }
        }
    }

    return $inDesiredState
}

Export-ModuleMember -Function Get-TargetResource, Test-TargetResource, Set-TargetResource
