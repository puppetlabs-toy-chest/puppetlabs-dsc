require 'pathname'

Puppet::Type.newtype(:dsc_xazuresubscription) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xAzureSubscription resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xAzure/DSCResources/MSFT_xAzureSubscription/MSFT_xAzureSubscription.schema.mof
  }

  validate do
      fail('dsc_azuresubscriptionname is a required attribute') if self[:dsc_azuresubscriptionname].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xAzureSubscription"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xAzureSubscription"
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

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    desc "Specifies whether the subscription should be present or absent."
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

  # Name:         AzureSubscriptionName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_azuresubscriptionname) do
    desc "Specifies the name of the Azure subscription that should be set to Current."
    isrequired
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
    desc "Specifies the location of the Publish Settings file for the Azure Subscription."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
