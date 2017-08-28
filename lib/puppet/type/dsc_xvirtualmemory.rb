require 'pathname'

Puppet::Type.newtype(:dsc_xvirtualmemory) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xVirtualMemory resource type.
    Automatically generated from
    'xComputerManagement/DSCResources/MSFT_xVirtualMemory/MSFT_xVirtualMemory.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_drive is a required attribute') if self[:dsc_drive].nil?
      fail('dsc_type is a required attribute') if self[:dsc_type].nil?
    end

  def dscmeta_resource_friendly_name; 'xVirtualMemory' end
  def dscmeta_resource_name; 'MSFT_xVirtualMemory' end
  def dscmeta_module_name; 'xComputerManagement' end
  def dscmeta_module_version; '2.1.0.0' end

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

  # Name:         Drive
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_drive) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Drive - The drive letter for which paging settings should be set. Can be letter only, letter and colon or letter with colon and trailing slash."
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
  # Values:       ["AutoManagePagingFile", "CustomSize", "SystemManagedSize", "NoPagingFile"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type - The type of the paging setting to use. If set to AutoManagePagingFile, the drive letter will be ignored. If set to SystemManagedSize, the values for InitialSize and MaximumSize will be ignored Valid values are AutoManagePagingFile, CustomSize, SystemManagedSize, NoPagingFile."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['AutoManagePagingFile', 'automanagepagingfile', 'CustomSize', 'customsize', 'SystemManagedSize', 'systemmanagedsize', 'NoPagingFile', 'nopagingfile'].include?(value)
        fail("Invalid value '#{value}'. Valid values are AutoManagePagingFile, CustomSize, SystemManagedSize, NoPagingFile")
      end
    end
  end

  # Name:         InitialSize
  # Type:         sint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_initialsize) do
    def mof_type; 'sint64' end
    def mof_is_embedded?; false end
    desc "InitialSize - The initial size of the page file in Megabyte"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaximumSize
  # Type:         sint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumsize) do
    def mof_type; 'sint64' end
    def mof_is_embedded?; false end
    desc "MaximumSize - The maximum size of the page file in Megabyte"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
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

Puppet::Type.type(:dsc_xvirtualmemory).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
