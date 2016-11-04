require 'pathname'

Puppet::Type.newtype(:dsc_xexchmailboxserver) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchMailboxServer resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchMailboxServer/MSFT_xExchMailboxServer.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  def dscmeta_resource_friendly_name; 'xExchMailboxServer' end
  def dscmeta_resource_name; 'MSFT_xExchMailboxServer' end
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

  # Name:         Identity
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identity) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Identity - The Identity parameter specifies the Mailbox server that you want to modify."
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
    desc "Credential - Credentials used to establish a remote Powershell session to Exchange"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         DomainController
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domaincontroller) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainController - The DomainController parameter specifies the fully qualified domain name (FQDN) of the domain controller that writes this configuration change to Active Directory."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseCopyActivationDisabledAndMoveNow
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasecopyactivationdisabledandmovenow) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DatabaseCopyActivationDisabledAndMoveNow - The DatabaseCopyActivationDisabledAndMoveNow parameter specifies whether to prevent databases from being mounted on this Mailbox server if there are other healthy copies of the databases on other Mailbox servers. It will also immediately move any mounted databases on the server to other servers if copies exist and are healthy."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DatabaseCopyAutoActivationPolicy
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Blocked", "IntrasiteOnly", "Unrestricted"]
  newparam(:dsc_databasecopyautoactivationpolicy) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseCopyAutoActivationPolicy - The DatabaseCopyAutoActivationPolicy parameter specifies the type of automatic activation available for mailbox database copies on the specified Mailbox server. Valid values are Blocked, IntrasiteOnly, and Unrestricted. Valid values are Blocked, IntrasiteOnly, Unrestricted."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Blocked', 'blocked', 'IntrasiteOnly', 'intrasiteonly', 'Unrestricted', 'unrestricted'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Blocked, IntrasiteOnly, Unrestricted")
      end
    end
  end

  # Name:         MaximumActiveDatabases
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumactivedatabases) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MaximumActiveDatabases - The MaximumActiveDatabases parameter specifies the number of databases that can be mounted on this Mailbox server. This parameter accepts numeric values."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaximumPreferredActiveDatabases
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumpreferredactivedatabases) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MaximumPreferredActiveDatabases - The MaximumPreferredActiveDatabases parameter specifies a preferred maximum number of databases that a server should have. This value is different from the actual maximum, which is configured using the MaximumActiveDatabases parameter. The value of MaximumPreferredActiveDatabases is only honored during best copy and server selection, database and server switchovers, and when rebalancing the DAG."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WacDiscoveryEndpoint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_wacdiscoveryendpoint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WacDiscoveryEndpoint - The WacDiscoveryEndpoint parameter specifies the Office Online Server endpoint to use. Exchange 2016 only."
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

Puppet::Type.type(:dsc_xexchmailboxserver).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
