require 'pathname'

Puppet::Type.newtype(:dsc_spexcelserviceapp) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

    class PuppetX::Dsc::TypeHelpers
      def self.validate_MSFT_SPExcelFileLocation(mof_type_map, name, value)
        required = ['locationtype']
        allowed = ['address','abortonrefreshonopenfail','automaticvolatilefunctioncachelifetime','chartandimagesizemax','concurrentdatarequestspersessionmax','defaultworkbookcalcmode','description','displaygranularextdataerrors','externaldataallowed','includechildren','manualextdatacachelifetime','newworkbooksessiontimeout','periodicextdatacachelifetime','requestdurationmax','restexternaldataallowed','sessiontimeout','shortsessiontimeout','udfsallowed','warnondatarefresh','workbooksizemax']
        lowkey_hash = Hash[value.map { |k, v| [k.to_s.downcase, v] }]

        missing = required - lowkey_hash.keys
        unless missing.empty?
          fail "#{name} is missing the following required keys: #{missing.join(',')}"
        end

        extraneous = lowkey_hash.keys - required - allowed
        unless extraneous.empty?
          fail "#{name} includes invalid keys: #{extraneous.join(',')}"
        end

        lowkey_hash.keys.each do |key|
          if lowkey_hash[key]
            validate_mof_type(mof_type_map[key], 'MSFT_SPExcelFileLocation', key, lowkey_hash[key])
          end
        end
      end
    end

  @doc = %q{
    The DSC SPExcelServiceApp resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPExcelServiceApp/MSFT_SPExcelServiceApp.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPExcelServiceApp' end
  def dscmeta_resource_name; 'MSFT_SPExcelServiceApp' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.4.0.0' end

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
    desc "Name - The name of the service application"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ApplicationPool
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_applicationpool) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ApplicationPool - The name of the application pool to run the service app in"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TrustedFileLocations
  # Type:         MSFT_SPExcelFileLocation[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_trustedfilelocations, :array_matching => :all) do
    def mof_type; 'MSFT_SPExcelFileLocation[]' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"address"=>{:type=>"string"}, "locationtype"=>{:type=>"string", :values=>["SharePoint", "UNC", "HTTP"]}, "abortonrefreshonopenfail"=>{:type=>"boolean"}, "automaticvolatilefunctioncachelifetime"=>{:type=>"uint32"}, "chartandimagesizemax"=>{:type=>"uint32"}, "concurrentdatarequestspersessionmax"=>{:type=>"uint32"}, "defaultworkbookcalcmode"=>{:type=>"string", :values=>["File", "Manual", "Auto", "AutoDataTables"]}, "description"=>{:type=>"string"}, "displaygranularextdataerrors"=>{:type=>"boolean"}, "externaldataallowed"=>{:type=>"string", :values=>["None", "Dcl", "DclandEmbedded"]}, "includechildren"=>{:type=>"boolean"}, "manualextdatacachelifetime"=>{:type=>"uint32"}, "newworkbooksessiontimeout"=>{:type=>"uint32"}, "periodicextdatacachelifetime"=>{:type=>"uint32"}, "requestdurationmax"=>{:type=>"uint32"}, "restexternaldataallowed"=>{:type=>"boolean"}, "sessiontimeout"=>{:type=>"uint32"}, "shortsessiontimeout"=>{:type=>"uint32"}, "udfsallowed"=>{:type=>"boolean"}, "warnondatarefresh"=>{:type=>"boolean"}, "workbooksizemax"=>{:type=>"uint32"}}
    end
    desc "TrustedFileLocations - Trusted file locations for the service app"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be an array of hashes or a hash")
      end
      (value.kind_of?(Hash) ? [value] : value).each_with_index do |v, i|
        fail "TrustedFileLocations value at index #{i} should be a Hash" unless v.is_a? Hash

        PuppetX::Dsc::TypeHelpers.validate_MSFT_SPExcelFileLocation(mof_type_map, "TrustedFileLocations", v)
      end
    end
    munge do |value|
      value.kind_of?(Hash) ?
        [PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)] :
        value.map { |v| PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, v) }
    end
  end

  # Name:         CachingOfUnusedFilesEnable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cachingofunusedfilesenable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CachingOfUnusedFilesEnable - Specifies that files that are no longer used by Excel Services Application can remain in the cache for later use."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CrossDomainAccessAllowed
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_crossdomainaccessallowed) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CrossDomainAccessAllowed - Specifies that trusted workbooks and data connection files can be requested and rendered by Web Parts or pages that reside in other HTTP domains."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EncryptedUserConnectionRequired
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Connection"]
  newparam(:dsc_encrypteduserconnectionrequired) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EncryptedUserConnectionRequired - Requires that encryption is used between the end-user and the server running Excel Services Application. Valid values are None, Connection."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Connection', 'connection'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Connection")
      end
    end
  end

  # Name:         ExternalDataConnectionLifetime
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externaldataconnectionlifetime) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ExternalDataConnectionLifetime - Specifies the maximum number of seconds that an external data connection can remain open in the connection pool."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         FileAccessMethod
  # Type:         string
  # IsMandatory:  False
  # Values:       ["UseImpersonation", "UseFileAccessAccount"]
  newparam(:dsc_fileaccessmethod) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FileAccessMethod - Specifies the authentication method that Excel Services Application uses to retrieve files. Valid values are UseImpersonation, UseFileAccessAccount."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['UseImpersonation', 'useimpersonation', 'UseFileAccessAccount', 'usefileaccessaccount'].include?(value)
        fail("Invalid value '#{value}'. Valid values are UseImpersonation, UseFileAccessAccount")
      end
    end
  end

  # Name:         LoadBalancingScheme
  # Type:         string
  # IsMandatory:  False
  # Values:       ["RoundRobin", "Local", "WorkbookURL"]
  newparam(:dsc_loadbalancingscheme) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LoadBalancingScheme - Specifies the load-balancing schema that is used by the Excel Services Application Web service application to send requests to different back-end Excel Services Application computers. Valid values are RoundRobin, Local, WorkbookURL."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['RoundRobin', 'roundrobin', 'Local', 'local', 'WorkbookURL', 'workbookurl'].include?(value)
        fail("Invalid value '#{value}'. Valid values are RoundRobin, Local, WorkbookURL")
      end
    end
  end

  # Name:         MemoryCacheThreshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_memorycachethreshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MemoryCacheThreshold - Specifies the percentage of the maximum private bytes that can be allocated to inactive objects."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         PrivateBytesMax
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_privatebytesmax) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "PrivateBytesMax - Specifies the maximum private bytes, in megabytes, that are used by Excel Services Application."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SessionsPerUserMax
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sessionsperusermax) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "SessionsPerUserMax - Specifies the maximum number of sessions allowed for a user."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SiteCollectionAnonymousSessionsMax
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sitecollectionanonymoussessionsmax) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "SiteCollectionAnonymousSessionsMax - Specifies the maximum number of anonymous sessions allowed per site collection."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         TerminateProcessOnAccessViolation
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_terminateprocessonaccessviolation) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "TerminateProcessOnAccessViolation - Terminates Excel Services Application when an access violation occurs in the process."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ThrottleAccessViolationsPerSiteCollection
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_throttleaccessviolationspersitecollection) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ThrottleAccessViolationsPerSiteCollection - Specifies that if a workbook causes an access violation error on Excel Services Application, all files originating from that workbook's site collection are blocked from loading for the specified period (in seconds)."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         UnattendedAccountApplicationId
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_unattendedaccountapplicationid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UnattendedAccountApplicationId - Specifies that the application ID that is used to look up the unattended service account credentials from the secure storage service that is specified by the UnattendedAccountSecureServiceAppName parameter."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UnusedObjectAgeMax
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_unusedobjectagemax) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "UnusedObjectAgeMax - Specifies the maximum amount of time, in minutes, that objects not currently used in a session are kept in the memory cache."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         WorkbookCache
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_workbookcache) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WorkbookCache - Specifies the local file system location of the cache that is used to store workbooks that are used by Excel Services Application."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WorkbookCacheSizeMax
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_workbookcachesizemax) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "WorkbookCacheSizeMax - Specifies the maximum allowable size, in megabytes, of an individual session."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Present ensures service app exists, absent ensures it is removed Valid values are Present, Absent."
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
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spexcelserviceapp).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
