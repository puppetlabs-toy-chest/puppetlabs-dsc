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

Puppet::Type.newtype(:dsc_script) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC Script resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-wmf-4/PSDesiredStateConfiguration/DSCResources/MSFT_ScriptResource/MSFT_ScriptResource.schema.mof
  }

  validate do
      fail('dsc_getscript is a required attribute') if self[:dsc_getscript].nil?
      fail('dsc_setscript is a required attribute') if self[:dsc_setscript].nil?
      fail('dsc_testscript is a required attribute') if self[:dsc_testscript].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "Script"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_ScriptResource"
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

  newparam(:dscmeta_module_version) do
    defaultto "1.0"
  end

  newparam(:name, :namevar => true ) do
  end

  # Name:         GetScript
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_getscript) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SetScript
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_setscript) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TestScript
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_testscript) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Credential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Result
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_result) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
