require 'pathname'

Puppet::Type.newtype(:dsc_xdnsserveraddress) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDNSServerAddress resource type.
    Automatically generated from
    'xNetworking/DSCResources/MSFT_xDNSServerAddress/MSFT_xDNSServerAddress.schema.mof'

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
    end

  def dscmeta_resource_friendly_name; 'xDNSServerAddress' end
  def dscmeta_resource_name; 'MSFT_xDNSServerAddress' end
  def dscmeta_module_name; 'xNetworking' end
  def dscmeta_module_version; '5.1.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
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
    desc "InterfaceAlias - Alias of the network interface for which the DNS server address is set."
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
    desc "AddressFamily - IP address family. Valid values are IPv4, IPv6."
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

  # Name:         Address
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_address, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Address - The desired DNS Server address(es). Exclude to enable DHCP."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Validate
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_validate) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Validate - Requires that the DNS Server addresses be validated if they are updated. It will cause the resource to throw a 'A general error occurred that is not covered by a more specific error code.' error if set to True and specified DNS Servers are not accessible."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xdnsserveraddress).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
