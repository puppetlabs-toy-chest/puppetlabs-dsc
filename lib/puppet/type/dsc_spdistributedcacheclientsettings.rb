require 'pathname'

Puppet::Type.newtype(:dsc_spdistributedcacheclientsettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPDistributedCacheClientSettings resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPDistributedCacheClientSettings/MSFT_SPDistributedCacheClientSettings.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPDistributedCacheClientSettings' end
  def dscmeta_resource_name; 'MSFT_SPDistributedCacheClientSettings' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '2.2.0.0' end

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
    desc "IsSingleInstance - Unique key for the resource. Set to 'Yes' to apply configuration. Valid values are Yes."
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

  # Name:         DLTCMaxConnectionsToServer
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dltcmaxconnectionstoserver) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DLTCMaxConnectionsToServer - Maximum number of connections to the Distributed Logon Token Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DLTCRequestTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dltcrequesttimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DLTCRequestTimeout - Request timeout for the Distributed Logon Token Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DLTCChannelOpenTimeOut
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dltcchannelopentimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DLTCChannelOpenTimeOut - Channel timeout for the Distributed Logon Token Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DVSCMaxConnectionsToServer
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dvscmaxconnectionstoserver) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DVSCMaxConnectionsToServer - Maximum number of connections to the Distributed View State Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DVSCRequestTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dvscrequesttimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DVSCRequestTimeout - Request timeout for the Distributed View State Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DVSCChannelOpenTimeOut
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dvscchannelopentimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DVSCChannelOpenTimeOut - Channel timeout for the Distributed View State Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DACMaxConnectionsToServer
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dacmaxconnectionstoserver) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DACMaxConnectionsToServer - Maximum number of connections to the Distributed Access Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DACRequestTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dacrequesttimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DACRequestTimeout - Request timeout for the Distributed Access Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DACChannelOpenTimeOut
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dacchannelopentimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DACChannelOpenTimeOut - Channel timeout for the Distributed Access Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DAFMaxConnectionsToServer
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dafmaxconnectionstoserver) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DAFMaxConnectionsToServer - Maximum number of connections to the Distributed Activity Feed Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DAFRequestTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dafrequesttimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DAFRequestTimeout - Request timeout for the Distributed Activity Feed Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DAFChannelOpenTimeOut
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dafchannelopentimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DAFChannelOpenTimeOut - Channel timeout for the Distributed Activity Feed Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DAFCMaxConnectionsToServer
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dafcmaxconnectionstoserver) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DAFCMaxConnectionsToServer - Maximum number of connections to the Distributed Activity Feed LMT Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DAFCRequestTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dafcrequesttimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DAFCRequestTimeout - Request timeout for the Distributed Activity Feed LMT Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DAFCChannelOpenTimeOut
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dafcchannelopentimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DAFCChannelOpenTimeOut - Channel timeout for the Distributed Activity Feed LMT Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DBCMaxConnectionsToServer
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dbcmaxconnectionstoserver) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DBCMaxConnectionsToServer - Maximum number of connections to the Distributed Bouncer Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DBCRequestTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dbcrequesttimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DBCRequestTimeout - Request timeout for the Distributed Bouncer Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DBCChannelOpenTimeOut
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dbcchannelopentimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DBCChannelOpenTimeOut - Channel timeout for the Distributed Bouncer Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DDCMaxConnectionsToServer
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ddcmaxconnectionstoserver) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DDCMaxConnectionsToServer - Maximum number of connections to the Distributed Default Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DDCRequestTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ddcrequesttimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DDCRequestTimeout - Request timeout for the Distributed Default Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DDCChannelOpenTimeOut
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ddcchannelopentimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DDCChannelOpenTimeOut - Channel timeout for the Distributed Default Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DSCMaxConnectionsToServer
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dscmaxconnectionstoserver) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DSCMaxConnectionsToServer - Maximum number of connections to the Distributed Search Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DSCRequestTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dscrequesttimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DSCRequestTimeout - Request timeout for the Distributed Search Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DSCChannelOpenTimeOut
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dscchannelopentimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DSCChannelOpenTimeOut - Channel timeout for the Distributed Search Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DTCMaxConnectionsToServer
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dtcmaxconnectionstoserver) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DTCMaxConnectionsToServer - Maximum number of connections to the Distributed Security Trimming Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DTCRequestTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dtcrequesttimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DTCRequestTimeout - Request timeout for the Distributed Security Trimming Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DTCChannelOpenTimeOut
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dtcchannelopentimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DTCChannelOpenTimeOut - Channel timeout for the Distributed Security Trimming Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DSTACMaxConnectionsToServer
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dstacmaxconnectionstoserver) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DSTACMaxConnectionsToServer - Maximum number of connections to the Distributed Server to Application Server Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DSTACRequestTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dstacrequesttimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DSTACRequestTimeout - Request timeout for the Distributed Server to Application Server Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DSTACChannelOpenTimeOut
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dstacchannelopentimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DSTACChannelOpenTimeOut - Channel timeout for the Distributed Server to Application Server Cache"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         InstallAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "InstallAccount - POWERSHELL 4 ONLY: The account to run this resource as, use PsDscRunAsCredential if using PowerShell 5"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("InstallAccount", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spdistributedcacheclientsettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
