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

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xExchMailboxDatabase')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xExchMailboxDatabase'
    end

    defaultto 'xExchMailboxDatabase'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xExchMailboxDatabase')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xExchMailboxDatabase'
    end

    defaultto 'MSFT_xExchMailboxDatabase'
  end

  newparam(:dscmeta_import_resource) do
    desc "Please ignore this parameter.
      Defaults to `true`."
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xExchange')."

    validate do |value|
      fail 'dscmeta_module_name is read-only' if value != 'xExchange'
    end

    defaultto 'xExchange'
  end

  newparam(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.4.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    validate do |value|
      fail 'dscmeta_module_version is read-only' if value != '1.4.0.0'
    end

    defaultto '1.4.0.0'
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name"
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
    desc "Credential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         DatabaseCopyCount
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasecopycount) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DatabaseCopyCount"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Server
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_server) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Server"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EdbFilePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_edbfilepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EdbFilePath"
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
    desc "LogFolderPath"
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
    desc "AdServerSettingsPreferredServer"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SkipInitialDatabaseMount
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_skipinitialdatabasemount) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SkipInitialDatabaseMount"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowServiceRestart
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowservicerestart) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowServiceRestart"
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
    desc "AutoDagExcludeFromMonitoring"
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
    desc "BackgroundDatabaseMaintenance"
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
    desc "CalendarLoggingQuota"
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
    desc "CircularLoggingEnabled"
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
    desc "DataMoveReplicationConstraint - Valid values are None, SecondCopy, SecondDatacenter, AllDatacenters, AllCopies."
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
    desc "DeletedItemRetention"
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
    desc "DomainController"
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
    desc "EventHistoryRetentionPeriod"
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
    desc "IndexEnabled"
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
    desc "IsExcludedFromProvisioning"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IssueWarningQuota
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_issuewarningquota) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IssueWarningQuota"
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
    desc "IsSuspendedFromProvisioning"
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
    desc "JournalRecipient"
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
    desc "MailboxRetention"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MountAtStartup
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mountatstartup) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MountAtStartup"
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
    desc "OfflineAddressBook"
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
    desc "ProhibitSendQuota"
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
    desc "ProhibitSendReceiveQuota"
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
    desc "RecoverableItemsQuota"
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
    desc "RecoverableItemsWarningQuota"
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
    desc "RetainDeletedItemsUntilBackup"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


end

Puppet::Type.type(:dsc_xexchmailboxdatabase).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
