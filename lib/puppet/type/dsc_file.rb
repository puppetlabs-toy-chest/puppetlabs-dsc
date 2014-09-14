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

Puppet::Type.newtype(:dsc_file) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC File resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-wmf-4/PSDesiredStateConfiguration/DSCResources/MSFT_FileDirectoryConfiguration/MSFT_FileDirectoryConfiguration.Schema.mof
  }

  validate do
      fail('dsc_destinationpath is a required attribute') if self[:dsc_destinationpath].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "File"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_FileDirectoryConfiguration"
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

  # Name:         DestinationPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_destinationpath) do
    isrequired
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

  # Name:         Type
  # Type:         string
  # IsMandatory:  False
  # Values:       ["File", "Directory"]
  newparam(:dsc_type) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['File', 'file', 'Directory', 'directory'].include?(value)
        fail("Invalid value '#{value}'. Valid values are File, Directory")
      end
    end
  end

  # Name:         SourcePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sourcepath) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Contents
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_contents) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Checksum
  # Type:         string
  # IsMandatory:  False
  # Values:       ["SHA-1", "SHA-256", "SHA-512", "CreatedDate", "ModifiedDate"]
  newparam(:dsc_checksum) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['SHA-1', 'sha-1', 'SHA-256', 'sha-256', 'SHA-512', 'sha-512', 'CreatedDate', 'createddate', 'ModifiedDate', 'modifieddate'].include?(value)
        fail("Invalid value '#{value}'. Valid values are SHA-1, SHA-256, SHA-512, CreatedDate, ModifiedDate")
      end
    end
  end

  # Name:         Recurse
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recurse) do
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

  # Name:         CreatedDate
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_createddate) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ModifiedDate
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_modifieddate) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Attributes
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["ReadOnly", "Hidden", "System", "Archive"]
  newparam(:dsc_attributes, :array_matching => :all) do
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['ReadOnly', 'readonly', 'Hidden', 'hidden', 'System', 'system', 'Archive', 'archive'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are ReadOnly, Hidden, System, Archive")
        end
      end
      if value.kind_of?(String)
        unless ['ReadOnly', 'readonly', 'Hidden', 'hidden', 'System', 'system', 'Archive', 'archive'].include?(value)
          fail("Invalid value #{value}. Valid values are ReadOnly, Hidden, System, Archive")
        end
      end
    end
  end

  # Name:         Size
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_size) do
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         SubItems
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_subitems, :array_matching => :all) do
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
  end

  # Name:         MatchSource
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_matchsource) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end


end
