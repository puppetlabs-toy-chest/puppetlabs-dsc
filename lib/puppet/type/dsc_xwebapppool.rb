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
  def dscmeta_module_version; '1.9.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Name of the Web Application Pool"
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
    desc "Ensure - Web Application Pool Present/Absent Valid values are Present, Absent."
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
    desc "State - Should the app pool be started or stopped Valid values are Started, Stopped."
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
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_autostart) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "autoStart - When true, indicates to the World Wide Web Publishing Service (W3SVC) that the application pool should be automatically started when it is created or when IIS is started. Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
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
    desc "managedRuntimeVersion - Which version of .Net Valid values are v4.0, v2.0, ."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['v4.0', 'v4.0', 'v2.0', 'v2.0', '', ''].include?(value)
        fail("Invalid value '#{value}'. Valid values are v4.0, v2.0, ")
      end
    end
  end

  # Name:         managedPipelineMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Integrated", "Classic"]
  newparam(:dsc_managedpipelinemode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "managedPipelineMode - Specifies the request-processing mode that is used to process requests for managed content. Valid values are Integrated, Classic."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Integrated', 'integrated', 'Classic', 'classic'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Integrated, Classic")
      end
    end
  end

  # Name:         startMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["AlwaysRunning", "OnDemand"]
  newparam(:dsc_startmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "startMode - App pool always running or on demand Valid values are AlwaysRunning, OnDemand."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['AlwaysRunning', 'alwaysrunning', 'OnDemand', 'ondemand'].include?(value)
        fail("Invalid value '#{value}'. Valid values are AlwaysRunning, OnDemand")
      end
    end
  end

  # Name:         identityType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["ApplicationPoolIdentity", "LocalSystem", "LocalService", "NetworkService", "SpecificUser"]
  newparam(:dsc_identitytype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "identityType - Who should the app pool run as Valid values are ApplicationPoolIdentity, LocalSystem, LocalService, NetworkService, SpecificUser."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['ApplicationPoolIdentity', 'applicationpoolidentity', 'LocalSystem', 'localsystem', 'LocalService', 'localservice', 'NetworkService', 'networkservice', 'SpecificUser', 'specificuser'].include?(value)
        fail("Invalid value '#{value}'. Valid values are ApplicationPoolIdentity, LocalSystem, LocalService, NetworkService, SpecificUser")
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
    desc "Credential - Credential of that user"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         loadUserProfile
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_loaduserprofile) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "loadUserProfile - Load the users profile Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
      end
    end
  end

  # Name:         queueLength
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_queuelength) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "queueLength - Indicates to HTTP.sys how many requests to queue for an application pool before rejecting future requests."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         enable32BitAppOnWin64
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_enable32bitapponwin64) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "enable32BitAppOnWin64 - When true, enables a 32-bit application to run on a computer that runs a 64-bit version of Windows. Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
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
    desc "managedRuntimeLoader - Specifies the managed loader to use for pre-loading the application pool."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         enableConfigurationOverride
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_enableconfigurationoverride) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "enableConfigurationOverride - When true, indicates that delegated settings in Web.config files will processed for applications within this application pool. When false, all settings in Web.config files will be ignored for this application pool. Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
      end
    end
  end

  # Name:         CLRConfigFile
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_clrconfigfile) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CLRConfigFile - Specifies the .NET configuration file for the application pool."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         passAnonymousToken
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_passanonymoustoken) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "passAnonymousToken - If true, the Windows Process Activation Service (WAS) creates and passes a token for the built-in IUSR anonymous user account to the Anonymous authentication module. The Anonymous authentication module uses the token to impersonate the built-in account. When PassAnonymousToken is false, the token will not be passed. Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
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
    desc "logonType - Specifies the logon type for the process identity. Valid values are LogonBatch, LogonService."
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
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_manualgroupmembership) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "manualGroupMembership - Specifies whether the IIS_IUSRS group Security Identifier (SID) is added to the worker process token. When false, IIS automatically uses an application pool identity as though it were a member of the built-in IIS_IUSRS group, which has access to necessary file and system resources. When true, an application pool identity must be explicitly added to all resources that a worker process requires at runtime. Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
      end
    end
  end

  # Name:         idleTimeout
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_idletimeout) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "idleTimeout - The period of time a worker process should run if no new requests are received and the worker process is not processing requests."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         maxProcesses
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxprocesses) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "maxProcesses - The number of worker processes associated with the application pool."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         shutdownTimeLimit
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_shutdowntimelimit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "shutdownTimeLimit - The period of time that IIS waits for requests to finish running in a worker process before IIS terminates the worker process."
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
    desc "startupTimeLimit - The period of time that IIS waits for an application pool to start."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         pingingEnabled
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_pingingenabled) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "pingingEnabled - Pinging behavior for the worker process health monitoring. Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
      end
    end
  end

  # Name:         pingInterval
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pinginterval) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "pingInterval - The time interval between health-monitoring pings that the World Wide Web Publishing Service (WWW service) sends to a worker process."
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
    desc "pingResponseTime - The period of time that a worker process is given to respond to a health-monitoring ping."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         disallowOverlappingRotation
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_disallowoverlappingrotation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "disallowOverlappingRotation - Specifies whether or not the World Wide Web Publishing Service (WWW Service) should start up another worker process to replace the existing worker process while it is shutting down. Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
      end
    end
  end

  # Name:         disallowRotationOnConfigChange
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_disallowrotationonconfigchange) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "disallowRotationOnConfigChange - Specifies whether the WWW Service should rotate worker processes in an application pool when the configuration has changed. Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
      end
    end
  end

  # Name:         logEventOnRecycle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logeventonrecycle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "logEventOnRecycle - Specifies that IIS should log an event when an application pool is recycled. The logEventOnRecycle property must have a bit set corresponding to the reason for the recycle if IIS is to log the event."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         restartMemoryLimit
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartmemorylimit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "restartMemoryLimit - Restart app pool when memory exceeds this limit"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         restartPrivateMemoryLimit
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartprivatememorylimit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "restartPrivateMemoryLimit - Restart app pool when private memory exceeds this limit"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         restartRequestsLimit
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartrequestslimit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "restartRequestsLimit - Specifies that the worker process should be recycled after it processes a specific number of requests."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         restartTimeLimit
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restarttimelimit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "restartTimeLimit - Specifies that the worker process should be recycled after a specified amount of time has elapsed."
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
    desc "restartSchedule - Restart the app pool at these times"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         loadBalancerCapabilities
  # Type:         string
  # IsMandatory:  False
  # Values:       ["HttpLevel", "TcpLevel"]
  newparam(:dsc_loadbalancercapabilities) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "loadBalancerCapabilities - The response behavior of a service when it is unavailable. Valid values are HttpLevel, TcpLevel."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['HttpLevel', 'httplevel', 'TcpLevel', 'tcplevel'].include?(value)
        fail("Invalid value '#{value}'. Valid values are HttpLevel, TcpLevel")
      end
    end
  end

  # Name:         orphanWorkerProcess
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_orphanworkerprocess) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "orphanWorkerProcess - Value indicating whether to put a worker process in an orphan state when an application pool fails. Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
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
    desc "orphanActionExe - The path of an executable to run when the service orphans a worker process."
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
    desc "orphanActionParams - Command-line parameters for the executable named by the OrphanActionExe property."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         rapidFailProtection
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_rapidfailprotection) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "rapidFailProtection - Value indicating whether rapid-fail protection is on or off. Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
      end
    end
  end

  # Name:         rapidFailProtectionInterval
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_rapidfailprotectioninterval) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "rapidFailProtectionInterval - The interval of time before the failure count for a process is reset."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         rapidFailProtectionMaxCrashes
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_rapidfailprotectionmaxcrashes) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "rapidFailProtectionMaxCrashes - The maximum number of failures allowed within the time specified by the RapidFailProtectionInterval property."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         autoShutdownExe
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autoshutdownexe) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "autoShutdownExe - The path of an executable to run when the service shuts down an application pool for rapid-fail protection."
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
    desc "autoShutdownParams - Command-line parameters for the executable that is specified by the AutoShutdownExe property."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         cpuLimit
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cpulimit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "cpuLimit - Configures the maximum percentage of CPU time (in 1/1000ths of one percent) that the worker processes in an application pool are allowed to consume over a period of time as indicated by the resetInterval attribute."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         cpuAction
  # Type:         string
  # IsMandatory:  False
  # Values:       ["NoAction", "KillW3wp", "Throttle", "ThrottleUnderLoad"]
  newparam(:dsc_cpuaction) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "cpuAction - Configures the action that IIS takes when a worker process exceeds its configured CPU limit.  Valid values are NoAction, KillW3wp, Throttle, ThrottleUnderLoad."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['NoAction', 'noaction', 'KillW3wp', 'killw3wp', 'Throttle', 'throttle', 'ThrottleUnderLoad', 'throttleunderload'].include?(value)
        fail("Invalid value '#{value}'. Valid values are NoAction, KillW3wp, Throttle, ThrottleUnderLoad")
      end
    end
  end

  # Name:         cpuResetInterval
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cpuresetinterval) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "cpuResetInterval - Specifies the reset period (in minutes) for CPU monitoring and throttling limits on an application pool."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         cpuSmpAffinitized
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_cpusmpaffinitized) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "cpuSmpAffinitized - Specifies whether a particular worker process assigned to an application pool should also be assigned to a given CPU. Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
      end
    end
  end

  # Name:         cpuSmpProcessorAffinityMask
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cpusmpprocessoraffinitymask) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "cpuSmpProcessorAffinityMask - Specifies the hexadecimal processor mask for multi-processor computers, which indicates to which CPU the worker processes in an application pool should be bound. Before this property takes effect, the smpAffinitized attribute must be set to true for the application pool."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         cpuSmpProcessorAffinityMask2
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cpusmpprocessoraffinitymask2) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "cpuSmpProcessorAffinityMask2 - Specifies the high-order DWORD hexadecimal processor mask for 64-bit multi-processor computers, which indicates to which CPU the worker processes in an application pool should be bound. Before this property takes effect, the smpAffinitized attribute must be set to true for the application pool."
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

Puppet::Type.type(:dsc_xwebapppool).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
