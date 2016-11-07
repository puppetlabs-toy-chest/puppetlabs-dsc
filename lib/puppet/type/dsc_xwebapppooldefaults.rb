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

  def dscmeta_resource_friendly_name; 'xWebAppPoolDefaults' end
  def dscmeta_resource_name; 'MSFT_xWebAppPoolDefaults' end
  def dscmeta_module_name; 'xWebAdministration' end
  def dscmeta_module_version; '1.15.0.0' end

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


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xwebapppooldefaults).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
