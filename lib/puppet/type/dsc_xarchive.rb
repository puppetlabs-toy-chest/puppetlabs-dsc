require 'pathname'

Puppet::Type.newtype(:dsc_xarchive) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xArchive resource type.
    Automatically generated from
    'xPSDesiredStateConfiguration/DSCResources/MSFT_xArchive/MSFT_xArchive.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_destination is a required attribute') if self[:dsc_destination].nil?
    end

  def dscmeta_resource_friendly_name; 'xArchive' end
  def dscmeta_resource_name; 'MSFT_xArchive' end
  def dscmeta_module_name; 'xPSDesiredStateConfiguration' end
  def dscmeta_module_version; '3.5.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Destination
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_destination) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Destination"
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
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Path - Represnts the source path to one or more files or directories.\n"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         CompressionLevel
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Optimal", "NoCompression", "Fastest"]
  newparam(:dsc_compressionlevel) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CompressionLevel - Specifies values that indicate whether a compression operation emphasizes speed or compression size.\nOptimal {default} \n Valid values are Optimal, NoCompression, Fastest."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DestinationType - An enumerated value that describes if the Destination path points to a File or Directory. If Directory is specified then the archive file contents would be expanded to the specified path on the other hand if File is specified, an archive file would be created at the specified destination path.\nDirectory {default} \n Valid values are File, Directory."
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
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MatchSource - An boolean value to indicate if the destination contents have to be always kept in sync with the files or directories specified in the source path.\n"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CreationTime
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_creationtime) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "CreationTime - Specifies the local time at which the file or directory was created in datetime format.\n"
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Attributes - Specifies the attributes of the file or directory in string format.\n"
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Mode - Specifies the mode of the file or directory.\n"
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
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "Size - Specifis the size of the file or directory in bytes.\n"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xarchive).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
