require 'pathname'

Puppet::Type.newtype(:dsc_xscommanagementserversetup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSCOMManagementServerSetup resource type.
    Automatically generated from
    'xSCOM/DSCResources/MSFT_xSCOMManagementServerSetup/MSFT_xSCOMManagementServerSetup.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xSCOMManagementServerSetup' end
  def dscmeta_resource_name; 'MSFT_xSCOMManagementServerSetup' end
  def dscmeta_module_name; 'xSCOM' end
  def dscmeta_module_version; '1.3.3.0' end

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
    desc "Ensure - An enumerated value that describes if the OM management server is expected to be installed on the machine.\nPresent {default}  \nAbsent   \n Valid values are Present, Absent."
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

  # Name:         InstallPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstallPath - Installation path for the software."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ManagementGroupName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_managementgroupname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ManagementGroupName - The name of the management group."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
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

  # Name:         ManagementServicePort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_managementserviceport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "ManagementServicePort - Change the Management Server port on install."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ActionAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_actionaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "ActionAccount - The domain and user name of the Management server action account."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("ActionAccount", value)
    end
  end

  # Name:         ActionAccountUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_actionaccountusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ActionAccountUsername - Output username of the Management server action account."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DASAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dasaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "DASAccount - The domain and user name of the Data Access service account."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("DASAccount", value)
    end
  end

  # Name:         DASAccountUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dasaccountusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DASAccountUsername - Output username of the Data Access service account."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DataReader
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_datareader) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "DataReader - The domain and user name of the data reader account."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("DataReader", value)
    end
  end

  # Name:         DataReaderUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_datareaderusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DataReaderUsername - Output username of the data reader account."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DataWriter
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_datawriter) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "DataWriter - The domain and user name of the data Writer account."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("DataWriter", value)
    end
  end

  # Name:         DataWriterUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_datawriterusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DataWriterUsername - Output username of the data writer account."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlServerInstance
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlserverinstance) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlServerInstance - The SQL server and instance."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseName - The name of the Operational database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseSize
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasesize) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "DatabaseSize - The size in MB of the Operational database."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DwSqlServerInstance
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dwsqlserverinstance) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DwSqlServerInstance - The data warehouse server and instance."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DwDatabaseName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dwdatabasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DwDatabaseName - The name of the data warehouse database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DwDatabaseSize
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dwdatabasesize) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "DwDatabaseSize - The size in MB of the data warehouse database."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         UseMicrosoftUpdate
  # Type:         uint8
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usemicrosoftupdate) do
    def mof_type; 'uint8' end
    def mof_is_embedded?; false end
    desc "UseMicrosoftUpdate - 0: Do not opt in to Microsoft Update. 1: Opt in to Microsoft Update."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SendCEIPReports
  # Type:         uint8
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sendceipreports) do
    def mof_type; 'uint8' end
    def mof_is_embedded?; false end
    desc "SendCEIPReports - 0: Do not opt in to the Customer Experience Improvement Program (CEIP). 1: Opt in to CEIP."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EnableErrorReporting
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Never", "Queued", "Always"]
  newparam(:dsc_enableerrorreporting) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EnableErrorReporting - Never: Do not opt in to sending automatic error reports. Queued: Opt in to sending error reports, but queue the reports for review before sending. Always: Opt in to automatically send error reports. Valid values are Never, Queued, Always."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Never', 'never', 'Queued', 'queued', 'Always', 'always'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Never, Queued, Always")
      end
    end
  end

  # Name:         SendODRReports
  # Type:         uint8
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sendodrreports) do
    def mof_type; 'uint8' end
    def mof_is_embedded?; false end
    desc "SendODRReports - 0: Do not opt in to sending operational data reports. 1: opt in to sending operational data reports."
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

Puppet::Type.type(:dsc_xscommanagementserversetup).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
