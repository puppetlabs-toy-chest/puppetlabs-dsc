require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserverfailoverclustersetup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSQLServerFailoverClusterSetup resource type.
    Automatically generated from
    'xSQLServer/DSCResources/MSFT_xSQLServerFailoverClusterSetup/MSFT_xSQLServerFailoverClusterSetup.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_action is a required attribute') if self[:dsc_action].nil?
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
    end

  def dscmeta_resource_friendly_name; 'xSQLServerFailoverClusterSetup' end
  def dscmeta_resource_name; 'MSFT_xSQLServerFailoverClusterSetup' end
  def dscmeta_module_name; 'xSQLServer' end
  def dscmeta_module_version; '3.0.0.0' end

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

  # Name:         Action
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Prepare", "Complete"]
  newparam(:dsc_action) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Action - Prepare or Complete. Valid values are Prepare, Complete."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Prepare', 'prepare', 'Complete', 'complete'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Prepare, Complete")
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
    desc "SourcePath - UNC path to the root of the source files for installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SourceFolder
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sourcefolder) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SourceFolder - Folder within the source path containing the source files for installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SetupCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_setupcredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SetupCredential - Credential to be used to perform the installation."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SetupCredential", value)
    end
  end

  # Name:         SourceCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sourcecredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SourceCredential - Credential to be used to access SourcePath."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SourceCredential", value)
    end
  end

  # Name:         SuppressReboot
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_suppressreboot) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SuppressReboot - Suppress reboot."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ForceReboot
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_forcereboot) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ForceReboot - Force reboot."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Features
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_features) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Features - SQL features to be installed."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_instancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceName - SQL instance to be installed."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstanceID
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_instanceid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceID - SQL instance ID, if different from InstanceName."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PID
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PID - Product key for licensed installations."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UpdateEnabled
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_updateenabled) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UpdateEnabled - Enabled updates during installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UpdateSource
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_updatesource) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UpdateSource - Source of updates to be applied during installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQMReporting
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqmreporting) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQMReporting - Enable customer experience reporting."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ErrorReporting
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_errorreporting) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ErrorReporting - Enable error reporting."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FailoverClusterGroup
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_failoverclustergroup) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FailoverClusterGroup - Name of the resource group to be used for the SQL Server failover cluster."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FailoverClusterNetworkName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_failoverclusternetworkname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FailoverClusterNetworkName - Network name for the SQL Server failover cluster."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FailoverClusterIPAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_failoverclusteripaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FailoverClusterIPAddress - IPv4 address for the SQL Server failover cluster."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstallSharedDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installshareddir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstallSharedDir - Installation path for shared SQL files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstallSharedWOWDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installsharedwowdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstallSharedWOWDir - Installation path for x86 shared SQL files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstanceDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_instancedir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceDir - Installation path for SQL instance files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLSvcAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlsvcaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SQLSvcAccount - Service account for the SQL service."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SQLSvcAccount", value)
    end
  end

  # Name:         SQLSvcAccountUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlsvcaccountusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLSvcAccountUsername - Output username for the SQL service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AgtSvcAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_agtsvcaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "AgtSvcAccount - Service account for the SQL Agent service."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("AgtSvcAccount", value)
    end
  end

  # Name:         AgtSvcAccountUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_agtsvcaccountusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AgtSvcAccountUsername - Output username for the SQL Agent service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLCollation
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlcollation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLCollation - Collation for SQL."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLSysAdminAccounts
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlsysadminaccounts, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "SQLSysAdminAccounts - Array of accounts to be made SQL administrators."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         SecurityMode
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_securitymode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SecurityMode - Security mode."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SAPwd
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sapwd) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SAPwd - SA password, if SecurityMode=SQL"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SAPwd", value)
    end
  end

  # Name:         InstallSQLDataDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installsqldatadir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstallSQLDataDir - Root path for SQL database files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLUserDBDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqluserdbdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLUserDBDir - Path for SQL database files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLUserDBLogDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqluserdblogdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLUserDBLogDir - Path for SQL log files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLTempDBDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqltempdbdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLTempDBDir - Path for SQL TempDB files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLTempDBLogDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqltempdblogdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLTempDBLogDir - Path for SQL TempDB log files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLBackupDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlbackupdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLBackupDir - Path for SQL backup files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ASSvcAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_assvcaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "ASSvcAccount - Service account for Analysus Services service."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("ASSvcAccount", value)
    end
  end

  # Name:         ASSvcAccountUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_assvcaccountusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ASSvcAccountUsername - Output username for the Analysis Services service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ASCollation
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ascollation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ASCollation - Collation for Analysis Services."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ASSysAdminAccounts
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_assysadminaccounts, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ASSysAdminAccounts - Array of accounts to be made Analysis Services admins."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ASDataDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_asdatadir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ASDataDir - Path for Analysis Services data files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ASLogDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_aslogdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ASLogDir - Path for Analysis Services log files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ASBackupDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_asbackupdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ASBackupDir - Path for Analysis Services backup files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ASTempDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_astempdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ASTempDir - Path for Analysis Services temp files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ASConfigDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_asconfigdir) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ASConfigDir - Path for Analysis Services config."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ISSvcAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_issvcaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "ISSvcAccount - Service account for Integration Services service."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("ISSvcAccount", value)
    end
  end

  # Name:         ISSvcAccountUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_issvcaccountusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ISSvcAccountUsername - Output username for the Integration Services service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ISFileSystemFolder
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isfilesystemfolder) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ISFileSystemFolder - File system folder for Integration Services."
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

Puppet::Type.type(:dsc_xsqlserverfailoverclustersetup).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
