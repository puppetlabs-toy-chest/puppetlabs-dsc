require 'pathname'

Puppet::Type.newtype(:dsc_spsearchmanagedproperty) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPSearchManagedProperty resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPSearchManagedProperty/MSFT_SPSearchManagedProperty.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_serviceappname is a required attribute') if self[:dsc_serviceappname].nil?
    end

  def dscmeta_resource_friendly_name; 'SPSearchManagedProperty' end
  def dscmeta_resource_name; 'MSFT_SPSearchManagedProperty' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '3.2.0.0' end

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
    desc "Name - The name of the managed property"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServiceAppName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_serviceappname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServiceAppName - The name of the search service app that this managed property exists within"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PropertyType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Binary", "DateTime", "Decimal", "Double", "Integer", "Text", "YesNo"]
  newparam(:dsc_propertytype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PropertyType - The type of managed property - choose between Binary, DateTime, Decimal, Double, Integer, Text, and YesNo Valid values are Binary, DateTime, Decimal, Double, Integer, Text, YesNo."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Binary', 'binary', 'DateTime', 'datetime', 'Decimal', 'decimal', 'Double', 'double', 'Integer', 'integer', 'Text', 'text', 'YesNo', 'yesno'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Binary, DateTime, Decimal, Double, Integer, Text, YesNo")
      end
    end
  end

  # Name:         Searchable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_searchable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Searchable - Should the property be Searchable"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Queryable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_queryable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Queryable - Should the property be Queryable"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Retrievable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_retrievable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Retrievable - Should the property be Retrievable"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         HasMultipleValues
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_hasmultiplevalues) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "HasMultipleValues - Should the property allow for multiple values to be selected"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Refinable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_refinable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Refinable - Should the property be Refinable"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Sortable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sortable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Sortable - Should the property be Sortable"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SafeForAnonymous
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_safeforanonymous) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SafeForAnonymous - Should the property be marked as safe for anonymous access"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Aliases
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_aliases, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Aliases - Aliases of the managed property"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         TokenNormalization
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tokennormalization) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "TokenNormalization - Should the property be case sensitive"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         NoWordBreaker
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_nowordbreaker) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "NoWordBreaker - Should the property only match exact content"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IncludeAllCrawledProperties
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_includeallcrawledproperties) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IncludeAllCrawledProperties - Should the property be mapped to all crawled properties"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CrawledProperties
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_crawledproperties, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "CrawledProperties - List of crawled properties that the property is mapped with"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Present if the source should exist, absent if it should not Valid values are Present, Absent."
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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spsearchmanagedproperty).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
