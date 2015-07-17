# workaround for cross modules dependencies
master_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'dsc','lib'))
$:.push(master_path) if File.directory?(master_path)
require 'puppet/type/base_dsc'

Puppet::Type.newtype(:dsc_xdnsserveraddress) do

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  provide :mof, :parent => Puppet::Type.type(:base_dsc).provider(:mof)

  @doc = %q{
    The DSC xDNSServerAddress resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit/xNetworking/DSCResources/MSFT_xDNSServerAddress/MSFT_xDNSServerAddress.schema.mof
  }

  validate do
      fail('dsc_interfacealias is a required attribute') if self[:dsc_interfacealias].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xDNSServerAddress"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xDNSServerAddress"
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

  # Name:         Address
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_address, :array_matching => :all) do
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
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
