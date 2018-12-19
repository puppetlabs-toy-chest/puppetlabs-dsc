require 'pathname'

Puppet::Type.newtype(:dsc_spwebapppeoplepickersettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

    class PuppetX::Dsc::TypeHelpers
      def self.validate_MSFT_SPWebAppPPSearchDomain(mof_type_map, name, value)
        required = ['fqdn','isforest']
        allowed = ['accessaccount']
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
            validate_mof_type(mof_type_map[key], 'MSFT_SPWebAppPPSearchDomain', key, lowkey_hash[key])
          end
        end
      end
    end

  @doc = %q{
    The DSC SPWebAppPeoplePickerSettings resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPWebAppPeoplePickerSettings/MSFT_SPWebAppPeoplePickerSettings.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPWebAppPeoplePickerSettings' end
  def dscmeta_resource_name; 'MSFT_SPWebAppPeoplePickerSettings' end
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

  # Name:         ActiveDirectoryCustomFilter
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_activedirectorycustomfilter) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ActiveDirectoryCustomFilter - Sets a customized query filter to send to Active Directory"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ActiveDirectoryCustomQuery
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_activedirectorycustomquery) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ActiveDirectoryCustomQuery - Sets the custom query that is sent to Active Directory"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ActiveDirectorySearchTimeout
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_activedirectorysearchtimeout) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "ActiveDirectorySearchTimeout - Sets the time-out in seconds when a query is issued to Active Directory"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         OnlySearchWithinSiteCollection
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_onlysearchwithinsitecollection) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "OnlySearchWithinSiteCollection - Specifies whether to search only the current site collection"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SearchActiveDirectoryDomains
  # Type:         MSFT_SPWebAppPPSearchDomain[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_searchactivedirectorydomains, :array_matching => :all) do
    def mof_type; 'MSFT_SPWebAppPPSearchDomain[]' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"fqdn"=>{:type=>"string"}, "isforest"=>{:type=>"boolean"}, "accessaccount"=>{:type=>"MSFT_Credential"}}
    end
    desc "SearchActiveDirectoryDomains - List of all domains/forests that must be searched"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be an array of hashes or a hash")
      end
      (value.kind_of?(Hash) ? [value] : value).each_with_index do |v, i|
        fail "SearchActiveDirectoryDomains value at index #{i} should be a Hash" unless v.is_a? Hash

        PuppetX::Dsc::TypeHelpers.validate_MSFT_SPWebAppPPSearchDomain(mof_type_map, "SearchActiveDirectoryDomains", v)
      end
    end
    munge do |value|
      value.kind_of?(Hash) ?
        [PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)] :
        value.map { |v| PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, v) }
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

Puppet::Type.type(:dsc_spwebapppeoplepickersettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
