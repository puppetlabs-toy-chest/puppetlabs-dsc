require 'pathname'

Puppet::Type.newtype(:dsc_xscsrserversetup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSCSRServerSetup resource type.
    Automatically generated from
    'xSCSR/DSCResources/MSFT_xSCSRServerSetup/MSFT_xSCSRServerSetup.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_ensure is a required attribute') if self[:dsc_ensure].nil?
    end

  def dscmeta_resource_friendly_name; 'xSCSRServerSetup' end
  def dscmeta_resource_name; 'MSFT_xSCSRServerSetup' end
  def dscmeta_module_name; 'xSCSR' end
  def dscmeta_module_version; '1.3.0.0' end

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
  # IsMandatory:  True
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - An enumerated value that describes if the Service Reporting server is expected to be installed on the machine.\nPresent {default}  \nAbsent   \n Valid values are Present, Absent."
    isrequired
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

  # Name:         SendCEIPReports
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Yes", "No"]
  newparam(:dsc_sendceipreports) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SendCEIPReports - Participation in Customer Experience Improvement Program (yes or no). Valid values are Yes, No."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Yes', 'yes', 'No', 'no'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Yes, No")
      end
    end
  end

  # Name:         UseMicrosoftUpdate
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Yes", "No"]
  newparam(:dsc_usemicrosoftupdate) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UseMicrosoftUpdate - Participation in Microsoft Update (yes or no). Valid values are Yes, No."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Yes', 'yes', 'No', 'no'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Yes, No")
      end
    end
  end

  # Name:         InstallFolder
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installfolder) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstallFolder - Folder to install to."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databaseserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseServer - Name of the server that is running SQL Server where the databases already exist, or where Setup will create them ."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseServerInstance
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databaseserverinstance) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseServerInstance - Name of the SQL Server database instance to install to."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RepositoryDatabaseName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_repositorydatabasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RepositoryDatabaseName - Name of the usage repository database that already exists, or that Setup will create."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StagingDatabaseName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_stagingdatabasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StagingDatabaseName - Name of the usage staging database that already exists, or that Setup will create."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DWDatabaseName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dwdatabasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DWDatabaseName - Name of the usage data warehouse database that already exists, or that Setup will create."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AnalysisDatabaseServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_analysisdatabaseserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AnalysisDatabaseServer - Name of the server that is running SQL Server where the analysis database already exists, or where Setup will create it."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AnalysisDatabaseServerInstance
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_analysisdatabaseserverinstance) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AnalysisDatabaseServerInstance - Name of the SQL Server analysis database instance to install to."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AnalysisDatabaseName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_analysisdatabasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AnalysisDatabaseName - Name of the analysis database that already exists, or that Setup will create."
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

Puppet::Type.type(:dsc_xscsrserversetup).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
