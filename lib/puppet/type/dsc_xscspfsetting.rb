require 'pathname'

Puppet::Type.newtype(:dsc_xscspfsetting) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSCSPFSetting resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSCSPF/DSCResources/MSFT_xSCSPFSetting/MSFT_xSCSPFSetting.schema.mof
  }

  validate do
      fail('dsc_servername is a required attribute') if self[:dsc_servername].nil?
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSCSPFSetting"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSCSPFSetting"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSCSPF"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.3.1.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "An enumerated value that describes if the SPF setting exists.\nPresent {default}  \nAbsent   \n"
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
    desc "Specifies the name of the server the setting is associated with."
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
    desc "Specifies either DatabaseConnectionString or EndPointConnectionString."
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
    desc "Specifies a friendly name for the setting."
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
    desc "Specifies the value for the setting."
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
    desc "Credential with admin permissions to Service Provider Foundation."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
    end
  end


end
