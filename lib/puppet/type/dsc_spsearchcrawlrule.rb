require 'pathname'

Puppet::Type.newtype(:dsc_spsearchcrawlrule) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPSearchCrawlRule resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPSearchCrawlRule/MSFT_SPSearchCrawlRule.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
    end

  def dscmeta_resource_friendly_name; 'SPSearchCrawlRule' end
  def dscmeta_resource_name; 'MSFT_SPSearchCrawlRule' end
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

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - The name of the search service application"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServiceAppName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serviceappname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServiceAppName - The name of the search service application"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AuthenticationType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["DefaultRuleAccess", "BasicAccountRuleAccess", "CertificateRuleAccess", "NTLMAccountRuleAccess", "FormRuleAccess", "CookieRuleAccess", "AnonymousAccess"]
  newparam(:dsc_authenticationtype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AuthenticationType - Authentication type used by the crawl rule Valid values are DefaultRuleAccess, BasicAccountRuleAccess, CertificateRuleAccess, NTLMAccountRuleAccess, FormRuleAccess, CookieRuleAccess, AnonymousAccess."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['DefaultRuleAccess', 'defaultruleaccess', 'BasicAccountRuleAccess', 'basicaccountruleaccess', 'CertificateRuleAccess', 'certificateruleaccess', 'NTLMAccountRuleAccess', 'ntlmaccountruleaccess', 'FormRuleAccess', 'formruleaccess', 'CookieRuleAccess', 'cookieruleaccess', 'AnonymousAccess', 'anonymousaccess'].include?(value)
        fail("Invalid value '#{value}'. Valid values are DefaultRuleAccess, BasicAccountRuleAccess, CertificateRuleAccess, NTLMAccountRuleAccess, FormRuleAccess, CookieRuleAccess, AnonymousAccess")
      end
    end
  end

  # Name:         RuleType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["InclusionRule", "ExclusionRule"]
  newparam(:dsc_ruletype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RuleType - The type of the rule Valid values are InclusionRule, ExclusionRule."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['InclusionRule', 'inclusionrule', 'ExclusionRule', 'exclusionrule'].include?(value)
        fail("Invalid value '#{value}'. Valid values are InclusionRule, ExclusionRule")
      end
    end
  end

  # Name:         CrawlConfigurationRules
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["FollowLinksNoPageCrawl", "CrawlComplexUrls", "CrawlAsHTTP"]
  newparam(:dsc_crawlconfigurationrules, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "CrawlConfigurationRules - The configuration options for this rule Valid values are FollowLinksNoPageCrawl, CrawlComplexUrls, CrawlAsHTTP."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['FollowLinksNoPageCrawl', 'followlinksnopagecrawl', 'CrawlComplexUrls', 'crawlcomplexurls', 'CrawlAsHTTP', 'crawlashttp'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are FollowLinksNoPageCrawl, CrawlComplexUrls, CrawlAsHTTP")
        end
      end
      if value.kind_of?(String)
        unless ['FollowLinksNoPageCrawl', 'followlinksnopagecrawl', 'CrawlComplexUrls', 'crawlcomplexurls', 'CrawlAsHTTP', 'crawlashttp'].include?(value)
          fail("Invalid value #{value}. Valid values are FollowLinksNoPageCrawl, CrawlComplexUrls, CrawlAsHTTP")
        end
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         AuthenticationCredentials
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authenticationcredentials) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "AuthenticationCredentials - The credentials used for this crawl rule (used for types BasicAccountRuleAccess and NTLMAccountRuleAccess)"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("AuthenticationCredentials", value)
    end
  end

  # Name:         CertificateName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_certificatename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CertificateName - The certificate used for this crawl rule (used for type CertificateRuleAccess)"
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
    desc "Ensure - Present if the service app should exist, absent if it should not Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_spsearchcrawlrule).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
