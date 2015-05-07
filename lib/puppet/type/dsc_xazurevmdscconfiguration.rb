# workaround for cross modules dependencies
master_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'dsc','lib'))
$:.push(master_path) if File.directory?(master_path)
require 'puppet/type/base_dsc'

Puppet::Type.newtype(:dsc_xazurevmdscconfiguration) do

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  provide :mof, :parent => Puppet::Type.type(:base_dsc).provider(:mof)

  @doc = %q{
    The DSC xAzureVMDscConfiguration resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit/xAzure/DSCResources/MSFT_xAzureVMDscConfiguration/MSFT_xAzureVMDscConfiguration.schema.mof
  }

  validate do
      fail('dsc_storageaccountname is a required attribute') if self[:dsc_storageaccountname].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xAzureVMDscConfiguration"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xAzureVMDscConfiguration"
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

  # Name:         StorageAccountName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_storageaccountname) do
    desc "Specifies name of the existing storage account."
    isrequired
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
    desc "Specifies whether the supplied Configuration is Present or Absent in Azure Storage"
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

  # Name:         ContainerName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_containername) do
    desc "Specifies the name of the Container in the Azure Storage Account."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConfigurationPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_configurationpath) do
    desc "Specifies location of the Dsc Configuration document"
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
    desc "Specifies the name of the Azure subscription that should be set to Current."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AzurePublishSettingsPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_azurepublishsettingspath) do
    desc "Specifies the location of the Publish Settings file for the Azure Subscription."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         BlobUri
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_bloburi) do
    desc "Absolute Uri of the Blob"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
