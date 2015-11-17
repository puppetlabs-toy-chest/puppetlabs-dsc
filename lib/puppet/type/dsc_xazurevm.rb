require 'pathname'

Puppet::Type.newtype(:dsc_xazurevm) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xAzureVM resource type.
    Automatically generated from
    'xAzure/DSCResources/MSFT_xAzureVM/MSFT_xAzureVM.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xAzureVM')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xAzureVM'
    end

    defaultto 'xAzureVM'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xAzureVM')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xAzureVM'
    end

    defaultto 'MSFT_xAzureVM'
  end

  newparam(:dscmeta_import_resource) do
    desc "Please ignore this parameter.
      Defaults to `true`."
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xAzure')."

    validate do |value|
      fail 'dscmeta_module_name is read-only' if value != 'xAzure'
    end

    defaultto 'xAzure'
  end

  newparam(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('0.2.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    validate do |value|
      fail 'dscmeta_module_version is read-only' if value != '0.2.0.0'
    end

    defaultto '0.2.0.0'
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Specifies the name of the virtual machine."
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
    desc "Ensure - Specifies whether the Azure VM should be present or absent. Valid values are Present, Absent."
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

  # Name:         ImageName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_imagename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ImageName - Specifies the name of the operating system image to use to create the operating system disk."
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
    desc "ServiceName - Specifies the new or existing service name."
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
    desc "StorageAccountName - Specifies the name of the storage account for the VM."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstanceSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_instancesize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceSize - Specifies the size of the instance.   For a list of virtual machine sizes, see http://msdn.microsoft.com/library/azure/dn197896.aspx"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Linux
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_linux) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Linux - Creates a Linux virtual machine."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Windows
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_windows) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Windows - Creates a Windows virtual machine."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         ExtensionContainerName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_extensioncontainername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExtensionContainerName - The name of the Container in Azure Blob storage where the script files will reside.  Case sensitive."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ExtensionFileList
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_extensionfilelist) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExtensionFileList - List of files in Azure Blob container that should be copied in to the VM.  Case sensitive."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ExtensionScriptName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_extensionscriptname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExtensionScriptName - Name of one of the files in the container that will be exectued at startup.  Case sensitive."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end

Puppet::Type.type(:dsc_xazurevm).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
