require 'pathname'

Puppet::Type.newtype(:dsc_xexchtransportservice) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchTransportService resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchTransportService/MSFT_xExchTransportService.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  def dscmeta_resource_friendly_name; 'xExchTransportService' end
  def dscmeta_resource_name; 'MSFT_xExchTransportService' end
  def dscmeta_module_name; 'xExchange' end
  def dscmeta_module_version; '1.11.0.0' end

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

  # Name:         Identity
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identity) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Identity"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         AllowServiceRestart
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowservicerestart) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowServiceRestart"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ActiveUserStatisticsLogMaxAge
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_activeuserstatisticslogmaxage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ActiveUserStatisticsLogMaxAge"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ActiveUserStatisticsLogMaxDirectorySize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_activeuserstatisticslogmaxdirectorysize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ActiveUserStatisticsLogMaxDirectorySize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ActiveUserStatisticsLogMaxFileSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_activeuserstatisticslogmaxfilesize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ActiveUserStatisticsLogMaxFileSize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ActiveUserStatisticsLogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_activeuserstatisticslogpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ActiveUserStatisticsLogPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AgentLogEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_agentlogenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AgentLogEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AgentLogMaxAge
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_agentlogmaxage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AgentLogMaxAge"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AgentLogMaxDirectorySize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_agentlogmaxdirectorysize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AgentLogMaxDirectorySize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AgentLogMaxFileSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_agentlogmaxfilesize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AgentLogMaxFileSize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AgentLogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_agentlogpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AgentLogPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConnectivityLogEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_connectivitylogenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ConnectivityLogEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ConnectivityLogMaxAge
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_connectivitylogmaxage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConnectivityLogMaxAge"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConnectivityLogMaxDirectorySize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_connectivitylogmaxdirectorysize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConnectivityLogMaxDirectorySize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConnectivityLogMaxFileSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_connectivitylogmaxfilesize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConnectivityLogMaxFileSize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConnectivityLogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_connectivitylogpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConnectivityLogPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ContentConversionTracingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_contentconversiontracingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ContentConversionTracingEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DelayNotificationTimeout
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_delaynotificationtimeout) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DelayNotificationTimeout"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DnsLogEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dnslogenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DnsLogEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DnsLogMaxAge
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dnslogmaxage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DnsLogMaxAge"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DnsLogMaxDirectorySize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dnslogmaxdirectorysize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DnsLogMaxDirectorySize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DnsLogMaxFileSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dnslogmaxfilesize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DnsLogMaxFileSize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DnsLogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dnslogpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DnsLogPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ExternalDNSAdapterEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externaldnsadapterenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ExternalDNSAdapterEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExternalDNSAdapterGuid
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externaldnsadapterguid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExternalDNSAdapterGuid"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ExternalDNSProtocolOption
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Any", "UseTcpOnly", "UseUdpOnly"]
  newparam(:dsc_externaldnsprotocoloption) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExternalDNSProtocolOption - Valid values are Any, UseTcpOnly, UseUdpOnly."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Any', 'any', 'UseTcpOnly', 'usetcponly', 'UseUdpOnly', 'useudponly'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Any, UseTcpOnly, UseUdpOnly")
      end
    end
  end

  # Name:         ExternalDNSServers
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externaldnsservers, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExternalDNSServers"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ExternalIPAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externalipaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExternalIPAddress"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InternalDNSAdapterEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_internaldnsadapterenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "InternalDNSAdapterEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         InternalDNSAdapterGuid
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_internaldnsadapterguid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InternalDNSAdapterGuid"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InternalDNSProtocolOption
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Any", "UseTcpOnly", "UseUdpOnly"]
  newparam(:dsc_internaldnsprotocoloption) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InternalDNSProtocolOption - Valid values are Any, UseTcpOnly, UseUdpOnly."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Any', 'any', 'UseTcpOnly', 'usetcponly', 'UseUdpOnly', 'useudponly'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Any, UseTcpOnly, UseUdpOnly")
      end
    end
  end

  # Name:         InternalDNSServers
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_internaldnsservers, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "InternalDNSServers"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         IntraOrgConnectorProtocolLoggingLevel
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Verbose"]
  newparam(:dsc_intraorgconnectorprotocollogginglevel) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IntraOrgConnectorProtocolLoggingLevel - Valid values are None, Verbose."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Verbose', 'verbose'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Verbose")
      end
    end
  end

  # Name:         IntraOrgConnectorSmtpMaxMessagesPerConnection
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_intraorgconnectorsmtpmaxmessagesperconnection) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "IntraOrgConnectorSmtpMaxMessagesPerConnection"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         IrmLogEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_irmlogenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IrmLogEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IrmLogMaxAge
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_irmlogmaxage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IrmLogMaxAge"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IrmLogMaxDirectorySize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_irmlogmaxdirectorysize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IrmLogMaxDirectorySize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IrmLogMaxFileSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_irmlogmaxfilesize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IrmLogMaxFileSize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IrmLogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_irmlogpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IrmLogPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxConcurrentMailboxDeliveries
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxconcurrentmailboxdeliveries) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "MaxConcurrentMailboxDeliveries"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxConcurrentMailboxSubmissions
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxconcurrentmailboxsubmissions) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "MaxConcurrentMailboxSubmissions"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxConnectionRatePerMinute
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxconnectionrateperminute) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "MaxConnectionRatePerMinute"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxOutboundConnections
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxoutboundconnections) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MaxOutboundConnections"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxPerDomainOutboundConnections
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxperdomainoutboundconnections) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MaxPerDomainOutboundConnections"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MessageExpirationTimeout
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_messageexpirationtimeout) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MessageExpirationTimeout"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MessageRetryInterval
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_messageretryinterval) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MessageRetryInterval"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MessageTrackingLogEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_messagetrackinglogenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MessageTrackingLogEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         MessageTrackingLogMaxAge
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_messagetrackinglogmaxage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MessageTrackingLogMaxAge"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MessageTrackingLogMaxDirectorySize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_messagetrackinglogmaxdirectorysize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MessageTrackingLogMaxDirectorySize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MessageTrackingLogMaxFileSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_messagetrackinglogmaxfilesize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MessageTrackingLogMaxFileSize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MessageTrackingLogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_messagetrackinglogpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MessageTrackingLogPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MessageTrackingLogSubjectLoggingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_messagetrackinglogsubjectloggingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MessageTrackingLogSubjectLoggingEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         OutboundConnectionFailureRetryInterval
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_outboundconnectionfailureretryinterval) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "OutboundConnectionFailureRetryInterval"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PickupDirectoryMaxHeaderSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pickupdirectorymaxheadersize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PickupDirectoryMaxHeaderSize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PickupDirectoryMaxMessagesPerMinute
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pickupdirectorymaxmessagesperminute) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "PickupDirectoryMaxMessagesPerMinute"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         PickupDirectoryMaxRecipientsPerMessage
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pickupdirectorymaxrecipientspermessage) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "PickupDirectoryMaxRecipientsPerMessage"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         PickupDirectoryPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pickupdirectorypath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PickupDirectoryPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PipelineTracingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pipelinetracingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "PipelineTracingEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         PipelineTracingPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pipelinetracingpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PipelineTracingPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PipelineTracingSenderAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pipelinetracingsenderaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PipelineTracingSenderAddress"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PoisonMessageDetectionEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_poisonmessagedetectionenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "PoisonMessageDetectionEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         PoisonThreshold
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_poisonthreshold) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "PoisonThreshold"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         QueueLogMaxAge
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_queuelogmaxage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "QueueLogMaxAge"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         QueueLogMaxDirectorySize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_queuelogmaxdirectorysize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "QueueLogMaxDirectorySize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         QueueLogMaxFileSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_queuelogmaxfilesize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "QueueLogMaxFileSize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         QueueLogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_queuelogpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "QueueLogPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         QueueMaxIdleTime
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_queuemaxidletime) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "QueueMaxIdleTime"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReceiveProtocolLogMaxAge
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_receiveprotocollogmaxage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReceiveProtocolLogMaxAge"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReceiveProtocolLogMaxDirectorySize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_receiveprotocollogmaxdirectorysize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReceiveProtocolLogMaxDirectorySize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReceiveProtocolLogMaxFileSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_receiveprotocollogmaxfilesize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReceiveProtocolLogMaxFileSize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReceiveProtocolLogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_receiveprotocollogpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReceiveProtocolLogPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RecipientValidationCacheEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recipientvalidationcacheenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RecipientValidationCacheEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ReplayDirectoryPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_replaydirectorypath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReplayDirectoryPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RootDropDirectoryPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_rootdropdirectorypath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RootDropDirectoryPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RoutingTableLogMaxAge
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_routingtablelogmaxage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RoutingTableLogMaxAge"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RoutingTableLogMaxDirectorySize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_routingtablelogmaxdirectorysize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RoutingTableLogMaxDirectorySize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RoutingTableLogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_routingtablelogpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RoutingTableLogPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SendProtocolLogMaxAge
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sendprotocollogmaxage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SendProtocolLogMaxAge"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SendProtocolLogMaxDirectorySize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sendprotocollogmaxdirectorysize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SendProtocolLogMaxDirectorySize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SendProtocolLogMaxFileSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sendprotocollogmaxfilesize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SendProtocolLogMaxFileSize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SendProtocolLogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sendprotocollogpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SendProtocolLogPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServerStatisticsLogMaxAge
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serverstatisticslogmaxage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerStatisticsLogMaxAge"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServerStatisticsLogMaxDirectorySize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serverstatisticslogmaxdirectorysize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerStatisticsLogMaxDirectorySize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServerStatisticsLogMaxFileSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serverstatisticslogmaxfilesize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerStatisticsLogMaxFileSize"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServerStatisticsLogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serverstatisticslogpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerStatisticsLogPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TransientFailureRetryCount
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_transientfailureretrycount) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "TransientFailureRetryCount"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         TransientFailureRetryInterval
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_transientfailureretryinterval) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TransientFailureRetryInterval"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UseDowngradedExchangeServerAuth
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usedowngradedexchangeserverauth) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UseDowngradedExchangeServerAuth"
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

Puppet::Type.type(:dsc_xexchtransportservice).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
