require 'pathname'

Puppet::Type.newtype(:dsc_xadrecyclebin) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xADRecycleBin resource type.
    Automatically generated from
    'xActiveDirectory/DSCResources/MSFT_xADRecycleBin/MSFT_xADRecycleBin.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_forestfqdn is a required attribute') if self[:dsc_forestfqdn].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xADRecycleBin')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xADRecycleBin'
    end

    defaultto 'xADRecycleBin'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xADRecycleBin')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xADRecycleBin'
    end

    defaultto 'MSFT_xADRecycleBin'
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
    desc "A read-only value that is the DSC Module Name ('xActiveDirectory')."

    validate do |value|
      fail 'dscmeta_module_name is read-only' if value != 'xActiveDirectory'
    end

    defaultto 'xActiveDirectory'
  end

  newparam(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('2.7.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    validate do |value|
      fail 'dscmeta_module_version is read-only' if value != '2.7.0.0'
    end

    defaultto '2.7.0.0'
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         ForestFQDN
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_forestfqdn) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ForestFQDN"
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
    desc "EnterpriseAdministratorCredential"
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
    desc "RecycleBinEnabled"
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
    desc "ForestMode"
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
