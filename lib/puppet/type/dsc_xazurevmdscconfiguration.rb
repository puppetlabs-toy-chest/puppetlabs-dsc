require 'pathname'

Puppet::Type.newtype(:dsc_xazurevmdscconfiguration) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xAzureVMDscConfiguration resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xAzure/DSCResources/MSFT_xAzureVMDscConfiguration/MSFT_xAzureVMDscConfiguration.schema.mof
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

  # Name:         StorageAccountName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_storageaccountname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Absolute Uri of the Blob"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
