require 'pathname'

Puppet::Type.newtype(:dsc_xexchjetstresscleanup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchJetstressCleanup resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchJetstressCleanup/MSFT_xExchJetstressCleanup.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_jetstresspath is a required attribute') if self[:dsc_jetstresspath].nil?
    end

  def dscmeta_resource_friendly_name; 'xExchJetstressCleanup' end
  def dscmeta_resource_name; 'MSFT_xExchJetstressCleanup' end
  def dscmeta_module_name; 'xExchange' end
  def dscmeta_module_version; '1.11.0.0' end

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

  # Name:         JetstressPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_jetstresspath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "JetstressPath - The path to the folder where Jetstress is installed, and which contains JetstressCmd.exe"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConfigFilePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_configfilepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConfigFilePath - Either ConfigFilePath, or DatabasePaths AND LogPaths MUST be specified. ConfigFilePath takes precedence. This is the full path to the JetstressConfig.xml file. If ConfigFilePath is specified, the config file will be used to determine the database and log folders that need to be removed"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabasePaths
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasepaths, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "DatabasePaths - Either ConfigFilePath, or DatabasePaths AND LogPaths MUST be specified. DatabasePaths specifies the paths to database directories that should be cleaned up."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         DeleteAssociatedMountPoints
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_deleteassociatedmountpoints) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DeleteAssociatedMountPoints - Defaults to $false. If specified, indicates that mount points associated with the Jetstress database and log paths should be removed"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         LogPaths
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logpaths, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "LogPaths - Either ConfigFilePath, or DatabasePaths AND LogPaths MUST be specified. LogPaths specifies the paths to log directories that should be cleaned up."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         OutputSaveLocation
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_outputsavelocation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "OutputSaveLocation - If RemoveBinaries is set to $true and Jetstress output was saved to the default location (the installation path of Jetstress), specifies the folder path to copy the Jetstress output files to."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RemoveBinaries
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_removebinaries) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RemoveBinaries - Specifies that the files in the Jetstress installation directory should be removed"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xexchjetstresscleanup).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
