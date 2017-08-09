require 'pathname'

Puppet::Type.newtype(:dsc_xmountimage) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xMountImage resource type.
    Automatically generated from
    'xStorage/DSCResources/MSFT_xMountImage/MSFT_xMountImage.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_imagepath is a required attribute') if self[:dsc_imagepath].nil?
    end

  def dscmeta_resource_friendly_name; 'xMountImage' end
  def dscmeta_resource_name; 'MSFT_xMountImage' end
  def dscmeta_module_name; 'xStorage' end
  def dscmeta_module_version; '3.2.0.0' end

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

  # Name:         ImagePath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_imagepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ImagePath - Specifies the path of the VHD or ISO file."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DriveLetter
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_driveletter) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DriveLetter - Specifies the drive letter to mount this VHD or ISO to."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StorageType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["ISO", "VHD", "VHDx", "VHDSet"]
  newparam(:dsc_storagetype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StorageType - Specifies the storage type of a file. If the StorageType parameter is not specified, then the storage type is determined by file extension. Valid values are ISO, VHD, VHDx, VHDSet."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['ISO', 'iso', 'VHD', 'vhd', 'VHDx', 'vhdx', 'VHDSet', 'vhdset'].include?(value)
        fail("Invalid value '#{value}'. Valid values are ISO, VHD, VHDx, VHDSet")
      end
    end
  end

  # Name:         Access
  # Type:         string
  # IsMandatory:  False
  # Values:       ["ReadOnly", "ReadWrite"]
  newparam(:dsc_access) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Access - Allows a VHD file to be mounted in read-only or read-write mode. ISO files are mounted in read-only mode regardless of what parameter value you provide. Valid values are ReadOnly, ReadWrite."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['ReadOnly', 'readonly', 'ReadWrite', 'readwrite'].include?(value)
        fail("Invalid value '#{value}'. Valid values are ReadOnly, ReadWrite")
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
    desc "Ensure - Determines whether the VHD or ISO should be mounted or not. Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_xmountimage).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
