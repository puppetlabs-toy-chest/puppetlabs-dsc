require 'pathname'

Puppet::Type.newtype(:dsc_xaddomain) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xADDomain resource type.
    Automatically generated from
    'xActiveDirectory/DSCResources/MSFT_xADDomain/MSFT_xADDomain.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_domainname is a required attribute') if self[:dsc_domainname].nil?
    end

  def dscmeta_resource_friendly_name; 'xADDomain' end
  def dscmeta_resource_name; 'MSFT_xADDomain' end
  def dscmeta_module_name; 'xActiveDirectory' end
  def dscmeta_module_version; '2.14.0.0' end

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

  # Name:         DomainName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_domainname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainName - Name of the domain to which the user will be added"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DomainAdministratorCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domainadministratorcredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "DomainAdministratorCredential - Credentials used to query for domain existence"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("DomainAdministratorCredential", value)
    end
  end

  # Name:         SafemodeAdministratorPassword
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_safemodeadministratorpassword) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SafemodeAdministratorPassword - Password for the administrator account when the computer is started in Safe Mode"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SafemodeAdministratorPassword", value)
    end
  end

  # Name:         ParentDomainName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_parentdomainname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ParentDomainName - Fully qualified name of the parent domain"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DomainNetbiosName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domainnetbiosname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainNetbiosName - NetBIOS name for the new domain"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DnsDelegationCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dnsdelegationcredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "DnsDelegationCredential - Credential used for creating DNS delegation"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("DnsDelegationCredential", value)
    end
  end

  # Name:         DatabasePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabasePath - Path to a directory that contains the domain database"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogPath - Path to a directory for the log file that will be written"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SysvolPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sysvolpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SysvolPath - Path to a directory where the Sysvol file will be written"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xaddomain).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
