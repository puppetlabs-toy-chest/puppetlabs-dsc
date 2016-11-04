require 'pathname'

Puppet::Type.newtype(:dsc_xnetbios) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xNetBIOS resource type.
    Automatically generated from
    'xNetworking/DSCResources/MSFT_xNetBIOS/MSFT_xNetBIOS.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_interfacealias is a required attribute') if self[:dsc_interfacealias].nil?
    end

  def dscmeta_resource_friendly_name; 'xNetBIOS' end
  def dscmeta_resource_name; 'MSFT_xNetBIOS' end
  def dscmeta_module_name; 'xNetworking' end
  def dscmeta_module_version; '3.0.0.0' end

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

  # Name:         InterfaceAlias
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_interfacealias) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InterfaceAlias"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Setting
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Default", "Enable", "Disable"]
  newparam(:dsc_setting) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Setting - Default - Use NetBios settings from the DHCP server. If static IP, Enable NetBIOS. Valid values are Default, Enable, Disable."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Default', 'default', 'Enable', 'enable', 'Disable', 'disable'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Default, Enable, Disable")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xnetbios).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
