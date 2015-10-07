require 'pathname'

Puppet::Type.newtype(:dsc_xazuresqldatabaseserverfirewallrule) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xAzureSqlDatabaseServerFirewallRule resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xAzure/DSCResources/MSFT_xAzureSqlDatabaseServerFirewallRule/MSFT_xAzureSqlDatabaseServerFirewallRule.schema.mof
  }

  validate do
      fail('dsc_rulename is a required attribute') if self[:dsc_rulename].nil?
      fail('dsc_servername is a required attribute') if self[:dsc_servername].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xAzureSqlDatabaseServerFirewallRule"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xAzureSqlDatabaseServerFirewallRule"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xAzure"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.1.3"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         RuleName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_rulename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name of the firewall rule"
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
    desc "Name of the database server for which firewall rule should be created"
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
    desc "Start IP address of the firewall rule"
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
    desc "End IP address of the firewall rule"
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
    desc "Specifies the name of the Azure subscription that should be set to Current"
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
    desc "Specifies the location of the Publish Settings file for the Azure Subscription"
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
    desc "Ensure that firewall rule is present or absent"
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


end

Puppet::Type.type(:dsc_xazuresqldatabaseserverfirewallrule).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
