require 'pathname'

Puppet::Type.newtype(:dsc_xwebapppool) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xWebAppPool resource type.
    Automatically generated from
    'xWebAdministration/DSCResources/MSFT_xWebAppPool/MSFT_xWebAppPool.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xWebAppPool' end
  def dscmeta_resource_name; 'MSFT_xWebAppPool' end
  def dscmeta_module_name; 'xWebAdministration' end
  def dscmeta_module_version; '1.15.0.0' end

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
    desc "Name - Indicates the application pool name. The value must contain between 1 and 64 characters."
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
    desc "Ensure - Indicates if the application pool exists. Set this property to Absent to ensure that the application pool does not exist. Setting it to Present (the default value) ensures that the application pool exists. Valid values are Present, Absent."
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

  # Name:         State
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Started", "Stopped"]
  newparam(:dsc_state) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "State - Indicates the state of the application pool. The values that are allowed for this property are: Started, Stopped. Valid values are Started, Stopped."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Started', 'started', 'Stopped', 'stopped'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Started, Stopped")
      end
    end
  end

  # Name:         autoStart
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autostart) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "autoStart - When set to true, indicates to the World Wide Web Publishing Service (W3SVC) that the application pool should be automatically started when it is created or when IIS is started."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CLRConfigFile
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_clrconfigfile) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CLRConfigFile - Indicates the .NET configuration file for the application pool."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         enable32BitAppOnWin64
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enable32bitapponwin64) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "enable32BitAppOnWin64 - When set to true, enables a 32-bit application to run on a computer that runs a 64-bit version of Windows."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         enableConfigurationOverride
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enableconfigurationoverride) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "enableConfigurationOverride - When set to true, indicates that delegated settings in Web.config files will processed for applications within this application pool. When set to false, all settings in Web.config files will be ignored for this application pool."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         managedPipelineMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Integrated", "Classic"]
  newparam(:dsc_managedpipelinemode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "managedPipelineMode - Indicates the request-processing mode that is used to process requests for managed content. The values that are allowed for this property are: Integrated, Classic. Valid values are Integrated, Classic."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Integrated', 'integrated', 'Classic', 'classic'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Integrated, Classic")
      end
    end
  end

  # Name:         managedRuntimeLoader
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_managedruntimeloader) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "managedRuntimeLoader - Indicates the managed loader to use for pre-loading the application pool."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         managedRuntimeVersion
  # Type:         string
  # IsMandatory:  False
  # Values:       ["v4.0", "v2.0", ""]
  newparam(:dsc_managedruntimeversion) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "managedRuntimeVersion - Indicates the CLR version to be used by the application pool. The values that are allowed for this property are: v4.0, v2.0, and ''. Valid values are v4.0, v2.0, ."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['v4.0', 'v4.0', 'v2.0', 'v2.0', '', ''].include?(value)
        fail("Invalid value '#{value}'. Valid values are v4.0, v2.0, ")
      end
    end
  end

  # Name:         passAnonymousToken
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_passanonymoustoken) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "passAnonymousToken - When set to true, the Windows Process Activation Service (WAS) creates and passes a token for the built-in IUSR anonymous user account to the Anonymous authentication module. The Anonymous authentication module uses the token to impersonate the built-in account. When this property is set to false, the token will not be passed."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         startMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["OnDemand", "AlwaysRunning"]
  newparam(:dsc_startmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "startMode - Indicates the startup type for the application pool. The values that are allowed for this property are: OnDemand, AlwaysRunning. Valid values are OnDemand, AlwaysRunning."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['OnDemand', 'ondemand', 'AlwaysRunning', 'alwaysrunning'].include?(value)
        fail("Invalid value '#{value}'. Valid values are OnDemand, AlwaysRunning")
      end
    end
  end

  # Name:         queueLength
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_queuelength) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "queueLength - Indicates the maximum number of requests that HTTP.sys will queue for the application pool. The value must be a valid integer between 10 and 65535."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         cpuAction
  # Type:         string
  # IsMandatory:  False
  # Values:       ["NoAction", "KillW3wp", "Throttle", "ThrottleUnderLoad"]
  newparam(:dsc_cpuaction) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "cpuAction - Configures the action that IIS takes when a worker process exceeds its configured CPU limit. The values that are allowed for this property are: NoAction, KillW3wp, Throttle, and ThrottleUnderLoad. Valid values are NoAction, KillW3wp, Throttle, ThrottleUnderLoad."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['NoAction', 'noaction', 'KillW3wp', 'killw3wp', 'Throttle', 'throttle', 'ThrottleUnderLoad', 'throttleunderload'].include?(value)
        fail("Invalid value '#{value}'. Valid values are NoAction, KillW3wp, Throttle, ThrottleUnderLoad")
      end
    end
  end

  # Name:         cpuLimit
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cpulimit) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "cpuLimit - Configures the maximum percentage of CPU time (in 1/1000ths of one percent) that the worker processes in the application pool are allowed to consume over a period of time as indicated by the cpuResetInterval property. The value must be a valid integer between 0 and 100000."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         cpuResetInterval
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cpuresetinterval) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "cpuResetInterval - Indicates the reset period (in minutes) for CPU monitoring and throttling limits on the application pool. The value must be a string representation of a TimeSpan value. The valid range (in minutes) is 0 to 1440. Setting the value of this property to 0 disables CPU monitoring."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         cpuSmpAffinitized
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cpusmpaffinitized) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "cpuSmpAffinitized - Indicates whether a particular worker process assigned to the application pool should also be assigned to a given CPU."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         cpuSmpProcessorAffinityMask
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cpusmpprocessoraffinitymask) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "cpuSmpProcessorAffinityMask - Indicates the hexadecimal processor mask for multi-processor computers, which indicates to which CPU the worker processes in the application pool should be bound. Before this property takes effect, the cpuSmpAffinitized property must be set to true for the application pool. The value must be a valid integer between 0 and 4294967295."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         cpuSmpProcessorAffinityMask2
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cpusmpprocessoraffinitymask2) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "cpuSmpProcessorAffinityMask2 - Indicates the high-order DWORD hexadecimal processor mask for 64-bit multi-processor computers, which indicates to which CPU the worker processes in the application pool should be bound. Before this property takes effect, the cpuSmpAffinitized property must be set to true for the application pool. The value must be a valid integer between 0 and 4294967295."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         identityType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["ApplicationPoolIdentity", "LocalService", "LocalSystem", "NetworkService", "SpecificUser"]
  newparam(:dsc_identitytype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "identityType - Indicates the account identity under which the application pool runs. The values that are allowed for this property are: ApplicationPoolIdentity, LocalService, LocalSystem, NetworkService, and SpecificUser. Valid values are ApplicationPoolIdentity, LocalService, LocalSystem, NetworkService, SpecificUser."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['ApplicationPoolIdentity', 'applicationpoolidentity', 'LocalService', 'localservice', 'LocalSystem', 'localsystem', 'NetworkService', 'networkservice', 'SpecificUser', 'specificuser'].include?(value)
        fail("Invalid value '#{value}'. Valid values are ApplicationPoolIdentity, LocalService, LocalSystem, NetworkService, SpecificUser")
      end
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential - Indicates the custom account crededentials. This property is only valid when the identityType property is set to SpecificUser."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         idleTimeout
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_idletimeout) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "idleTimeout - Indicates the amount of time (in minutes) a worker process will remain idle before it shuts down. The value must be a string representation of a TimeSpan value and must be less than the restartTimeLimit property value. The valid range (in minutes) is 0 to 43200."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         idleTimeoutAction
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Terminate", "Suspend"]
  newparam(:dsc_idletimeoutaction) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "idleTimeoutAction - Indicates the action to perform when the idle timeout duration has been reached. The values that are allowed for this property are: Terminate, Suspend. Valid values are Terminate, Suspend."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Terminate', 'terminate', 'Suspend', 'suspend'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Terminate, Suspend")
      end
    end
  end

  # Name:         loadUserProfile
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_loaduserprofile) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "loadUserProfile - Indicates whether IIS loads the user profile for the application pool identity."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         logEventOnProcessModel
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logeventonprocessmodel) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "logEventOnProcessModel - Indicates that IIS should generate an event log entry for each occurrence of the specified process model events."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         logonType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["LogonBatch", "LogonService"]
  newparam(:dsc_logontype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "logonType - Indicates the logon type for the process identity. The values that are allowed for this property are: LogonBatch, LogonService. Valid values are LogonBatch, LogonService."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['LogonBatch', 'logonbatch', 'LogonService', 'logonservice'].include?(value)
        fail("Invalid value '#{value}'. Valid values are LogonBatch, LogonService")
      end
    end
  end

  # Name:         manualGroupMembership
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_manualgroupmembership) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "manualGroupMembership - Indicates whether the IIS_IUSRS group Security Identifier (SID) is added to the worker process token."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         maxProcesses
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxprocesses) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "maxProcesses - Indicates the maximum number of worker processes that would be used for the application pool. The value must be a valid integer between 0 and 2147483647."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         pingingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pingingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "pingingEnabled - Indicates whether pinging (health monitoring) is enabled for the worker process(es) serving this application pool."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         pingInterval
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pinginterval) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "pingInterval - Indicates the period of time (in seconds) between health monitoring pings sent to the worker process(es) serving this application pool. The value must be a string representation of a TimeSpan value. The valid range (in seconds) is 1 to 4294967."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         pingResponseTime
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pingresponsetime) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "pingResponseTime - Indicates the maximum time (in seconds) that a worker process is given to respond to a health monitoring ping. The value must be a string representation of a TimeSpan value. The valid range (in seconds) is 1 to 4294967."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         setProfileEnvironment
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_setprofileenvironment) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "setProfileEnvironment - Indicates the environment to be set based on the user profile for the new process."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         shutdownTimeLimit
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_shutdowntimelimit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "shutdownTimeLimit - Indicates the period of time (in seconds) a worker process is given to finish processing requests and shut down. The value must be a string representation of a TimeSpan value. The valid range (in seconds) is 1 to 4294967."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         startupTimeLimit
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_startuptimelimit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "startupTimeLimit - Indicates the period of time (in seconds) a worker process is given to start up and initialize. The value must be a string representation of a TimeSpan value. The valid range (in seconds) is 1 to 4294967."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         orphanActionExe
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_orphanactionexe) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "orphanActionExe - Indicates an executable to run when a worker process is orphaned."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         orphanActionParams
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_orphanactionparams) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "orphanActionParams - Indicates parameters for the executable that is specified in the orphanActionExe property."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         orphanWorkerProcess
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_orphanworkerprocess) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "orphanWorkerProcess - Indicates whether to assign a worker process to an orphan state instead of terminating it when the application pool fails. If true, an unresponsive worker process will be orphaned instead of terminated."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         loadBalancerCapabilities
  # Type:         string
  # IsMandatory:  False
  # Values:       ["HttpLevel", "TcpLevel"]
  newparam(:dsc_loadbalancercapabilities) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "loadBalancerCapabilities - Indicates the response behavior of a service when it is unavailable. The values that are allowed for this property are: HttpLevel, TcpLevel. If set to HttpLevel and the application pool is stopped, HTTP.sys will return HTTP 503 error. If set to TcpLevel, HTTP.sys will reset the connection. Valid values are HttpLevel, TcpLevel."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['HttpLevel', 'httplevel', 'TcpLevel', 'tcplevel'].include?(value)
        fail("Invalid value '#{value}'. Valid values are HttpLevel, TcpLevel")
      end
    end
  end

  # Name:         rapidFailProtection
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_rapidfailprotection) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "rapidFailProtection - Indicates whether rapid-fail protection is enabled. If true, the application pool is shut down if there are a specified number of worker process crashes within a specified time period."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         rapidFailProtectionInterval
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_rapidfailprotectioninterval) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "rapidFailProtectionInterval - Indicates the time interval (in minutes) during which the specified number of worker process crashes must occur before the application pool is shut down by rapid-fail protection. The value must be a string representation of a TimeSpan value. The valid range (in minutes) is 1 to 144000."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         rapidFailProtectionMaxCrashes
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_rapidfailprotectionmaxcrashes) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "rapidFailProtectionMaxCrashes - Indicates the maximum number of worker process crashes permitted before the application pool is shut down by rapid-fail protection. The value must be a valid integer between 0 and 2147483647."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         autoShutdownExe
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autoshutdownexe) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "autoShutdownExe - Indicates an executable to run when the application pool is shut down by rapid-fail protection."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         autoShutdownParams
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autoshutdownparams) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "autoShutdownParams - Indicates parameters for the executable that is specified in the autoShutdownExe property."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         disallowOverlappingRotation
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disallowoverlappingrotation) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "disallowOverlappingRotation - Indicates whether the W3SVC service should start another worker process to replace the existing worker process while that process is shutting down. If true, the application pool recycle will happen such that the existing worker process exits before another worker process is created."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         disallowRotationOnConfigChange
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disallowrotationonconfigchange) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "disallowRotationOnConfigChange - Indicates whether the W3SVC service should rotate worker processes in the application pool when the configuration has changed. If true, the application pool will not recycle when its configuration is changed."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         logEventOnRecycle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logeventonrecycle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "logEventOnRecycle - Indicates that IIS should generate an event log entry for each occurrence of the specified recycling events."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         restartMemoryLimit
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartmemorylimit) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "restartMemoryLimit - Indicates the maximum amount of virtual memory (in KB) a worker process can consume before causing the application pool to recycle. The value must be a valid integer between 0 and 4294967295. A value of 0 means there is no limit."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         restartPrivateMemoryLimit
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartprivatememorylimit) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "restartPrivateMemoryLimit - Indicates the maximum amount of private memory (in KB) a worker process can consume before causing the application pool to recycle. The value must be a valid integer between 0 and 4294967295. A value of 0 means there is no limit."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         restartRequestsLimit
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartrequestslimit) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "restartRequestsLimit - Indicates the maximum number of requests the application pool can process before it is recycled. The value must be a valid integer between 0 and 4294967295. A value of 0 means the application pool can process an unlimited number of requests."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         restartTimeLimit
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restarttimelimit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "restartTimeLimit - Indicates the period of time (in minutes) after which the application pool will recycle. The value must be a string representation of a TimeSpan value. The valid range (in minutes) is 0 to 432000. A value of 0 means the application pool does not recycle on a regular interval."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         restartSchedule
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartschedule, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "restartSchedule - Indicates a set of specific local times, in 24 hour format, when the application pool is recycled. The value must be an array of string representations of TimeSpan values. TimeSpan values must be between 00:00:00 and 23:59:59 seconds inclusive, with a granularity of 60 seconds. Setting the value of this property to '' disables the schedule."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xwebapppool).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
