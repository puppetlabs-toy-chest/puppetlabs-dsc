require 'pathname'

Puppet::Type.newtype(:dsc_xdatabaseserver) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDatabaseServer resource type.
    Automatically generated from
    'xDatabase/DSCResources/MSFT_xDatabaseServer/MSFT_xDatabaseServer.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_loginmode is a required attribute') if self[:dsc_loginmode].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xDatabaseServer')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xDatabaseServer'
    end

    defaultto 'xDatabaseServer'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xDatabaseServer')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xDatabaseServer'
    end

    defaultto 'MSFT_xDatabaseServer'
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
    desc "A read-only value that is the DSC Module Name ('xDatabase')."

    validate do |value|
      fail 'dscmeta_module_name is read-only' if value != 'xDatabase'
    end

    defaultto 'xDatabase'
  end

  newparam(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.4.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    validate do |value|
      fail 'dscmeta_module_version is read-only' if value != '1.4.0.0'
    end

    defaultto '1.4.0.0'
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         LoginMode
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Windows", "Mixed"]
  newparam(:dsc_loginmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LoginMode - Valid values are Windows, Mixed."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Windows', 'windows', 'Mixed', 'mixed'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Windows, Mixed")
      end
    end
  end


end

Puppet::Type.type(:dsc_xdatabaseserver).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
