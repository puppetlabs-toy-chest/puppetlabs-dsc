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

Puppet::Type.newtype(:dsc_xdhcpserverscope) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xDhcpServerScope resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xDhcpServer/DSCResources/MSFT_xDhcpServerScope/MSFT_xDhcpServerScope.schema.mof
  }

  validate do
      fail('dsc_ipstartrange is a required attribute') if self[:dsc_ipstartrange].nil?
      fail('dsc_ipendrange is a required attribute') if self[:dsc_ipendrange].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xDhcpServerScope"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xDhcpServerScope"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xDhcpServer"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.1"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    defaultvalues
    defaultto :present
  end

  # Name:         IPStartRange
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_ipstartrange) do
    desc "Starting address to set for this scope"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IPEndRange
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_ipendrange) do
    desc "Ending address to set for this scope"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_name) do
    desc "Name of DHCP Scope"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SubnetMask
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_subnetmask) do
    desc "Subnet mask for the scope specified in IP address format"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LeaseDuration
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_leaseduration) do
    desc "Time interval for which an IP address should be leased"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         State
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Active", "Inactive"]
  newparam(:dsc_state) do
    desc "Whether scope should be active or inactive"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Active', 'active', 'Inactive', 'inactive'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Active, Inactive")
      end
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
    desc "Whether scope should be set or removed"
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

  # Name:         ScopeID
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scopeid) do
    desc "ScopeId for the given scope"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
