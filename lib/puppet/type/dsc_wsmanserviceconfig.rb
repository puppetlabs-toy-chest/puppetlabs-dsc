require 'pathname'

Puppet::Type.newtype(:dsc_wsmanserviceconfig) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC WSManServiceConfig resource type.
    Automatically generated from
    'WSManDsc/DSCResources/DSR_WSManServiceConfig/DSR_WSManServiceConfig.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_issingleinstance is a required attribute') if self[:dsc_issingleinstance].nil?
    end

  def dscmeta_resource_friendly_name; 'WSManServiceConfig' end
  def dscmeta_resource_name; 'DSR_WSManServiceConfig' end
  def dscmeta_module_name; 'WSManDsc' end
  def dscmeta_module_version; '2.3.0.0' end

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

  # Name:         IsSingleInstance
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Yes"]
  newparam(:dsc_issingleinstance) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IsSingleInstance - Specifies the resource is a single instance, the value must be 'Yes' Valid values are Yes."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Yes', 'yes'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Yes")
      end
    end
  end

  # Name:         RootSDDL
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_rootsddl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RootSDDL - Specifies the security descriptor that controls remote access to the listener."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxConnections
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxconnections) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaxConnections - Specifies the maximum number of active requests that the service can process simultaneously."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxConcurrentOperationsPerUser
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxconcurrentoperationsperuser) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaxConcurrentOperationsPerUser - Specifies the maximum number of concurrent operations that any user can remotely open on the same system."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EnumerationTimeoutMS
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enumerationtimeoutms) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "EnumerationTimeoutMS - Specifies the idle time-out in milliseconds between Pull messages."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxPacketRetrievalTimeSeconds
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxpacketretrievaltimeseconds) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaxPacketRetrievalTimeSeconds - Specifies the maximum length of time, in seconds, the WinRM service takes to retrieve a packet."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         AllowUnencrypted
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowunencrypted) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowUnencrypted - Allows the client computer to request unencrypted traffic."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AuthBasic
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authbasic) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AuthBasic - Allows the WinRM service to use Basic authentication."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AuthKerberos
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authkerberos) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AuthKerberos - Allows the WinRM service to use Kerberos authentication."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AuthNegotiate
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authnegotiate) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AuthNegotiate - Allows the WinRM service to use Negotiate authentication."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AuthCertificate
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authcertificate) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AuthCertificate - Allows the WinRM service to use client certificate-based authentication."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AuthCredSSP
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authcredssp) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AuthCredSSP - Allows the WinRM service to use Credential Security Support Provider (CredSSP) authentication."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AuthCbtHardeningLevel
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Strict", "Relaxed", "None"]
  newparam(:dsc_authcbthardeninglevel) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AuthCbtHardeningLevel - Allows the client computer to request unencrypted traffic. Valid values are Strict, Relaxed, None."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Strict', 'strict', 'Relaxed', 'relaxed', 'None', 'none'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Strict, Relaxed, None")
      end
    end
  end

  # Name:         EnableCompatibilityHttpListener
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enablecompatibilityhttplistener) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableCompatibilityHttpListener - Specifies whether the compatibility HTTP listener is enabled."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EnableCompatibilityHttpsListener
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enablecompatibilityhttpslistener) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableCompatibilityHttpsListener - Specifies whether the compatibility HTTPS listener is enabled."
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

Puppet::Type.type(:dsc_wsmanserviceconfig).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
