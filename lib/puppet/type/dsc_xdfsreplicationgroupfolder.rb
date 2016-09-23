require 'pathname'

Puppet::Type.newtype(:dsc_xdfsreplicationgroupfolder) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDFSReplicationGroupFolder resource type.
    Automatically generated from
    'xDFS/DSCResources/MSFT_xDFSReplicationGroupFolder/MSFT_xDFSReplicationGroupFolder.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_groupname is a required attribute') if self[:dsc_groupname].nil?
      fail('dsc_foldername is a required attribute') if self[:dsc_foldername].nil?
    end

  def dscmeta_resource_friendly_name; 'xDFSReplicationGroupFolder' end
  def dscmeta_resource_name; 'MSFT_xDFSReplicationGroupFolder' end
  def dscmeta_module_name; 'xDFS' end
  def dscmeta_module_version; '3.1.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         PsDscRunAsCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_psdscrunascredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "PsDscRunAsCredential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         GroupName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_groupname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "GroupName - The name of the DFS Replication Group."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FolderName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_foldername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FolderName - The name of the DFS Replication Group Folder."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Description - A description for the DFS Replication Group Folder."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FilenameToExclude
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_filenametoexclude, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "FilenameToExclude - An array of file names to exclude from replication"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         DirectoryNameToExclude
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_directorynametoexclude, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "DirectoryNameToExclude - An array of directory names to exclude from replication."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         DfsnPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dfsnpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DfsnPath - The DFS Namespace that this DFS Replication Group folder is mapped to."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DomainName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domainname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainName - The name of the AD Domain the DFS Replication Group Folder will be in."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xdfsreplicationgroupfolder).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
