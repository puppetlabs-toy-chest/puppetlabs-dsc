require 'pathname'

Puppet::Type.newtype(:dsc_xexchmailboxdatabasecopy) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xExchMailboxDatabaseCopy resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xExchange/DSCResources/MSFT_xExchMailboxDatabaseCopy/MSFT_xExchMailboxDatabaseCopy.schema.mof
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xExchMailboxDatabaseCopy"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xExchMailboxDatabaseCopy"
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

  # Name:         MailboxServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mailboxserver) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AdServerSettingsPreferredServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adserversettingspreferredserver) do
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
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ActivationPreference
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_activationpreference) do
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
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

  # Name:         ReplayLagTime
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_replaylagtime) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SeedingPostponed
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_seedingpostponed) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         TruncationLagTime
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_truncationlagtime) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
