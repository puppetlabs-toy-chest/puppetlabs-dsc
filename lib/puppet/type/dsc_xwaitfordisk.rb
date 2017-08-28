require 'pathname'

Puppet::Type.newtype(:dsc_xwaitfordisk) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xWaitForDisk resource type.
    Automatically generated from
    'xStorage/DSCResources/MSFT_xWaitForDisk/MSFT_xWaitForDisk.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xWaitForDisk' end
  def dscmeta_resource_name; 'MSFT_xWaitForDisk' end
  def dscmeta_module_name; 'xStorage' end
  def dscmeta_module_version; '3.2.0.0' end

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

  # Name:         DiskId
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_diskid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DiskId - Specifies the disk identifier for the disk to wait for."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DiskIdType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Number", "UniqueId"]
  newparam(:dsc_diskidtype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DiskIdType - Specifies the identifier type the DiskId contains. Defaults to Number. Valid values are Number, UniqueId."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Number', 'number', 'UniqueId', 'uniqueid'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Number, UniqueId")
      end
    end
  end

  # Name:         RetryIntervalSec
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_retryintervalsec) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "RetryIntervalSec - Specifies the number of seconds to wait for the disk to become available."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RetryCount
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_retrycount) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "RetryCount - The number of times to loop the retry interval while waiting for the disk."
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

Puppet::Type.type(:dsc_xwaitfordisk).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
