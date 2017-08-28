require 'pathname'

Puppet::Type.newtype(:dsc_xscheduledtask) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xScheduledTask resource type.
    Automatically generated from
    'xComputerManagement/DSCResources/MSFT_xScheduledTask/MSFT_xScheduledTask.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_taskname is a required attribute') if self[:dsc_taskname].nil?
    end

  def dscmeta_resource_friendly_name; 'xScheduledTask' end
  def dscmeta_resource_name; 'MSFT_xScheduledTask' end
  def dscmeta_module_name; 'xComputerManagement' end
  def dscmeta_module_version; '2.1.0.0' end

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

  # Name:         TaskName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_taskname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TaskName - The name of the task"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TaskPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_taskpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TaskPath - The path to the task - defaults to the root directory"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Description - The task description"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ActionExecutable
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_actionexecutable) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ActionExecutable - The path to the .exe for this task"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ActionArguments
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_actionarguments) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ActionArguments - The arguments to pass the executable"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ActionWorkingPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_actionworkingpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ActionWorkingPath - The working path to specify for the executable"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ScheduleType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Once", "Daily", "Weekly", "AtStartup", "AtLogOn"]
  newparam(:dsc_scheduletype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ScheduleType - When should the task be executed Valid values are Once, Daily, Weekly, AtStartup, AtLogOn."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Once', 'once', 'Daily', 'daily', 'Weekly', 'weekly', 'AtStartup', 'atstartup', 'AtLogOn', 'atlogon'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Once, Daily, Weekly, AtStartup, AtLogOn")
      end
    end
  end

  # Name:         RepeatInterval
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_repeatinterval) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "RepeatInterval - How many units (minutes, hours, days) between each run of this task?"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StartTime
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_starttime) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "StartTime - The time of day this task should start at - defaults to 12:00 AM. Not valid for AtLogon and AtStartup tasks"
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
    desc "Ensure - Present if the task should exist, Absent if it should be removed Valid values are Present, Absent."
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

  # Name:         Enable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Enable - True if the task should be enabled, false if it should be disabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExecuteAsCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_executeascredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "ExecuteAsCredential - The credential this task should execute as. If not specified defaults to running as the local system account"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("ExecuteAsCredential", value)
    end
  end

  # Name:         DaysInterval
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_daysinterval) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DaysInterval - Specifies the interval between the days in the schedule. An interval of 1 produces a daily schedule. An interval of 2 produces an every-other day schedule."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RandomDelay
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_randomdelay) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "RandomDelay - Specifies a random amount of time to delay the start time of the trigger. The delay time is a random time between the time the task triggers and the time that you specify in this setting."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RepetitionDuration
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_repetitionduration) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "RepetitionDuration - Specifies how long the repetition pattern repeats after the task starts."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DaysOfWeek
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_daysofweek, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "DaysOfWeek - Specifies an array of the days of the week on which Task Scheduler runs the task."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         WeeksInterval
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_weeksinterval) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "WeeksInterval - Specifies the interval between the weeks in the schedule. An interval of 1 produces a weekly schedule. An interval of 2 produces an every-other week schedule."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         User
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_user) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "User - Specifies the identifier of the user for a trigger that starts a task when a user logs on."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DisallowDemandStart
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disallowdemandstart) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisallowDemandStart - Indicates whether the task is prohibited to run on demand or not. Defaults to $false"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisallowHardTerminate
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disallowhardterminate) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisallowHardTerminate - Indicates whether the task is prohibited to be terminated or not. Defaults to $false"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Compatibility
  # Type:         string
  # IsMandatory:  False
  # Values:       ["AT", "V1", "Vista", "Win7", "Win8"]
  newparam(:dsc_compatibility) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Compatibility - The task compatibility level. Defaults to Vista. Valid values are AT, V1, Vista, Win7, Win8."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['AT', 'at', 'V1', 'v1', 'Vista', 'vista', 'Win7', 'win7', 'Win8', 'win8'].include?(value)
        fail("Invalid value '#{value}'. Valid values are AT, V1, Vista, Win7, Win8")
      end
    end
  end

  # Name:         AllowStartIfOnBatteries
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowstartifonbatteries) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowStartIfOnBatteries - Indicates whether the task should start if the machine is on batteries or not. Defaults to $false"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Hidden
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_hidden) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Hidden - Indicates that the task is hidden in the Task Scheduler UI."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RunOnlyIfIdle
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_runonlyifidle) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RunOnlyIfIdle - Indicates that Task Scheduler runs the task only when the computer is idle."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IdleWaitTimeout
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_idlewaittimeout) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "IdleWaitTimeout - Specifies the amount of time that Task Scheduler waits for an idle condition to occur."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         NetworkName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_networkname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NetworkName - Specifies the name of a network profile that Task Scheduler uses to determine if the task can run. The Task Scheduler UI uses this setting for display purposes. Specify a network name if you specify the RunOnlyIfNetworkAvailable parameter."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DisallowStartOnRemoteAppSession
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disallowstartonremoteappsession) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisallowStartOnRemoteAppSession - Indicates that the task does not start if the task is triggered to run in a Remote Applications Integrated Locally (RAIL) session."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         StartWhenAvailable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_startwhenavailable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "StartWhenAvailable - Indicates that Task Scheduler can start the task at any time after its scheduled time has passed."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DontStopIfGoingOnBatteries
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dontstopifgoingonbatteries) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DontStopIfGoingOnBatteries - Indicates that the task does not stop if the computer switches to battery power."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         WakeToRun
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_waketorun) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "WakeToRun - Indicates that Task Scheduler wakes the computer before it runs the task."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IdleDuration
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_idleduration) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "IdleDuration - Specifies the amount of time that the computer must be in an idle state before Task Scheduler runs the task."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RestartOnIdle
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartonidle) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RestartOnIdle - Indicates that Task Scheduler restarts the task when the computer cycles into an idle condition more than once."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DontStopOnIdleEnd
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dontstoponidleend) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DontStopOnIdleEnd - Indicates that Task Scheduler does not terminate the task if the idle condition ends before the task is completed."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExecutionTimeLimit
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_executiontimelimit) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "ExecutionTimeLimit - Specifies the amount of time that Task Scheduler is allowed to complete the task."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MultipleInstances
  # Type:         string
  # IsMandatory:  False
  # Values:       ["IgnoreNew", "Parallel", "Queue"]
  newparam(:dsc_multipleinstances) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MultipleInstances - Specifies the policy that defines how Task Scheduler handles multiple instances of the task. Valid values are IgnoreNew, Parallel, Queue."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['IgnoreNew', 'ignorenew', 'Parallel', 'parallel', 'Queue', 'queue'].include?(value)
        fail("Invalid value '#{value}'. Valid values are IgnoreNew, Parallel, Queue")
      end
    end
  end

  # Name:         Priority
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_priority) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Priority - Specifies the priority level of the task. Priority must be an integer from 0 (highest priority) to 10 (lowest priority). The default value is 7. Priority levels 7 and 8 are used for background tasks. Priority levels 4, 5, and 6 are used for interactive tasks."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RestartCount
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartcount) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "RestartCount - Specifies the number of times that Task Scheduler attempts to restart the task."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RestartInterval
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartinterval) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "RestartInterval - Specifies the amount of time that Task Scheduler attempts to restart the task."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RunOnlyIfNetworkAvailable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_runonlyifnetworkavailable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RunOnlyIfNetworkAvailable - Indicates that Task Scheduler runs the task only when a network is available. Task Scheduler uses the NetworkID parameter and NetworkName parameter that you specify in this cmdlet to determine if the network is available."
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

Puppet::Type.type(:dsc_xscheduledtask).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
