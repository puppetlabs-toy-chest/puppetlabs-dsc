require 'pathname'

Puppet::Type.newtype(:dsc_spwordautomationserviceapp) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPWordAutomationServiceApp resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPWordAutomationServiceApp/MSFT_SPWordAutomationServiceApp.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPWordAutomationServiceApp' end
  def dscmeta_resource_name; 'MSFT_SPWordAutomationServiceApp' end
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
    desc "Name - THe name of the service application"
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
    desc "Ensure - Present to ensure the app exists, absent to ensure that it does not Valid values are Present, Absent."
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

  # Name:         DatabaseName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseName - The name of the database for the service app"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databaseserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseServer - The name of the server that will host the database"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SupportedFileFormats
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["docx", "doc", "mht", "rtf", "xml"]
  newparam(:dsc_supportedfileformats, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "SupportedFileFormats - The list of supported file types Valid values are docx, doc, mht, rtf, xml."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['docx', 'docx', 'doc', 'doc', 'mht', 'mht', 'rtf', 'rtf', 'xml', 'xml'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are docx, doc, mht, rtf, xml")
        end
      end
      if value.kind_of?(String)
        unless ['docx', 'docx', 'doc', 'doc', 'mht', 'mht', 'rtf', 'rtf', 'xml', 'xml'].include?(value)
          fail("Invalid value #{value}. Valid values are docx, doc, mht, rtf, xml")
        end
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         DisableEmbeddedFonts
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disableembeddedfonts) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableEmbeddedFonts - Should embedded fonts be disabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         MaximumMemoryUsage
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximummemoryusage) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaximumMemoryUsage - What is the maximum amount of memory the service app should use (in MB)"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RecycleThreshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recyclethreshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "RecycleThreshold - What is the recycle threshold for this service app"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DisableBinaryFileScan
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disablebinaryfilescan) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableBinaryFileScan - Should binary file scans be disabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ConversionProcesses
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_conversionprocesses) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ConversionProcesses - How many conversion processes can be run at once"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         JobConversionFrequency
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_jobconversionfrequency) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "JobConversionFrequency - How frequently should new jobs be started from the queue (in minutes)"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         NumberOfConversionsPerProcess
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_numberofconversionsperprocess) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "NumberOfConversionsPerProcess - How many document conversions should be included in a single process"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         TimeBeforeConversionIsMonitored
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_timebeforeconversionismonitored) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "TimeBeforeConversionIsMonitored - How long can a conversion be run before it becomes monitored"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaximumConversionAttempts
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumconversionattempts) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaximumConversionAttempts - What is the maximum number of attempts to convert a document"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaximumSyncConversionRequests
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumsyncconversionrequests) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaximumSyncConversionRequests - What is the maximum number of sync conversion requests for the service app"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         KeepAliveTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_keepalivetimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "KeepAliveTimeout - How long is the keep alive timeout set to for the service app"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaximumConversionTime
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumconversiontime) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaximumConversionTime - What is the maximum time in seconds for a document conversion to be allowed to run"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
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

Puppet::Type.type(:dsc_spwordautomationserviceapp).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
