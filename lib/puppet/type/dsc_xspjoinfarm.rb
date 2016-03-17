require 'pathname'

Puppet::Type.newtype(:dsc_xspjoinfarm) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSPJoinFarm resource type.
    Automatically generated from
    'xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPJoinFarm/MSFT_xSPJoinFarm.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_farmconfigdatabasename is a required attribute') if self[:dsc_farmconfigdatabasename].nil?
      fail('dsc_databaseserver is a required attribute') if self[:dsc_databaseserver].nil?
    end

  def dscmeta_resource_friendly_name; 'xSPJoinFarm' end
  def dscmeta_resource_name; 'MSFT_xSPJoinFarm' end
  def dscmeta_module_name; 'xSharePoint' end
  def dscmeta_module_version; '0.12.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         FarmConfigDatabaseName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_farmconfigdatabasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FarmConfigDatabaseName - The name of the config database to connect to"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseServer
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_databaseserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseServer - The server that hosts the config database"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Passphrase
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_passphrase) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Passphrase - The passphrase that should be used to join the farm"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServerRole
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Application", "Custom", "DistributedCache", "Search", "SingleServer", "SingleServerFarm", "SpecialLoad", "WebFrontEnd"]
  newparam(:dsc_serverrole) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerRole - SharePoint 2016 only - the MinRole role to enroll this server as Valid values are Application, Custom, DistributedCache, Search, SingleServer, SingleServerFarm, SpecialLoad, WebFrontEnd."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Application', 'application', 'Custom', 'custom', 'DistributedCache', 'distributedcache', 'Search', 'search', 'SingleServer', 'singleserver', 'SingleServerFarm', 'singleserverfarm', 'SpecialLoad', 'specialload', 'WebFrontEnd', 'webfrontend'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Application, Custom, DistributedCache, Search, SingleServer, SingleServerFarm, SpecialLoad, WebFrontEnd")
      end
    end
  end

  # Name:         InstallAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "InstallAccount - POWERSHELL 4 ONLY: The account to run this resource as, use PsDscRunAsAccount if using PowerShell 5"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("InstallAccount", value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xspjoinfarm).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
