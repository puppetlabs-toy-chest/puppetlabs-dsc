require 'pathname'

Puppet::Type.newtype(:dsc_spsecurestoreserviceapp) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPSecureStoreServiceApp resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPSecureStoreServiceApp/MSFT_SPSecureStoreServiceApp.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  def dscmeta_resource_friendly_name; 'SPSecureStoreServiceApp' end
  def dscmeta_resource_name; 'MSFT_SPSecureStoreServiceApp' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.5.0.0' end

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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of the secure store service app"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProxyName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_proxyname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProxyName - The proxy name, if not specified will be /Name of service app/ Proxy"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ApplicationPool
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_applicationpool) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ApplicationPool - The name of the application pool it will run in"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AuditingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_auditingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AuditingEnabled - Is auditing enabled for this service app"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AuditlogMaxSize
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_auditlogmaxsize) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "AuditlogMaxSize - What is the maximum size of the audit log in MB"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DatabaseCredentials
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasecredentials) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "DatabaseCredentials - What SQL credentials should be used to access the database"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("DatabaseCredentials", value)
    end
  end

  # Name:         DatabaseName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseName - The name of the database for the service app"
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
    desc "DatabaseServer - The name of the database server to host the database"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseAuthenticationType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Windows", "SQL"]
  newparam(:dsc_databaseauthenticationtype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseAuthenticationType - What type of authentication should be used to access the database Valid values are Windows, SQL."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Windows', 'windows', 'SQL', 'sql'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Windows, SQL")
      end
    end
  end

  # Name:         FailoverDatabaseServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_failoverdatabaseserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FailoverDatabaseServer - The name of the database server hosting a failover instance of the database"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PartitionMode
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_partitionmode) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "PartitionMode - Is partition mode enabled for this service app"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Sharing
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sharing) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Sharing - Is sharing enabled for this service app"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Present if the service app should exist, absent if it should not Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_spsecurestoreserviceapp).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
