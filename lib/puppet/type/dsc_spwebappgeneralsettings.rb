require 'pathname'

Puppet::Type.newtype(:dsc_spwebappgeneralsettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPWebAppGeneralSettings resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPWebAppGeneralSettings/MSFT_SPWebAppGeneralSettings.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPWebAppGeneralSettings' end
  def dscmeta_resource_name; 'MSFT_SPWebAppGeneralSettings' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.4.0.0' end

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

  # Name:         Url
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_url) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Url - The URL of the web app to set the general settings for"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TimeZone
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_timezone) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "TimeZone - The timezone code to use for this web app. A full list is at https://msdn.microsoft.com/en-us/library/office/microsoft.sharepoint.spregionalsettings.timezones.aspx"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Alerts
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_alerts) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Alerts - Should alerts be enabled for this web app"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AlertsLimit
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_alertslimit) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "AlertsLimit - What is the maximum number of alerts that a user can create in this web app"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RSS
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_rss) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RSS - Should RSS feeds be enabled in this web app"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         BlogAPI
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_blogapi) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "BlogAPI - Should the Blog API be enabled in this web app"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         BlogAPIAuthenticated
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_blogapiauthenticated) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "BlogAPIAuthenticated - Is authentication required for the blog API"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         BrowserFileHandling
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Strict", "Permissive"]
  newparam(:dsc_browserfilehandling) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "BrowserFileHandling - What file handling mode should be used in this web app - strict or permissive Valid values are Strict, Permissive."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Strict', 'strict', 'Permissive', 'permissive'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Strict, Permissive")
      end
    end
  end

  # Name:         SecurityValidation
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_securityvalidation) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SecurityValidation - Is security validation enforced in this web app"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SecurityValidationExpires
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_securityvalidationexpires) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SecurityValidationExpires - Does security validation expire after a set time"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SecurityValidationTimeOutMinutes
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_securityvalidationtimeoutminutes) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "SecurityValidationTimeOutMinutes - Number of minutes security validation will expire if securityvalidationexpires is set"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RecycleBinEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recyclebinenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RecycleBinEnabled - Is the recycle bin enabled in this web application"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RecycleBinCleanupEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recyclebincleanupenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RecycleBinCleanupEnabled - Is automatic cleanup of the recycle bin enabled in this web app"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RecycleBinRetentionPeriod
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recyclebinretentionperiod) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "RecycleBinRetentionPeriod - How many days does the recycle bin keep content for"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SecondStageRecycleBinQuota
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_secondstagerecyclebinquota) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "SecondStageRecycleBinQuota - How much content does the second stage recycle bin keep content for"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaximumUploadSize
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumuploadsize) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaximumUploadSize - What is the maximum file upload size for this web app (in MB)"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         CustomerExperienceProgram
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_customerexperienceprogram) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CustomerExperienceProgram - Should the customer experience program be enabled in this web app"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowOnlineWebPartCatalog
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowonlinewebpartcatalog) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowOnlineWebPartCatalog - Should the Online WebPart Gallery be enabled for this web app"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SelfServiceSiteCreationEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_selfservicesitecreationenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SelfServiceSiteCreationEnabled - Should Self Service Site Creation be enabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         PresenceEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_presenceenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "PresenceEnabled - Is Skype for Business presence enabled for this web app"
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
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spwebappgeneralsettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
