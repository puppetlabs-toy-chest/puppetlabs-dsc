require 'pathname'

Puppet::Type.newtype(:dsc_xbltpm) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xBLTpm resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xBitlocker/DSCResources/MSFT_xBLTpm/MSFT_xBLTpm.schema.mof
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xBLTpm"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xBLTpm"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xBitlocker"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.0.1.1"
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

  # Name:         AllowClear
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowclear) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowPhysicalPresence
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowphysicalpresence) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowImmediateReboot
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowimmediatereboot) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end


end
