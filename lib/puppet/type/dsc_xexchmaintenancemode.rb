require 'pathname'

Puppet::Type.newtype(:dsc_xexchmaintenancemode) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchMaintenanceMode resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchMaintenanceMode/MSFT_xExchMaintenanceMode.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_enabled is a required attribute') if self[:dsc_enabled].nil?
    end

  def dscmeta_resource_friendly_name; 'xExchMaintenanceMode' end
  def dscmeta_resource_name; 'MSFT_xExchMaintenanceMode' end
  def dscmeta_module_name; 'xExchange' end
  def dscmeta_module_version; '1.27.0.0' end

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

  # Name:         Enabled
  # Type:         boolean
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_enabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Enabled - Whether the server should be put into Maintenance Mode. When Enabled is set to True, the server will be put in Maintenance Mode. If False, the server will be taken out of Maintenance Mode."
    isrequired
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential - Credentials used to establish a remote PowerShell session to Exchange"
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

  # Name:         AdditionalComponentsToActivate
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_additionalcomponentstoactivate, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "AdditionalComponentsToActivate - When taking a server out of Maintenance Mode, the following components will be set to Active by default: ServerWideOffline, UMCallRouter, HighAvailability, Monitoring, RecoveryActionsEnabled. This parameter specifies an additional list of components to set to Active."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         DomainController
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domaincontroller) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainController - The DomainController parameter specifies the fully qualified domain name (FQDN) of the domain controller that writes this configuration change to Active Directory."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MountDialOverride
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Lossless", "GoodAvailability", "BestAvailability", "BestEffort"]
  newparam(:dsc_mountdialoverride) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MountDialOverride - Used when moving databases back to the server after taking the server out of maintenance mode. The MountDialOverride parameter is used to override the auto database mount dial (AutoDatabaseMountDial) setting for the target server and specify an alternate setting. Defaults to None. Valid values are None, Lossless, GoodAvailability, BestAvailability, BestEffort."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Lossless', 'lossless', 'GoodAvailability', 'goodavailability', 'BestAvailability', 'bestavailability', 'BestEffort', 'besteffort'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Lossless, GoodAvailability, BestAvailability, BestEffort")
      end
    end
  end

  # Name:         MovePreferredDatabasesBack
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_movepreferreddatabasesback) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MovePreferredDatabasesBack - Whether to move back databases with an Activation Preference of one for this server after taking the server out of Maintenance Mode. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SetInactiveComponentsFromAnyRequesterToActive
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_setinactivecomponentsfromanyrequestertoactive) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SetInactiveComponentsFromAnyRequesterToActive - Whether components that were set to Inactive by outside Requesters should also be set to Active when exiting Maintenance Mode. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SkipActiveCopyChecks
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_skipactivecopychecks) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SkipActiveCopyChecks - Used when moving databases back to the server after taking the server out of maintenance mode. The SkipActiveCopyChecks switch specifies whether to skip checking the current active copy to see if it's currently a seeding source for any passive databases. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SkipAllChecks
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_skipallchecks) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SkipAllChecks - Exchange 2016 Only. Used when moving databases back to the server after taking the server out of maintenance mode. The SkipAllChecks switch specifies whether to skip all checks. This switch is equivalent to specifying all of the individual skip parameters that are available on this cmdlet. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SkipClientExperienceChecks
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_skipclientexperiencechecks) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SkipClientExperienceChecks - Used when moving databases back to the server after taking the server out of maintenance mode. The SkipClientExperienceChecks switch specifies whether to skip the search catalog (content index) state check to see if the search catalog is healthy and up to date. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SkipCpuChecks
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_skipcpuchecks) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SkipCpuChecks - Exchange 2016 Only. Used when moving databases back to the server after taking the server out of maintenance mode. The SkipCpuChecks switch specifies whether to skip the high CPU utilization checks. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SkipHealthChecks
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_skiphealthchecks) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SkipHealthChecks - Used when moving databases back to the server after taking the server out of maintenance mode. The SkipHealthChecks switch specifies whether to bypass passive copy health checks. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SkipLagChecks
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_skiplagchecks) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SkipLagChecks - Used when moving databases back to the server after taking the server out of maintenance mode. The SkipLagChecks switch specifies whether to allow a copy to be activated that has replay and copy queues outside of the configured criteria. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SkipMaximumActiveDatabasesChecks
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_skipmaximumactivedatabaseschecks) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SkipMaximumActiveDatabasesChecks - Used when moving databases back to the server after taking the server out of maintenance mode. The SkipMaximumActiveDatabasesChecks switch specifies whether to skip checking the value of MaximumPreferredActiveDatabases during the best copy and server selection (BCSS) process. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SkipMoveSuppressionChecks
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_skipmovesuppressionchecks) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SkipMoveSuppressionChecks - Exchange 2016 Only. Used when moving databases back to the server after taking the server out of maintenance mode. The SkipMoveSuppressionChecks switch specifies whether to skip the move suppression checks. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         UpgradedServerVersion
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_upgradedserverversion) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UpgradedServerVersion - Optional string to specify what the server version will be after applying a Cumulative Update. If the server is already at this version, requests to put the server in Maintenance Mode will be ignored. Version should be in the format ##.#.####.#, as in 15.0.1104.5."
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

Puppet::Type.type(:dsc_xexchmaintenancemode).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
