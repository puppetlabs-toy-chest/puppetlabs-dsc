require 'pathname'

Puppet::Type.newtype(:dsc_xpackage) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xPackage resource type.
    Automatically generated from
    'xPSDesiredStateConfiguration/DSCResources/MSFT_xPackageResource/MSFT_xPackageResource.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_productid is a required attribute') if self[:dsc_productid].nil?
    end

  def dscmeta_resource_friendly_name; 'xPackage' end
  def dscmeta_resource_name; 'MSFT_xPackageResource' end
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

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Valid values are Present, Absent."
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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Path
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProductId
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_productid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProductId"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Arguments
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_arguments) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Arguments"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
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
    desc "Credential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         ReturnCode
  # Type:         uint32[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_returncode, :array_matching => :all) do
    def mof_type; 'uint32[]' end
    def mof_is_embedded?; false end
    desc "ReturnCode"
    validate do |value|
      unless value.kind_of?(Array) || (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
        fail("Invalid value '#{value}'. Should be an integer or an array of integers")
      end
    end
    munge do |value|
      v = PuppetX::Dsc::TypeHelpers.munge_integer(value)
      v.is_a?(Array) ? v : Array(v)
    end
  end

  # Name:         LogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PackageDescription
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_packagedescription) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PackageDescription"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Publisher
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_publisher) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Publisher"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstalledOn
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installedon) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstalledOn"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Size
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_size) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Size"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Version
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_version) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Version"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Installed
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installed) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Installed"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         FileHash
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_filehash) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FileHash"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         HashAlgorithm
  # Type:         string
  # IsMandatory:  False
  # Values:       ["SHA1", "SHA256", "SHA384", "SHA512", "MD5", "RIPEMD160"]
  newparam(:dsc_hashalgorithm) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "HashAlgorithm - Valid values are SHA1, SHA256, SHA384, SHA512, MD5, RIPEMD160."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['SHA1', 'sha1', 'SHA256', 'sha256', 'SHA384', 'sha384', 'SHA512', 'sha512', 'MD5', 'md5', 'RIPEMD160', 'ripemd160'].include?(value)
        fail("Invalid value '#{value}'. Valid values are SHA1, SHA256, SHA384, SHA512, MD5, RIPEMD160")
      end
    end
  end

  # Name:         SignerSubject
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_signersubject) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SignerSubject"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SignerThumbprint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_signerthumbprint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SignerThumbprint"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServerCertificateValidationCallback
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_servercertificatevalidationcallback) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerCertificateValidationCallback"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstalledCheckRegHive
  # Type:         string
  # IsMandatory:  False
  # Values:       ["LocalMachine", "CurrentUser"]
  newparam(:dsc_installedcheckreghive) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstalledCheckRegHive - Valid values are LocalMachine, CurrentUser."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['LocalMachine', 'localmachine', 'CurrentUser', 'currentuser'].include?(value)
        fail("Invalid value '#{value}'. Valid values are LocalMachine, CurrentUser")
      end
    end
  end

  # Name:         InstalledCheckRegKey
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installedcheckregkey) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstalledCheckRegKey"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstalledCheckRegValueName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installedcheckregvaluename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstalledCheckRegValueName"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstalledCheckRegValueData
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installedcheckregvaluedata) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstalledCheckRegValueData"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CreateCheckRegValue
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_createcheckregvalue) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CreateCheckRegValue"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RunAsCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_runascredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "RunAsCredential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("RunAsCredential", value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xpackage).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
