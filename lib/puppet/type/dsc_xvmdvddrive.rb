require 'pathname'

Puppet::Type.newtype(:dsc_xvmdvddrive) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xVMDvdDrive resource type.
    Automatically generated from
    'xHyper-V/DSCResources/MSFT_xVMDvdDrive/MSFT_xVMDvdDrive.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_vmname is a required attribute') if self[:dsc_vmname].nil?
      fail('dsc_controllernumber is a required attribute') if self[:dsc_controllernumber].nil?
      fail('dsc_controllerlocation is a required attribute') if self[:dsc_controllerlocation].nil?
    end

  def dscmeta_resource_friendly_name; 'xVMDvdDrive' end
  def dscmeta_resource_name; 'MSFT_xVMDvdDrive' end
  def dscmeta_module_name; 'xHyper-V' end
  def dscmeta_module_version; '3.9.0.0' end

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

  # Name:         VMName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_vmname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VMName - Specifies the name of the virtual machine to which the DVD drive is to be added."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ControllerNumber
  # Type:         uint32
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_controllernumber) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ControllerNumber - Specifies the number of the controller to which the DVD drive is to be added."
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

  # Name:         ControllerLocation
  # Type:         uint32
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_controllerlocation) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ControllerLocation - Specifies the number of the location on the controller at which the DVD drive is to be added."
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

  # Name:         Path
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - Specifies the full path to the virtual hard disk file or physical hard disk volume for the added DVD drive."
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
    desc "Ensure - Specifies if the DVD Drive should exist or not. Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_xvmdvddrive).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
