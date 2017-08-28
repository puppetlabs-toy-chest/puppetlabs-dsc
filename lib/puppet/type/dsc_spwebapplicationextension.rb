require 'pathname'

Puppet::Type.newtype(:dsc_spwebapplicationextension) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPWebApplicationExtension resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPWebApplicationExtension/MSFT_SPWebApplicationExtension.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_webappurl is a required attribute') if self[:dsc_webappurl].nil?
      fail('dsc_zone is a required attribute') if self[:dsc_zone].nil?
    end

  def dscmeta_resource_friendly_name; 'SPWebApplicationExtension' end
  def dscmeta_resource_name; 'MSFT_SPWebApplicationExtension' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.8.0.0' end

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

  # Name:         WebAppUrl
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_webappurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WebAppUrl - The URL of the parent web application"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of the web application extension"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Url
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_url) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Url - The URL of the web application extension"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Zone
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Default", "Intranet", "Internet", "Extranet", "Custom"]
  newparam(:dsc_zone) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Zone - Specifies one of the five zones with which the internal URL of this new extension is to be associated. Valid values are Default, Intranet, Internet, Extranet, Custom."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Default', 'default', 'Intranet', 'intranet', 'Internet', 'internet', 'Extranet', 'extranet', 'Custom', 'custom'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Default, Intranet, Internet, Extranet, Custom")
      end
    end
  end

  # Name:         AllowAnonymous
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowanonymous) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowAnonymous - Should anonymous access be enabled for this web app extension"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AuthenticationMethod
  # Type:         string
  # IsMandatory:  False
  # Values:       ["NTLM", "Kerberos", "Claims"]
  newparam(:dsc_authenticationmethod) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AuthenticationMethod - What authentication mode should be used for the web app extension Valid values are NTLM, Kerberos, Claims."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['NTLM', 'ntlm', 'Kerberos', 'kerberos', 'Claims', 'claims'].include?(value)
        fail("Invalid value '#{value}'. Valid values are NTLM, Kerberos, Claims")
      end
    end
  end

  # Name:         AuthenticationProvider
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authenticationprovider) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AuthenticationProvider - What authentication provider should be used for the web app. This value is required when AuthenticationMethod is set to Claims"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         HostHeader
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_hostheader) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "HostHeader - The host header to use for the web app extension"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Path
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - The path on the local servers to host the IIS web site from"
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
    desc "Port - The port to run the site on"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UseSSL
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usessl) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UseSSL - Should this web app extension use SSL"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Present if the web app should exist, absent if it should not Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_spwebapplicationextension).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
