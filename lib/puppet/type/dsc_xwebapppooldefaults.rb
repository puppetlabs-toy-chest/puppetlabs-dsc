require 'pathname'

Puppet::Type.newtype(:dsc_xwebapppooldefaults) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xWebAppPoolDefaults resource type.
    Automatically generated from
    'xWebAdministration/DSCResources/MSFT_xWebAppPoolDefaults/MSFT_xWebAppPoolDefaults.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_applyto is a required attribute') if self[:dsc_applyto].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xWebAppPoolDefaults')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xWebAppPoolDefaults'
    end

    defaultto 'xWebAppPoolDefaults'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xWebAppPoolDefaults')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xWebAppPoolDefaults'
    end

    defaultto 'MSFT_xWebAppPoolDefaults'
  end

  newparam(:dscmeta_import_resource) do
    desc "Please ignore this parameter.
      Defaults to `true`."
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xWebAdministration')."

    validate do |value|
      fail 'dscmeta_module_name is read-only' if value != 'xWebAdministration'
    end

    defaultto 'xWebAdministration'
  end

  newparam(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.7.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    validate do |value|
      fail 'dscmeta_module_version is read-only' if value != '1.7.0.0'
    end

    defaultto '1.7.0.0'
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
    desc "ApplyTo - Dummy value because we need a key, always 'Machine' Valid values are Machine."
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
    desc "ManagedRuntimeVersion - applicationPools/applicationPoolDefaults/managedRuntimeVersion Valid values are , v2.0, v4.0."
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
    desc "IdentityType - applicationPools/applicationPoolDefaults/processModel/identityType Valid values are ApplicationPoolIdentity, LocalService, LocalSystem, NetworkService."
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
