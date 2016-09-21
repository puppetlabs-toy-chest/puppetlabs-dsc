require 'pathname'

Puppet::Type.newtype(:dsc_xdfsreplicationgroupmembership) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDFSReplicationGroupMembership resource type.
    Automatically generated from
    'xDFS/DSCResources/MSFT_xDFSReplicationGroupMembership/MSFT_xDFSReplicationGroupMembership.schema.mof'

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
      fail('dsc_computername is a required attribute') if self[:dsc_computername].nil?
    end

  def dscmeta_resource_friendly_name; 'xDFSReplicationGroupMembership' end
  def dscmeta_resource_name; 'MSFT_xDFSReplicationGroupMembership' end
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

  # Name:         ComputerName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_computername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ComputerName - The computer name of the DFS Replication Group member."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ContentPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_contentpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ContentPath - The local content path for the DFS Replication Group Folder."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StagingPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_stagingpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StagingPath - The local staging path for the DFS Replication Group Folder."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConflictAndDeletedPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_conflictanddeletedpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConflictAndDeletedPath - The local content and deleted path for the DFS Replication Group Folder."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReadOnly
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_readonly) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ReadOnly - Specify if this content path should be read only."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         PrimaryMember
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_primarymember) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "PrimaryMember - Specify if this folder/member should be the primary member."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DomainName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domainname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainName - The name of the AD Domain the DFS Replication Group this replication group is in."
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

Puppet::Type.type(:dsc_xdfsreplicationgroupmembership).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
