require 'pathname'

Puppet::Type.newtype(:dsc_spwebapplicationappdomain) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPWebApplicationAppDomain resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPWebApplicationAppDomain/MSFT_SPWebApplicationAppDomain.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_webapplication is a required attribute') if self[:dsc_webapplication].nil?
      fail('dsc_zone is a required attribute') if self[:dsc_zone].nil?
    end

  def dscmeta_resource_friendly_name; 'SPWebApplicationAppDomain' end
  def dscmeta_resource_name; 'MSFT_SPWebApplicationAppDomain' end
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

  # Name:         WebApplication
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_webapplication) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WebApplication - The URL of the web application to set the app domain for"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Zone
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Default", "Internet", "Intranet", "Extranet", "Custom"]
  newparam(:dsc_zone) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Zone - The zone that this app domain applies to Valid values are Default, Internet, Intranet, Extranet, Custom."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Default', 'default', 'Internet', 'internet', 'Intranet', 'intranet', 'Extranet', 'extranet', 'Custom', 'custom'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Default, Internet, Intranet, Extranet, Custom")
      end
    end
  end

  # Name:         AppDomain
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_appdomain) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AppDomain - The domain for apps in this web app zone"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Port
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_port) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Port - The port to run apps on"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SSL
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ssl) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SSL - Should apps run under SSL"
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

Puppet::Type.type(:dsc_spwebapplicationappdomain).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
