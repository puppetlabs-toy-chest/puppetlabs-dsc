require 'pathname'

Puppet::Type.newtype(:dsc_spselfservicesitecreation) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPSelfServiceSiteCreation resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPSelfServiceSiteCreation/MSFT_SPSelfServiceSiteCreation.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_webappurl is a required attribute') if self[:dsc_webappurl].nil?
    end

  def dscmeta_resource_friendly_name; 'SPSelfServiceSiteCreation' end
  def dscmeta_resource_name; 'MSFT_SPSelfServiceSiteCreation' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '3.2.0.0' end

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

  # Name:         WebAppUrl
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_webappurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WebAppUrl - The url of the web application"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Enabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Enabled - Specifies if users are allowed to create site collections or not"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         OnlineEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_onlineenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "OnlineEnabled - Specifies if site collections are created in SharePoint Online in a hybrid configuration. Hybrid configuration needs to be caried out seperately using the Hybrid Picker"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         QuotaTemplate
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_quotatemplate) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "QuotaTemplate - The quota template to apply to new site collections. Specify null to not apply any qouta template"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ShowStartASiteMenuItem
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_showstartasitemenuitem) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ShowStartASiteMenuItem - Should the Start a Site link be displayed. Must be false or not specified if Enabled is false"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CreateIndividualSite
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_createindividualsite) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CreateIndividualSite - Should Self Service Site Creation create an individual Site, false for a Site Collection"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ParentSiteUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_parentsiteurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ParentSiteUrl - Specifies the URL of the parent site where new sites are to be created. This is only used when CreateIndividualSite is true. Use [%userid%] to represent the ID of the user who is creating the site, for example: /projects/[%userid%]"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PolicyOption
  # Type:         string
  # IsMandatory:  False
  # Values:       ["MustHavePolicy", "CanHavePolicy", "NotHavePolicy"]
  newparam(:dsc_policyoption) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PolicyOption - Specifies what site classification should be displayed Valid values are MustHavePolicy, CanHavePolicy, NotHavePolicy."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['MustHavePolicy', 'musthavepolicy', 'CanHavePolicy', 'canhavepolicy', 'NotHavePolicy', 'nothavepolicy'].include?(value)
        fail("Invalid value '#{value}'. Valid values are MustHavePolicy, CanHavePolicy, NotHavePolicy")
      end
    end
  end

  # Name:         RequireSecondaryContact
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_requiresecondarycontact) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RequireSecondaryContact - Specifies if users needs to provide one or more additional site administrators"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CustomFormUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_customformurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CustomFormUrl - Specifies a custom form URL to use for Self Service Site Creation. This is only used when CreateIndividualSite is true. Must be an absolute URL or empty to use built in form (_layouts/_layouts/15/scsignup.aspx)"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spselfservicesitecreation).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
