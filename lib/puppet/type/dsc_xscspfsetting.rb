require 'pathname'

Puppet::Type.newtype(:dsc_xscspfsetting) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSCSPFSetting resource type.
    Automatically generated from
    'xSCSPF/DSCResources/MSFT_xSCSPFSetting/MSFT_xSCSPFSetting.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_servername is a required attribute') if self[:dsc_servername].nil?
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  def dscmeta_resource_friendly_name; 'xSCSPFSetting' end
  def dscmeta_resource_name; 'MSFT_xSCSPFSetting' end
  def dscmeta_module_name; 'xSCSPF' end
  def dscmeta_module_version; '1.3.1.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
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

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - An enumerated value that describes if the SPF setting exists.\nPresent {default}  \nAbsent   \n Valid values are Present, Absent."
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

  # Name:         ServerName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_servername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerName - Specifies the name of the server the setting is associated with."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SettingType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["DatabaseConnectionString", "EndPointConnectionString"]
  newparam(:dsc_settingtype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SettingType - Specifies either DatabaseConnectionString or EndPointConnectionString. Valid values are DatabaseConnectionString, EndPointConnectionString."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['DatabaseConnectionString', 'databaseconnectionstring', 'EndPointConnectionString', 'endpointconnectionstring'].include?(value)
        fail("Invalid value '#{value}'. Valid values are DatabaseConnectionString, EndPointConnectionString")
      end
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Specifies a friendly name for the setting."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Value
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_value) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Value - Specifies the value for the setting."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SCSPFAdminCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scspfadmincredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SCSPFAdminCredential - Credential with admin permissions to Service Provider Foundation."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SCSPFAdminCredential", value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xscspfsetting).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
