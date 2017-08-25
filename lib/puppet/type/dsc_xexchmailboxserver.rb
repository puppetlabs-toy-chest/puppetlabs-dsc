require 'pathname'

Puppet::Type.newtype(:dsc_xexchmailboxserver) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchMailboxServer resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchMailboxServer/MSFT_xExchMailboxServer.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  def dscmeta_resource_friendly_name; 'xExchMailboxServer' end
  def dscmeta_resource_name; 'MSFT_xExchMailboxServer' end
  def dscmeta_module_name; 'xExchange' end
  def dscmeta_module_version; '1.16.0.0' end

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

  # Name:         Identity
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identity) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Identity - The Identity parameter specifies the Mailbox server that you want to modify."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
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
    desc "Credential - Credentials used to establish a remote Powershell session to Exchange"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         AutoDatabaseMountDial
  # Type:         string
  # IsMandatory:  False
  # Values:       ["BestAvailability", "GoodAvailability", "Lossless"]
  newparam(:dsc_autodatabasemountdial) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AutoDatabaseMountDial - The AutoDatabaseMountDial parameter specifies the automatic database mount behavior for a continuous replication environment after a database failover. Valid values are BestAvailability, GoodAvailability, Lossless."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['BestAvailability', 'bestavailability', 'GoodAvailability', 'goodavailability', 'Lossless', 'lossless'].include?(value)
        fail("Invalid value '#{value}'. Valid values are BestAvailability, GoodAvailability, Lossless")
      end
    end
  end

  # Name:         CalendarRepairIntervalEndWindow
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_calendarrepairintervalendwindow) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "CalendarRepairIntervalEndWindow - The CalendarRepairIntervalEndWindow parameter specifies the number of days into the future to repair calendars. For example, if this parameter is set to 90, the Calendar Repair Assistant repairs calendars on this Mailbox server 90 days from now."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         CalendarRepairLogDirectorySizeLimit
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_calendarrepairlogdirectorysizelimit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CalendarRepairLogDirectorySizeLimit - The CalendarRepairLogDirectorySizeLimit parameter specifies the size limit for all log files for the Calendar Repair Assistant. After the limit is reached, the oldest files are deleted."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CalendarRepairLogEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_calendarrepairlogenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CalendarRepairLogEnabled - The CalendarRepairLogEnabled parameter specifies whether the Calendar Repair Attendant logs items that it repairs. The repair log doesn't contain failed repair attempts."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CalendarRepairLogFileAgeLimit
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_calendarrepairlogfileagelimit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CalendarRepairLogFileAgeLimit - The CalendarRepairLogFileAgeLimit parameter specifies how long to retain calendar repair logs. Log files that exceed the maximum retention period are deleted."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CalendarRepairLogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_calendarrepairlogpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CalendarRepairLogPath - The CalendarRepairLogPath parameter specifies the location of the calendar repair log files on the Mailbox server."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CalendarRepairLogSubjectLoggingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_calendarrepairlogsubjectloggingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CalendarRepairLogSubjectLoggingEnabled - The CalendarRepairLogSubjectLoggingEnabled parameter specifies that the subject of the repaired calendar item is logged in the calendar repair log."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CalendarRepairMissingItemFixDisabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_calendarrepairmissingitemfixdisabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CalendarRepairMissingItemFixDisabled - The CalendarRepairMissingItemFixDisabled parameter specifies that the Calendar Repair Assistant won't fix missing attendee calendar items for mailboxes homed on this Mailbox server."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CalendarRepairMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["ValidateOnly", "RepairAndValidate"]
  newparam(:dsc_calendarrepairmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CalendarRepairMode - The CalendarRepairMode parameter specifies the mode that the Calendar Repair Assistant will run in. Valid values are ValidateOnly, RepairAndValidate."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['ValidateOnly', 'validateonly', 'RepairAndValidate', 'repairandvalidate'].include?(value)
        fail("Invalid value '#{value}'. Valid values are ValidateOnly, RepairAndValidate")
      end
    end
  end

  # Name:         CalendarRepairWorkCycle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_calendarrepairworkcycle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CalendarRepairWorkCycle - The CalendarRepairWorkCycle parameter specifies the time span in which all mailboxes on the specified server will be scanned by the Calendar Repair Assistant. Calendars that have inconsistencies will be flagged and repaired according to the interval specified by the CalendarRepairWorkCycleCheckpoint parameter."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CalendarRepairWorkCycleCheckpoint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_calendarrepairworkcyclecheckpoint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CalendarRepairWorkCycleCheckpoint - The CalendarRepairWorkCycleCheckpoint parameter specifies the time span at which all mailboxes will be identified as needing work completed on them."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
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

  # Name:         DatabaseCopyActivationDisabledAndMoveNow
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasecopyactivationdisabledandmovenow) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DatabaseCopyActivationDisabledAndMoveNow - The DatabaseCopyActivationDisabledAndMoveNow parameter specifies whether to prevent databases from being mounted on this Mailbox server if there are other healthy copies of the databases on other Mailbox servers. It will also immediately move any mounted databases on the server to other servers if copies exist and are healthy."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DatabaseCopyAutoActivationPolicy
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Blocked", "IntrasiteOnly", "Unrestricted"]
  newparam(:dsc_databasecopyautoactivationpolicy) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseCopyAutoActivationPolicy - The DatabaseCopyAutoActivationPolicy parameter specifies the type of automatic activation available for mailbox database copies on the specified Mailbox server. Valid values are Blocked, IntrasiteOnly, and Unrestricted. Valid values are Blocked, IntrasiteOnly, Unrestricted."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Blocked', 'blocked', 'IntrasiteOnly', 'intrasiteonly', 'Unrestricted', 'unrestricted'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Blocked, IntrasiteOnly, Unrestricted")
      end
    end
  end

  # Name:         FolderLogForManagedFoldersEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_folderlogformanagedfoldersenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "FolderLogForManagedFoldersEnabled - The FolderLogForManagedFoldersEnabled parameter specifies whether the folder log for managed folders is enabled for messages that were moved to managed folders."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ForceGroupMetricsGeneration
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_forcegroupmetricsgeneration) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ForceGroupMetricsGeneration - The ForceGroupMetricsGeneration parameter specifies that group metrics information must be generated on the Mailbox server regardless of whether that server generates an offline address book (OAB). By default, group metrics are generated only on servers that generate OABs. Group metrics information is used by MailTips to inform senders about how many recipients their messages will be sent to. You need to use this parameter if your organization doesn't generate OABs and you want the group metrics data to be available."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsExcludedFromProvisioning
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isexcludedfromprovisioning) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsExcludedFromProvisioning - The IsExcludedFromProvisioning parameter specifies that the Mailbox server isn't considered by the OAB provisioning load balancer. If the IsExcludedFromProvisioning parameter is set to $true, the server won't be used for provisioning a new OAB or for moving existing OABs."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         JournalingLogForManagedFoldersEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_journalinglogformanagedfoldersenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "JournalingLogForManagedFoldersEnabled - The JournalingLogForManagedFoldersEnabled parameter specifies whether the log for managed folders is enabled for journaling. The two possible values for this parameter are $true or $false. If you specify $true, information about messages that were journaled is logged. The logs are located at the location you specify with the LogPathForManagedFolders parameter."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Locale
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_locale, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Locale - The Locale parameter specifies the locale. A locale is a collection of language-related user preferences such as writing system, calendar, and date format."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         LogDirectorySizeLimitForManagedFolders
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logdirectorysizelimitformanagedfolders) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogDirectorySizeLimitForManagedFolders - The LogDirectorySizeLimitForManagedFolders parameter specifies the size limit for all managed folder log files from a single message database. After the limit is reached for a set of managed folder log files from a message database, the oldest files are deleted to make space for new files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogFileAgeLimitForManagedFolders
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logfileagelimitformanagedfolders) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogFileAgeLimitForManagedFolders - The LogFileAgeLimitForManagedFolders parameter specifies how long to retain managed folder logs. Log files that exceed the maximum retention period are deleted."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogFileSizeLimitForManagedFolders
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logfilesizelimitformanagedfolders) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogFileSizeLimitForManagedFolders - The LogFileSizeLimitForManagedFolders parameter specifies the maximum size for each managed folder log file. When the log file size limit is reached, a new log file is created."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogPathForManagedFolders
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logpathformanagedfolders) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogPathForManagedFolders - The LogPathForManagedFolders parameter specifies the path to the directory that stores the managed folder log files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MailboxProcessorWorkCycle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mailboxprocessorworkcycle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MailboxProcessorWorkCycle - The MailboxProcessorWorkCycle parameter specifies how often to scan for locked mailboxes."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ManagedFolderAssistantSchedule
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_managedfolderassistantschedule, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ManagedFolderAssistantSchedule - The ManagedFolderAssistantSchedule parameter specifies the intervals each week during which the Managed Folder Assistant applies messaging records management (MRM) settings to managed folders. The format is StartDay.Time-EndDay."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ManagedFolderWorkCycle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_managedfolderworkcycle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ManagedFolderWorkCycle - The ManagedFolderWorkCycle parameter specifies the time span in which all mailboxes on the specified server will be processed by the Managed Folder Assistant. The Managed Folder Assistant applies retention policies according to the ManagedFolderWorkCycleCheckpoint interval."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ManagedFolderWorkCycleCheckpoint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_managedfolderworkcyclecheckpoint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ManagedFolderWorkCycleCheckpoint - The ManagedFolderWorkCycleCheckpoint parameter specifies the time span at which to refresh the list of mailboxes so that new mailboxes that have been created or moved will be part of the work queue. Also, as mailboxes are prioritized, existing mailboxes that haven't been successfully processed for a long time will be placed higher in the queue and will have a greater chance of being processed again in the same work cycle."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MAPIEncryptionRequired
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mapiencryptionrequired) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MAPIEncryptionRequired - The MAPIEncryptionRequired parameter specifies whether Exchange blocks MAPI clients that don't use encrypted remote procedure calls (RPCs)."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         MaximumActiveDatabases
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumactivedatabases) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MaximumActiveDatabases - The MaximumActiveDatabases parameter specifies the number of databases that can be mounted on this Mailbox server. This parameter accepts numeric values."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaximumPreferredActiveDatabases
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumpreferredactivedatabases) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MaximumPreferredActiveDatabases - The MaximumPreferredActiveDatabases parameter specifies a preferred maximum number of databases that a server should have. This value is different from the actual maximum, which is configured using the MaximumActiveDatabases parameter. The value of MaximumPreferredActiveDatabases is only honored during best copy and server selection, database and server switchovers, and when rebalancing the DAG."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         OABGeneratorWorkCycle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_oabgeneratorworkcycle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "OABGeneratorWorkCycle - The OABGeneratorWorkCycle parameter specifies the time span in which the OAB generation on the specified server will be processed."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         OABGeneratorWorkCycleCheckpoint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_oabgeneratorworkcyclecheckpoint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "OABGeneratorWorkCycleCheckpoint - The OABGeneratorWorkCycleCheckpoint parameter specifies the time span at which to run OAB generation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PublicFolderWorkCycle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_publicfolderworkcycle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PublicFolderWorkCycle - The PublicFolderWorkCycle parameter is used by the public folder assistant to determine how often the mailboxes in a database are processed by the assistant."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PublicFolderWorkCycleCheckpoint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_publicfolderworkcyclecheckpoint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PublicFolderWorkCycleCheckpoint - The PublicFolderWorkCycleCheckpoint determines how often the mailbox list for a database is evaluated. The processing speed is also calculated."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RetentionLogForManagedFoldersEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_retentionlogformanagedfoldersenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RetentionLogForManagedFoldersEnabled - The RetentionLogForManagedFoldersEnabled parameter specifies whether the Managed Folder Assistant logs information about messages that have reached their retention limits."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SharingPolicySchedule
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sharingpolicyschedule, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "SharingPolicySchedule - The SharingPolicySchedule parameter specifies the intervals each week during which the sharing policy runs. The Sharing Policy Assistant checks permissions on shared calendar items and contact folders in users' mailboxes against the assigned sharing policy. The assistant lowers or removes permissions according to the policy. The format is StartDay.Time-EndDay.Time."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         SharingPolicyWorkCycle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sharingpolicyworkcycle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SharingPolicyWorkCycle - The SharingPolicyWorkCycle parameter specifies the time span in which all mailboxes on the specified server will be scanned by the Sharing Policy Assistant. The Sharing Policy Assistant scans all mailboxes and enables or disables sharing polices according to the interval specified by the SharingPolicyWorkCycle."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SharingPolicyWorkCycleCheckpoint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sharingpolicyworkcyclecheckpoint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SharingPolicyWorkCycleCheckpoint - The SharingPolicyWorkCycleCheckpoint parameter specifies the time span at which to refresh the list of mailboxes so that new mailboxes that have been created or moved will be part of the work queue. Also, as mailboxes are prioritized, existing mailboxes that haven't been successfully processed for a long time will be placed higher in the queue and will have a greater chance of being processed again in the same work cycle."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SharingSyncWorkCycle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sharingsyncworkcycle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SharingSyncWorkCycle - The SharingSyncWorkCycle parameter specifies the time span in which all mailboxes on the specified server will be synced to the cloud-based service by the Sharing Sync Assistant. Mailboxes that require syncing will be synced according to the interval specified by the SharingSyncWorkCycleCheckpoint parameter."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SharingSyncWorkCycleCheckpoint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sharingsyncworkcyclecheckpoint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SharingSyncWorkCycleCheckpoint - The SharingSyncWorkCycleCheckpoint parameter specifies the time span at which to refresh the list of mailboxes so that new mailboxes that have been created or moved will be part of the work queue. Also, as mailboxes are prioritized, existing mailboxes that haven't been successfully processed for a long time will be placed higher in the queue and will have a greater chance of being processed again in the same work cycle."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SiteMailboxWorkCycle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sitemailboxworkcycle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SiteMailboxWorkCycle - The SiteMailboxWorkCycle parameter specifies the time span in which the site mailbox information on the specified server will be processed."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SiteMailboxWorkCycleCheckpoint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sitemailboxworkcyclecheckpoint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SiteMailboxWorkCycleCheckpoint - The SiteMailboxWorkCycleCheckpoint parameter specifies the time span at which to refresh the site mailbox workcycle."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SubjectLogForManagedFoldersEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_subjectlogformanagedfoldersenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SubjectLogForManagedFoldersEnabled - The SubjectLogForManagedFoldersEnabled parameter specifies whether the subject of messages is displayed in managed folder logs."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         TopNWorkCycle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_topnworkcycle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TopNWorkCycle - The TopNWorkCycle parameter specifies the time span in which all mailboxes that have Unified Messaging on the specified server will be scanned by the TopN Words Assistant. The TopN Words Assistant scans voice mail for the most frequently used words to aid in transcription."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TopNWorkCycleCheckpoint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_topnworkcyclecheckpoint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TopNWorkCycleCheckpoint - The TopNWorkCycleCheckpoint parameter specifies the time span at which to refresh the list of mailboxes so that new mailboxes that have been created or moved will be part of the work queue. Also, as mailboxes are prioritized, existing mailboxes that haven't been successfully processed for a long time will be placed higher in the queue and will have a greater chance of being processed again in the same work cycle."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UMReportingWorkCycle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_umreportingworkcycle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UMReportingWorkCycle - The UMReportingWorkCycle parameter specifies the time span in which the arbitration mailbox named SystemMailbox{e0dc1c29-89c3-4034-b678-e6c29d823ed9} on the specified server will be scanned by the Unified Messaging Reporting Assistant. The Unified Messaging Reporting Assistant updates the Call Statistics reports by reading Unified Messaging call data records for an organization on a regular basis."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UMReportingWorkCycleCheckpoint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_umreportingworkcyclecheckpoint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UMReportingWorkCycleCheckpoint - The UMReportingWorkCycleCheckpoint parameter specifies the time span at which the arbitration mailbox named SystemMailbox{e0dc1c29-89c3-4034-b678-e6c29d823ed9} will be marked by processing."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WacDiscoveryEndpoint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_wacdiscoveryendpoint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WacDiscoveryEndpoint - The WacDiscoveryEndpoint parameter specifies the Office Online Server endpoint to use. Exchange 2016 only."
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

Puppet::Type.type(:dsc_xexchmailboxserver).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
