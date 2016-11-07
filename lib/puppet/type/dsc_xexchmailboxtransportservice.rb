require 'pathname'

Puppet::Type.newtype(:dsc_xexchmailboxtransportservice) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchMailboxTransportService resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchMailboxTransportService/MSFT_xExchMailboxTransportService.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xExchMailboxTransportService' end
  def dscmeta_resource_name; 'MSFT_xExchMailboxTransportService' end
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


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xexchmailboxtransportservice).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
