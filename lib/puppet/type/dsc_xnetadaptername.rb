require 'pathname'

Puppet::Type.newtype(:dsc_xnetadaptername) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xNetAdapterName resource type.
    Automatically generated from
    'xNetworking/DSCResources/MSFT_xNetAdapterName/MSFT_xNetAdapterName.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_newname is a required attribute') if self[:dsc_newname].nil?
    end

  def dscmeta_resource_friendly_name; 'xNetAdapterName' end
  def dscmeta_resource_name; 'MSFT_xNetAdapterName' end
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

  # Name:         NewName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_newname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NewName - Specifies the new name of the network adapter."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - This is the name of the network adapter to find."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PhysicalMediaType
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_physicalmediatype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PhysicalMediaType - This is the media type of the network adapter to find."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Status
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Up", "Disconnected", "Disabled"]
  newparam(:dsc_status) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Status - This is the status of the network adapter to find. Valid values are Up, Disconnected, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Up', 'up', 'Disconnected', 'disconnected', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Up, Disconnected, Disabled")
      end
    end
  end

  # Name:         MacAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_macaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MacAddress - This is the MAC address of the network adapter to find."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InterfaceDescription
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interfacedescription) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InterfaceDescription - This is the interface description of the network adapter to find."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InterfaceIndex
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interfaceindex) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "InterfaceIndex - This is the interface index of the network adapter to find."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         InterfaceGuid
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interfaceguid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InterfaceGuid - This is the interface GUID of the network adapter to find."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DriverDescription
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_driverdescription) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DriverDescription - This is the driver description of the network adapter."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InterfaceNumber
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interfacenumber) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "InterfaceNumber - This is the interface number of the network adapter if more than one are returned by the parameters."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         IgnoreMultipleMatchingAdapters
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ignoremultiplematchingadapters) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IgnoreMultipleMatchingAdapters - This switch will suppress an error occurring if more than one matching adapter matches the parameters passed."
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

Puppet::Type.type(:dsc_xnetadaptername).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
