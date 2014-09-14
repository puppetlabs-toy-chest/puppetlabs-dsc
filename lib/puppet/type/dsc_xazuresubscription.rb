begin
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
rescue LoadError => detail
  require 'pathname'
  lib_path = Pathname.new(__FILE__).dirname.parent.parent
  $:.unshift(lib_path)
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
end

Puppet::Type.newtype(:dsc_xazuresubscription) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xAzureSubscription resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xAzure/DSCResources/MSFT_xAzureSubscription/MSFT_xAzureSubscription.schema.mof
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
