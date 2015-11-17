require 'pathname'

Puppet::Type.newtype(:dsc_xwebapppooldefaults) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xWebAppPoolDefaults resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xWebAdministration/DSCResources/MSFT_xWebAppPoolDefaults/MSFT_xWebAppPoolDefaults.schema.mof
  }

  validate do
      fail('dsc_applyto is a required attribute') if self[:dsc_applyto].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xWebAppPoolDefaults"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xWebAppPoolDefaults"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xWebAdministration"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.7.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         ApplyTo
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Machine"]
  newparam(:dsc_applyto) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Dummy value because we need a key, always 'Machine'"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Machine', 'machine'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Machine")
      end
    end
  end

  # Name:         ManagedRuntimeVersion
  # Type:         string
  # IsMandatory:  False
  # Values:       ["", "v2.0", "v4.0"]
  newparam(:dsc_managedruntimeversion) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "applicationPools/applicationPoolDefaults/managedRuntimeVersion"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['', '', 'v2.0', 'v2.0', 'v4.0', 'v4.0'].include?(value)
        fail("Invalid value '#{value}'. Valid values are , v2.0, v4.0")
      end
    end
  end

  # Name:         IdentityType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["ApplicationPoolIdentity", "LocalService", "LocalSystem", "NetworkService"]
  newparam(:dsc_identitytype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "applicationPools/applicationPoolDefaults/processModel/identityType"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['ApplicationPoolIdentity', 'applicationpoolidentity', 'LocalService', 'localservice', 'LocalSystem', 'localsystem', 'NetworkService', 'networkservice'].include?(value)
        fail("Invalid value '#{value}'. Valid values are ApplicationPoolIdentity, LocalService, LocalSystem, NetworkService")
      end
    end
  end


end

Puppet::Type.type(:dsc_xwebapppooldefaults).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
