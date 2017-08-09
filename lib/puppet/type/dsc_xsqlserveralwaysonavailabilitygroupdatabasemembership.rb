require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserveralwaysonavailabilitygroupdatabasemembership) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSQLServerAlwaysOnAvailabilityGroupDatabaseMembership resource type.
    Automatically generated from
    'xSQLServer/DSCResources/MSFT_xSQLServerAlwaysOnAvailabilityGroupDatabaseMembership/MSFT_xSQLServerAlwaysOnAvailabilityGroupDatabaseMembership.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_sqlserver is a required attribute') if self[:dsc_sqlserver].nil?
      fail('dsc_sqlinstancename is a required attribute') if self[:dsc_sqlinstancename].nil?
      fail('dsc_availabilitygroupname is a required attribute') if self[:dsc_availabilitygroupname].nil?
    end

  def dscmeta_resource_friendly_name; 'xSQLServerAlwaysOnAvailabilityGroupDatabaseMembership' end
  def dscmeta_resource_name; 'MSFT_xSQLServerAlwaysOnAvailabilityGroupDatabaseMembership' end
  def dscmeta_module_name; 'xSQLServer' end
  def dscmeta_module_version; '8.0.0.0' end

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

  # Name:         DatabaseName
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasename, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "DatabaseName - The name of the database(s) to add to the availability group. This accepts wildcards."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         SQLServer
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_sqlserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLServer - Hostname of the SQL Server where the primary replica of the availability group lives. If the availability group is not currently on this server, the resource will attempt to connect to the server where the primary replica lives."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLInstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_sqlinstancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLInstanceName - Name of the SQL instance to be configured."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AvailabilityGroupName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_availabilitygroupname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AvailabilityGroupName - The name of the availability group in which to manage the database membership(s)."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         BackupPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_backuppath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "BackupPath - The path used to seed the availability group replicas. This should be a path that is accessible by all of the replicas"
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
    desc "Ensure - Specifies the membership of the database(s) in the availability group. The options are: Present: The defined database(s) are added to the availability group. All other databases that may be a member of the availability group are ignored. Absent: The defined database(s) are removed from the availability group. All other databases that may be a member of the availability group are ignored. The default is 'Present'. Valid values are Present, Absent."
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

  # Name:         Force
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_force) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Force - When used with 'Ensure = 'Present'' it ensures the specified database(s) are the only databases that are a member of the specified Availability Group. This parameter is ignored when 'Ensure' is 'Absent'."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         MatchDatabaseOwner
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_matchdatabaseowner) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MatchDatabaseOwner - If set to $true, this ensures the database owner of the database on the primary replica is the owner of the database on all secondary replicas. This requires the database owner is available as a login on all replicas and that the PSDscRunAsAccount has impersonate permissions. If set to $false, the owner of the database will be the PSDscRunAsAccount. The default is '$true'"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xsqlserveralwaysonavailabilitygroupdatabasemembership).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
