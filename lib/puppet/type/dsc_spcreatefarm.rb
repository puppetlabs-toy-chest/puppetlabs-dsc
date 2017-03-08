require 'pathname'

Puppet::Type.newtype(:dsc_spcreatefarm) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPCreateFarm resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPCreateFarm/MSFT_SPCreateFarm.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPCreateFarm' end
  def dscmeta_resource_name; 'MSFT_SPCreateFarm' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.5.0.0' end

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

  # Name:         FarmConfigDatabaseName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_farmconfigdatabasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FarmConfigDatabaseName - Name of the configuration database"
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
    desc "DatabaseServer - Server that will host the configuration and admin content databases"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FarmAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_farmaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "FarmAccount - The account to use as the main farm account"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("FarmAccount", value)
    end
  end

  # Name:         Passphrase
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_passphrase) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Passphrase - The passphrase to use to allow servers to join this farm"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Passphrase", value)
    end
  end

  # Name:         AdminContentDatabaseName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_admincontentdatabasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AdminContentDatabaseName - The name of the admin content database"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CentralAdministrationPort
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_centraladministrationport) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "CentralAdministrationPort - What port will Central Admin be provisioned to - default is 9999"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         CentralAdministrationAuth
  # Type:         string
  # IsMandatory:  False
  # Values:       ["NTLM", "Kerberos"]
  newparam(:dsc_centraladministrationauth) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CentralAdministrationAuth - The authentication provider of the CentralAdministration web application Valid values are NTLM, Kerberos."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['NTLM', 'ntlm', 'Kerberos', 'kerberos'].include?(value)
        fail("Invalid value '#{value}'. Valid values are NTLM, Kerberos")
      end
    end
  end

  # Name:         ServerRole
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Application", "ApplicationWithSearch", "Custom", "DistributedCache", "Search", "SingleServer", "SingleServerFarm", "WebFrontEnd", "WebFrontEndWithDistributedCache"]
  newparam(:dsc_serverrole) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerRole - SharePoint 2016 only - the MinRole role to enroll this server as Valid values are Application, ApplicationWithSearch, Custom, DistributedCache, Search, SingleServer, SingleServerFarm, WebFrontEnd, WebFrontEndWithDistributedCache."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Application', 'application', 'ApplicationWithSearch', 'applicationwithsearch', 'Custom', 'custom', 'DistributedCache', 'distributedcache', 'Search', 'search', 'SingleServer', 'singleserver', 'SingleServerFarm', 'singleserverfarm', 'WebFrontEnd', 'webfrontend', 'WebFrontEndWithDistributedCache', 'webfrontendwithdistributedcache'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Application, ApplicationWithSearch, Custom, DistributedCache, Search, SingleServer, SingleServerFarm, WebFrontEnd, WebFrontEndWithDistributedCache")
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
    desc "InstallAccount - POWERSHELL 4 ONLY: The account to run this resource as, use PsDscRunAsCredential if using PowerShell 5"
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

Puppet::Type.type(:dsc_spcreatefarm).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
