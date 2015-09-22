require 'pathname'

Puppet::Type.newtype(:dsc_waitforany) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC WaitForAny resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_WaitForAny/MSFT_WaitForAny.schema.mof
  }

  validate do
      fail('dsc_resourcename is a required attribute') if self[:dsc_resourcename].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "WaitForAny"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_WaitForAny"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "PSDesiredStateConfiguration"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         ResourceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_resourcename) do
    desc "Name of Resource on remote machine"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         NodeName
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_nodename, :array_matching => :all) do
    desc "List of remote machines"
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
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_retryintervalsec) do
    desc "Time between various retries. Lower bound is 1."
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
    desc "Maximum number of retries to check the state of resource."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         ThrottleLimit
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_throttlelimit) do
    desc "Number of machines to connect simultaneously. Default is new-cimsession default"
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
