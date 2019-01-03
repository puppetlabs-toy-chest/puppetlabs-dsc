require 'pathname'

Puppet::Type.newtype(:dsc_spwebappsuitebar) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPWebAppSuiteBar resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPWebAppSuiteBar/MSFT_SPWebAppSuiteBar.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPWebAppSuiteBar' end
  def dscmeta_resource_name; 'MSFT_SPWebAppSuiteBar' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '2.2.0.0' end

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
    desc "WebAppUrl - The URL of the web application"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SuiteNavBrandingLogoNavigationUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_suitenavbrandinglogonavigationurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SuiteNavBrandingLogoNavigationUrl - SP2016+: Url to take the users to when the suite bar logo is clicked"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SuiteNavBrandingLogoTitle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_suitenavbrandinglogotitle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SuiteNavBrandingLogoTitle - SP2016+: Alternative text for the Suite Bar Logo"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SuiteNavBrandingLogoUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_suitenavbrandinglogourl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SuiteNavBrandingLogoUrl - SP2016+: URL of the logo for the Suite Bar"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SuiteNavBrandingText
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_suitenavbrandingtext) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SuiteNavBrandingText - SP2016+: Text to display at the left hand side of the suite bar"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SuiteBarBrandingElementHtml
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_suitebarbrandingelementhtml) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SuiteBarBrandingElementHtml - SP2013: HTML to inject in the left hand-side of the Suite Bar"
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

Puppet::Type.type(:dsc_spwebappsuitebar).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
