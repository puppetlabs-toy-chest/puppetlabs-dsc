require 'pathname'

Puppet::Type.newtype(:dsc_xmppreference) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xMpPreference resource type.
    Automatically generated from
    'xDefender/DSCResources/MSFT_xMpPreference/MSFT_xMpPreference.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  def dscmeta_resource_friendly_name; 'xMpPreference' end
  def dscmeta_resource_name; 'MSFT_xMpPreference' end
  def dscmeta_module_name; 'xDefender' end
  def dscmeta_module_version; '0.2.0.0' end

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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Provide the text string to uniquely identify this group of settings"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ExclusionPath
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_exclusionpath, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExclusionPath - Specifies an array of file paths to exclude from scheduled and real-time scanning. You can specify a folder to exclude all the files under the folder."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ExclusionExtension
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_exclusionextension, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExclusionExtension - Specifies an array of file name extensions, such as obj or lib, to exclude from scheduled, custom, and real-time scanning."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ExclusionProcess
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_exclusionprocess, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExclusionProcess - Specifies an array of processes, as paths to process images. The cmdlet excludes any files opened by the processes that you specify from scheduled and real-time scanning. Specifying this parameter excludes files opened by executable programs only. The cmdlet does not exclude the processes themselves. To exclude a process, specify it by using the ExclusionPath parameter."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         RealTimeScanDirection
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Both", "Incoming", "Outgoing"]
  newparam(:dsc_realtimescandirection) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RealTimeScanDirection - Specifies scanning configuration for incoming and outgoing files on NTFS volumes. Specify a value for this parameter to enhance performance on servers which have a large number of file transfers, but need scanning for either incoming or outgoing files. Evaluate this configuration based on the server role. For non-NTFS volumes, Windows Defender performs full monitoring of file and program activity. Valid values are Both, Incoming, Outgoing."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Both', 'both', 'Incoming', 'incoming', 'Outgoing', 'outgoing'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Both, Incoming, Outgoing")
      end
    end
  end

  # Name:         QuarantinePurgeItemsAfterDelay
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_quarantinepurgeitemsafterdelay) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "QuarantinePurgeItemsAfterDelay - Specifies the number of days to keep items in the Quarantine folder. If you specify a value of zero or do not specify a value for this parameter, items stay in the Quarantine folder indefinitely."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RemediationScheduleDay
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Everyday", "Never", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  newparam(:dsc_remediationscheduleday) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RemediationScheduleDay - Specifies the day of the week on which to perform a scheduled full scan in order to complete remediation. Alternatively, specify everyday for this full scan or never. The default value is Never. If you specify a value of Never or do not specify a value, Windows Defender performs a scheduled full scan to complete remediation by using a default frequency. Valid values are Everyday, Never, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Everyday', 'everyday', 'Never', 'never', 'Monday', 'monday', 'Tuesday', 'tuesday', 'Wednesday', 'wednesday', 'Thursday', 'thursday', 'Friday', 'friday', 'Saturday', 'saturday', 'Sunday', 'sunday'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Everyday, Never, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday")
      end
    end
  end

  # Name:         RemediationScheduleTime
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_remediationscheduletime) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "RemediationScheduleTime - Specifies the time of day, as the number of minutes after midnight, to perform a scheduled scan. The time refers to the local time on the computer. If you do not specify a value for this parameter, a scheduled scan runs at the default time of two hours after midnight."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReportingAdditionalActionTimeOut
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reportingadditionalactiontimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ReportingAdditionalActionTimeOut - Specifies the number of minutes before a detection in the additional action state changes to the cleared state."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ReportingNonCriticalTimeOut
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reportingnoncriticaltimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ReportingNonCriticalTimeOut - Specifies the number of minutes before a detection in the non-critically failed state changes to the cleared state."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ReportingCriticalFailureTimeOut
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reportingcriticalfailuretimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ReportingCriticalFailureTimeOut - Specifies the number of minutes before a detection in the critically failed state changes to either the additional action state or the cleared state."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ScanAvgCPULoadFactor
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scanavgcpuloadfactor) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ScanAvgCPULoadFactor - Specifies the maxium percentage CPU usage for a scan. The acceptable values for this parameter are:  integers from 5 through 100, and the value 0, which disables CPU throttling. Windows Defender does not exceed the percentage of CPU usage that you specify. The default value is 50."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         CheckForSignaturesBeforeRunningScan
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_checkforsignaturesbeforerunningscan) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CheckForSignaturesBeforeRunningScan - Indicates whether to check for new virus and spyware definitions before Windows Defender runs a scan. If you specify a value of $True, Windows Defender checks for new definitions. If you specify $False or do not specify a value, the scan begins with existing definitions. This value applies to scheduled scans and to scans that you start from the command line, but it does not affect scans that you start from the user interface."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ScanPurgeItemsAfterDelay
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scanpurgeitemsafterdelay) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ScanPurgeItemsAfterDelay - Specifies the number of days to keep items in the scan history folder. After this time, Windows Defender removes the items. If you specify a value of zero, Windows Defender does not remove items. If you do not specify a value, Windows Defender removes items from the scan history folder after the default length of time, which is 30 days."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ScanOnlyIfIdleEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scanonlyifidleenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ScanOnlyIfIdleEnabled - Indicates whether to start scheduled scans only when the computer is not in use. If you specify a value of $True or do not specify a value, Windows Defender runs schedules scans when the computer is on, but not in use."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ScanParameters
  # Type:         string
  # IsMandatory:  False
  # Values:       ["FullSCan", "QuickScan"]
  newparam(:dsc_scanparameters) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ScanParameters - Specifies the scan type to use during a scheduled scan. If you do not specify this parameter, Windows Defender uses the default value of quick scan. Valid values are FullSCan, QuickScan."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['FullSCan', 'fullscan', 'QuickScan', 'quickscan'].include?(value)
        fail("Invalid value '#{value}'. Valid values are FullSCan, QuickScan")
      end
    end
  end

  # Name:         ScanScheduleDay
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Everyday", "Never", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  newparam(:dsc_scanscheduleday) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ScanScheduleDay - Specifies the day of the week on which to perform a scheduled scan. Alternatively, specify everyday for a scheduled scan or never. If you specify a value of Never or do not specify a value, Windows Defender performs a scheduled scan by using a default frequency. Valid values are Everyday, Never, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Everyday', 'everyday', 'Never', 'never', 'Monday', 'monday', 'Tuesday', 'tuesday', 'Wednesday', 'wednesday', 'Thursday', 'thursday', 'Friday', 'friday', 'Saturday', 'saturday', 'Sunday', 'sunday'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Everyday, Never, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday")
      end
    end
  end

  # Name:         ScanScheduleQuickScanTime
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scanschedulequickscantime) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "ScanScheduleQuickScanTime - Specifies the time of day, as the number of minutes after midnight, to perform a scheduled quick scan. The time refers to the local time on the computer. If you do not specify a value for this parameter, a scheduled quick scan runs at the time specified by the ScanScheduleTime parameter. That parameter has a default time of two hours after midnight."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ScanScheduleTime
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scanscheduletime) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "ScanScheduleTime - Specifies the time of day, as the number of minutes after midnight, to perform a scheduled scan. The time refers to the local time on the computer. If you do not specify a value for this parameter, a scheduled scan runs at a default time of two hours after midnight."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SignatureFirstAuGracePeriod
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_signaturefirstaugraceperiod) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "SignatureFirstAuGracePeriod - Specifies a grace period, in minutes, for the definition. If a definition successfully updates within this period, Windows Defender abandons any service initiated updates. This parameter overrides the value of the CheckForSignaturesBeforeRunningScan parameter."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SignatureAuGracePeriod
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_signatureaugraceperiod) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "SignatureAuGracePeriod - Specifies a grace period, in minutes, for the definition. If a definition successfully updates within this period, Windows Defender abandons any service initiated updates."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SignatureDefinitionUpdateFileSharesSources
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_signaturedefinitionupdatefilesharessources) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SignatureDefinitionUpdateFileSharesSources - Specifies file-share sources for definition updates. Specify sources as a bracketed sequence of Universal Naming Convention (UNC) locations, separated by the pipeline symbol. If you specify a value for this parameter, Windows Defender attempts to connect to the shares in the order that you specify. After Windows Defender updates a definition, it stops attempting to connect to shares on the list. If you do not specify a value for this parameter, the list is empty."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SignatureDisableUpdateOnStartupWithoutEngine
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_signaturedisableupdateonstartupwithoutengine) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SignatureDisableUpdateOnStartupWithoutEngine - Indicates whether to initiate definition updates even if no antimalware engine is present. If you specify a value of $True or do not specify a value, Windows Defender initiates definition updates on startup. If you specify a value of $False, and if no antimalware engine is present, Windows Defender does not initiate definition updates on startup."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SignatureFallbackOrder
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_signaturefallbackorder) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SignatureFallbackOrder - Specifies the order in which to contact different definition update sources. Specify the types of update sources in the order in which you want Windows Defender to contact them, enclosed in braces and separated by the pipeline symbol."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SignatureScheduleDay
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Everyday", "Never", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  newparam(:dsc_signaturescheduleday) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SignatureScheduleDay - Specifies the day of the week on which to check for definition updates. Alternatively, specify everyday for a scheduled scan or never. If you specify a value of Never or do not specify a value, Windows Defender checks for definition updates by using a default frequency. Valid values are Everyday, Never, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Everyday', 'everyday', 'Never', 'never', 'Monday', 'monday', 'Tuesday', 'tuesday', 'Wednesday', 'wednesday', 'Thursday', 'thursday', 'Friday', 'friday', 'Saturday', 'saturday', 'Sunday', 'sunday'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Everyday, Never, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday")
      end
    end
  end

  # Name:         SignatureScheduleTime
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_signaturescheduletime) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "SignatureScheduleTime - Specifies the time of day, as the number of minutes after midnight, to check for definition updates. The time refers to the local time on the computer. If you do not specify a value for this parameter, Windows Defender checks for definition updates at the default time of 15 minutes before the scheduled scan time."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SignatureUpdateCatchupInterval
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_signatureupdatecatchupinterval) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "SignatureUpdateCatchupInterval - Specifies the number of days after which Windows Defender requires a catch-up definition update. If you do not specify a value for this parameter, Windows Defender requires a catch-up definition update after the default value of one day."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SignatureUpdateInterval
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_signatureupdateinterval) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "SignatureUpdateInterval - Specifies the interval, in hours, at which to check for definition updates. The acceptable values for this parameter are:  integers from 1 through 24. If you do not specify a value for this parameter, Windows Defender checks at the default interval. You can use this parameter instead of the SignatureScheduleDay parameter and SignatureScheduleTime parameter. "
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MAPSReporting
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Advanced", "Basic", "Disabled"]
  newparam(:dsc_mapsreporting) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MAPSReporting - Specifies the type of membership in Microsoft Active Protection Service. Microsoft Active Protection Service is an online community that helps you choose how to respond to potential threats. The community also helps prevent the spread of new malicious software. If you join this community, you can choose to automatically send basic or additional information about detected software. Additional information helps Microsoft create new definitions. In some instances, personal information might unintentionally be sent to Microsoft. However, Microsoft will not use this information to identify you or contact you. Valid values are Advanced, Basic, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Advanced', 'advanced', 'Basic', 'basic', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Advanced, Basic, Disabled")
      end
    end
  end

  # Name:         DisablePrivacyMode
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disableprivacymode) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisablePrivacyMode - Indicates whether to disable privacy mode. Privacy mode prevents users, other than administrators, from displaying threat history."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RandomizeScheduleTaskTimes
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_randomizescheduletasktimes) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RandomizeScheduleTaskTimes - Indicates whether to select a random time for the scheduled start and scheduled update for definitions. If you specify a value of $True or do not specify a value, scheduled tasks begin within 30 minutes, before or after, the scheduled time. If you randomize the start times, it can distribute the impact of scanning. For example, if several virtual machines share the same host, randomized start times prevents all the hosts from starting the scheduled tasks at the same time."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableBehaviorMonitoring
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disablebehaviormonitoring) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableBehaviorMonitoring - Indicates whether to enable behavior monitoring. If you specify a value of $True or do not specify a value, Windows Defender enables behavior monitoring"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableIntrusionPreventionSystem
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disableintrusionpreventionsystem) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableIntrusionPreventionSystem - Indicates whether to configure network protection against exploitation of known vulnerabilities. If you specify a value of $True or do not specify a value, network protection is enabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableIOAVProtection
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disableioavprotection) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableIOAVProtection - Indicates whether Windows Defender scans all downloaded files and attachments. If you specify a value of $True or do not specify a value, scanning downloaded files and attachments is enabled. "
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableRealtimeMonitoring
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disablerealtimemonitoring) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableRealtimeMonitoring - Indicates whether to use real-time protection. If you specify a value of $True or do not specify a value, Windows Defender uses real-time protection. We recommend that you enable Windows Defender to use real-time protection."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableScriptScanning
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disablescriptscanning) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableScriptScanning - Specifies whether to disable the scanning of scripts during malware scans."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableArchiveScanning
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disablearchivescanning) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableArchiveScanning - Indicates whether to scan archive files, such as .zip and .cab files, for malicious and unwanted software. If you specify a value of $True or do not specify a value, Windows Defender scans archive files."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableAutoExclusions
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disableautoexclusions) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableAutoExclusions - Indicates whether to disable the Automatic Exclusions feature for the server."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableCatchupFullScan
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disablecatchupfullscan) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableCatchupFullScan - Indicates whether Windows Defender runs catch-up scans for scheduled full scans. A computer can miss a scheduled scan, usually because the computer is turned off at the scheduled time. If you specify a value of $True, after the computer misses two scheduled full scans, Windows Defender runs a catch-up scan the next time someone logs on to the computer. If you specify a value of $False or do not specify a value, the computer does not run catch-up scans for scheduled full scans."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableCatchupQuickScan
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disablecatchupquickscan) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableCatchupQuickScan - Indicates whether Windows Defender runs catch-up scans for scheduled quick scans. A computer can miss a scheduled scan, usually because the computer is off at the scheduled time. If you specify a value of $True, after the computer misses two scheduled quick scans, Windows Defender runs a catch-up scan the next time someone logs onto the computer. If you specify a value of $False or do not specify a value, the computer does not run catch-up scans for scheduled quick scans. "
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableEmailScanning
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disableemailscanning) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableEmailScanning - Indicates whether Windows Defender parses the mailbox and mail files, according to their specific format, in order to analyze mail bodies and attachments. Windows Defender supports several formats, including .pst, .dbx, .mbx, .mime, and .binhex. If you specify a value of $True, Windows Defender performs email scanning. If you specify a value of $False or do not specify a value, Windows Defender does not perform email scanning. "
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableRemovableDriveScanning
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disableremovabledrivescanning) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableRemovableDriveScanning - Indicates whether to scan for malicious and unwanted software in removable drives, such as flash drives, during a full scan. If you specify a value of $True, Windows Defender scans removable drives during any type of scan. If you specify a value of $False or do not specify a value, Windows Defender does not scan removable drives during a full scan. Windows Defender can still scan removable drives during quick scans or custom scans."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableRestorePoint
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disablerestorepoint) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableRestorePoint - Indicates whether to disable scanning of restore points."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableScanningMappedNetworkDrivesForFullScan
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disablescanningmappednetworkdrivesforfullscan) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableScanningMappedNetworkDrivesForFullScan - Indicates whether to scan mapped network drives. If you specify a value of $True, Windows Defender scans mapped network drives. If you specify a value of $False or do not specify a value, Windows Defender does not scan mapped network drives."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableScanningNetworkFiles
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disablescanningnetworkfiles) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableScanningNetworkFiles - Indicates whether to scan for network files. If you specify a value of $True, Windows Defender scans network files. If you specify a value of $False or do not specify a value, Windows Defender does not scan network files. We do not recommend that you scan network files."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         UILockdown
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_uilockdown) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UILockdown - Indicates whether to disable UI lockdown mode. If you specify a value of $True, Windows Defender disables UI lockdown mode. If you specify $False or do not specify a value, UI lockdown mode is enabled."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ThreatIDDefaultAction_Ids
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_threatiddefaultaction_ids) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "ThreatIDDefaultAction_Ids - Specifies an array of the actions to take for the IDs specified by using the ThreatIDDefaultAction_Ids parameter."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ThreatIDDefaultAction_Actions
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Allow", "Block", "Clean", "NoAction", "Quarantine", "Remove", "UserDefined"]
  newparam(:dsc_threatiddefaultaction_actions) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ThreatIDDefaultAction_Actions - Specifies which automatic remediation action to take for an unknonwn level threat. Valid values are Allow, Block, Clean, NoAction, Quarantine, Remove, UserDefined."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Allow', 'allow', 'Block', 'block', 'Clean', 'clean', 'NoAction', 'noaction', 'Quarantine', 'quarantine', 'Remove', 'remove', 'UserDefined', 'userdefined'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Allow, Block, Clean, NoAction, Quarantine, Remove, UserDefined")
      end
    end
  end

  # Name:         UnknownThreatDefaultAction
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Allow", "Block", "Clean", "NoAction", "Quarantine", "Remove", "UserDefined"]
  newparam(:dsc_unknownthreatdefaultaction) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UnknownThreatDefaultAction - Specifies which automatic remediation action to take for a low level threat. Valid values are Allow, Block, Clean, NoAction, Quarantine, Remove, UserDefined."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Allow', 'allow', 'Block', 'block', 'Clean', 'clean', 'NoAction', 'noaction', 'Quarantine', 'quarantine', 'Remove', 'remove', 'UserDefined', 'userdefined'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Allow, Block, Clean, NoAction, Quarantine, Remove, UserDefined")
      end
    end
  end

  # Name:         LowThreatDefaultAction
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Allow", "Block", "Clean", "NoAction", "Quarantine", "Remove", "UserDefined"]
  newparam(:dsc_lowthreatdefaultaction) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LowThreatDefaultAction - Specifies which automatic remediation action to take for a low level threat. Valid values are Allow, Block, Clean, NoAction, Quarantine, Remove, UserDefined."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Allow', 'allow', 'Block', 'block', 'Clean', 'clean', 'NoAction', 'noaction', 'Quarantine', 'quarantine', 'Remove', 'remove', 'UserDefined', 'userdefined'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Allow, Block, Clean, NoAction, Quarantine, Remove, UserDefined")
      end
    end
  end

  # Name:         ModerateThreatDefaultAction
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Allow", "Block", "Clean", "NoAction", "Quarantine", "Remove", "UserDefined"]
  newparam(:dsc_moderatethreatdefaultaction) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ModerateThreatDefaultAction - Specifies which automatic remediation action to take for a moderate level threat. Valid values are Allow, Block, Clean, NoAction, Quarantine, Remove, UserDefined."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Allow', 'allow', 'Block', 'block', 'Clean', 'clean', 'NoAction', 'noaction', 'Quarantine', 'quarantine', 'Remove', 'remove', 'UserDefined', 'userdefined'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Allow, Block, Clean, NoAction, Quarantine, Remove, UserDefined")
      end
    end
  end

  # Name:         HighThreatDefaultAction
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Allow", "Block", "Clean", "NoAction", "Quarantine", "Remove", "UserDefined"]
  newparam(:dsc_highthreatdefaultaction) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "HighThreatDefaultAction - Specifies which automatic remediation action to take for a high level threat. Valid values are Allow, Block, Clean, NoAction, Quarantine, Remove, UserDefined."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Allow', 'allow', 'Block', 'block', 'Clean', 'clean', 'NoAction', 'noaction', 'Quarantine', 'quarantine', 'Remove', 'remove', 'UserDefined', 'userdefined'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Allow, Block, Clean, NoAction, Quarantine, Remove, UserDefined")
      end
    end
  end

  # Name:         SevereThreatDefaultAction
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Allow", "Block", "Clean", "NoAction", "Quarantine", "Remove", "UserDefined"]
  newparam(:dsc_severethreatdefaultaction) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SevereThreatDefaultAction - Specifies which automatic remediation action to take for a severe level threat. Valid values are Allow, Block, Clean, NoAction, Quarantine, Remove, UserDefined."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Allow', 'allow', 'Block', 'block', 'Clean', 'clean', 'NoAction', 'noaction', 'Quarantine', 'quarantine', 'Remove', 'remove', 'UserDefined', 'userdefined'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Allow, Block, Clean, NoAction, Quarantine, Remove, UserDefined")
      end
    end
  end

  # Name:         SubmitSamplesConsent
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Allways Prompt", "Send safe samples automatically", "Never send", "Send all samples automatically"]
  newparam(:dsc_submitsamplesconsent) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SubmitSamplesConsent - Specifies how Windows Defender checks for user consent for certain samples. If consent has previously been granted, Windows Defender submits the samples. Otherwise, if the MAPSReporting parameter does not have a value of Disabled, Windows Defender prompts the user for consent. Valid values are Allways Prompt, Send safe samples automatically, Never send, Send all samples automatically."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Allways Prompt', 'allways prompt', 'Send safe samples automatically', 'send safe samples automatically', 'Never send', 'never send', 'Send all samples automatically', 'send all samples automatically'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Allways Prompt, Send safe samples automatically, Never send, Send all samples automatically")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xmppreference).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
