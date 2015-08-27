require 'pathname'

Puppet::Type.newtype(:dsc_xexchoutlookanywhere) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xExchOutlookAnywhere resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xExchange/DSCResources/MSFT_xExchOutlookAnywhere/MSFT_xExchOutlookAnywhere.schema.mof
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xExchOutlookAnywhere"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xExchOutlookAnywhere"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xExchange"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.2.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Identity
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identity) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Credential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AllowServiceRestart
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowservicerestart) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         DomainController
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domaincontroller) do
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
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         ExtendedProtectionFlags
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_extendedprotectionflags, :array_matching => :all) do
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
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         InternalHostname
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_internalhostname) do
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
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end


end
