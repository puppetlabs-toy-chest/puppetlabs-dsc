require 'pathname'

Puppet::Type.newtype(:dsc_xrdgatewayconfiguration) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xRDGatewayConfiguration resource type.
    Automatically generated from
    'xRemoteDesktopSessionHost/DSCResources/MSFT_xRDGatewayConfiguration/MSFT_xRDGatewayConfiguration.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_connectionbroker is a required attribute') if self[:dsc_connectionbroker].nil?
    end

  def dscmeta_resource_friendly_name; 'xRDGatewayConfiguration' end
  def dscmeta_resource_name; 'MSFT_xRDGatewayConfiguration' end
  def dscmeta_module_name; 'xRemoteDesktopSessionHost' end
  def dscmeta_module_version; '1.8.0.0' end

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

  # Name:         ConnectionBroker
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_connectionbroker) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConnectionBroker"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         GatewayServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_gatewayserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "GatewayServer"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         GatewayMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["DoNotUse", "Custom", "Automatic"]
  newparam(:dsc_gatewaymode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "GatewayMode - Valid values are DoNotUse, Custom, Automatic."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['DoNotUse', 'donotuse', 'Custom', 'custom', 'Automatic', 'automatic'].include?(value)
        fail("Invalid value '#{value}'. Valid values are DoNotUse, Custom, Automatic")
      end
    end
  end

  # Name:         ExternalFqdn
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externalfqdn) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExternalFqdn"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogonMethod
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Password", "Smartcard", "AllowUserToSelectDuringConnection"]
  newparam(:dsc_logonmethod) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogonMethod - Valid values are Password, Smartcard, AllowUserToSelectDuringConnection."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Password', 'password', 'Smartcard', 'smartcard', 'AllowUserToSelectDuringConnection', 'allowusertoselectduringconnection'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Password, Smartcard, AllowUserToSelectDuringConnection")
      end
    end
  end

  # Name:         UseCachedCredentials
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usecachedcredentials) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UseCachedCredentials"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         BypassLocal
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_bypasslocal) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "BypassLocal"
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

Puppet::Type.type(:dsc_xrdgatewayconfiguration).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
