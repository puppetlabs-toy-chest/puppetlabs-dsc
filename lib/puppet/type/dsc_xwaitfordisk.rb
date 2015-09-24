require 'pathname'

Puppet::Type.newtype(:dsc_xwaitfordisk) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xWaitForDisk resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xStorage/DSCResources/MSFT_xWaitForDisk/MSFT_xWaitForDisk.schema.mof
  }

  validate do
      fail('dsc_disknumber is a required attribute') if self[:dsc_disknumber].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xWaitForDisk"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xWaitForDisk"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xStorage"
  end

  newparam(:dscmeta_module_version) do
    defaultto "2.0.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         DiskNumber
  # Type:         uint32
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_disknumber) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    isrequired
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         RetryIntervalSec
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_retryintervalsec) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
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
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
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
