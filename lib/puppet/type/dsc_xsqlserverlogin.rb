require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserverlogin) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSQLServerLogin resource type.
    Automatically generated from
    'xSQLServer/DSCResources/MSFT_xSQLServerLogin/MSFT_xSQLServerLogin.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_sqlserver is a required attribute') if self[:dsc_sqlserver].nil?
      fail('dsc_sqlinstancename is a required attribute') if self[:dsc_sqlinstancename].nil?
    end

  def dscmeta_resource_friendly_name; 'xSQLServerLogin' end
  def dscmeta_resource_name; 'MSFT_xSQLServerLogin' end
  def dscmeta_module_name; 'xSQLServer' end
  def dscmeta_module_version; '7.0.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
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

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - The specified login is Present or Absent. Default is Present. Valid values are Present, Absent."
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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of the login."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LoginType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["WindowsUser", "WindowsGroup", "SqlLogin", "Certificate", "AsymmetricKey", "ExternalUser", "ExternalGroup"]
  newparam(:dsc_logintype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LoginType - The type of login to be created. If LoginType is 'WindowsUser' or 'WindowsGroup' then provide the name in the format DOMAIN\name. Default is WindowsUser. Unsupported login types are Certificate, AsymmetricKey, ExternalUser, and ExternalGroup. Valid values are WindowsUser, WindowsGroup, SqlLogin, Certificate, AsymmetricKey, ExternalUser, ExternalGroup."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['WindowsUser', 'windowsuser', 'WindowsGroup', 'windowsgroup', 'SqlLogin', 'sqllogin', 'Certificate', 'certificate', 'AsymmetricKey', 'asymmetrickey', 'ExternalUser', 'externaluser', 'ExternalGroup', 'externalgroup'].include?(value)
        fail("Invalid value '#{value}'. Valid values are WindowsUser, WindowsGroup, SqlLogin, Certificate, AsymmetricKey, ExternalUser, ExternalGroup")
      end
    end
  end

  # Name:         SQLServer
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_sqlserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLServer - The hostname of the SQL Server to be configured."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLInstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_sqlinstancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLInstanceName - Name of the SQL instance to be configured."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LoginCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logincredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "LoginCredential - If LoginType is 'SqlLogin' then a PSCredential is needed for the password to the login."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("LoginCredential", value)
    end
  end

  # Name:         LoginMustChangePassword
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_loginmustchangepassword) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "LoginMustChangePassword - Specifies if the login is required to have its password change on the next login. Only applies to SQL Logins. Default is $true."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         LoginPasswordExpirationEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_loginpasswordexpirationenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "LoginPasswordExpirationEnabled - Specifies if the login password is required to expire in accordance to the operating system security policy. Only applies to SQL Logins. Default is $true."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         LoginPasswordPolicyEnforced
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_loginpasswordpolicyenforced) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "LoginPasswordPolicyEnforced - Specifies if the login password is required to conform to the password policy specified in the system security policy. Only applies to SQL Logins. Default is $true."
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

Puppet::Type.type(:dsc_xsqlserverlogin).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
