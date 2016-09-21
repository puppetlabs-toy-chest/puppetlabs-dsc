require 'pathname'

Puppet::Type.newtype(:dsc_xazurevmdscconfiguration) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xAzureVMDscConfiguration resource type.
    Automatically generated from
    'xAzure/DSCResources/MSFT_xAzureVMDscConfiguration/MSFT_xAzureVMDscConfiguration.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_storageaccountname is a required attribute') if self[:dsc_storageaccountname].nil?
    end

  def dscmeta_resource_friendly_name; 'xAzureVMDscConfiguration' end
  def dscmeta_resource_name; 'MSFT_xAzureVMDscConfiguration' end
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

  # Name:         StorageAccountName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_storageaccountname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StorageAccountName - Specifies name of the existing storage account."
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
    desc "Ensure - Specifies whether the supplied Configuration is Present or Absent in Azure Storage Valid values are Present, Absent."
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
    desc "ContainerName - Specifies the name of the Container in the Azure Storage Account."
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
    desc "ConfigurationPath - Specifies location of the Dsc Configuration document"
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
    desc "AzureSubscriptionName - Specifies the name of the Azure subscription that should be set to Current."
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
    desc "AzurePublishSettingsPath - Specifies the location of the Publish Settings file for the Azure Subscription."
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
    desc "BlobUri - Absolute Uri of the Blob"
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

Puppet::Type.type(:dsc_xazurevmdscconfiguration).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
