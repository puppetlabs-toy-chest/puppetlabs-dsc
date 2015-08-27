require 'pathname'

Puppet::Type.newtype(:dsc_xdnsarecord) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows



  end

  @doc = %q{
    The DSC xDnsARecord resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xDnsServer/DSCResources/MSFT_xDnsARecord/MSFT_xDnsARecord.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_zone is a required attribute') if self[:dsc_zone].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xDnsARecord"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xDnsARecord"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xDnsServer"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.1"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto :present
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Zone
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_zone) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Target
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_target) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
