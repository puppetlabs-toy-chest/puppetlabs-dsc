require 'pathname'

Puppet::Type.newtype(:dsc_xnetadapterlso) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xNetAdapterLso resource type.
    Automatically generated from
    'xNetworking/DSCResources/MSFT_xNetAdapterLso/MSFT_xNetAdapterLso.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  def dscmeta_resource_friendly_name; 'xNetAdapterLso' end
  def dscmeta_resource_name; 'MSFT_xNetAdapterLso' end
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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Specifies the name of network adapter."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Protocol
  # Type:         string
  # IsMandatory:  False
  # Values:       ["V1IPv4", "IPv4", "IPv6"]
  newparam(:dsc_protocol) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Protocol - Specifies which protocol to make changes to. Valid values are V1IPv4, IPv4, IPv6."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['V1IPv4', 'v1ipv4', 'IPv4', 'ipv4', 'IPv6', 'ipv6'].include?(value)
        fail("Invalid value '#{value}'. Valid values are V1IPv4, IPv4, IPv6")
      end
    end
  end

  # Name:         State
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_state) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "State - Specifies whether LSO should be enabled or disabled."
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

Puppet::Type.type(:dsc_xnetadapterlso).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
