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

Puppet::Type.newtype(:dsc_xvhdfile) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xVhdFile resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xHyper-V/DSCResources/MSFT_xVhdFileDirectory/MSFT_xVhdFileDirectory.schema.mof
  }

  validate do
      fail('dsc_vhdpath is a required attribute') if self[:dsc_vhdpath].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xVhdFile"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xVhdFileDirectory"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xHyper-V"
  end

  newparam(:dscmeta_module_version) do
    defaultto "2.1"
  end

  newparam(:name, :namevar => true ) do
  end

  # Name:         VhdPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_vhdpath) do
    desc "Path to the VHD"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FileDirectory
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_filedirectory, :array_matching => :all) do
    desc "The FileDirectory objects to copy to the VHD"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
  end


end
