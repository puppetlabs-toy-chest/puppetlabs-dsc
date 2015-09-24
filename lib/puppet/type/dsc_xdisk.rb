require 'pathname'

Puppet::Type.newtype(:dsc_xdisk) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xDisk resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xStorage/DSCResources/MSFT_xDisk/MSFT_xDisk.schema.mof
  }

  validate do
      fail('dsc_driveletter is a required attribute') if self[:dsc_driveletter].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xDisk"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xDisk"
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

  # Name:         DriveLetter
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_driveletter) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DiskNumber
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disknumber) do
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

  # Name:         Size
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_size) do
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

  # Name:         FSLabel
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_fslabel) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
