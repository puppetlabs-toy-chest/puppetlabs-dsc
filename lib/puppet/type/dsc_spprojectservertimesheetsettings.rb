require 'pathname'

Puppet::Type.newtype(:dsc_spprojectservertimesheetsettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPProjectServerTimeSheetSettings resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPProjectServerTimeSheetSettings/MSFT_SPProjectServerTimeSheetSettings.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_url is a required attribute') if self[:dsc_url].nil?
    end

  def dscmeta_resource_friendly_name; 'SPProjectServerTimeSheetSettings' end
  def dscmeta_resource_name; 'MSFT_SPProjectServerTimeSheetSettings' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '2.2.0.0' end

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

  # Name:         Url
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_url) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Url - The default zone URL of the Project site to set timesheet settings for"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EnableOvertimeAndNonBillableTracking
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enableovertimeandnonbillabletracking) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableOvertimeAndNonBillableTracking - Should timesheets allow tracking of overtime and non-billable work types"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DefaultTimesheetCreationMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["CurrentTaskAssignments", "CurrentProjects", "NoPrepopulation"]
  newparam(:dsc_defaulttimesheetcreationmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DefaultTimesheetCreationMode - What is the default mode for timesheets to be created in Valid values are CurrentTaskAssignments, CurrentProjects, NoPrepopulation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['CurrentTaskAssignments', 'currenttaskassignments', 'CurrentProjects', 'currentprojects', 'NoPrepopulation', 'noprepopulation'].include?(value)
        fail("Invalid value '#{value}'. Valid values are CurrentTaskAssignments, CurrentProjects, NoPrepopulation")
      end
    end
  end

  # Name:         DefaultTrackingUnit
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Days", "Weeks"]
  newparam(:dsc_defaulttrackingunit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DefaultTrackingUnit - What is the default tracking unit for timesheets Valid values are Days, Weeks."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Days', 'days', 'Weeks', 'weeks'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Days, Weeks")
      end
    end
  end

  # Name:         DefaultReportingUnit
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Hours", "Days"]
  newparam(:dsc_defaultreportingunit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DefaultReportingUnit - What is the default reporting unit for timesheets Valid values are Hours, Days."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Hours', 'hours', 'Days', 'days'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Hours, Days")
      end
    end
  end

  # Name:         HoursInStandardDay
  # Type:         real32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_hoursinstandardday) do
    def mof_type; 'real32' end
    def mof_is_embedded?; false end
    desc "HoursInStandardDay - How many hours are in a standard timesheeet day?"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         HoursInStandardWeek
  # Type:         real32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_hoursinstandardweek) do
    def mof_type; 'real32' end
    def mof_is_embedded?; false end
    desc "HoursInStandardWeek - How many hours are in a standard timesheeet week?"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxHoursPerTimesheet
  # Type:         real32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxhourspertimesheet) do
    def mof_type; 'real32' end
    def mof_is_embedded?; false end
    desc "MaxHoursPerTimesheet - Maximum hours per timesheet"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MinHoursPerTimesheet
  # Type:         real32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_minhourspertimesheet) do
    def mof_type; 'real32' end
    def mof_is_embedded?; false end
    desc "MinHoursPerTimesheet - Minimum hours per timesheet"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxHoursPerDay
  # Type:         real32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxhoursperday) do
    def mof_type; 'real32' end
    def mof_is_embedded?; false end
    desc "MaxHoursPerDay - Maximum hours per day"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AllowFutureTimeReporting
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowfuturetimereporting) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowFutureTimeReporting - Allow future time reporting?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowNewPersonalTasks
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allownewpersonaltasks) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowNewPersonalTasks - Allow new personal tasks?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowTopLevelTimeReporting
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowtopleveltimereporting) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowTopLevelTimeReporting - Allow top-level time reporting?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RequireTaskStatusManagerApproval
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_requiretaskstatusmanagerapproval) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RequireTaskStatusManagerApproval - Require task status manager approval?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RequireLineApprovalBeforeTimesheetApproval
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_requirelineapprovalbeforetimesheetapproval) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RequireLineApprovalBeforeTimesheetApproval - Require line approval before timesheet approval?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EnableTimesheetAuditing
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enabletimesheetauditing) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableTimesheetAuditing - Enable timesheet auditing?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         FixedApprovalRouting
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_fixedapprovalrouting) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "FixedApprovalRouting - Enable fixed approval routing?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SingleEntryMode
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_singleentrymode) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SingleEntryMode - Enable single entry mode?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DefaultTrackingMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["PercentComplete", "ActualDoneAndRemaining", "HoursPerPeriod", "FreeForm"]
  newparam(:dsc_defaulttrackingmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DefaultTrackingMode - What is the default tracking mode for tasks? Valid values are PercentComplete, ActualDoneAndRemaining, HoursPerPeriod, FreeForm."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['PercentComplete', 'percentcomplete', 'ActualDoneAndRemaining', 'actualdoneandremaining', 'HoursPerPeriod', 'hoursperperiod', 'FreeForm', 'freeform'].include?(value)
        fail("Invalid value '#{value}'. Valid values are PercentComplete, ActualDoneAndRemaining, HoursPerPeriod, FreeForm")
      end
    end
  end

  # Name:         ForceTrackingModeForAllProjects
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_forcetrackingmodeforallprojects) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ForceTrackingModeForAllProjects - Force project managers to use the specified tracking mode for each project?"
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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spprojectservertimesheetsettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
