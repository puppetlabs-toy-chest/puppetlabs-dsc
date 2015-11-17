require 'pathname'

Puppet::Type.newtype(:dsc_xazurestorageaccount) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xAzureStorageAccount resource type.
    Automatically generated from
    'xAzure/DSCResources/MSFT_xAzureStorageAccount/MSFT_xAzureStorageAccount.schema.mof'

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

  newproperty(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xAzureStorageAccount')."

    def retrieve
      'xAzureStorageAccount'
    end

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only'
    end
  end

  newproperty(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xAzureStorageAccount')."

    def retrieve
      'MSFT_xAzureStorageAccount'
    end

    validate do |value|
      fail 'dscmeta_resource_name is read-only'
    end
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

  newproperty(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xAzure')."

    def retrieve
      'xAzure'
    end

    validate do |value|
      fail 'dscmeta_module_name is read-only'
    end
  end

  newproperty(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('0.2.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    def retrieve
      '0.2.0.0'
    end

    validate do |value|
      fail 'dscmeta_module_version is read-only'
    end
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
    desc "StorageAccountName - Specifies a name for the storage account. The storage account name must be unique to Windows Azure and must be between 3 and 24 characters in length and use lowercase letters and numbers only."
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
    desc "Ensure - Specifies whether the Azure Storage Account should be present or absent. Valid values are Present, Absent."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AffinityGroup - Specifies the name of an existing affinity group in the current subscription. You can specify either a Location or an AffinityGroup parameter, but not both. "
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Container - Specifies a name for the Container that should be created in the Azure Storage Account."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Folder - Specifies a local folder.  All files in the root of the folder will be uploaded to the new container."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Label - Specifies a label for the storage account. The label may be up to 100 characters in length."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end

Puppet::Type.type(:dsc_xazurestorageaccount).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
