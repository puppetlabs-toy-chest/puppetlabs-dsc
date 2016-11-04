require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserverreplication) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSQLServerReplication resource type.
    Automatically generated from
    'xSQLServer/DSCResources/MSFT_xSQLServerReplication/MSFT_xSQLServerReplication.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
    end

  def dscmeta_resource_friendly_name; 'xSQLServerReplication' end
  def dscmeta_resource_name; 'MSFT_xSQLServerReplication' end
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

  # Name:         InstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_instancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceName - SQL Server instance name where replication distribution will be configured"
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
    desc "Ensure - Valid values are Present, Absent."
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

  # Name:         DistributorMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Local", "Remote"]
  newparam(:dsc_distributormode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DistributorMode - Valid values are Local, Remote."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Local', 'local', 'Remote', 'remote'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Local, Remote")
      end
    end
  end

  # Name:         AdminLinkCredentials
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adminlinkcredentials) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "AdminLinkCredentials - Distributor administration link password"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("AdminLinkCredentials", value)
    end
  end

  # Name:         DistributionDBName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_distributiondbname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DistributionDBName - Distribution database name"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RemoteDistributor
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_remotedistributor) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RemoteDistributor - Distributor server name if configuring publisher with remote distributor"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WorkingDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_workingdirectory) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WorkingDirectory - Publisher working directory"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UseTrustedConnection
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usetrustedconnection) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UseTrustedConnection - Publisher security mode"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         UninstallWithForce
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_uninstallwithforce) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UninstallWithForce - Force flag for uninstall procedure"
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

Puppet::Type.type(:dsc_xsqlserverreplication).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
