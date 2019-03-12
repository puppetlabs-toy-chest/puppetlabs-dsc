require 'pathname'

Puppet::Type.newtype(:dsc_xexchmailboxdatabase) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchMailboxDatabase resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchMailboxDatabase/MSFT_xExchMailboxDatabase.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xExchMailboxDatabase' end
  def dscmeta_resource_name; 'MSFT_xExchMailboxDatabase' end
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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The Name parameter specifies the unique name of the mailbox database."
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

  # Name:         DatabaseCopyCount
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasecopycount) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DatabaseCopyCount - The number of copies that the database will have once fully configured"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EdbFilePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_edbfilepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EdbFilePath - The EdbFilePath parameter specifies the path to the database files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogFolderPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logfolderpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogFolderPath - The LogFolderPath parameter specifies the folder location for log files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Server
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_server) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Server - The Server parameter specifies the server on which you want to create the database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AdServerSettingsPreferredServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adserversettingspreferredserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AdServerSettingsPreferredServer - An optional domain controller to pass to Set-AdServerSettings -PreferredServer"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AllowServiceRestart
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowservicerestart) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowServiceRestart - Whether it is okay to restart the Information Store Service after adding a database. Defaults to $false."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowFileRestore
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowfilerestore) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowFileRestore - The AllowFileRestore parameter specifies whether to allow a database to be restored from a backup."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AutoDagExcludeFromMonitoring
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagexcludefrommonitoring) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AutoDagExcludeFromMonitoring - The AutoDagExcludedFromMonitoringparameter specifies whether to exclude the mailbox database from the ServerOneCopyMonitor, which alerts an administrator when a replicated database has only one healthy copy available."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         BackgroundDatabaseMaintenance
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_backgrounddatabasemaintenance) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "BackgroundDatabaseMaintenance - The BackgroundDatabaseMaintenance parameter specifies whether the Extensible Storage Engine (ESE) performs database maintenance."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CalendarLoggingQuota
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_calendarloggingquota) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CalendarLoggingQuota - The CalendarLoggingQuota parameter specifies the maximum size of the log in the Recoverable Items folder of the mailbox that stores changes to calendar items."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CircularLoggingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_circularloggingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CircularLoggingEnabled - The CircularLoggingEnabled parameter specifies whether circular logging is enabled for the database."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DataMoveReplicationConstraint
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "SecondCopy", "SecondDatacenter", "AllDatacenters", "AllCopies"]
  newparam(:dsc_datamovereplicationconstraint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DataMoveReplicationConstraint - The DataMoveReplicationConstraint parameter specifies the throttling behavior for high availability mailbox moves. Valid values are None, SecondCopy, SecondDatacenter, AllDatacenters, AllCopies."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'SecondCopy', 'secondcopy', 'SecondDatacenter', 'seconddatacenter', 'AllDatacenters', 'alldatacenters', 'AllCopies', 'allcopies'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, SecondCopy, SecondDatacenter, AllDatacenters, AllCopies")
      end
    end
  end

  # Name:         DeletedItemRetention
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_deleteditemretention) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DeletedItemRetention - The DeletedItemRetention parameter specifies the length of time to keep deleted items in the Recoverable Items\\Deletions folder in mailboxes."
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
    desc "DomainController - The DomainController parameter specifies the domain controller that's used by this cmdlet to read data from or write data to Active Directory. You identify the domain controller by its fully qualified domain name (FQDN). For example, dc01.contoso.com."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EventHistoryRetentionPeriod
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_eventhistoryretentionperiod) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EventHistoryRetentionPeriod - The EventHistoryRetentionPeriod parameter specifies the length of time to keep event data."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IndexEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_indexenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IndexEnabled - The IndexEnabled parameter specifies whether Exchange Search indexes the mailbox database."
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
    desc "IsExcludedFromProvisioning - The IsExcludedFromProvisioning parameter specifies whether to exclude the database from the mailbox provisioning load balancer that distributes new mailboxes randomly and evenly across the available databases."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsExcludedFromProvisioningByOperator
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isexcludedfromprovisioningbyoperator) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsExcludedFromProvisioningByOperator - The IIsExcludedFromProvisioningByOperator parameter specifies whether to exclude the database from the mailbox provisioning load balancer that distributes new mailboxes randomly and evenly across the available databases."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsExcludedFromProvisioningDueToLogicalCorruption
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isexcludedfromprovisioningduetologicalcorruption) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsExcludedFromProvisioningDueToLogicalCorruption - The IsExcludedFromProvisioningDueToLogicalCorruption parameter specifies whether to exclude the database from the mailbox provisioning load balancer that distributes new mailboxes randomly and evenly across the available databases."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsExcludedFromProvisioningReason
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isexcludedfromprovisioningreason) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IsExcludedFromProvisioningReason - The IsExcludedFromProvisioningReason parameter specifies the reason why you excluded the mailbox database from the mailbox provisioning load balancer."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IssueWarningQuota
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_issuewarningquota) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IssueWarningQuota - The IssueWarningQuota parameter specifies the warning threshold for the size of the mailbox."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IsSuspendedFromProvisioning
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_issuspendedfromprovisioning) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsSuspendedFromProvisioning - The IsSuspendedFromProvisioning parameter specifies whether to exclude the database from the mailbox provisioning load balancer that distributes new mailboxes randomly and evenly across the available databases."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         JournalRecipient
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_journalrecipient) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "JournalRecipient - The JournalRecipient parameter specifies the journal recipient to use for per-database journaling for all mailboxes on the database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MailboxRetention
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mailboxretention) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MailboxRetention - The MailboxRetention parameter specifies the length of time to keep deleted mailboxes before they are permanently deleted or purged."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MetaCacheDatabaseMaxCapacityInBytes
  # Type:         sint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_metacachedatabasemaxcapacityinbytes) do
    def mof_type; 'sint64' end
    def mof_is_embedded?; false end
    desc "MetaCacheDatabaseMaxCapacityInBytes - The MetaCacheDatabaseMaxCapacityInBytes parameter specifies the size of the metacache database in bytes. To convert gigabytes to bytes, multiply the value by 1024^3. For terabytes to bytes, multiply by 1024^4."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MountAtStartup
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mountatstartup) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MountAtStartup - The MountAtStartup parameter specifies whether to mount the mailbox database when the Microsoft Exchange Information Store service starts."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         OfflineAddressBook
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_offlineaddressbook) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "OfflineAddressBook - The OfflineAddressBook parameter specifies the offline address book that's associated with the mailbox database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProhibitSendQuota
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_prohibitsendquota) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProhibitSendQuota - The ProhibitSendQuota parameter specifies a size limit for the mailbox. If the mailbox reaches or exceeds this size, the mailbox can't send new messages, and the user receives a descriptive warning message."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProhibitSendReceiveQuota
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_prohibitsendreceivequota) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProhibitSendReceiveQuota - The ProhibitSendReceiveQuota parameter specifies a size limit for the mailbox. If the mailbox reaches or exceeds this size, the mailbox can't send or receive new messages. Messages sent to the mailbox are returned to the sender with a descriptive error message. This value effectively determines the maximum size of the mailbox."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RecoverableItemsQuota
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recoverableitemsquota) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RecoverableItemsQuota - The RecoverableItemsQuota parameter specifies the maximum size for the Recoverable Items folder of the mailbox."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RecoverableItemsWarningQuota
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recoverableitemswarningquota) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RecoverableItemsWarningQuota - The RecoverableItemsWarningQuota parameter specifies the warning threshold for the size of the Recoverable Items folder for the mailbox."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RetainDeletedItemsUntilBackup
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_retaindeleteditemsuntilbackup) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RetainDeletedItemsUntilBackup - The RetainDeletedItemsUntilBackup parameter specifies whether to keep items in the Recoverable Items\\Deletions folder of the mailbox until the next database backup occurs."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SkipInitialDatabaseMount
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_skipinitialdatabasemount) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SkipInitialDatabaseMount - Whether the initial mount of databases should be skipped after database creation"
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

Puppet::Type.type(:dsc_xexchmailboxdatabase).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
