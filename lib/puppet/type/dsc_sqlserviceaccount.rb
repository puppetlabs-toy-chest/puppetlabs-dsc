require 'pathname'

Puppet::Type.newtype(:dsc_sqlserviceaccount) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SqlServiceAccount resource type.
    Automatically generated from
    'SqlServerDsc/DSCResources/MSFT_SqlServiceAccount/MSFT_SqlServiceAccount.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_servername is a required attribute') if self[:dsc_servername].nil?
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
      fail('dsc_servicetype is a required attribute') if self[:dsc_servicetype].nil?
    end

  def dscmeta_resource_friendly_name; 'SqlServiceAccount' end
  def dscmeta_resource_name; 'MSFT_SqlServiceAccount' end
  def dscmeta_module_name; 'SqlServerDsc' end
  def dscmeta_module_version; '11.1.0.0' end

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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         ServerName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_servername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerName - Hostname of the SQL Server."
    isrequired
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
    desc "InstanceName - Name of the SQL instance."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServiceType
  # Type:         string
  # IsMandatory:  True
  # Values:       ["DatabaseEngine", "SQLServerAgent", "Search", "IntegrationServices", "AnalysisServices", "ReportingServices", "SQLServerBrowser", "NotificationServices"]
  newparam(:dsc_servicetype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServiceType - Type of service being managed. Valid values are DatabaseEngine, SQLServerAgent, Search, IntegrationServices, AnalysisServices, ReportingServices, SQLServerBrowser, NotificationServices."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['DatabaseEngine', 'databaseengine', 'SQLServerAgent', 'sqlserveragent', 'Search', 'search', 'IntegrationServices', 'integrationservices', 'AnalysisServices', 'analysisservices', 'ReportingServices', 'reportingservices', 'SQLServerBrowser', 'sqlserverbrowser', 'NotificationServices', 'notificationservices'].include?(value)
        fail("Invalid value '#{value}'. Valid values are DatabaseEngine, SQLServerAgent, Search, IntegrationServices, AnalysisServices, ReportingServices, SQLServerBrowser, NotificationServices")
      end
    end
  end

  # Name:         ServiceAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serviceaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "ServiceAccount - The service account that should be used when running the service."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("ServiceAccount", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         RestartService
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartservice) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RestartService - Determines whether the service is automatically restarted when a change to the configuration was needed."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Force
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_force) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Force - Forces the service account to be updated. Useful for password changes."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ServiceAccountName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serviceaccountname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServiceAccountName - Returns the service account username for the service."
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

Puppet::Type.type(:dsc_sqlserviceaccount).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
