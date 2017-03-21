require 'pathname'

Puppet::Type.newtype(:dsc_spdiagnosticloggingsettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPDiagnosticLoggingSettings resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPDiagnosticLoggingSettings/MSFT_SPDiagnosticLoggingSettings.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_logpath is a required attribute') if self[:dsc_logpath].nil?
    end

  def dscmeta_resource_friendly_name; 'SPDiagnosticLoggingSettings' end
  def dscmeta_resource_name; 'MSFT_SPDiagnosticLoggingSettings' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.5.0.0' end

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
  end

  # Name:         LogPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_logpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogPath - The physical path on each server to store ULS logs"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogSpaceInGB
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logspaceingb) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "LogSpaceInGB - The space in GB that should be used to store ULS logs"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         AppAnalyticsAutomaticUploadEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_appanalyticsautomaticuploadenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AppAnalyticsAutomaticUploadEnabled - Should app analytics automatically be uploaded"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CustomerExperienceImprovementProgramEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_customerexperienceimprovementprogramenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CustomerExperienceImprovementProgramEnabled - Should the customer experience program be enabled in this farm"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DaysToKeepLogs
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_daystokeeplogs) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DaysToKeepLogs - How many days should ULS logs be kept for"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DownloadErrorReportingUpdatesEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_downloaderrorreportingupdatesenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DownloadErrorReportingUpdatesEnabled - Should updates to error reporting tools be automatically downloaded"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ErrorReportingAutomaticUploadEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_errorreportingautomaticuploadenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ErrorReportingAutomaticUploadEnabled - Should error reports be automatically uploaded"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ErrorReportingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_errorreportingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ErrorReportingEnabled - Should reporting of errors be enabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EventLogFloodProtectionEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_eventlogfloodprotectionenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EventLogFloodProtectionEnabled - Protect event logs with Event Log Flood Protection"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EventLogFloodProtectionNotifyInterval
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_eventlogfloodprotectionnotifyinterval) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "EventLogFloodProtectionNotifyInterval - What interval should the event logs report a flood event"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EventLogFloodProtectionQuietPeriod
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_eventlogfloodprotectionquietperiod) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "EventLogFloodProtectionQuietPeriod - What quiet period should reset the event log flood protection thresholds"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EventLogFloodProtectionThreshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_eventlogfloodprotectionthreshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "EventLogFloodProtectionThreshold - What is the event log flood protection threshold"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EventLogFloodProtectionTriggerPeriod
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_eventlogfloodprotectiontriggerperiod) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "EventLogFloodProtectionTriggerPeriod - What is the time period that will trigger event log flood protection"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         LogCutInterval
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logcutinterval) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "LogCutInterval - How many minutes of activity will a ULS log file leep in an individual file"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         LogMaxDiskSpaceUsageEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logmaxdiskspaceusageenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "LogMaxDiskSpaceUsageEnabled - Will the maximum disk space setting be enabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ScriptErrorReportingDelay
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scripterrorreportingdelay) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ScriptErrorReportingDelay - What delay will be set before script error reporting is triggered"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ScriptErrorReportingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scripterrorreportingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ScriptErrorReportingEnabled - Is script error reporting enabled in this farm"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ScriptErrorReportingRequireAuth
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scripterrorreportingrequireauth) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ScriptErrorReportingRequireAuth - Require users to be authenticated to allow script errors to be reported"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         InstallAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "InstallAccount - POWERSHELL 4 ONLY: The account to run this resource as, use PsDscRunAsCredential if using PowerShell 5"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("InstallAccount", value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spdiagnosticloggingsettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
