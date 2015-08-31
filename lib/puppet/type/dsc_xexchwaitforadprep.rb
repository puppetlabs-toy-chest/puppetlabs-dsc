require 'pathname'

Puppet::Type.newtype(:dsc_xexchwaitforadprep) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows



  end

  @doc = %q{
    The DSC xExchWaitForADPrep resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xExchange/DSCResources/MSFT_xExchWaitForADPrep/MSFT_xExchWaitForADPrep.schema.mof
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xExchWaitForADPrep"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xExchWaitForADPrep"
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
    defaultto :present
  end

  # Name:         Identity
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identity) do
    desc "Not actually used. Enter anything, as long as it's not null"
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
    desc "Credentials used to perform Active Directory lookups against the Schema, Configuration, and Domain naming contexts"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SchemaVersion
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_schemaversion) do
    desc "Specifies that the Active Directory schema should have been prepared using Exchange 2013 'setup /PrepareSchema', and should be at the specified version"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value || value.to_i >= 0
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         OrganizationVersion
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_organizationversion) do
    desc "Specifies that the Exchange Organization should have been prepared using Exchange 2013 'setup /PrepareAD', and should be at the specified version"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value || value.to_i >= 0
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         DomainVersion
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domainversion) do
    desc "Specifies that the domain containing the target Exchange 2013 server was prepared using setup /PrepareAD, /PrepareDomain, or /PrepareAllDomains, and should be at the specified version"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value || value.to_i >= 0
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         ExchangeDomains
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_exchangedomains, :array_matching => :all) do
    desc "The FQDN's of domains that should be checked for DomainVersion in addition to the domain that this Exchange server belongs to"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         RetryIntervalSec
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_retryintervalsec) do
    desc "How many seconds to wait between retries when checking whether AD has been prepped. Defaults to 60."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         RetryCount
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_retrycount) do
    desc "How many retry attempts should be made to see if AD has been prepped before an exception is thrown. Defaults to 30."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end


end
