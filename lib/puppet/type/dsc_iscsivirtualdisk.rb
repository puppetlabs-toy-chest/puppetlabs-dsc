require 'pathname'

Puppet::Type.newtype(:dsc_iscsivirtualdisk) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC iSCSIVirtualDisk resource type.
    Automatically generated from
    'iSCSIDsc/DSCResources/DSR_iSCSIVirtualDisk/DSR_iSCSIVirtualDisk.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
    end

  def dscmeta_resource_friendly_name; 'iSCSIVirtualDisk' end
  def dscmeta_resource_name; 'DSR_iSCSIVirtualDisk' end
  def dscmeta_module_name; 'iSCSIDsc' end
  def dscmeta_module_version; '1.5.0.0' end

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

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - Specifies the path of the VHDX file that is associated with the iSCSI virtual disk."
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
    desc "Ensure - Ensures that Virtual Disk is either Absent or Present. Valid values are Present, Absent."
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

  # Name:         DiskType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Dynamic", "Fixed", "Differencing"]
  newparam(:dsc_disktype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DiskType - Specifies the type of the VHDX. Valid values are Dynamic, Fixed, Differencing."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Dynamic', 'dynamic', 'Fixed', 'fixed', 'Differencing', 'differencing'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Dynamic, Fixed, Differencing")
      end
    end
  end

  # Name:         SizeBytes
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sizebytes) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "SizeBytes - Specifies the size, in bytes, of the iSCSI virtual disk."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         BlockSizeBytes
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_blocksizebytes) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "BlockSizeBytes - Specifies the block size, in bytes, for the VHDX."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         LogicalSectorSizeBytes
  # Type:         uint32
  # IsMandatory:  False
  # Values:       ["512", "4096"]
  newparam(:dsc_logicalsectorsizebytes) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "LogicalSectorSizeBytes - Specifies the logical sector size, in bytes, for the VHDX. Valid values are 512, 4096."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
      unless ['512', '512', '4096', '4096'].include?(value)
        fail("Invalid value '#{value}'. Valid values are 512, 4096")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         PhysicalSectorSizeBytes
  # Type:         uint32
  # IsMandatory:  False
  # Values:       ["512", "4096"]
  newparam(:dsc_physicalsectorsizebytes) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "PhysicalSectorSizeBytes - Specifies the physical sector size, in bytes, for the VHDX. Valid values are 512, 4096."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
      unless ['512', '512', '4096', '4096'].include?(value)
        fail("Invalid value '#{value}'. Valid values are 512, 4096")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Description - Specifies the description for the iSCSI virtual disk."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ParentPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_parentpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ParentPath - Specifies the parent virtual disk path if the VHDX is a differencing disk."
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

Puppet::Type.type(:dsc_iscsivirtualdisk).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
