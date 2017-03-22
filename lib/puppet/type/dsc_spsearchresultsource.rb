require 'pathname'

Puppet::Type.newtype(:dsc_spsearchresultsource) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPSearchResultSource resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPSearchResultSource/MSFT_SPSearchResultSource.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPSearchResultSource' end
  def dscmeta_resource_name; 'MSFT_SPSearchResultSource' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.6.0.0' end

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
    desc "Name - The name of the result source"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SearchServiceAppName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_searchserviceappname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SearchServiceAppName - The name of the search service application to associate this result source with"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Query
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_query) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Query - The query to pass to the provider source"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProviderType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Exchange Search Provider", "Local People Provider", "Local SharePoint Provider", "OpenSearch Provider", "Remote People Provider", "Remote SharePoint Provider"]
  newparam(:dsc_providertype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProviderType - The provider type to use for the result source Valid values are Exchange Search Provider, Local People Provider, Local SharePoint Provider, OpenSearch Provider, Remote People Provider, Remote SharePoint Provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Exchange Search Provider', 'exchange search provider', 'Local People Provider', 'local people provider', 'Local SharePoint Provider', 'local sharepoint provider', 'OpenSearch Provider', 'opensearch provider', 'Remote People Provider', 'remote people provider', 'Remote SharePoint Provider', 'remote sharepoint provider'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Exchange Search Provider, Local People Provider, Local SharePoint Provider, OpenSearch Provider, Remote People Provider, Remote SharePoint Provider")
      end
    end
  end

  # Name:         ConnectionUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_connectionurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConnectionUrl - The URI to connect to the remote location"
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
    desc "Ensure - Present if the result source should exist, absent if it should not Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_spsearchresultsource).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
