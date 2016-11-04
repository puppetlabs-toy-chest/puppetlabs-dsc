require 'pathname'

Puppet::Type.newtype(:dsc_xexchowavirtualdirectory) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchOwaVirtualDirectory resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchOwaVirtualDirectory/MSFT_xExchOwaVirtualDirectory.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xExchOwaVirtualDirectory' end
  def dscmeta_resource_name; 'MSFT_xExchOwaVirtualDirectory' end
  def dscmeta_module_name; 'xExchange' end
  def dscmeta_module_version; '1.11.0.0' end

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

  # Name:         Identity
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identity) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Identity"
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
    desc "Credential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         AdfsAuthentication
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adfsauthentication) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AdfsAuthentication"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowServiceRestart
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowservicerestart) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowServiceRestart"
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
    desc "BasicAuthentication"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ChangePasswordEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_changepasswordenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ChangePasswordEnabled"
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
    desc "DigestAuthentication"
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
    desc "DomainController"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
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
    desc "ExternalAuthenticationMethods"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ExternalUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externalurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExternalUrl"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FormsAuthentication
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_formsauthentication) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "FormsAuthentication"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         InternalUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_internalurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InternalUrl"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstantMessagingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_instantmessagingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "InstantMessagingEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         InstantMessagingCertificateThumbprint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_instantmessagingcertificatethumbprint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstantMessagingCertificateThumbprint"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstantMessagingServerName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_instantmessagingservername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstantMessagingServerName"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstantMessagingType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Ocs"]
  newparam(:dsc_instantmessagingtype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstantMessagingType - Valid values are None, Ocs."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Ocs', 'ocs'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Ocs")
      end
    end
  end

  # Name:         LogonPagePublicPrivateSelectionEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logonpagepublicprivateselectionenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "LogonPagePublicPrivateSelectionEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         LogonPageLightSelectionEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logonpagelightselectionenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "LogonPageLightSelectionEnabled"
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
    desc "WindowsAuthentication"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         LogonFormat
  # Type:         string
  # IsMandatory:  False
  # Values:       ["FullDomain", "UserName", "PrincipalName"]
  newparam(:dsc_logonformat) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogonFormat - Valid values are FullDomain, UserName, PrincipalName."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['FullDomain', 'fulldomain', 'UserName', 'username', 'PrincipalName', 'principalname'].include?(value)
        fail("Invalid value '#{value}'. Valid values are FullDomain, UserName, PrincipalName")
      end
    end
  end

  # Name:         DefaultDomain
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_defaultdomain) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DefaultDomain"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xexchowavirtualdirectory).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
