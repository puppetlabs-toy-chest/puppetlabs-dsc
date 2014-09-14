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

Puppet::Type.newtype(:dsc_xazurestorageaccount) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xAzureStorageAccount resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xAzure/DSCResources/MSFT_xAzureStorageAccount/MSFT_xAzureStorageAccount.schema.mof
  }

  validate do
      fail('dsc_storageaccountname is a required attribute') if self[:dsc_storageaccountname].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xAzureStorageAccount"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xAzureStorageAccount"
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
    desc "Specifies a name for the storage account. The storage account name must be unique to Windows Azure and must be between 3 and 24 characters in length and use lowercase letters and numbers only."
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
    desc "Specifies whether the Azure Storage Account should be present or absent."
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

  # Name:         AffinityGroup
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_affinitygroup) do
    desc "Specifies the name of an existing affinity group in the current subscription. You can specify either a Location or an AffinityGroup parameter, but not both. "
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Container
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_container) do
    desc "Specifies a name for the Container that should be created in the Azure Storage Account."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Folder
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_folder) do
    desc "Specifies a local folder.  All files in the root of the folder will be uploaded to the new container."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Label
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_label) do
    desc "Specifies a label for the storage account. The label may be up to 100 characters in length."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
