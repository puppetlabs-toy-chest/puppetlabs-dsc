require 'pathname'

Puppet::Type.newtype(:dsc_xdisk) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDisk resource type.
    Automatically generated from
    'xStorage/DSCResources/MSFT_xDisk/MSFT_xDisk.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_driveletter is a required attribute') if self[:dsc_driveletter].nil?
    end

  def dscmeta_resource_friendly_name; 'xDisk' end
  def dscmeta_resource_name; 'MSFT_xDisk' end
  def dscmeta_module_name; 'xStorage' end
  def dscmeta_module_version; '2.4.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         DriveLetter
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_driveletter) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DriveLetter"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DiskNumber
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disknumber) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DiskNumber"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Size
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_size) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "Size"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         FSLabel
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_fslabel) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FSLabel"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AllocationUnitSize
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allocationunitsize) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "AllocationUnitSize"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xdisk).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
