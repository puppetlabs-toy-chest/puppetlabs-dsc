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

Puppet::Type.newtype(:dsc_xarchive) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xArchive resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xPSDesiredStateConfiguration/DSCResources/MSFT_xArchive/MSFT_xArchive.schema.mof
  }

  validate do
      fail('dsc_destination is a required attribute') if self[:dsc_destination].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xArchive"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xArchive"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xPSDesiredStateConfiguration"
  end

  newparam(:dscmeta_module_version) do
    defaultto "3.0.2.0"
  end

  newparam(:name, :namevar => true ) do
  end

  # Name:         Destination
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_destination) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Path
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_path, :array_matching => :all) do
    desc "Represnts the source path to one or more files or directories.\n"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
  end

  # Name:         CompressionLevel
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Optimal", "NoCompression", "Fastest"]
  newparam(:dsc_compressionlevel) do
    desc "Specifies values that indicate whether a compression operation emphasizes speed or compression size.\nOptimal {default} \n"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Optimal', 'optimal', 'NoCompression', 'nocompression', 'Fastest', 'fastest'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Optimal, NoCompression, Fastest")
      end
    end
  end

  # Name:         DestinationType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["File", "Directory"]
  newparam(:dsc_destinationtype) do
    desc "An enumerated value that describes if the Destination path points to a File or Directory. If Directory is specified then the archive file contents would be expanded to the specified path on the other hand if File is specified, an archive file would be created at the specified destination path.\nDirectory {default} \n"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['File', 'file', 'Directory', 'directory'].include?(value)
        fail("Invalid value '#{value}'. Valid values are File, Directory")
      end
    end
  end

  # Name:         MatchSource
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_matchsource) do
    desc "An boolean value to indicate if the destination contents have to be always kept in sync with the files or directories specified in the source path.\n"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end

  # Name:         CreationTime
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_creationtime) do
    desc "Specifies the local time at which the file or directory was created in datetime format.\n"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Attributes
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_attributes) do
    desc "Specifies the attributes of the file or directory in string format.\n"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Mode
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mode) do
    desc "Specifies the mode of the file or directory.\n"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Size
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_size) do
    desc "Specifis the size of the file or directory in bytes.\n"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end


end
