require 'pathname'

Puppet::Type.newtype(:dsc_xvmswitch) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xVMSwitch resource type.
    Automatically generated from
    'xHyper-V/DSCResources/MSFT_xVMSwitch/MSFT_xVMSwitch.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_type is a required attribute') if self[:dsc_type].nil?
    end

  def dscmeta_resource_friendly_name; 'xVMSwitch' end
  def dscmeta_resource_name; 'MSFT_xVMSwitch' end
  def dscmeta_module_name; 'xHyper-V' end
  def dscmeta_module_version; '3.5.0.0' end

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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Name of the VM Switch"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Type
  # Type:         string
  # IsMandatory:  True
  # Values:       ["External", "Internal", "Private"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type - Type of switch Valid values are External, Internal, Private."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['External', 'external', 'Internal', 'internal', 'Private', 'private'].include?(value)
        fail("Invalid value '#{value}'. Valid values are External, Internal, Private")
      end
    end
  end

  # Name:         NetAdapterName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_netadaptername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NetAdapterName - Network adapter name for external switch type"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AllowManagementOS
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowmanagementos) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowManagementOS - Specify if the VM host has access to the physical NIC"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         BandwidthReservationMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Default", "Weight", "Absolute", "None", "NA"]
  newparam(:dsc_bandwidthreservationmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "BandwidthReservationMode - Type of Bandwidth Reservation Mode to use for the switch Valid values are Default, Weight, Absolute, None, NA."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Default', 'default', 'Weight', 'weight', 'Absolute', 'absolute', 'None', 'none', 'NA', 'na'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Default, Weight, Absolute, None, NA")
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
    desc "Ensure - Whether switch should be present or absent Valid values are Present, Absent."
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

  # Name:         Id
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_id) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Id - Unique ID for the switch"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         NetAdapterInterfaceDescription
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_netadapterinterfacedescription) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NetAdapterInterfaceDescription - Description of the network interface"
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

Puppet::Type.type(:dsc_xvmswitch).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
