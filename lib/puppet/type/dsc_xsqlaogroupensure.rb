require 'pathname'

Puppet::Type.newtype(:dsc_xsqlaogroupensure) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSQLAOGroupEnsure resource type.
    Automatically generated from
    'xSQLServer/DSCResources/MSFT_xSQLAOGroupEnsure/MSFT_xSQLAOGroupEnsure.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_ensure is a required attribute') if self[:dsc_ensure].nil?
      fail('dsc_availabilitygroupname is a required attribute') if self[:dsc_availabilitygroupname].nil?
    end

  def dscmeta_resource_friendly_name; 'xSQLAOGroupEnsure' end
  def dscmeta_resource_name; 'MSFT_xSQLAOGroupEnsure' end
  def dscmeta_module_name; 'xSQLServer' end
  def dscmeta_module_version; '3.0.0.0' end

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

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Determines whether the availability group should be added or removed. Valid values are Present, Absent."
    isrequired
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

  # Name:         AvailabilityGroupName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_availabilitygroupname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AvailabilityGroupName - Name for availability group."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AvailabilityGroupNameListener
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_availabilitygroupnamelistener) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AvailabilityGroupNameListener - Listener name for availability group."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AvailabilityGroupNameIP
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_availabilitygroupnameip, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "AvailabilityGroupNameIP - List of IP addresses associated with listener."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         AvailabilityGroupSubMask
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_availabilitygroupsubmask, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "AvailabilityGroupSubMask - Network subnetmask for listener."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         AvailabilityGroupPort
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_availabilitygroupport) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "AvailabilityGroupPort - Port availability group should listen on."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ReadableSecondary
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "ReadOnly", "ReadIntent"]
  newparam(:dsc_readablesecondary) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReadableSecondary - Mode secondaries should operate under (None, ReadOnly, ReadIntent). Valid values are None, ReadOnly, ReadIntent."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'ReadOnly', 'readonly', 'ReadIntent', 'readintent'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, ReadOnly, ReadIntent")
      end
    end
  end

  # Name:         AutoBackupPreference
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Primary", "Secondary"]
  newparam(:dsc_autobackuppreference) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AutoBackupPreference - Where backups should be backed up from (Primary, Secondary). Valid values are Primary, Secondary."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Primary', 'primary', 'Secondary', 'secondary'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Primary, Secondary")
      end
    end
  end

  # Name:         BackupPriority
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_backuppriority) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "BackupPriority - The percentage weight for backup prority (default 50)."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EndPointPort
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_endpointport) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "EndPointPort - he TCP port for the SQL AG Endpoint (default 5022)."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SQLServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLServer - The SQL Server for the database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLInstanceName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlinstancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLInstanceName - The SQL instance for the database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SetupCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_setupcredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SetupCredential - Credential to be used to Grant Permissions on SQL Server, set this to $null to use Windows Authentication."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SetupCredential", value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xsqlaogroupensure).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
