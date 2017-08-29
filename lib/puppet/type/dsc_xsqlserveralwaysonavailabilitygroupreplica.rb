require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserveralwaysonavailabilitygroupreplica) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSQLServerAlwaysOnAvailabilityGroupReplica resource type.
    Automatically generated from
    'xSQLServer/DSCResources/MSFT_xSQLServerAlwaysOnAvailabilityGroupReplica/MSFT_xSQLServerAlwaysOnAvailabilityGroupReplica.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_availabilitygroupname is a required attribute') if self[:dsc_availabilitygroupname].nil?
      fail('dsc_sqlinstancename is a required attribute') if self[:dsc_sqlinstancename].nil?
    end

  def dscmeta_resource_friendly_name; 'xSQLServerAlwaysOnAvailabilityGroupReplica' end
  def dscmeta_resource_name; 'MSFT_xSQLServerAlwaysOnAvailabilityGroupReplica' end
  def dscmeta_module_name; 'xSQLServer' end
  def dscmeta_module_version; '7.0.0.0' end

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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of the availability group replica."
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
    desc "AvailabilityGroupName - The name of the availability group."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLServer - Hostname of the SQL Server to be configured."
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
    desc "SQLInstanceName - Name of the SQL instance to be configued."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PrimaryReplicaSQLServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_primaryreplicasqlserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PrimaryReplicaSQLServer - Hostname of the SQL Server where the primary replica is expected to be active. If the primary replica is not found here, the resource will attempt to find the host that holds the primary replica and connect to it."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PrimaryReplicaSQLInstanceName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_primaryreplicasqlinstancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PrimaryReplicaSQLInstanceName - Name of the SQL instance where the primary replica lives."
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
    desc "Ensure - Specifies if the availability group replica should be present or absent. Default is Present. Valid values are Present, Absent."
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

  # Name:         AvailabilityMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["AsynchronousCommit", "SynchronousCommit"]
  newparam(:dsc_availabilitymode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AvailabilityMode - Specifies the replica availability mode. Default is 'AsynchronousCommit'. Valid values are AsynchronousCommit, SynchronousCommit."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['AsynchronousCommit', 'asynchronouscommit', 'SynchronousCommit', 'synchronouscommit'].include?(value)
        fail("Invalid value '#{value}'. Valid values are AsynchronousCommit, SynchronousCommit")
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
    desc "BackupPriority - Specifies the desired priority of the replicas in performing backups. The acceptable values for this parameter are: integers from 0 through 100. Of the set of replicas which are online and available, the replica that has the highest priority performs the backup. Default is 50."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ConnectionModeInPrimaryRole
  # Type:         string
  # IsMandatory:  False
  # Values:       ["AllowAllConnections", "AllowReadWriteConnections"]
  newparam(:dsc_connectionmodeinprimaryrole) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConnectionModeInPrimaryRole - Specifies how the availability replica handles connections when in the primary role. Valid values are AllowAllConnections, AllowReadWriteConnections."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['AllowAllConnections', 'allowallconnections', 'AllowReadWriteConnections', 'allowreadwriteconnections'].include?(value)
        fail("Invalid value '#{value}'. Valid values are AllowAllConnections, AllowReadWriteConnections")
      end
    end
  end

  # Name:         ConnectionModeInSecondaryRole
  # Type:         string
  # IsMandatory:  False
  # Values:       ["AllowNoConnections", "AllowReadIntentConnectionsOnly", "AllowAllConnections"]
  newparam(:dsc_connectionmodeinsecondaryrole) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConnectionModeInSecondaryRole - Specifies how the availability replica handles connections when in the secondary role. Valid values are AllowNoConnections, AllowReadIntentConnectionsOnly, AllowAllConnections."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['AllowNoConnections', 'allownoconnections', 'AllowReadIntentConnectionsOnly', 'allowreadintentconnectionsonly', 'AllowAllConnections', 'allowallconnections'].include?(value)
        fail("Invalid value '#{value}'. Valid values are AllowNoConnections, AllowReadIntentConnectionsOnly, AllowAllConnections")
      end
    end
  end

  # Name:         EndpointHostName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_endpointhostname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EndpointHostName - Specifies the hostname or IP address of the availability group replica endpoint. Default is the instance network name which is set in the code because the value can only be determined when connected to the SQL Instance."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FailoverMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Automatic", "Manual"]
  newparam(:dsc_failovermode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FailoverMode - Specifies the failover mode. Default is 'Manual'. Valid values are Automatic, Manual."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Automatic', 'automatic', 'Manual', 'manual'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Automatic, Manual")
      end
    end
  end

  # Name:         ReadOnlyRoutingConnectionUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_readonlyroutingconnectionurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReadOnlyRoutingConnectionUrl - Specifies the fully-qualified domain name (FQDN) and port to use when routing to the replica for read only connections."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReadOnlyRoutingList
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_readonlyroutinglist, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ReadOnlyRoutingList - Specifies an ordered list of replica server names that represent the probe sequence for connection director to use when redirecting read-only connections through this availability replica. This parameter applies if the availability replica is the current primary replica of the availability group."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         SqlServerNetName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlservernetname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlServerNetName - Output the NetName property from the SQL Server object. Used by Get-TargetResource"
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

Puppet::Type.type(:dsc_xsqlserveralwaysonavailabilitygroupreplica).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
