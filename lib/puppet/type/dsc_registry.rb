# workaround for cross modules dependencies
master_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'dsc','lib'))
$:.push(master_path) if File.directory?(master_path)
require 'puppet/type/base_dsc'

Puppet::Type.newtype(:dsc_registry) do

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  provide :mof, :parent => Puppet::Type.type(:base_dsc).provider(:mof)

  @doc = %q{
    The DSC Registry resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-wmf-4/PSDesiredStateConfiguration/DSCResources/MSFT_RegistryResource/MSFT_RegistryResource.schema.mof
  }

  validate do
      fail('dsc_key is a required attribute') if self[:dsc_key].nil?
      fail('dsc_valuename is a required attribute') if self[:dsc_valuename].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "Registry"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_RegistryResource"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "PSDesiredStateConfiguration"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto :present
  end

  # Name:         Key
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_key) do
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
  # Values:       ["String", "Binary", "Dword", "Qword", "MultiString", "ExpandString"]
  newparam(:dsc_valuetype) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['String', 'string', 'Binary', 'binary', 'Dword', 'dword', 'Qword', 'qword', 'MultiString', 'multistring', 'ExpandString', 'expandstring'].include?(value)
        fail("Invalid value '#{value}'. Valid values are String, Binary, Dword, Qword, MultiString, ExpandString")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
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
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end

  # Name:         Force
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_force) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end


end
