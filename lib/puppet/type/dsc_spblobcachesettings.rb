require 'pathname'

Puppet::Type.newtype(:dsc_spblobcachesettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPBlobCacheSettings resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPBlobCacheSettings/MSFT_SPBlobCacheSettings.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPBlobCacheSettings' end
  def dscmeta_resource_name; 'MSFT_SPBlobCacheSettings' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.6.0.0' end

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

  # Name:         Zone
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Default", "Intranet", "Internet", "Custom", "Extranet"]
  newparam(:dsc_zone) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Zone - The zone of the web application for which blob cache has to be configured Valid values are Default, Intranet, Internet, Custom, Extranet."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Default', 'default', 'Intranet', 'intranet', 'Internet', 'internet', 'Custom', 'custom', 'Extranet', 'extranet'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Default, Intranet, Internet, Custom, Extranet")
      end
    end
  end

  # Name:         EnableCache
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enablecache) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableCache - Specify if the blob cache has to be enabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Location
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_location) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Location - The location where the blob cache has to store its files"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxSizeInGB
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxsizeingb) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "MaxSizeInGB - The maximum size (in GB) of disk space the blob cache is allowed to use"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxAgeInSeconds
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxageinseconds) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaxAgeInSeconds - The maximum age (in seconds) that a browser caches a blob"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         FileTypes
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_filetypes) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FileTypes - Specify the file types that must be stored by the blob cache"
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
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spblobcachesettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
