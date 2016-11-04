require 'pathname'

Puppet::Type.newtype(:dsc_xexchoutlookanywhere) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchOutlookAnywhere resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchOutlookAnywhere/MSFT_xExchOutlookAnywhere.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xExchOutlookAnywhere' end
  def dscmeta_resource_name; 'MSFT_xExchOutlookAnywhere' end
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

  # Name:         ExternalClientsRequireSsl
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externalclientsrequiressl) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ExternalClientsRequireSsl"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExtendedProtectionFlags
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_extendedprotectionflags, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExtendedProtectionFlags"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
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
    desc "ExtendedProtectionSPNList"
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
  # Values:       ["Allow", "None", "Require"]
  newparam(:dsc_extendedprotectiontokenchecking) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExtendedProtectionTokenChecking - Valid values are Allow, None, Require."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Allow', 'allow', 'None', 'none', 'Require', 'require'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Allow, None, Require")
      end
    end
  end

  # Name:         ExternalClientAuthenticationMethod
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Ntlm", "Basic", "Negotiate"]
  newparam(:dsc_externalclientauthenticationmethod) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExternalClientAuthenticationMethod - Valid values are Ntlm, Basic, Negotiate."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Ntlm', 'ntlm', 'Basic', 'basic', 'Negotiate', 'negotiate'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Ntlm, Basic, Negotiate")
      end
    end
  end

  # Name:         ExternalHostname
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externalhostname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExternalHostname"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IISAuthenticationMethods
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_iisauthenticationmethods, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "IISAuthenticationMethods"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         InternalClientAuthenticationMethod
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Ntlm", "Basic", "Negotiate"]
  newparam(:dsc_internalclientauthenticationmethod) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InternalClientAuthenticationMethod - Valid values are Ntlm, Basic, Negotiate."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Ntlm', 'ntlm', 'Basic', 'basic', 'Negotiate', 'negotiate'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Ntlm, Basic, Negotiate")
      end
    end
  end

  # Name:         InternalClientsRequireSsl
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_internalclientsrequiressl) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "InternalClientsRequireSsl"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         InternalHostname
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_internalhostname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InternalHostname"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SSLOffloading
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ssloffloading) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SSLOffloading"
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

Puppet::Type.type(:dsc_xexchoutlookanywhere).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
