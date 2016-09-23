require 'pathname'

Puppet::Type.newtype(:dsc_xscvmmmanagementserversetup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSCVMMManagementServerSetup resource type.
    Automatically generated from
    'xSCVMM/DSCResources/MSFT_xSCVMMManagementServerSetup/MSFT_xSCVMMManagementServerSetup.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xSCVMMManagementServerSetup' end
  def dscmeta_resource_name; 'MSFT_xSCVMMManagementServerSetup' end
  def dscmeta_module_name; 'xSCVMM' end
  def dscmeta_module_version; '1.2.4.0' end

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
    desc "Ensure - An enumerated value that describes if the DPM server is expected to be installed on the machine.\nPresent {default}  \nAbsent   \n Valid values are Present, Absent."
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

  # Name:         vmmService
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_vmmservice) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "vmmService - Domain account for the VMM service."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("vmmService", value)
    end
  end

  # Name:         vmmServiceUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_vmmserviceusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "vmmServiceUsername - Output username of the VMM service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProductKey
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_productkey) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProductKey - Product key for licensed installations."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UserName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_username) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UserName - Display name for the user."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CompanyName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_companyname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CompanyName - Display name for the organization."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProgramFiles
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_programfiles) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProgramFiles - Installation path for the software."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ClusterManagementServer
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_clustermanagementserver) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ClusterManagementServer - Is this a clustered Management Server?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         FirstManagementServer
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_firstmanagementserver) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "FirstManagementServer - Is this the first Management Server?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CreateNewSqlDatabase
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_createnewsqldatabase) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CreateNewSqlDatabase - 0: Use an existing Microsoft SQL Server database. 1: Create a new SQL Server database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlMachineName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlmachinename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlMachineName - Name of the server that is hosting SQL Server."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlInstanceName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlinstancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlInstanceName - Name of the new or existing instance of SQL Server."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlDatabaseName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqldatabasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlDatabaseName - Name of the new or existing SQL Server database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IndigoTcpPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_indigotcpport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "IndigoTcpPort - Port for communication with the VMM console."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         IndigoHTTPSPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_indigohttpsport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "IndigoHTTPSPort - Port for communication with the Windows Preinstallation Environment agents."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         IndigoNETTCPPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_indigonettcpport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "IndigoNETTCPPort - Port for communication with Windows Deployment Services."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         IndigoHTTPPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_indigohttpport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "IndigoHTTPPort - Port for communication with Windows PE agent for time synchronization."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         WSManTcpPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_wsmantcpport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "WSManTcpPort - Port for communication with agents on hosts and library servers."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         BitsTcpPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_bitstcpport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "BitsTcpPort - Port for file transfers to agents on hosts and library servers."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         CreateNewLibraryShare
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_createnewlibraryshare) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CreateNewLibraryShare - 0: Use an existing library share. 1: Create a new library share."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LibraryShareName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_librarysharename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LibraryShareName - Name of the file share to be used or created."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LibrarySharePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_librarysharepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LibrarySharePath - Location of the existing file share or the new file share to be created."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LibraryShareDescription
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_librarysharedescription) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LibraryShareDescription - Description of the share."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TopContainerName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_topcontainername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TopContainerName - Container for Distributed Key Management."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         VmmServerName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_vmmservername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VmmServerName - Clustered service name for a highly available VMM management server."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         VMMStaticIPAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_vmmstaticipaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VMMStaticIPAddress - IP address for the clustered service name for a highly available VMM management server, if you are not using Dynamic Host Configuration Protocol (DHCP)."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RetainSqlDatabase
  # Type:         uint8
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_retainsqldatabase) do
    def mof_type; 'uint8' end
    def mof_is_embedded?; false end
    desc "RetainSqlDatabase - 0: Remove the SQL Server database. 1: Do not remove the SQL Server database."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ForceHAVMMUninstall
  # Type:         uint8
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_forcehavmmuninstall) do
    def mof_type; 'uint8' end
    def mof_is_embedded?; false end
    desc "ForceHAVMMUninstall - 0: Do not force uninstallation if setup.exe cannot verify whether this node is the final node of the highly available installation. 1: Force the uninstallation."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SQMOptIn
  # Type:         uint8
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqmoptin) do
    def mof_type; 'uint8' end
    def mof_is_embedded?; false end
    desc "SQMOptIn - 0: Do not opt in to the Customer Experience Improvement Program (CEIP). 1: Opt in to CEIP."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MUOptIn
  # Type:         uint8
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_muoptin) do
    def mof_type; 'uint8' end
    def mof_is_embedded?; false end
    desc "MUOptIn - 0: Do not opt in to Microsoft Update. 1: Opt in to Microsoft Update."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xscvmmmanagementserversetup).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
