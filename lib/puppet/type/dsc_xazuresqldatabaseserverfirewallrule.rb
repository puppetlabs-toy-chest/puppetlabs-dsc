# workaround for cross modules dependencies
master_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'dsc','lib'))
$:.push(master_path) if File.directory?(master_path)
require 'puppet/type/base_dsc'

Puppet::Type.newtype(:dsc_xazuresqldatabaseserverfirewallrule) do

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  provide :mof, :parent => Puppet::Type.type(:base_dsc).provider(:mof)

  @doc = %q{
    The DSC xAzureSqlDatabaseServerFirewallRule resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit/xAzure/DSCResources/MSFT_xAzureSqlDatabaseServerFirewallRule/MSFT_xAzureSqlDatabaseServerFirewallRule.schema.mof
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
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xAzure"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.1.2"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    defaultvalues
    defaultto :present
  end

  # Name:         RuleName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_rulename) do
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
