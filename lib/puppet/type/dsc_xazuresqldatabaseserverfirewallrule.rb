require 'pathname'

Puppet::Type.newtype(:dsc_xazuresqldatabaseserverfirewallrule) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xAzureSqlDatabaseServerFirewallRule resource type.
    Automatically generated from
    'xAzure/DSCResources/MSFT_xAzureSqlDatabaseServerFirewallRule/MSFT_xAzureSqlDatabaseServerFirewallRule.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_rulename is a required attribute') if self[:dsc_rulename].nil?
      fail('dsc_servername is a required attribute') if self[:dsc_servername].nil?
    end

  def dscmeta_resource_friendly_name; 'xAzureSqlDatabaseServerFirewallRule' end
  def dscmeta_resource_name; 'MSFT_xAzureSqlDatabaseServerFirewallRule' end
  def dscmeta_module_name; 'xAzure' end
  def dscmeta_module_version; '0.2.0.0' end

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

  # Name:         RuleName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_rulename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RuleName - Name of the firewall rule"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServerName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_servername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerName - Name of the database server for which firewall rule should be created"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StartIPAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_startipaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StartIPAddress - Start IP address of the firewall rule"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EndIPAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_endipaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EndIPAddress - End IP address of the firewall rule"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AzureSubscriptionName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_azuresubscriptionname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AzureSubscriptionName - Specifies the name of the Azure subscription that should be set to Current"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AzurePublishSettingsFile
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_azurepublishsettingsfile) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AzurePublishSettingsFile - Specifies the location of the Publish Settings file for the Azure Subscription"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Ensure that firewall rule is present or absent Valid values are Present, Absent."
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


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xazuresqldatabaseserverfirewallrule).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
