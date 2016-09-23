require 'pathname'

Puppet::Type.newtype(:dsc_xdfsreplicationgroupconnection) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDFSReplicationGroupConnection resource type.
    Automatically generated from
    'xDFS/DSCResources/MSFT_xDFSReplicationGroupConnection/MSFT_xDFSReplicationGroupConnection.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_groupname is a required attribute') if self[:dsc_groupname].nil?
      fail('dsc_sourcecomputername is a required attribute') if self[:dsc_sourcecomputername].nil?
      fail('dsc_destinationcomputername is a required attribute') if self[:dsc_destinationcomputername].nil?
    end

  def dscmeta_resource_friendly_name; 'xDFSReplicationGroupConnection' end
  def dscmeta_resource_name; 'MSFT_xDFSReplicationGroupConnection' end
  def dscmeta_module_name; 'xDFS' end
  def dscmeta_module_version; '3.1.0.0' end

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

  # Name:         SourceComputerName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_sourcecomputername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SourceComputerName - The DFS Replication Group connection source computer name."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DestinationComputerName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_destinationcomputername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DestinationComputerName - The DFS Replication Group connection destination computer name."
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
    desc "Ensure - Specifies whether the DSF Replication Group connection should exist. Valid values are Present, Absent."
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
    desc "Description - A description for the DFS Replication Group connection."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EnsureEnabled
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_ensureenabled) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EnsureEnabled - Ensures that connection is either Enabled or Disabled. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         EnsureRDCEnabled
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_ensurerdcenabled) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EnsureRDCEnabled - Ensures remote differential compression is Enabled or Disabled. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
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
    desc "DomainName - The name of the AD Domain the DFS Replication Group connection should be in."
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

Puppet::Type.type(:dsc_xdfsreplicationgroupconnection).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
