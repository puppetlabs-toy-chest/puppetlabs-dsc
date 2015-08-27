require 'pathname'

Puppet::Type.newtype(:dsc_xscvmmmanagementserversetup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows

    def ensure_value
        'present'
    end

    def absent_value
        'absent'
    end

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
      provider.munge_boolean(value.to_s)
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
    defaultto :present
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    desc "An enumerated value that describes if the DPM server is expected to be installed on the machine.\nPresent {default}  \nAbsent   \n"
    isrequired
    validate do |value|
      resource[:ensure] = provider.munge_ensure(value.downcase)
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

  # Name:         vmmService
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_vmmservice) do
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
    desc "Is this a clustered Management Server?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         FirstManagementServer
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_firstmanagementserver) do
    desc "Is this the first Management Server?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         CreateNewSqlDatabase
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_createnewsqldatabase) do
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
