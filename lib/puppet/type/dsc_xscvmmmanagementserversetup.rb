require 'pathname'

Puppet::Type.newtype(:dsc_xscvmmmanagementserversetup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSCVMMManagementServerSetup resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSCVMM/DSCResources/MSFT_xSCVMMManagementServerSetup/MSFT_xSCVMMManagementServerSetup.schema.mof
  }

  validate do
      fail('dsc_ensure is a required attribute') if self[:dsc_ensure].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSCVMMManagementServerSetup"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSCVMMManagementServerSetup"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSCVMM"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.2.4.0"
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
  # IsMandatory:  True
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "An enumerated value that describes if the DPM server is expected to be installed on the machine.\nPresent {default}  \nAbsent   \n"
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    def mof_type; 'string' end
    def mof_is_embedded?; true end
    desc "Credential to be used to perform the installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         vmmService
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_vmmservice) do
    def mof_type; 'string' end
    def mof_is_embedded?; true end
    desc "Domain account for the VMM service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         vmmServiceUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_vmmserviceusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Output username of the VMM service."
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
    desc "Product key for licensed installations."
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
    desc "Display name for the user."
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
    desc "Display name for the organization."
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
    desc "Installation path for the software."
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
    desc "Is this a clustered Management Server?"
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
    desc "Is this the first Management Server?"
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
    desc "0: Use an existing Microsoft SQL Server database. 1: Create a new SQL Server database."
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
    desc "Name of the server that is hosting SQL Server."
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
    desc "Name of the new or existing instance of SQL Server."
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
    desc "Name of the new or existing SQL Server database."
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
    desc "Port for communication with the VMM console."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         IndigoHTTPSPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_indigohttpsport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "Port for communication with the Windows Preinstallation Environment agents."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         IndigoNETTCPPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_indigonettcpport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "Port for communication with Windows Deployment Services."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         IndigoHTTPPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_indigohttpport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "Port for communication with Windows PE agent for time synchronization."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         WSManTcpPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_wsmantcpport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "Port for communication with agents on hosts and library servers."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         BitsTcpPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_bitstcpport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "Port for file transfers to agents on hosts and library servers."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         CreateNewLibraryShare
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_createnewlibraryshare) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "0: Use an existing library share. 1: Create a new library share."
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
    desc "Name of the file share to be used or created."
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
    desc "Location of the existing file share or the new file share to be created."
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
    desc "Description of the share."
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
    desc "Container for Distributed Key Management."
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
    desc "Clustered service name for a highly available VMM management server."
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
    desc "IP address for the clustered service name for a highly available VMM management server, if you are not using Dynamic Host Configuration Protocol (DHCP)."
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
    desc "0: Remove the SQL Server database. 1: Do not remove the SQL Server database."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         ForceHAVMMUninstall
  # Type:         uint8
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_forcehavmmuninstall) do
    def mof_type; 'uint8' end
    def mof_is_embedded?; false end
    desc "0: Do not force uninstallation if setup.exe cannot verify whether this node is the final node of the highly available installation. 1: Force the uninstallation."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         SQMOptIn
  # Type:         uint8
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqmoptin) do
    def mof_type; 'uint8' end
    def mof_is_embedded?; false end
    desc "0: Do not opt in to the Customer Experience Improvement Program (CEIP). 1: Opt in to CEIP."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         MUOptIn
  # Type:         uint8
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_muoptin) do
    def mof_type; 'uint8' end
    def mof_is_embedded?; false end
    desc "0: Do not opt in to Microsoft Update. 1: Opt in to Microsoft Update."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end


end
