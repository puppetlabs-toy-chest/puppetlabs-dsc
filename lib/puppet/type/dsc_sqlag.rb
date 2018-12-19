require 'pathname'

Puppet::Type.newtype(:dsc_sqlag) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SqlAG resource type.
    Automatically generated from
    'SqlServerDsc/DSCResources/MSFT_SqlAG/MSFT_SqlAG.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
    end

  def dscmeta_resource_friendly_name; 'SqlAG' end
  def dscmeta_resource_name; 'MSFT_SqlAG' end
  def dscmeta_module_name; 'SqlServerDsc' end
  def dscmeta_module_version; '11.1.0.0' end

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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of the availability group."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServerName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_servername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerName - Hostname of the SQL Server to be configured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_instancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceName - Name of the SQL instance to be configured."
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
    desc "Ensure - Specifies if the availability group should be present or absent. Default is Present. Valid values are Present, Absent."
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

  # Name:         AutomatedBackupPreference
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Primary", "SecondaryOnly", "Secondary", "None"]
  newparam(:dsc_automatedbackuppreference) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AutomatedBackupPreference - Specifies the automated backup preference for the availability group. Default is None Valid values are Primary, SecondaryOnly, Secondary, None."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Primary', 'primary', 'SecondaryOnly', 'secondaryonly', 'Secondary', 'secondary', 'None', 'none'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Primary, SecondaryOnly, Secondary, None")
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

  # Name:         BasicAvailabilityGroup
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_basicavailabilitygroup) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "BasicAvailabilityGroup - Specifies the type of availability group is Basic. This is only available is SQL Server 2016 and later and is ignored when applied to previous versions."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DatabaseHealthTrigger
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasehealthtrigger) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DatabaseHealthTrigger - Specifies if the option Database Level Health Detection is enabled. This is only available is SQL Server 2016 and later and is ignored when applied to previous versions."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DtcSupportEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dtcsupportenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DtcSupportEnabled - Specifies if the option Database DTC Support is enabled. This is only available is SQL Server 2016 and later and is ignored when applied to previous versions. This can't be altered once the Availability Group is created and is ignored if it is the case."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
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
    desc "EndpointHostName - Specifies the hostname or IP address of the availability group replica endpoint. Default is the instance network name."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FailureConditionLevel
  # Type:         string
  # IsMandatory:  False
  # Values:       ["OnServerDown", "OnServerUnresponsive", "OnCriticalServerErrors", "OnModerateServerErrors", "OnAnyQualifiedFailureCondition"]
  newparam(:dsc_failureconditionlevel) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FailureConditionLevel - Specifies the automatic failover behavior of the availability group. Valid values are OnServerDown, OnServerUnresponsive, OnCriticalServerErrors, OnModerateServerErrors, OnAnyQualifiedFailureCondition."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['OnServerDown', 'onserverdown', 'OnServerUnresponsive', 'onserverunresponsive', 'OnCriticalServerErrors', 'oncriticalservererrors', 'OnModerateServerErrors', 'onmoderateservererrors', 'OnAnyQualifiedFailureCondition', 'onanyqualifiedfailurecondition'].include?(value)
        fail("Invalid value '#{value}'. Valid values are OnServerDown, OnServerUnresponsive, OnCriticalServerErrors, OnModerateServerErrors, OnAnyQualifiedFailureCondition")
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

  # Name:         HealthCheckTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_healthchecktimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "HealthCheckTimeout - Specifies the length of time, in milliseconds, after which AlwaysOn availability groups declare an unresponsive server to be unhealthy. Default is 30000."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ProcessOnlyOnActiveNode
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_processonlyonactivenode) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ProcessOnlyOnActiveNode - Specifies that the resource will only determine if a change is needed if the target node is the active host of the SQL Server Instance."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EndpointUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_endpointurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EndpointUrl - Gets the Endpoint URL of the availability group replica endpoint."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EndpointPort
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_endpointport) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "EndpointPort - Gets the port the database mirroring endpoint is listening on."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Version
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_version) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Version - Gets the major version of the SQL Server instance."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         IsActiveNode
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isactivenode) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsActiveNode - Determines if the current node is actively hosting the SQL Server instance."
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

Puppet::Type.type(:dsc_sqlag).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
