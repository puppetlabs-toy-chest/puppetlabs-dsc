$script:v16onlyParams = @("AllowOutboundHttp", "S2SCertificateName", "OnlinePictureEnabled", `
                          "OnlineVideoEnabled", "OfficeAddinEnabled", `
                          "ExcelUseEffectiveUserName", "ExcelUdfsAllowed", `
                          "ExcelMemoryCacheThreshold", "ExcelUnusedObjectAgeMax", `
                          "ExcelCachingUnusedFiles", "ExcelAbortOnRefreshOnOpenFail", `
                          "ExcelAutomaticVolatileFunctionCacheLifeTime", `
                          "ExcelConcurrentDataRequestsPerSessionMax", `
                          "ExcelDefaultWorkbookCalcMode", "ExcelRestExternalDataEnabled", `
                          "ExcelChartAndImageSizeMax")

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [System.Boolean]
        $AllowCEIP,

        [System.Boolean]
        $AllowHttp,

        [System.Boolean]
        $AllowHttpSecureStoreConnections,

        [System.String]
        $CacheLocation,

        [System.Int32]
        $CacheSizeInGB,

        [System.String]
        $CertificateName,

        [System.Boolean]
        $ClipartEnabled,

        [System.Int32]
        $DocumentInfoCacheSize,

        [System.Boolean]
        $EditingEnabled,

        [System.Boolean]
        $ExcelAllowExternalData,

        [System.Int32]
        $ExcelConnectionLifetime,

        [System.Int32]
        $ExcelExternalDataCacheLifetime,

        [System.Int32]
        $ExcelPrivateBytesMax,

        [System.Int32]
        $ExcelRequestDurationMax,

        [System.Int32]
        $ExcelSessionTimeout,

        [System.Boolean]
        $ExcelUdfsAllowed,

        [System.Boolean]
        $ExcelWarnOnDataRefresh,

        [System.Int32]
        $ExcelWorkbookSizeMax,

        [System.Int32]
        $ExcelMemoryCacheThreshold,

        [System.Int32]
        $ExcelUnusedObjectAgeMax,

        [System.Boolean]
        $ExcelCachingUnusedFiles,

        [System.Boolean]
        $ExcelAbortOnRefreshOnOpenFail,

        [System.Int32]
        $ExcelAutomaticVolatileFunctionCacheLifetime,

        [System.Int32]
        $ExcelConcurrentDataRequestsPerSessionMax,

        [System.String]
        $ExcelDefaultWorkbookCalcMode,

        [System.Boolean]
        $ExcelRestExternalDataEnabled,

        [System.Int32]
        $ExcelChartAndImageSizeMax,

        [System.String]
        $ExternalURL,

        [System.String]
        $FarmOU,

        [parameter(Mandatory = $true)]
        [System.String]
        $InternalURL,

        [System.String]
        $LogLocation,

        [System.Int32]
        $LogRetentionInDays,

        [System.String]
        $LogVerbosity,

        [System.Int32]
        $MaxMemoryCacheSizeInMB,

        [System.Int32]
        $MaxTranslationCharacterCount,

        [System.Boolean]
        $OpenFromUncEnabled,

        [System.Boolean]
        $OpenFromUrlEnabled,

        [System.Boolean]
        $OpenFromUrlThrottlingEnabled,

        [System.String]
        $Proxy,

        [System.Int32]
        $RecycleActiveProcessCount,

        [System.String]
        $RenderingLocalCacheLocation,

        [System.Boolean]
        $SSLOffloaded,

        [System.Boolean]
        $TranslationEnabled,

        [System.String]
        $TranslationServiceAddress,

        [System.String]
        $TranslationServiceAppId,

        [System.Boolean]
        $AllowOutboundHttp,

        [System.Boolean]
        $ExcelUseEffectiveUserName,

        [System.String]
        $S2SCertificateName,

        [System.Boolean]
        $RemovePersonalInformationFromLogs,

        [System.Boolean]
        $PicturePasteDisabled
    )

    Test-OosDscV16Support -Parameters $PSBoundParameters

    try
    {
        $officeWebAppsFarm = Get-OfficeWebAppsFarm -ErrorAction Stop
    }
    catch
    {
        Write-Verbose -Message $_        
    }

    $returnValue = @{
        AllowCEIP = $officeWebAppsFarm.AllowCEIP
        AllowHttp = $officeWebAppsFarm.AllowHTTP
        AllowHttpSecureStoreConnections = $officeWebAppsFarm.AllowHttpSecureStoreConnections
        CacheLocation = $officeWebAppsFarm.CacheLocation
        CacheSizeInGB = $officeWebAppsFarm.CacheSizeInGB
        CertificateName = $officeWebAppsFarm.CertificateName
        ClipartEnabled = $officeWebAppsFarm.ClipartEnabled
        DocumentInfoCacheSize = $officeWebAppsFarm.DocumentInfoCacheSize
        EditingEnabled = $officeWebAppsFarm.EditingEnabled
        ExcelAllowExternalData = $officeWebAppsFarm.ExcelAllowExternalData
        ExcelConnectionLifetime = $officeWebAppsFarm.ExcelConnectionLifetime
        ExcelExternalDataCacheLifetime = $officeWebAppsFarm.ExcelExternalDataCacheLifetime
        ExcelPrivateBytesMax = $officeWebAppsFarm.ExcelPrivateBytesMax
        ExcelRequestDurationMax = $officeWebAppsFarm.ExcelRequestDurationMax
        ExcelSessionTimeout = $officeWebAppsFarm.ExcelSessionTimeout
        ExcelUdfsAllowed = $officeWebAppsFarm.ExcelUdfsAllowed
        ExcelWarnOnDataRefresh = $officeWebAppsFarm.ExcelWarnOnDataRefresh
        ExcelWorkbookSizeMax = $officeWebAppsFarm.ExcelWorkbookSizeMax
        ExcelMemoryCacheThreshold = $officeWebAppsFarm.ExcelMemoryCacheThreshold
        ExcelUnusedObjectAgeMax = $officeWebAppsFarm.ExcelUnusedObjectAgeMax
        ExcelCachingUnusedFiles = $officeWebAppsFarm.ExcelCachingUnusedFiles
        ExcelAbortOnRefreshOnOpenFail = $officeWebAppsFarm.ExcelAbortOnRefreshOnOpenFail
        ExcelAutomaticVolatileFunctionCacheLifetime = $officeWebAppsFarm.ExcelAutomaticVolatileFunctionCacheLifeTime
        ExcelConcurrentDataRequestsPerSessionMax = $officeWebAppsFarm.ExcelConcurrentDataRequestsPerSessionMax
        ExcelDefaultWorkbookCalcMode = $officeWebAppsFarm.ExcelDefaultWorkbookCalcMode
        ExcelRestExternalDataEnabled = $officeWebAppsFarm.ExcelRestExternalDataEnabled
        ExcelChartAndImageSizeMax = $officeWebAppsFarm.ExcelChartAndImageSizeMax
        ExternalURL = $officeWebAppsFarm.ExternalURL
        FarmOU = $officeWebAppsFarm.FarmOU
        InternalURL = $officeWebAppsFarm.InternalURL
        LogLocation = $officeWebAppsFarm.LogLocation
        LogRetentionInDays = $officeWebAppsFarm.LogRetentionInDays
        LogVerbosity = $officeWebAppsFarm.LogVerbosity
        MaxMemoryCacheSizeInMB = $officeWebAppsFarm.MaxMemoryCacheSizeInMB
        MaxTranslationCharacterCount = $officeWebAppsFarm.MaxTranslationCharacterCount
        OpenFromUncEnabled = $officeWebAppsFarm.OpenFromUncEnabled
        OpenFromUrlEnabled = $officeWebAppsFarm.OpenFromUrlEnabled
        OpenFromUrlThrottlingEnabled = $officeWebAppsFarm.OpenFromUrlThrottlingEnabled
        PicturePasteDisabled = $officeWebAppsFarm.PicturePasteDisabled
        Proxy = $officeWebAppsFarm.Proxy
        RecycleActiveProcessCount = $officeWebAppsFarm.RecycleActiveProcessCount
        RenderingLocalCacheLocation = $officeWebAppsFarm.RenderingLocalCacheLocation
        SSLOffloaded = $officeWebAppsFarm.SSLOffloaded
        TranslationEnabled = $officeWebAppsFarm.TranslationEnabled
        TranslationServiceAddress = $officeWebAppsFarm.TranslationServiceAddress
        TranslationServiceAppId = $officeWebAppsFarm.TranslationServiceAppId
        RemovePersonalInformationFromLogs = $officeWebAppsFarm.RemovePersonalInformationFromLogs
        ExcelUseEffectiveUserName = $officeWebAppsFarm.ExcelUseEffectiveUserName
        AllowOutboundHttp = $officeWebAppsFarm.AllowOutboundHttp
        S2SCertificateName = $officeWebAppsFarm.S2SCertificateName
    }

    return $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [System.Boolean]
        $AllowCEIP,

        [System.Boolean]
        $AllowHttp,

        [System.Boolean]
        $AllowHttpSecureStoreConnections,

        [System.String]
        $CacheLocation,

        [System.Int32]
        $CacheSizeInGB,

        [System.String]
        $CertificateName,

        [System.Boolean]
        $ClipartEnabled,

        [System.Int32]
        $DocumentInfoCacheSize,

        [System.Boolean]
        $EditingEnabled,

        [System.Boolean]
        $ExcelAllowExternalData,

        [System.Int32]
        $ExcelConnectionLifetime,

        [System.Int32]
        $ExcelExternalDataCacheLifetime,

        [System.Int32]
        $ExcelPrivateBytesMax,

        [System.Int32]
        $ExcelRequestDurationMax,

        [System.Int32]
        $ExcelSessionTimeout,

        [System.Boolean]
        $ExcelUdfsAllowed,

        [System.Boolean]
        $ExcelWarnOnDataRefresh,

        [System.Int32]
        $ExcelWorkbookSizeMax,

        [System.Int32]
        $ExcelMemoryCacheThreshold,

        [System.Int32]
        $ExcelUnusedObjectAgeMax,

        [System.Boolean]
        $ExcelCachingUnusedFiles,

        [System.Boolean]
        $ExcelAbortOnRefreshOnOpenFail,

        [System.Int32]
        $ExcelAutomaticVolatileFunctionCacheLifetime,

        [System.Int32]
        $ExcelConcurrentDataRequestsPerSessionMax,

        [System.String]
        $ExcelDefaultWorkbookCalcMode,

        [System.Boolean]
        $ExcelRestExternalDataEnabled,

        [System.Int32]
        $ExcelChartAndImageSizeMax,

        [System.String]
        $ExternalURL,

        [System.String]
        $FarmOU,

        [parameter(Mandatory = $true)]
        [System.String]
        $InternalURL,

        [System.String]
        $LogLocation,

        [System.Int32]
        $LogRetentionInDays,

        [System.String]
        $LogVerbosity,

        [System.Int32]
        $MaxMemoryCacheSizeInMB,

        [System.Int32]
        $MaxTranslationCharacterCount,

        [System.Boolean]
        $OpenFromUncEnabled,

        [System.Boolean]
        $OpenFromUrlEnabled,

        [System.Boolean]
        $OpenFromUrlThrottlingEnabled,

        [System.String]
        $Proxy,

        [System.Int32]
        $RecycleActiveProcessCount,

        [System.String]
        $RenderingLocalCacheLocation,

        [System.Boolean]
        $SSLOffloaded,

        [System.Boolean]
        $TranslationEnabled,

        [System.String]
        $TranslationServiceAddress,

        [System.String]
        $TranslationServiceAppId,

        [System.Boolean]
        $AllowOutboundHttp,

        [System.Boolean]
        $ExcelUseEffectiveUserName,

        [System.String]
        $S2SCertificateName,

        [System.Boolean]
        $RemovePersonalInformationFromLogs,

        [System.Boolean]
        $PicturePasteDisabled
    )

    Test-OosDscV16Support -Parameters $PSBoundParameters

    try
    {
        $officeWebAppsFarm = Get-OfficeWebAppsFarm -ErrorAction Stop
    }
    catch
    {
        Write-Verbose -Message $_        
    }

    if(-not $officeWebAppsFarm)
    {
        Write-Verbose "Installing new WebAppsFarm"
        New-OfficeWebAppsFarm @PSBoundParameters -Force
    }
    else
    {
        Write-Verbose "WebAppsFarm found setting parameters on farm"
        Set-OfficeWebAppsFarm @PSBoundParameters -Force
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [System.Boolean]
        $AllowCEIP,

        [System.Boolean]
        $AllowHttp,

        [System.Boolean]
        $AllowHttpSecureStoreConnections,

        [System.String]
        $CacheLocation,

        [System.Int32]
        $CacheSizeInGB,

        [System.String]
        $CertificateName,

        [System.Boolean]
        $ClipartEnabled,

        [System.Int32]
        $DocumentInfoCacheSize,

        [System.Boolean]
        $EditingEnabled,

        [System.Boolean]
        $ExcelAllowExternalData,

        [System.Int32]
        $ExcelConnectionLifetime,

        [System.Int32]
        $ExcelExternalDataCacheLifetime,

        [System.Int32]
        $ExcelPrivateBytesMax,

        [System.Int32]
        $ExcelRequestDurationMax,

        [System.Int32]
        $ExcelSessionTimeout,

        [System.Boolean]
        $ExcelUdfsAllowed,

        [System.Boolean]
        $ExcelWarnOnDataRefresh,

        [System.Int32]
        $ExcelWorkbookSizeMax,

        [System.Int32]
        $ExcelMemoryCacheThreshold,

        [System.Int32]
        $ExcelUnusedObjectAgeMax,

        [System.Boolean]
        $ExcelCachingUnusedFiles,

        [System.Boolean]
        $ExcelAbortOnRefreshOnOpenFail,

        [System.Int32]
        $ExcelAutomaticVolatileFunctionCacheLifetime,

        [System.Int32]
        $ExcelConcurrentDataRequestsPerSessionMax,

        [System.String]
        $ExcelDefaultWorkbookCalcMode,

        [System.Boolean]
        $ExcelRestExternalDataEnabled,

        [System.Int32]
        $ExcelChartAndImageSizeMax,

        [System.String]
        $ExternalURL,

        [System.String]
        $FarmOU,

        [parameter(Mandatory = $true)]
        [System.String]
        $InternalURL,

        [System.String]
        $LogLocation,

        [System.Int32]
        $LogRetentionInDays,

        [System.String]
        $LogVerbosity,

        [System.Int32]
        $MaxMemoryCacheSizeInMB,

        [System.Int32]
        $MaxTranslationCharacterCount,

        [System.Boolean]
        $OpenFromUncEnabled,

        [System.Boolean]
        $OpenFromUrlEnabled,

        [System.Boolean]
        $OpenFromUrlThrottlingEnabled,

        [System.String]
        $Proxy,

        [System.Int32]
        $RecycleActiveProcessCount,

        [System.String]
        $RenderingLocalCacheLocation,

        [System.Boolean]
        $SSLOffloaded,

        [System.Boolean]
        $TranslationEnabled,

        [System.String]
        $TranslationServiceAddress,

        [System.String]
        $TranslationServiceAppId,

        [System.Boolean]
        $AllowOutboundHttp,

        [System.Boolean]
        $ExcelUseEffectiveUserName,

        [System.String]
        $S2SCertificateName,

        [System.Boolean]
        $RemovePersonalInformationFromLogs,

        [System.Boolean]
        $PicturePasteDisabled
    )

    Test-OosDscV16Support -Parameters $PSBoundParameters

    try
    {
        $officeWebAppsFarm = Get-OfficeWebAppsFarm -ErrorAction Stop
    }
    catch
    {
        Write-Verbose -Message $_
        return $false
    }

    if($PSBoundParameters.ContainsKey('FarmOU'))
    {
        if ((Test-OosDscFarmOu -ExistingOU $officeWebAppsFarm.FarmOU -DesiredOU $FarmOU) -ne $true)
        {
            Write-Verbose -Message ("FarmOU not in a desired state. " + `
                                    "Expected: '$($PSBoundParameters['FarmOU'])'. " + `
                                    "Actual: '$($officeWebAppsFarm.FarmOU)'.")
            return $false
        }
    }

    $currentValues = Get-TargetResource @PSBoundParameters

    if ($InternalURL.EndsWith('/') -eq $false)
    {
        $InternalURL += "/"
    }
    if ($ExternalURL.EndsWith('/') -eq $false)
    {
        $ExternalURL += "/"
    }
    if ($Proxy.EndsWith('/') -eq $false)
    {
        $Proxy += "/"
    }
    return Test-OosDscParameterState -CurrentValues $currentValues `
                                   -DesiredValues $PSBoundParameters `
                                   -ValuesToCheck @(
                                       "InternalURL",
                                       "ExternalURL",
                                       "Proxy",
                                       "AllowHTTP",
                                       "AllowOutboundHttp",
                                       "SSLOffloaded",
                                       "CertificateName",
                                       "S2SCertificateName",
                                       "EditingEnabled",
                                       "LogLocation",
                                       "LogRetentionInDays",
                                       "LogVerbosity",
                                       "CacheLocation",
                                       "MaxMemoryCacheSizeInMB",
                                       "DocumentInfoCacheSize",
                                       "CacheSizeInGB",
                                       "ClipartEnabled",
                                       "TranslationEnabled",
                                       "MaxTranslationCharacterCount",
                                       "TranslationServiceAppId",
                                       "TranslationServiceAddress",
                                       "RenderingLocalCacheLocation",
                                       "RecycleActiveProcessCount",
                                       "AllowCEIP",
                                       "ExcelRequestDurationMax",
                                       "ExcelSessionTimeout",
                                       "ExcelWorkbookSizeMax",
                                       "ExcelPrivateBytesMax",
                                       "ExcelConnectionLifetime",
                                       "ExcelExternalDataCacheLifetime",
                                       "ExcelAllowExternalData",
                                       "ExcelUseEffectiveUserName",
                                       "ExcelWarnOnDataRefresh",
                                       "ExcelUdfsAllowed",
                                       "ExcelMemoryCacheThreshold",
                                       "ExcelUnusedObjectAgeMax",
                                       "ExcelCachingUnusedFiles",
                                       "ExcelAbortOnRefreshOnOpenFail",
                                       "ExcelAutomaticVolatileFunctionCacheLifeTime",
                                       "ExcelConcurrentDataRequestsPerSessionMax",
                                       "ExcelDefaultWorkbookCalcMode",
                                       "ExcelRestExternalDataEnabled",
                                       "ExcelChartAndImageSizeMax",
                                       "OpenFromUrlEnabled",
                                       "OpenFromUncEnabled",
                                       "OpenFromUrlThrottlingEnabled",
                                       "PicturePasteDisabled",
                                       "RemovePersonalInformationFromLogs",
                                       "AllowHttpSecureStoreConnections"
                                    )
}

function Test-OosDscV16Support
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param(
        [Parameter(Mandatory=$true)]
        [Object]
        $Parameters
    )

    $version = Get-OosDscInstalledProductVersion
    switch ($version.Major) {
        15 {  
            Write-Verbose -Message "Office Web Apps 2013 install detected. Checking parameter use."
            foreach($param in $script:v16onlyParams)
            {
                if ($Parameters.ContainsKey($param) -eq $true)
                {
                    throw "The parameter '$param' is not supported on Office Web Apps Server 2013"
                }
            }
        }
        16 {
            Write-Verbose -Message ("Office Online Server 2016 install detected. All " + `
                                    "parameters are enabled")
        }
        Default {
            throw ("This module only supports Office Web Apps 2013 (v15) and Office " + `
                   "Online Server 2016 (v16). Detected version was $($version.Major)")
        }
    }
}

Export-ModuleMember -Function *-TargetResource

