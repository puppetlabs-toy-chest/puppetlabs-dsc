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
  def dscmeta_module_version; '1.8.0.0' end

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
  # Values:       ["Minutes", "Hourly", "Daily"]
  newparam(:dsc_scheduletype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ScheduleType - How frequently should this task be executed? Minutes, Hourly or Daily Valid values are Minutes, Hourly, Daily."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Minutes', 'minutes', 'Hourly', 'hourly', 'Daily', 'daily'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Minutes, Hourly, Daily")
      end
    end
  end

  # Name:         RepeatInterval
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_repeatinterval) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "RepeatInterval - How many units (minutes, hours, days) between each run of this task?"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         StartTime
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_starttime) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StartTime - The time of day this task should start at - defaults to 12:00 AM"
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
    desc "Ensure - Present if the task should exist, false if it should be removed Valid values are Present, Absent."
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


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xscheduledtask).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
