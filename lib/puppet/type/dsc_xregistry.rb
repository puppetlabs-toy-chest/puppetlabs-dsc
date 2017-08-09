require 'pathname'

Puppet::Type.newtype(:dsc_xregistry) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xRegistry resource type.
    Automatically generated from
    'xPSDesiredStateConfiguration/DSCResources/MSFT_xRegistryResource/MSFT_xRegistryResource.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_key is a required attribute') if self[:dsc_key].nil?
      fail('dsc_valuename is a required attribute') if self[:dsc_valuename].nil?
    end

  def dscmeta_resource_friendly_name; 'xRegistry' end
  def dscmeta_resource_name; 'MSFT_xRegistryResource' end
  def dscmeta_module_name; 'xPSDesiredStateConfiguration' end
  def dscmeta_module_version; '6.4.0.0' end

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

  # Name:         Key
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_key) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Key - The path of the registry key to add, modify, or remove. This path must include the registry hive/drive."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ValueName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_valuename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ValueName - The name of the registry value. To add or remove a registry key, specify this property as an empty string without specifying ValueType or ValueData. To modify or remove the default value of a registry key, specify this property as an empty string while also specifying ValueType or ValueData."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ValueData
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_valuedata, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ValueData - The data the specified registry key value should have as a string or an array of strings (MultiString only)."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ValueType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["String", "Binary", "DWord", "QWord", "MultiString", "ExpandString"]
  newparam(:dsc_valuetype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ValueType - The type the specified registry key value should have. Valid values are String, Binary, DWord, QWord, MultiString, ExpandString."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['String', 'string', 'Binary', 'binary', 'DWord', 'dword', 'QWord', 'qword', 'MultiString', 'multistring', 'ExpandString', 'expandstring'].include?(value)
        fail("Invalid value '#{value}'. Valid values are String, Binary, DWord, QWord, MultiString, ExpandString")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Specifies whether or not the registry key or value should exist. To add or modify a registry key or value, set this property to Present. To remove a registry key or value, set the property to Absent. Valid values are Present, Absent."
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

  # Name:         Hex
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_hex) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Hex - Specifies whether or not the specified DWord or QWord registry key data is provided in a hexadecimal format. Not valid for types other than DWord and QWord. The default value is $false."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Force
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_force) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Force - Specifies whether or not to overwrite the specified registry key value if it already has a value or whether or not to delete a registry key that has subkeys. The default value is $false."
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

Puppet::Type.type(:dsc_xregistry).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
