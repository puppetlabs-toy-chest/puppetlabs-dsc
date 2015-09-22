require 'pathname'

Puppet::Type.newtype(:dsc_xdhcpserveroption) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xDhcpServerOption resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xDhcpServer/DSCResources/MSFT_xDhcpServerOption/MSFT_xDhcpServerOption.schema.mof
  }

  validate do
      fail('dsc_scopeid is a required attribute') if self[:dsc_scopeid].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xDhcpServerOption"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xDhcpServerOption"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xDhcpServer"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.2"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         ScopeID
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_scopeid) do
    desc "ScopeId for which options are set"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DnsServerIPAddress
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dnsserveripaddress, :array_matching => :all) do
    desc "IP address of DNS Servers"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         DnsDomain
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dnsdomain) do
    desc "Domain name of DNS Server"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Router
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_router, :array_matching => :all) do
    desc "IP address of the router/default gateway."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         AddressFamily
  # Type:         string
  # IsMandatory:  False
  # Values:       ["IPv4"]
  newparam(:dsc_addressfamily) do
    desc "Address family type"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['IPv4', 'ipv4'].include?(value)
        fail("Invalid value '#{value}'. Valid values are IPv4")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    desc "Whether option should be set or removed"
    validate do |value|
      resource[:ensure] = value.downcase
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Present', 'present', 'Absent', 'absent'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Present, Absent")
      end
    end
  end


end
