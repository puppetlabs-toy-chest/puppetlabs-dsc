require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserveralwaysonavailabilitygroup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSQLServerAlwaysOnAvailabilityGroup resource type.
    Automatically generated from
    'xSQLServer/DSCResources/MSFT_xSQLServerAlwaysOnAvailabilityGroup/MSFT_xSQLServerAlwaysOnAvailabilityGroup.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_sqlinstancename is a required attribute') if self[:dsc_sqlinstancename].nil?
    end

  def dscmeta_resource_friendly_name; 'xSQLServerAlwaysOnAvailabilityGroup' end
  def dscmeta_resource_name; 'MSFT_xSQLServerAlwaysOnAvailabilityGroup' end
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
    desc "Name - The name of the availability group."
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


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xsqlserveralwaysonavailabilitygroup).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
