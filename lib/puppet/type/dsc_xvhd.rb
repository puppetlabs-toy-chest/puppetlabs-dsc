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

Puppet::Type.newtype(:dsc_xvhd) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xVHD resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xHyper-V/DSCResources/MSFT_xVHD/MSFT_xVHD.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xVHD"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xVHD"
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

  ensurable do
    defaultvalues
    defaultto :present
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    desc "Name of the VHD File"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    desc "Folder where the VHD will be created"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ParentPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_parentpath) do
    desc "Parent VHD file path, for differencing disk"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaximumSizeBytes
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumsizebytes) do
    desc "Maximum size of Vhd to be created"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         Generation
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Vhd", "Vhdx"]
  newparam(:dsc_generation) do
    desc "Virtual disk format - Vhd or Vhdx"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Vhd', 'vhd', 'Vhdx', 'vhdx'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Vhd, Vhdx")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    desc "Should the VHD be created or deleted"
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

  # Name:         ID
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_id) do
    desc "Virtual Disk Identifier"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Type
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_type) do
    desc "Type of Vhd - Dynamic, Fixed, Differencing"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FileSizeBytes
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_filesizebytes) do
    desc "Current size of the VHD"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         IsAttached
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isattached) do
    desc "Is the VHD attached to a VM or not"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end


end
