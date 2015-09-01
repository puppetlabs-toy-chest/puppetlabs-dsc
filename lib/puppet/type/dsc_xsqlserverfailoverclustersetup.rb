require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserverfailoverclustersetup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSQLServerFailoverClusterSetup resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSQLServer/DSCResources/MSFT_xSQLServerFailoverClusterSetup/MSFT_xSQLServerFailoverClusterSetup.schema.mof
  }

  validate do
      fail('dsc_action is a required attribute') if self[:dsc_action].nil?
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSQLServerFailoverClusterSetup"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSQLServerFailoverClusterSetup"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSQLServer"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.3.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Action
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Prepare", "Complete"]
  newparam(:dsc_action) do
    desc "Prepare or Complete."
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
    desc "UNC path to the root of the source files for installation."
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
    desc "Folder within the source path containing the source files for installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SetupCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_setupcredential) do
    desc "Credential to be used to perform the installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Features
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_features) do
    desc "SQL features to be installed."
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
    desc "SQL instance to be installed."
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
    desc "SQL instance ID, if different from InstanceName."
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
    desc "Product key for licensed installations."
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
    desc "Enabled updates during installation."
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
    desc "Source of updates to be applied during installation."
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
    desc "Enable customer experience reporting."
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
    desc "Enable error reporting."
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
    desc "Name of the resource group to be used for the SQL Server failover cluster."
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
    desc "Network name for the SQL Server failover cluster."
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
    desc "IPv4 address for the SQL Server failover cluster."
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
    desc "Installation path for shared SQL files."
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
    desc "Installation path for x86 shared SQL files."
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
    desc "Installation path for SQL instance files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLSvcAccount
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlsvcaccount) do
    desc "Service account for the SQL service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLSvcAccountUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlsvcaccountusername) do
    desc "Output username for the SQL service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AgtSvcAccount
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_agtsvcaccount) do
    desc "Service account for the SQL Agent service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AgtSvcAccountUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_agtsvcaccountusername) do
    desc "Output username for the SQL Agent service."
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
    desc "Collation for SQL."
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
    desc "Array of accounts to be made SQL administrators."
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
    desc "Security mode."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SAPwd
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sapwd) do
    desc "SA password, if SecurityMode=SQL"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstallSQLDataDir
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installsqldatadir) do
    desc "Root path for SQL database files."
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
    desc "Path for SQL database files."
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
    desc "Path for SQL log files."
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
    desc "Path for SQL TempDB files."
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
    desc "Path for SQL TempDB log files."
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
    desc "Path for SQL backup files."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ASSvcAccount
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_assvcaccount) do
    desc "Service account for Analysus Services service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ASSvcAccountUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_assvcaccountusername) do
    desc "Output username for the Analysis Services service."
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
    desc "Collation for Analysis Services."
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
    desc "Array of accounts to be made Analysis Services admins."
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
    desc "Path for Analysis Services data files."
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
    desc "Path for Analysis Services log files."
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
    desc "Path for Analysis Services backup files."
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
    desc "Path for Analysis Services temp files."
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
    desc "Path for Analysis Services config."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ISSvcAccount
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_issvcaccount) do
    desc "Service account for Integration Services service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ISSvcAccountUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_issvcaccountusername) do
    desc "Output username for the Integration Services service."
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
    desc "File system folder for Integration Services."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
