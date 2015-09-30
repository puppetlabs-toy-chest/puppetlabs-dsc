require 'pathname'

Puppet::Type.newtype(:dsc_xspdiagnosticloggingsettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSPDiagnosticLoggingSettings resource type.
    Automatically generated from
    'xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPDiagnosticLoggingSettings/MSFT_xSPDiagnosticLoggingSettings.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xSPDiagnosticLoggingSettings' end
  def dscmeta_resource_name; 'MSFT_xSPDiagnosticLoggingSettings' end
  def dscmeta_module_name; 'xSharePoint' end
  def dscmeta_module_version; '0.7.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         LogPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_logpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogPath"
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
    desc "LogSpaceInGB"
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
    desc "AppAnalyticsAutomaticUploadEnabled"
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
    desc "CustomerExperienceImprovementProgramEnabled"
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
    desc "DaysToKeepLogs"
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
    desc "DownloadErrorReportingUpdatesEnabled"
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
    desc "ErrorReportingAutomaticUploadEnabled"
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
    desc "ErrorReportingEnabled"
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
    desc "EventLogFloodProtectionEnabled"
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
    desc "EventLogFloodProtectionNotifyInterval"
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
    desc "EventLogFloodProtectionQuietPeriod"
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
    desc "EventLogFloodProtectionThreshold"
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
    desc "EventLogFloodProtectionTriggerPeriod"
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
    desc "LogCutInterval"
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
    desc "LogMaxDiskSpaceUsageEnabled"
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
    desc "ScriptErrorReportingDelay"
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
    desc "ScriptErrorReportingEnabled"
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
    desc "ScriptErrorReportingRequireAuth"
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
    desc "InstallAccount"
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

Puppet::Type.type(:dsc_xspdiagnosticloggingsettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
