require 'pathname'

Puppet::Type.newtype(:dsc_xazurevmdscextension) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xAzureVMDscExtension resource type.
    Automatically generated from
    'xAzure/DSCResources/MSFT_xAzureVMDscExtension/MSFT_xAzureVMDscExtension.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_vmname is a required attribute') if self[:dsc_vmname].nil?
    end

  def dscmeta_resource_friendly_name; 'xAzureVMDscExtension' end
  def dscmeta_resource_name; 'MSFT_xAzureVMDscExtension' end
  def dscmeta_module_name; 'xAzure' end
  def dscmeta_module_version; '0.2.0.0' end

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

  # Name:         VMName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_vmname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VMName - Specifies name of the VM.  This is used together with ServiceName to construct a persistent vm object."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServiceName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_servicename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServiceName - Specifies name of the Service where the VM is deployed."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConfigurationArchive
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_configurationarchive) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConfigurationArchive - The name of the configuration package .zip file that was previously uploaded by Publish-AzureVMDscConfiguration. This parameter must specify only the name of the file, without any path."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StorageAccountName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_storageaccountname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StorageAccountName - Specifies the name of the Storage Account used to create the Storage Context.  The Azure Storage Context provides the security settings used to access the configuration script. This context should provide read access to the container specified by ContainerName."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConfigurationArgument
  # Type:         MSFT_KeyValuePair
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_configurationargument) do
    def mof_type; 'MSFT_KeyValuePair' end
    def mof_is_embedded?; true end
    desc "ConfigurationArgument - A hashtable specifying the arguments to the configuration function. The keys correspond to the parameter names and the values to the parameter values."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      fail 'ConfigurationArgument may only have a single key / value pair' unless value.length == 1
    end
  end

  # Name:         ConfigurationDataPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_configurationdatapath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConfigurationDataPath - The path to a .psd1 file that specifies the data for the configuration function."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Configuration
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_configuration) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Configuration - Name of the configuration script or module that will be invoked by the DSC Extension."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
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
    desc "ContainerName - Name of the Azure Storage Container where the ConfigurationArchive is located."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Force
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_force) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Force - By default Set-AzureVMDscExtension will not overwrite any existing blobs. Use -Force to overwrite them."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ReferenceName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_referencename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReferenceName - The Extension Reference Name"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StorageEndpointSuffix
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_storageendpointsuffix) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StorageEndpointSuffix - The DNS endpoint suffix for all storage services, e.g. core.windows.net"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Version
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_version) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Version - The specific version of the DSC Extension to use. If not given, it will default to 1.*"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TimeStamp
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_timestamp) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TimeStamp - Returns the timestamp of the last DSC Extension execution."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Code
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_code) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Code - Returns the message code for the latest oepration by the DSC Extension."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Message
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_message) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Message - Returns the formatted message string for the latest operation by the DSC Extension."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Status
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_status) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Status - Returns the state of the DSC Extension from Azure."
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

Puppet::Type.type(:dsc_xazurevmdscextension).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
