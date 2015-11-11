require 'pathname'

Puppet::Type.newtype(:dsc_xadrecyclebin) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xADRecycleBin resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADRecycleBin/MSFT_xADRecycleBin.schema.mof
  }

  validate do
      fail('dsc_forestfqdn is a required attribute') if self[:dsc_forestfqdn].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xADRecycleBin"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xADRecycleBin"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xActiveDirectory"
  end

  newparam(:dscmeta_module_version) do
    defaultto "2.6.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

if Puppet.version >= '4.0.0'
  autonotify(:reboot) { ['dsc_reboot'] }
end

  # Name:         ForestFQDN
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_forestfqdn) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EnterpriseAdministratorCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enterpriseadministratorcredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("EnterpriseAdministratorCredential", value)
    end
  end

  # Name:         RecycleBinEnabled
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recyclebinenabled) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ForestMode
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_forestmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end

Puppet::Type.type(:dsc_xadrecyclebin).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
