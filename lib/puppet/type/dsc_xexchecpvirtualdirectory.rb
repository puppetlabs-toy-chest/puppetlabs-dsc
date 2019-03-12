require 'pathname'

Puppet::Type.newtype(:dsc_xexchecpvirtualdirectory) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchEcpVirtualDirectory resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchEcpVirtualDirectory/MSFT_xExchEcpVirtualDirectory.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  def dscmeta_resource_friendly_name; 'xExchEcpVirtualDirectory' end
  def dscmeta_resource_name; 'MSFT_xExchEcpVirtualDirectory' end
  def dscmeta_module_name; 'xExchange' end
  def dscmeta_module_version; '1.27.0.0' end

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

  # Name:         Identity
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identity) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Identity - The Identity of the ECP Virtual Directory."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential - Credentials used to establish a remote PowerShell session to Exchange."
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

  # Name:         AllowServiceRestart
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowservicerestart) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowServiceRestart - Whether it is OK to recycle the app pool after making changes. Defaults to $true."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AdfsAuthentication
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adfsauthentication) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AdfsAuthentication - The AdfsAuthentication parameter specifies that the ECP virtual directory allows users to authenticate through Active Directory Federation Services (AD FS) authentication. This parameter accepts $true or $false. The default value is $false."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AdminEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adminenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AdminEnabled - The AdminEnabled parameter specifies that the EAC isn't able to be accessed through the Internet."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         BasicAuthentication
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_basicauthentication) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "BasicAuthentication - The BasicAuthentication parameter specifies whether Basic authentication is enabled on the virtual directory. "
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DigestAuthentication
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_digestauthentication) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DigestAuthentication - The DigestAuthentication parameter specifies whether Digest authentication is enabled on the virtual directory."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DomainController
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domaincontroller) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainController - The DomainController parameter specifies the domain controller that's used by this cmdlet to read data from or write data to Active Directory. You identify the domain controller by its fully qualified domain name (FQDN). For example, dc01.contoso.com."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ExtendedProtectionFlags
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["None", "Proxy", "NoServiceNameCheck", "AllowDotlessSpn", "ProxyCohosting"]
  newparam(:dsc_extendedprotectionflags, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExtendedProtectionFlags - Specifies custom settings for Extended Protection for Authentication on the virtual directory. Valid values are None, Proxy, NoServiceNameCheck, AllowDotlessSpn, ProxyCohosting."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['None', 'none', 'Proxy', 'proxy', 'NoServiceNameCheck', 'noservicenamecheck', 'AllowDotlessSpn', 'allowdotlessspn', 'ProxyCohosting', 'proxycohosting'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are None, Proxy, NoServiceNameCheck, AllowDotlessSpn, ProxyCohosting")
        end
      end
      if value.kind_of?(String)
        unless ['None', 'none', 'Proxy', 'proxy', 'NoServiceNameCheck', 'noservicenamecheck', 'AllowDotlessSpn', 'allowdotlessspn', 'ProxyCohosting', 'proxycohosting'].include?(value)
          fail("Invalid value #{value}. Valid values are None, Proxy, NoServiceNameCheck, AllowDotlessSpn, ProxyCohosting")
        end
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ExtendedProtectionSPNList
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_extendedprotectionspnlist, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExtendedProtectionSPNList - Specifies a list of valid Service Principal Names (SPNs) if you're using Extended Protection for Authentication on the virtual directory."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ExtendedProtectionTokenChecking
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Allow", "Require"]
  newparam(:dsc_extendedprotectiontokenchecking) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExtendedProtectionTokenChecking - Defines how you want to use Extended Protection for Authentication on the virtual directory. Valid values are None, Allow, Require."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Allow', 'allow', 'Require', 'require'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Allow, Require")
      end
    end
  end

  # Name:         ExternalAuthenticationMethods
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externalauthenticationmethods, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExternalAuthenticationMethods - The ExternalAuthenticationMethods parameter specifies the authentication methods supported on the Exchange server from outside the firewall."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         FormsAuthentication
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_formsauthentication) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "FormsAuthentication - The FormsAuthentication parameter specifies whether forms-based authentication is enabled on the ECP virtual directory."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         GzipLevel
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Off", "Low", "High", "Error"]
  newparam(:dsc_gziplevel) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "GzipLevel - The GzipLevel parameter sets Gzip configuration information for the ECP virtual directory. Valid values are Off, Low, High, Error."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Off', 'off', 'Low', 'low', 'High', 'high', 'Error', 'error'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Off, Low, High, Error")
      end
    end
  end

  # Name:         ExternalUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externalurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExternalUrl - The ExternalURL parameter specifies the URL that's used to connect to the virtual directory from outside the firewall."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InternalUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_internalurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InternalUrl - The InternalURL parameter specifies the URL that's used to connect to the virtual directory from inside the firewall."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         OwaOptionsEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_owaoptionsenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "OwaOptionsEnabled - Specifies that Outlook on the web Options is enabled for end users."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         WindowsAuthentication
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_windowsauthentication) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "WindowsAuthentication - The WindowsAuthentication parameter specifies whether Integrated Windows authentication is enabled on the virtual directory."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xexchecpvirtualdirectory).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
