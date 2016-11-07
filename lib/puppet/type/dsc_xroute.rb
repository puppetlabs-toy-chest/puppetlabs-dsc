require 'pathname'

Puppet::Type.newtype(:dsc_xroute) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xRoute resource type.
    Automatically generated from
    'xNetworking/DSCResources/MSFT_xRoute/MSFT_xRoute.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_interfacealias is a required attribute') if self[:dsc_interfacealias].nil?
      fail('dsc_addressfamily is a required attribute') if self[:dsc_addressfamily].nil?
      fail('dsc_destinationprefix is a required attribute') if self[:dsc_destinationprefix].nil?
      fail('dsc_nexthop is a required attribute') if self[:dsc_nexthop].nil?
    end

  def dscmeta_resource_friendly_name; 'xRoute' end
  def dscmeta_resource_name; 'MSFT_xRoute' end
  def dscmeta_module_name; 'xNetworking' end
  def dscmeta_module_version; '3.0.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         PsDscRunAsCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_psdscrunascredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "PsDscRunAsCredential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         InterfaceAlias
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_interfacealias) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InterfaceAlias - Specifies the alias of a network interface."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AddressFamily
  # Type:         string
  # IsMandatory:  True
  # Values:       ["IPv4", "IPv6"]
  newparam(:dsc_addressfamily) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AddressFamily - Specifies the IP address family. Valid values are IPv4, IPv6."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['IPv4', 'ipv4', 'IPv6', 'ipv6'].include?(value)
        fail("Invalid value '#{value}'. Valid values are IPv4, IPv6")
      end
    end
  end

  # Name:         DestinationPrefix
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_destinationprefix) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DestinationPrefix - Specifies a destination prefix of an IP route. A destination prefix consists of an IP address prefix and a prefix length, separated by a slash (/)."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         NextHop
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_nexthop) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NextHop - Specifies the next hop for the IP route."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Specifies whether the route should exist. Valid values are Present, Absent."
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

  # Name:         RouteMetric
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_routemetric) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "RouteMetric - Specifies an integer route metric for an IP route."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Publish
  # Type:         string
  # IsMandatory:  False
  # Values:       ["No", "Yes", "Age"]
  newparam(:dsc_publish) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Publish - Specifies the publish setting of an IP route. Valid values are No, Yes, Age."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['No', 'no', 'Yes', 'yes', 'Age', 'age'].include?(value)
        fail("Invalid value '#{value}'. Valid values are No, Yes, Age")
      end
    end
  end

  # Name:         PreferredLifetime
  # Type:         real64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_preferredlifetime) do
    def mof_type; 'real64' end
    def mof_is_embedded?; false end
    desc "PreferredLifetime - Specifies a preferred lifetime in seconds of an IP route."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xroute).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
