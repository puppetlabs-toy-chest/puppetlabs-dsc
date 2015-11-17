require 'pathname'

Puppet::Type.newtype(:dsc_xdatabaselogin) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDatabaseLogin resource type.
    Automatically generated from
    'xDatabase/DSCResources/MSFT_xDatabaseLogin/MSFT_xDatabaseLogin.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_loginname is a required attribute') if self[:dsc_loginname].nil?
    end

  newproperty(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xDatabaseLogin')."

    def retrieve
      'xDatabaseLogin'
    end

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only'
    end
  end

  newproperty(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xDatabaseLogin')."

    def retrieve
      'MSFT_xDatabaseLogin'
    end

    validate do |value|
      fail 'dscmeta_resource_name is read-only'
    end
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

  newproperty(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xDatabase')."

    def retrieve
      'xDatabase'
    end

    validate do |value|
      fail 'dscmeta_module_name is read-only'
    end
  end

  newproperty(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.4.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    def retrieve
      '1.4.0.0'
    end

    validate do |value|
      fail 'dscmeta_module_version is read-only'
    end
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Valid values are Present, Absent."
    validate do |value|
      resource[:ensure] = value.downcase
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Present', 'present', 'Absent', 'absent'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Present, Absent")
      end
    end
  end

  # Name:         LoginName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_loginname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LoginName"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LoginPassword
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_loginpassword) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LoginPassword"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlAuthType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Windows", "SQL"]
  newparam(:dsc_sqlauthtype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlAuthType - Valid values are Windows, SQL."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Windows', 'windows', 'SQL', 'sql'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Windows, SQL")
      end
    end
  end

  # Name:         SqlServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlServer - Sql Server Name"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlConnectionCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlconnectioncredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SqlConnectionCredential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SqlConnectionCredential", value)
    end
  end


end

Puppet::Type.type(:dsc_xdatabaselogin).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
