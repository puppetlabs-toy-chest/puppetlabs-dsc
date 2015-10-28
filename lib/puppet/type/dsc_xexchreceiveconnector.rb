require 'pathname'

Puppet::Type.newtype(:dsc_xexchreceiveconnector) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchReceiveConnector resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xExchange/DSCResources/MSFT_xExchReceiveConnector/MSFT_xExchReceiveConnector.schema.mof
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xExchReceiveConnector"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xExchReceiveConnector"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xExchange"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.3.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Identity
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identity) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      resource[:ensure] = value.downcase
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Present', 'present', 'Absent', 'absent'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Present, Absent")
      end
    end
  end

  # Name:         AdvertiseClientSettings
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_advertiseclientsettings) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AuthMechanism
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authmechanism, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Banner
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_banner) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         BareLinefeedRejectionEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_barelinefeedrejectionenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         BinaryMimeEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_binarymimeenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Bindings
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_bindings, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ChunkingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_chunkingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Comment
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_comment) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConnectionInactivityTimeout
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_connectioninactivitytimeout) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConnectionTimeout
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_connectiontimeout) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DefaultDomain
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_defaultdomain) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DeliveryStatusNotificationEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_deliverystatusnotificationenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DomainController
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domaincontroller) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DomainSecureEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domainsecureenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EightBitMimeEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_eightbitmimeenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EnableAuthGSSAPI
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enableauthgssapi) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Enabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EnhancedStatusCodesEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enhancedstatuscodesenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExtendedProtectionPolicy
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Allow", "Require"]
  newparam(:dsc_extendedprotectionpolicy) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Allow', 'allow', 'Require', 'require'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Allow, Require")
      end
    end
  end

  # Name:         Fqdn
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_fqdn) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LongAddressesEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_longaddressesenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         MaxAcknowledgementDelay
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxacknowledgementdelay) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxHeaderSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxheadersize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxHopCount
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxhopcount) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         MaxInboundConnection
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxinboundconnection) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxInboundConnectionPercentagePerSource
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxinboundconnectionpercentagepersource) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         MaxInboundConnectionPerSource
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxinboundconnectionpersource) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxLocalHopCount
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxlocalhopcount) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         MaxLogonFailures
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxlogonfailures) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         MaxMessageSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxmessagesize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxProtocolErrors
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxprotocolerrors) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxRecipientsPerMessage
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxrecipientspermessage) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         MessageRateLimit
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_messageratelimit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MessageRateSource
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "IPAddress", "User", "All"]
  newparam(:dsc_messageratesource) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'IPAddress', 'ipaddress', 'User', 'user', 'All', 'all'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, IPAddress, User, All")
      end
    end
  end

  # Name:         OrarEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_orarenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         PermissionGroups
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_permissiongroups, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         PipeliningEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pipeliningenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ProtocolLoggingLevel
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Verbose"]
  newparam(:dsc_protocollogginglevel) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Verbose', 'verbose'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Verbose")
      end
    end
  end

  # Name:         RemoteIPRanges
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_remoteipranges, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         RequireEHLODomain
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_requireehlodomain) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RequireTLS
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_requiretls) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ServiceDiscoveryFqdn
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_servicediscoveryfqdn) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SizeEnabled
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled", "EnabledWithoutValue"]
  newparam(:dsc_sizeenabled) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled', 'EnabledWithoutValue', 'enabledwithoutvalue'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled, EnabledWithoutValue")
      end
    end
  end

  # Name:         SuppressXAnonymousTls
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_suppressxanonymoustls) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         TarpitInterval
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tarpitinterval) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TlsCertificateName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tlscertificatename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TlsDomainCapabilities
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tlsdomaincapabilities, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         TransportRole
  # Type:         string
  # IsMandatory:  False
  # Values:       ["FrontendTransport", "HubTransport"]
  newparam(:dsc_transportrole) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['FrontendTransport', 'frontendtransport', 'HubTransport', 'hubtransport'].include?(value)
        fail("Invalid value '#{value}'. Valid values are FrontendTransport, HubTransport")
      end
    end
  end

  # Name:         Usage
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Client", "Internal", "Internet", "Partner", "Custom"]
  newparam(:dsc_usage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Client', 'client', 'Internal', 'internal', 'Internet', 'internet', 'Partner', 'partner', 'Custom', 'custom'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Client, Internal, Internet, Partner, Custom")
      end
    end
  end


end

Puppet::Type.type(:dsc_xexchreceiveconnector).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
