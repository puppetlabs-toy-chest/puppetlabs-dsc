require 'pathname'

Puppet::Type.newtype(:dsc_officeonlineserverfarm) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC OfficeOnlineServerFarm resource type.
    Automatically generated from
    'OfficeOnlineServerDsc/DSCResources/MSFT_OfficeOnlineServerFarm/MSFT_OfficeOnlineServerFarm.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_internalurl is a required attribute') if self[:dsc_internalurl].nil?
    end

  def dscmeta_resource_friendly_name; 'OfficeOnlineServerFarm' end
  def dscmeta_resource_name; 'MSFT_OfficeOnlineServerFarm' end
  def dscmeta_module_name; 'OfficeOnlineServerDsc' end
  def dscmeta_module_version; '1.0.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         PsDscRunAsCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_psdscrunascredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "PsDscRunAsCredential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         AllowCEIP
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowceip) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowCEIP - Enables Customer Experience Improvement Program (CEIP) reporting on all servers in the Office Web Apps Server farm"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowHttp
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowhttp) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowHttp - Indicates that IIS sites should be provisioned on port 80 for HTTP access. Use AllowHTTP only in environments where all computers require IPSEC (full encryption) or in test environments that do not contain sensitive files."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowHttpSecureStoreConnections
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowhttpsecurestoreconnections) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowHttpSecureStoreConnections - Indicates that secure store connections can be made by using non-SSL connections (such as HTTP). The default is False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CacheLocation
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cachelocation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CacheLocation - Specifies the location of the global disk cache that is used to store rendered image files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CacheSizeInGB
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cachesizeingb) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "CacheSizeInGB - Specifies the maximum size of the global disk cache in gigabytes."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         CertificateName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_certificatename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CertificateName - Specifies the friendly name of the certificate that Office Web Apps Server uses to create HTTPS bindings."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ClipartEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_clipartenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ClipartEnabled - Enables support for inserting clip art from Office.com into Office documents. This feature requires server-to-web communication, configured either directly or by using a proxy that you specify by using the Proxy parameter."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DocumentInfoCacheSize
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_documentinfocachesize) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "DocumentInfoCacheSize - Specifies the maximum number of document conversion records that are stored in a memory cache."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EditingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_editingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EditingEnabled - Enables support for editing in the browser. The default is False. Only set to True if you have the appropriate licensing to use the editing functionality."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExcelAllowExternalData
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelallowexternaldata) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ExcelAllowExternalData - Enables the refresh of supported external data in Excel Web App workbooks where workbooks contain connections to external data. The default is True."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExcelConnectionLifetime
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelconnectionlifetime) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ExcelConnectionLifetime - Specifies the duration, in seconds, of external data connections for Excel Web App. The default is 1800 seconds."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ExcelExternalDataCacheLifetime
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelexternaldatacachelifetime) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ExcelExternalDataCacheLifetime - Specifes the duration, in seconds, of the external data cache lifetime in Excel Web App. The default is 300 seconds."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ExcelPrivateBytesMax
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelprivatebytesmax) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ExcelPrivateBytesMax - Specifies the maximum private bytes, in megabytes, used by Excel Web App. When set to -1, the maximum private bytes use 50 percent of physical memory on the computer."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ExcelRequestDurationMax
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelrequestdurationmax) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ExcelRequestDurationMax - Specifies the maximum duration, in seconds, for a single request in a session. After this time elapses, the request times out."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ExcelSessionTimeout
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelsessiontimeout) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ExcelSessionTimeout - Specifies the time, in seconds, that a session remains active in Excel Web App when there is no user activity."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ExcelUdfsAllowed
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_exceludfsallowed) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ExcelUdfsAllowed - Activates user-defined functions for use with Web Excel."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExcelWarnOnDataRefresh
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelwarnondatarefresh) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ExcelWarnOnDataRefresh - Turns off or on the warning dialog displayed when data refreshes in Excel Web App."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExcelWorkbookSizeMax
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelworkbooksizemax) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ExcelWorkbookSizeMax - Specifies the maximum size, in megabytes, of a workbook that can be loaded."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ExcelMemoryCacheThreshold
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelmemorycachethreshold) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ExcelMemoryCacheThreshold - The percentage of the Maximum Private Bytes that can be allocated to inactive objects. When the memory cache threshold is exceeded, cached objects that are not currently in use are released."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ExcelUnusedObjectAgeMax
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelunusedobjectagemax) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ExcelUnusedObjectAgeMax - The maximum time (in minutes) that inactive objects remain in the memory cache. Inactive objects are objects that are not used in a session."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ExcelCachingUnusedFiles
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelcachingunusedfiles) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ExcelCachingUnusedFiles - Enable caching of files that are no longer in use by Web Excel sessions."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExcelAbortOnRefreshOnOpenFail
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelabortonrefreshonopenfail) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ExcelAbortOnRefreshOnOpenFail - Specifies that the loading of a Web Excel file automatically fails if an automatic data refresh operation fails when the file is opened."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExcelAutomaticVolatileFunctionCacheLifetime
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelautomaticvolatilefunctioncachelifetime) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ExcelAutomaticVolatileFunctionCacheLifetime - Specifies the maximum time, in seconds, that a computed value for a volatile function is cached for automatic recalculations."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ExcelConcurrentDataRequestsPerSessionMax
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelconcurrentdatarequestspersessionmax) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ExcelConcurrentDataRequestsPerSessionMax - Specifies the maximum number of concurrent external data requests allowed in each session. If a session must issue more than this number of requests, additional requests must be queued. The scope of this setting is the logical server."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ExcelDefaultWorkbookCalcMode
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_exceldefaultworkbookcalcmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExcelDefaultWorkbookCalcMode - Specifies the calculation mode of workbooks.  Settings other than File override the workbook settings."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ExcelRestExternalDataEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelrestexternaldataenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ExcelRestExternalDataEnabled - Specifies whether requests from the Representational State Transfer (REST) Application Programming Interface (API) are permitted to refresh external data connections."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExcelChartAndImageSizeMax
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excelchartandimagesizemax) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ExcelChartAndImageSizeMax - Specifies the maximum size, in megabytes, of a chart or image that can be opened."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ExternalURL
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externalurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExternalURL - Specifies the URL root that clients use to access the Office Web Apps Server farm from the Internet. In the case of a load-balanced, multiserver Office Web Apps Server farm, the external URL is bound to the IP address of the external-facing load balancer."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FarmOU
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_farmou) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FarmOU - Specifies the name of the Active Directory organizational unit (OU) that servers must be a member of to join the Office Web Apps Server farm. Use this parameter to prevent unauthorized servers (that is, servers that are not in the OU) from joining an Office Web Apps Server farm."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InternalURL
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_internalurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InternalURL - Specifies the URL root that clients use to access the Office Web Apps Server farm from the intranet."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogLocation
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_loglocation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogLocation - Specifies the location on the local computer where activity logs are stored."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogRetentionInDays
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logretentionindays) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "LogRetentionInDays - Specifies the number of days that log entries are stored. Log entries older than the configured date are trimmed."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         LogVerbosity
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logverbosity) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogVerbosity - Specifies how much information is stored in the trace log files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxMemoryCacheSizeInMB
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxmemorycachesizeinmb) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "MaxMemoryCacheSizeInMB - Specifies, in megabytes, the maximum amount of memory that the rendering cache can use."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxTranslationCharacterCount
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxtranslationcharactercount) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "MaxTranslationCharacterCount - Specifies the maximum amount of characters a document can have in order to be translated."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         OpenFromUncEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_openfromuncenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "OpenFromUncEnabled - Turns on or off the ability to use Online Viewers to view Office files from a UNC path."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         OpenFromUrlEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_openfromurlenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "OpenFromUrlEnabled - Turns on or off the ability to use Online Viewers to view Office files from a URL or UNC path."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         OpenFromUrlThrottlingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_openfromurlthrottlingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "OpenFromUrlThrottlingEnabled - Throttles the number of open from URL requests from any given server in a time period. The default throttling values, which are not configurable, make sure that an Office Web Apps Server farm will not overwhelm a single server with requests for content to be viewed in the Online Viewers."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Proxy
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_proxy) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Proxy - Specifies the URL of the proxy server that is configured to allow HTTP requests to external sites. Typically configured in conjunction with the ClipartEnabled and TranslationEnabled parameters."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RecycleActiveProcessCount
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recycleactiveprocesscount) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "RecycleActiveProcessCount - Specifies the number of files that a single Word or PowerPoint process can render before the process is recycled."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RenderingLocalCacheLocation
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_renderinglocalcachelocation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RenderingLocalCacheLocation - Specifies the location of the temporary cache for use by the Word and PowerPoint Viewing Services."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SSLOffloaded
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ssloffloaded) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SSLOffloaded - Indicates to the servers in the Office Web Apps Server farm that SSL is offloaded to the load balancer. When SSLOffloaded is enabled, web applications are bound to port 80 (HTTP) on the local server. However, HTML that references other resources, such as CSS or images, uses HTTPS URLs for those references."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         TranslationEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_translationenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "TranslationEnabled - Enables support for automatic document translation using Microsoft Translator, an online service that translates text between languages. The translated file is shown in the Word Web App. Because Microsoft Translator is an online service, you must enable server-to-web communication directly or by using a proxy that you specify by using the Proxy parameter."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         TranslationServiceAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_translationserviceaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TranslationServiceAddress - Specifies the URL of the translation server that translation requests are sent to. The default is the Microsoft Translator online service. Typically you will not use this parameter unless you must change translation services."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TranslationServiceAppId
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_translationserviceappid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TranslationServiceAppId - Specifies the application ID for the translation service. The default is the public application ID for Office Web Apps. Typically you will not use this parameter unless you have negotiated with Microsoft Translator for additional services and they have provided you with a private application ID."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AllowOutboundHttp
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowoutboundhttp) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowOutboundHttp"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExcelUseEffectiveUserName
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_exceluseeffectiveusername) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ExcelUseEffectiveUserName"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         S2SCertificateName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_s2scertificatename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "S2SCertificateName"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RemovePersonalInformationFromLogs
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_removepersonalinformationfromlogs) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RemovePersonalInformationFromLogs"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         PicturePasteDisabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_picturepastedisabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "PicturePasteDisabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_officeonlineserverfarm).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
