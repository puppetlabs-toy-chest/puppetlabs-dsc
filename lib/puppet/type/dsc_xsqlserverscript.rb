require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserverscript) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSQLServerScript resource type.
    Automatically generated from
    'xSQLServer/DSCResources/MSFT_xSQLServerScript/MSFT_xSQLServerScript.Schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_setfilepath is a required attribute') if self[:dsc_setfilepath].nil?
      fail('dsc_getfilepath is a required attribute') if self[:dsc_getfilepath].nil?
      fail('dsc_testfilepath is a required attribute') if self[:dsc_testfilepath].nil?
    end

  def dscmeta_resource_friendly_name; 'xSQLServerScript' end
  def dscmeta_resource_name; 'MSFT_xSQLServerScript' end
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

  # Name:         ServerInstance
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serverinstance) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerInstance - The name of an instance of the Database Engine. For default instances, only specify the computer name. For named instances, use the format ComputerName\\InstanceName"
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
    desc "SetFilePath - Path to SQL file that will perform Set action."
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
    desc "GetFilePath - Path to SQL file that will perform Get action."
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
    desc "TestFilePath - Path to SQL file that will perform Test action."
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
    desc "Credential - Credential to be used to run SQL scripts."
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
    desc "Variable - Creates a sqlcmd scripting variable for use in the sqlcmd script, and sets a value for the variable."
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
    desc "GetResult - Result of Get action."
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
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
