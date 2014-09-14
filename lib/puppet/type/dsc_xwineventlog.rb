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

Puppet::Type.newtype(:dsc_xwineventlog) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xWinEventLog resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xWinEventLog/DSCResources/MSFT_xWinEventLog/MSFT_xWinEventLog.schema.mof
  }

  validate do
      fail('dsc_logname is a required attribute') if self[:dsc_logname].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xWinEventLog"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xWinEventLog"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xWinEventLog"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.0.0.1"
  end

  newparam(:name, :namevar => true ) do
  end

  # Name:         LogName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_logname) do
    desc "Name of the event log"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaximumSizeInBytes
  # Type:         sint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumsizeinbytes) do
    desc "sizethat the event log file is allowed to be When the file reaches this maximum size it is considered full"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value || value.to_i >= 0
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         IsEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isenabled) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end

  # Name:         LogMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["AutoBackup", "Circular", "Retain"]
  newparam(:dsc_logmode) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['AutoBackup', 'autobackup', 'Circular', 'circular', 'Retain', 'retain'].include?(value)
        fail("Invalid value '#{value}'. Valid values are AutoBackup, Circular, Retain")
      end
    end
  end

  # Name:         SecurityDescriptor
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_securitydescriptor) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
