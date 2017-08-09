require 'pathname'

Puppet::Type.newtype(:dsc_xarchive) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xArchive resource type.
    Automatically generated from
    'xPSDesiredStateConfiguration/DSCResources/MSFT_xArchive/MSFT_xArchive.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
      fail('dsc_destination is a required attribute') if self[:dsc_destination].nil?
    end

  def dscmeta_resource_friendly_name; 'xArchive' end
  def dscmeta_resource_name; 'MSFT_xArchive' end
  def dscmeta_module_name; 'xPSDesiredStateConfiguration' end
  def dscmeta_module_version; '6.4.0.0' end

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

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - The path to the archive file that should be expanded to or removed from the specified destination."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Destination
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_destination) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Destination - The path where the specified archive file should be expanded to or removed from."
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
    desc "Ensure - Specifies whether or not the expanded content of the archive file at the specified path should exist at the specified destination. To update the specified destination to have the expanded content of the archive file at the specified path, specify this property as Present. To remove the expanded content of the archive file at the specified path from the specified destination, specify this property as Absent. The default value is Present. Valid values are Present, Absent."
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

  # Name:         Validate
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_validate) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Validate - Specifies whether or not to validate that a file at the destination with the same name as a file in the archive actually matches that corresponding file in the archive by the specified checksum method. If the file does not match and Ensure is specified as Present and Force is not specified, the resource will throw an error that the file at the desintation cannot be overwritten. If the file does not match and Ensure is specified as Present and Force is specified, the file at the desintation will be overwritten. If the file does not match and Ensure is specified as Absent, the file at the desintation will not be removed. The default value is false."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Checksum
  # Type:         string
  # IsMandatory:  False
  # Values:       ["SHA-1", "SHA-256", "SHA-512", "CreatedDate", "ModifiedDate"]
  newparam(:dsc_checksum) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Checksum - The Checksum method to use to validate whether or not a file at the destination with the same name as a file in the archive actually matches that corresponding file in the archive. An invalid argument exception will be thrown if Checksum is specified while Validate is specified as false. ModifiedDate will check that the LastWriteTime property of the file at the destination matches the LastWriteTime property of the file in the archive. CreatedDate will check that the CreationTime property of the file at the destination matches the CreationTime property of the file in the archive. SHA-1, SHA-256, and SHA-512 will check that the hash of the file at the destination by the specified SHA method matches the hash of the file in the archive by the specified SHA method. The default value is ModifiedDate. Valid values are SHA-1, SHA-256, SHA-512, CreatedDate, ModifiedDate."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['SHA-1', 'sha-1', 'SHA-256', 'sha-256', 'SHA-512', 'sha-512', 'CreatedDate', 'createddate', 'ModifiedDate', 'modifieddate'].include?(value)
        fail("Invalid value '#{value}'. Valid values are SHA-1, SHA-256, SHA-512, CreatedDate, ModifiedDate")
      end
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential - The credential of a user account with permissions to access the specified archive path and destination if needed."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         Force
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_force) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Force - Specifies whether or not any existing files or directories at the destination with the same name as a file or directory in the archive should be overwritten to match the file or directory in the archive. When this property is false, an error will be thrown if an item at the destination needs to be overwritten. The default value is false."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xarchive).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
