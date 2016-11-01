require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserverinstall) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSqlServerInstall resource type.
    Automatically generated from
    'xSqlPs/DSCResources/MSFT_xSqlServerInstall/MSFT_xSqlServerInstall.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
    end

  def dscmeta_resource_friendly_name; 'xSqlServerInstall' end
  def dscmeta_resource_name; 'MSFT_xSqlServerInstall' end
  def dscmeta_module_name; 'xSqlPs' end
  def dscmeta_module_version; '1.4.0.0' end

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

  # Name:         InstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_instancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceName - The name of sql instance."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SourcePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sourcepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SourcePath - The share path of sql server software."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         VersionID
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_versionid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VersionID - The numeric version identifier for the instance to be installed"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SourcePathCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sourcepathcredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SourcePathCredential - The credential that vm could use to access net share of sql server software."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SourcePathCredential", value)
    end
  end

  # Name:         Features
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_features) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Features - List of names of Sql Server features to install"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlAdministratorCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqladministratorcredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SqlAdministratorCredential - Sql sa credential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SqlAdministratorCredential", value)
    end
  end

  # Name:         UpdateEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_updateenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UpdateEnabled - Specify whether SQL server setup should discover and include product updates."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SvcAccount
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_svcaccount) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SvcAccount - Specify the startup account for the SQL server service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SysAdminAccounts
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sysadminaccounts) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SysAdminAccounts - Specify logins to be members of the sysadmin role."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AgentSvcAccount
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_agentsvcaccount) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AgentSvcAccount - Specify the account for SQL server agent service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlCollation
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlcollation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlCollation - Specify the default collation for SQL server"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstallSqlDataDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installsqldatadir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstallSqlDataDir - Specify the directory for SQL server system db files"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlTempDBDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqltempdbdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlTempDBDir - Specify the directory for TempDB files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlUserDBDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqluserdbdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlUserDBDir - Specify the directory for UserDB data files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlUserDBLogDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqluserdblogdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlUserDBLogDir - Specify the directory for UserDB log files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlBackupDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlbackupdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlBackupDir - Specify the directory for backup files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xsqlserverinstall).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
