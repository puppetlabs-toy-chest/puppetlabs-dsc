require 'pathname'

Puppet::Type.newtype(:dsc_opticaldiskdriveletter) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC OpticalDiskDriveLetter resource type.
    Automatically generated from
    'StorageDsc/DSCResources/MSFT_OpticalDiskDriveLetter/MSFT_OpticalDiskDriveLetter.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_diskid is a required attribute') if self[:dsc_diskid].nil?
    end

  def dscmeta_resource_friendly_name; 'OpticalDiskDriveLetter' end
  def dscmeta_resource_name; 'MSFT_OpticalDiskDriveLetter' end
  def dscmeta_module_name; 'StorageDsc' end
  def dscmeta_module_version; '4.0.0.0' end

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

  # Name:         DiskId
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_diskid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DiskId - Specifies the optical disk number for the disk to assign the drive letter to."
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
    desc "DriveLetter - Specifies the drive letter to assign to the optical disk. Can be a single letter, optionally followed by a colon. This value is ignored if Ensure is set to Absent."
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
    desc "Ensure - Determines whether a drive letter should be assigned to the optical disk. Defaults to 'Present'. Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_opticaldiskdriveletter).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
