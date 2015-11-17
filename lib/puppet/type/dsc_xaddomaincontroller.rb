require 'pathname'

Puppet::Type.newtype(:dsc_xaddomaincontroller) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xADDomainController resource type.
    Automatically generated from
    'xActiveDirectory/DSCResources/MSFT_xADDomainController/MSFT_xADDomainController.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_domainname is a required attribute') if self[:dsc_domainname].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xADDomainController')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xADDomainController'
    end

    defaultto 'xADDomainController'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xADDomainController')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xADDomainController'
    end

    defaultto 'MSFT_xADDomainController'
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

  # Name:         DomainName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_domainname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainName"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DomainAdministratorCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domainadministratorcredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "DomainAdministratorCredential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("DomainAdministratorCredential", value)
    end
  end

  # Name:         SafemodeAdministratorPassword
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_safemodeadministratorpassword) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SafemodeAdministratorPassword"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SafemodeAdministratorPassword", value)
    end
  end

  # Name:         DatabasePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabasePath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SysvolPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sysvolpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SysvolPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end

Puppet::Type.type(:dsc_xaddomaincontroller).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
