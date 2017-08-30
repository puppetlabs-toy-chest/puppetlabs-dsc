require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserverscript) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSQLServerScript resource type.
    Automatically generated from
    'xSQLServer/DSCResources/MSFT_xSQLServerScript/MSFT_xSQLServerScript.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_serverinstance is a required attribute') if self[:dsc_serverinstance].nil?
      fail('dsc_setfilepath is a required attribute') if self[:dsc_setfilepath].nil?
      fail('dsc_getfilepath is a required attribute') if self[:dsc_getfilepath].nil?
      fail('dsc_testfilepath is a required attribute') if self[:dsc_testfilepath].nil?
    end

  def dscmeta_resource_friendly_name; 'xSQLServerScript' end
  def dscmeta_resource_name; 'MSFT_xSQLServerScript' end
  def dscmeta_module_name; 'xSQLServer' end
  def dscmeta_module_version; '7.0.0.0' end

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

  # Name:         ServerInstance
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_serverinstance) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerInstance - The name of an instance of the Database Engine. For a default instance, only specify the computer name. For a named instance, use the format ComputerName\\InstanceName"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SetFilePath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_setfilepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SetFilePath - Path to the T-SQL file that will perform Set action."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         GetFilePath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_getfilepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "GetFilePath - Path to the T-SQL file that will perform Get action. Any values returned by the T-SQL queries will also be returned by the cmdlet Get-DscConfiguration through the 'GetResult' property."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TestFilePath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_testfilepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TestFilePath - Path to the T-SQL file that will perform Test action. Any script that does not throw an error or returns null is evaluated to true. The cmdlet Invoke-SqlCmd treats T-SQL Print statements as verbose text, and will not cause the test to return false."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential - The credentials to authenticate with, using SQL Authentication. To authenticate using Windows Authentication, assign the credentials to the built-in parameter 'PsDscRunAsCredential'. If both parameters 'Credential' and 'PsDscRunAsCredential' are not assigned, then SYSTEM account will be used to authenticate using Windows Authentication."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         Variable
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_variable, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Variable - Specifies, as a string array, a sqlcmd scripting variable for use in the sqlcmd script, and sets a value for the variable. Use a Windows PowerShell array to specify multiple variables and their values. For more information how to use this, please go to the help documentation for Invoke-Sqlcmd."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         GetResult
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_getresult, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "GetResult - Contains the values returned from the T-SQL script provided in the parameter 'GetFilePath' when cmdlet Get-DscConfiguration is run."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xsqlserverscript).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
