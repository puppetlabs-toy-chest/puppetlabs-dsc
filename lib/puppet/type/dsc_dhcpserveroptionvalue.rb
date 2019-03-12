require 'pathname'

Puppet::Type.newtype(:dsc_dhcpserveroptionvalue) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC DhcpServerOptionValue resource type.
    Automatically generated from
    'xDhcpServer/DSCResources/MSFT_DhcpServerOptionValue/MSFT_DhcpServerOptionValue.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_optionid is a required attribute') if self[:dsc_optionid].nil?
      fail('dsc_vendorclass is a required attribute') if self[:dsc_vendorclass].nil?
      fail('dsc_userclass is a required attribute') if self[:dsc_userclass].nil?
      fail('dsc_addressfamily is a required attribute') if self[:dsc_addressfamily].nil?
    end

  def dscmeta_resource_friendly_name; 'DhcpServerOptionValue' end
  def dscmeta_resource_name; 'MSFT_DhcpServerOptionValue' end
  def dscmeta_module_name; 'xDhcpServer' end
  def dscmeta_module_version; '2.0.0.0' end

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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         OptionId
  # Type:         uint32
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_optionid) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "OptionId - Option ID, specify an integer between 1 and 255."
    isrequired
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Value
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_value, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Value - Option data value. Could be an array of string for a multivalued option."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         VendorClass
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_vendorclass) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VendorClass - Vendor class. Use an empty string for default vendor class."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UserClass
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_userclass) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UserClass - User class. Use an empty string for default user class."
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
  # Values:       ["IPv4"]
  newparam(:dsc_addressfamily) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AddressFamily - Address family. Currently needs to be IPv4. Valid values are IPv4."
    isrequired
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Whether the DHCP option should exist. Valid values are Present, Absent."
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


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_dhcpserveroptionvalue).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
