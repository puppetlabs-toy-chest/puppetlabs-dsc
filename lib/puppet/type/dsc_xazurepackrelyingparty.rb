require 'pathname'

Puppet::Type.newtype(:dsc_xazurepackrelyingparty) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xAzurePackRelyingParty resource type.
    Automatically generated from
    'xAzurePack/DSCResources/MSFT_xAzurePackRelyingParty/MSFT_xAzurePackRelyingParty.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_target is a required attribute') if self[:dsc_target].nil?
      fail('dsc_fullyqualifieddomainname is a required attribute') if self[:dsc_fullyqualifieddomainname].nil?
    end

  def dscmeta_resource_friendly_name; 'xAzurePackRelyingParty' end
  def dscmeta_resource_name; 'MSFT_xAzurePackRelyingParty' end
  def dscmeta_module_name; 'xAzurePack' end
  def dscmeta_module_version; '1.4.0.0' end

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

  # Name:         Target
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Admin", "Tenant"]
  newparam(:dsc_target) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Target - Specifies the target site. Valid values are Admin, Tenant."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Admin', 'admin', 'Tenant', 'tenant'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Admin, Tenant")
      end
    end
  end

  # Name:         FullyQualifiedDomainName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_fullyqualifieddomainname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FullyQualifiedDomainName - Specifies a Fully Qualified Domain Name (FQDN)."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Port
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_port) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "Port - Specifies a port number."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         AzurePackAdminCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_azurepackadmincredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "AzurePackAdminCredential - Credential to be used to perform the installation."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("AzurePackAdminCredential", value)
    end
  end

  # Name:         SQLServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLServer - Database server for the Azure Pack databases."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLInstance
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlinstance) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLInstance - Database instance for the Azure Pack databases."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         dbUser
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dbuser) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "dbUser - SQL user to be used to create the database if the SetupCredential cannot be used."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("dbUser", value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xazurepackrelyingparty).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
