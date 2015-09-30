require 'pathname'

Puppet::Type.newtype(:dsc_xexchoabvirtualdirectory) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchOabVirtualDirectory resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xExchange/DSCResources/MSFT_xExchOabVirtualDirectory/MSFT_xExchOabVirtualDirectory.schema.mof
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xExchOabVirtualDirectory"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xExchOabVirtualDirectory"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xExchange"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.3.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

if Puppet.version >= '4.0.0'
  autonotify(:reboot) { ['dsc_reboot'] }
end

  # Name:         Identity
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identity) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         OABsToDistribute
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_oabstodistribute, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         AllowServiceRestart
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowservicerestart) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
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
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ExtendedProtectionFlags
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_extendedprotectionflags, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
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
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Allow', 'allow', 'Require', 'require'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Allow, Require")
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
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PollInterval
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pollinterval) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         RequireSSL
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_requiressl) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
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
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


end

Puppet::Type.type(:dsc_xexchoabvirtualdirectory).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
