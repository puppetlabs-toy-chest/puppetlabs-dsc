begin
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
rescue LoadError => detail
  require 'pathname'
  lib_path = Pathname.new(__FILE__).dirname.parent.parent
  $:.unshift(lib_path)
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
end

Puppet::Type.newtype(:dsc_xipaddress) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xIPAddress resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xNetworking/DSCResources/MSFT_xIPAddress/MSFT_xIPAddress.schema.mof
  }

  validate do
      fail('dsc_ipaddress is a required attribute') if self[:dsc_ipaddress].nil?
      fail('dsc_interfacealias is a required attribute') if self[:dsc_interfacealias].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xIPAddress"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xIPAddress"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xNetworking"
  end

  newparam(:dscmeta_module_version) do
    defaultto "2.1.1"
  end

  newparam(:name, :namevar => true ) do
  end

  # Name:         IPAddress
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_ipaddress) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InterfaceAlias
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_interfacealias) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DefaultGateway
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_defaultgateway) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SubnetMask
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_subnetmask) do
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         AddressFamily
  # Type:         string
  # IsMandatory:  False
  # Values:       ["IPv4", "IPv6"]
  newparam(:dsc_addressfamily) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['IPv4', 'ipv4', 'IPv6', 'ipv6'].include?(value)
        fail("Invalid value '#{value}'. Valid values are IPv4, IPv6")
      end
    end
  end


end
