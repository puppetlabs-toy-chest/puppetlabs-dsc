require 'pathname'

Puppet::Type.newtype(:dsc_xexchimapsettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchImapSettings resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchImapSettings/MSFT_xExchImapSettings.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_server is a required attribute') if self[:dsc_server].nil?
    end

  newproperty(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xExchImapSettings')."

    def retrieve
      'xExchImapSettings'
    end

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only'
    end
  end

  newproperty(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xExchImapSettings')."

    def retrieve
      'MSFT_xExchImapSettings'
    end

    validate do |value|
      fail 'dscmeta_resource_name is read-only'
    end
  end

  newparam(:dscmeta_import_resource) do
    desc "Please ignore this parameter.
      Defaults to `true`."
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newproperty(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xExchange')."

    def retrieve
      'xExchange'
    end

    validate do |value|
      fail 'dscmeta_module_name is read-only'
    end
  end

  newproperty(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.4.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    def retrieve
      '1.4.0.0'
    end

    validate do |value|
      fail 'dscmeta_module_version is read-only'
    end
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Server
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_server) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Server"
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

  # Name:         LoginType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["PlainTextLogin", "PlainTextAuthentication", "SecureLogin"]
  newparam(:dsc_logintype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LoginType - Valid values are PlainTextLogin, PlainTextAuthentication, SecureLogin."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['PlainTextLogin', 'plaintextlogin', 'PlainTextAuthentication', 'plaintextauthentication', 'SecureLogin', 'securelogin'].include?(value)
        fail("Invalid value '#{value}'. Valid values are PlainTextLogin, PlainTextAuthentication, SecureLogin")
      end
    end
  end

  # Name:         ExternalConnectionSettings
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externalconnectionsettings, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExternalConnectionSettings"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         X509CertificateName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_x509certificatename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "X509CertificateName"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end

Puppet::Type.type(:dsc_xexchimapsettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
