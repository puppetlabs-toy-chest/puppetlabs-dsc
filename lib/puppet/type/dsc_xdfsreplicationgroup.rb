require 'pathname'

Puppet::Type.newtype(:dsc_xdfsreplicationgroup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDFSReplicationGroup resource type.
    Automatically generated from
    'xDFS/DSCResources/MSFT_xDFSReplicationGroup/MSFT_xDFSReplicationGroup.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_groupname is a required attribute') if self[:dsc_groupname].nil?
    end

  def dscmeta_resource_friendly_name; 'xDFSReplicationGroup' end
  def dscmeta_resource_name; 'MSFT_xDFSReplicationGroup' end
  def dscmeta_module_name; 'xDFS' end
  def dscmeta_module_version; '3.2.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
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

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Specifies whether the DSF Replication Group should exist. Valid values are Present, Absent."
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

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Description - A description for the DFS Replication Group."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Members
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_members, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Members - A list of computers that are members of this Replication Group. These can be specified using either the ComputerName or FQDN name for each member. If an FQDN name is used and the DomainName parameter is set, the FQDN domain name must match."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Folders
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_folders, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Folders - A list of folders that are replicated in this Replication Group."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Topology
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Fullmesh", "Manual"]
  newparam(:dsc_topology) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Topology - This allows a replication topology to assign to the Replication Group. It defaults to Manual, which will not automatically create a topology. If set to Fullmesh, a full mesh topology between all members will be created. Valid values are Fullmesh, Manual."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Fullmesh', 'fullmesh', 'Manual', 'manual'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Fullmesh, Manual")
      end
    end
  end

  # Name:         ContentPaths
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_contentpaths, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ContentPaths - An array of DFS Replication Group Content Paths to use for each of the Folders. This can have one entry for each Folder in the Folders parameter and should be set in th same order. If any entry is not blank then the Content Paths will need to be set manually by using the xDFSReplicationGroupMembership resource."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         DomainName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domainname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainName - The AD domain the Replication Group should created in."
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

Puppet::Type.type(:dsc_xdfsreplicationgroup).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
