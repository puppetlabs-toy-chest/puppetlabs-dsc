require 'pathname'

Puppet::Type.newtype(:dsc_xexchumservice) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchUMService resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchUMService/MSFT_xExchUMService.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xExchUMService' end
  def dscmeta_resource_name; 'MSFT_xExchUMService' end
  def dscmeta_module_name; 'xExchange' end
  def dscmeta_module_version; '1.27.0.0' end

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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
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
    desc "Credential - Credentials used to establish a remote PowerShell session to Exchange"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         UMStartupMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["TCP", "TLS", "Dual"]
  newparam(:dsc_umstartupmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UMStartupMode - UMStartupMode for the UM server Valid values are TCP, TLS, Dual."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['TCP', 'tcp', 'TLS', 'tls', 'Dual', 'dual'].include?(value)
        fail("Invalid value '#{value}'. Valid values are TCP, TLS, Dual")
      end
    end
  end

  # Name:         DialPlans
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dialplans, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "DialPlans - Specifies all dial plans that the Unified Messaging service handles incoming calls for"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         GrammarGenerationSchedule
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_grammargenerationschedule, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "GrammarGenerationSchedule - Specifies the Grammar Generation Schedule"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         IPAddressFamily
  # Type:         string
  # IsMandatory:  False
  # Values:       ["IPv4Only", "IPv6Only", "Any"]
  newparam(:dsc_ipaddressfamily) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IPAddressFamily - Specifies whether the UM IP gateway will use IPv4, IPv6, or both to communicate Valid values are IPv4Only, IPv6Only, Any."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['IPv4Only', 'ipv4only', 'IPv6Only', 'ipv6only', 'Any', 'any'].include?(value)
        fail("Invalid value '#{value}'. Valid values are IPv4Only, IPv6Only, Any")
      end
    end
  end

  # Name:         IPAddressFamilyConfigurable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ipaddressfamilyconfigurable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IPAddressFamilyConfigurable - Specifies whether you're able to set the IPAddressFamily parameter to IPv6Only or Any"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IrmLogEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_irmlogenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IrmLogEnabled - Specifies whether to enable logging of Information Rights Management (IRM) transactions. IRM logging is enabled by default"
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
    desc "IrmLogMaxAge - Specifies the maximum age for the IRM log file. Log files that are older than the specified value are deleted"
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
    desc "IrmLogMaxDirectorySize - Specifies the maximum size of all IRM logs in the connectivity log directory. When a directory reaches its maximum file size, the server deletes the oldest log files first"
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
    desc "IrmLogMaxFileSize - Specifies the maximum size of each IRM log file. When a log file reaches its maximum file size, a new log file is created"
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
    desc "IrmLogPath - Specifies the default IRM log directory location"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxCallsAllowed
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxcallsallowed) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "MaxCallsAllowed - Specifies the maximum number of concurrent voice calls that the Unified Messaging service allows"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SIPAccessService
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sipaccessservice) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SIPAccessService - Specifies the FQDN and TCP port of the nearest  Skype for Business Server pool location for inbound and outbound calls from remote Skype for Business users located outside of the network"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DomainController
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domaincontroller) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainController - Optional Domain Controller to connect to"
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

Puppet::Type.type(:dsc_xexchumservice).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
