begin
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
rescue LoadError => detail
  require 'pathname'
  lib_path = Pathname.new(__FILE__).dirname.parent.parent
  $:.unshift(lib_path)
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
end

Puppet::Type.newtype(:dsc_xwebconfigkeyvalue) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xWebConfigKeyValue resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xWebAdministration/DSCResources/MSFT_xWebConfigKeyValue/MSFT_xWebConfigKeyValue.schema.mof
  }

  validate do
      fail('dsc_websitepath is a required attribute') if self[:dsc_websitepath].nil?
      fail('dsc_configsection is a required attribute') if self[:dsc_configsection].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xWebConfigKeyValue"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xWebConfigKeyValue"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xWebAdministration"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.3.2"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    defaultvalues
    defaultto :present
  end

  # Name:         WebsitePath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_websitepath) do
    desc "Path to website location(IIS or WebAdministration format)"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConfigSection
  # Type:         string
  # IsMandatory:  True
  # Values:       ["AppSettings"]
  newparam(:dsc_configsection) do
    desc "Config Section to be update"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['AppSettings', 'appsettings'].include?(value)
        fail("Invalid value '#{value}'. Valid values are AppSettings")
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

  # Name:         Key
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_key) do
    desc "Key for AppSettings"
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
    desc "Value for AppSettings"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IsAttribute
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isattribute) do
    desc "If the given key value pair is for attribute, default is element"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end


end
