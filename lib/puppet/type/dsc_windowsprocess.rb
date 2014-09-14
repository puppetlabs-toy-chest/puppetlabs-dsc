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

Puppet::Type.newtype(:dsc_windowsprocess) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC WindowsProcess resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-wmf-4/PSDesiredStateConfiguration/DSCResources/MSFT_ProcessResource/MSFT_ProcessResource.schema.mof
  }

  validate do
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
      fail('dsc_arguments is a required attribute') if self[:dsc_arguments].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "WindowsProcess"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_ProcessResource"
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

  ensurable do
    defaultvalues
    defaultto :present
  end

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Arguments
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_arguments) do
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

  # Name:         StandardOutputPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_standardoutputpath) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StandardErrorPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_standarderrorpath) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StandardInputPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_standardinputpath) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WorkingDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_workingdirectory) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PagedMemorySize
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pagedmemorysize) do
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         NonPagedMemorySize
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_nonpagedmemorysize) do
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         VirtualMemorySize
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_virtualmemorysize) do
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         HandleCount
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_handlecount) do
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value || value.to_i >= 0
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         ProcessId
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_processid) do
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value || value.to_i >= 0
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end


end
