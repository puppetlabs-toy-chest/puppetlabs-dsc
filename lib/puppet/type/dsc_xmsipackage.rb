require 'pathname'

Puppet::Type.newtype(:dsc_xmsipackage) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xMsiPackage resource type.
    Automatically generated from
    'xPSDesiredStateConfiguration/DSCResources/MSFT_xMsiPackage/MSFT_xMsiPackage.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_productid is a required attribute') if self[:dsc_productid].nil?
    end

  def dscmeta_resource_friendly_name; 'xMsiPackage' end
  def dscmeta_resource_name; 'MSFT_xMsiPackage' end
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

  # Name:         ProductId
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_productid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProductId - The identifying number used to find the package, usually a GUID."
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
    desc "Path - The path to the MSI file that should be installed or uninstalled."
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
    desc "Ensure - Specifies whether or not the MSI file should be installed or uninstalled. Valid values are Present, Absent."
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

  # Name:         Arguments
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_arguments) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Arguments - The arguments to be passed to the MSI package during installation or uninstallation."
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
    desc "Credential - The credential of a user account to be used to mount a UNC path if needed."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         LogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogPath - The path to the log file to log the output from the MSI execution."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FileHash
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_filehash) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FileHash - The expected hash value of the MSI file at the given path."
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
    desc "HashAlgorithm - The algorithm used to generate the given hash value. Valid values are SHA1, SHA256, SHA384, SHA512, MD5, RIPEMD160."
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
    desc "SignerSubject - The subject that should match the signer certificate of the digital signature of the MSI file."
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
    desc "SignerThumbprint - The certificate thumbprint that should match the signer certificate of the digital signature of the MSI file."
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
    desc "ServerCertificateValidationCallback - PowerShell code that should be used to validate SSL certificates for paths using HTTPS."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RunAsCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_runascredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "RunAsCredential - The credential of a user account under which to run the installation or uninstallation of the MSI package."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("RunAsCredential", value)
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The display name of the MSI package."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstallSource
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installsource) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstallSource - The path to the MSI package."
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
    desc "InstalledOn - The date that the MSI package was installed on or serviced on, whichever is later."
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
    desc "Size - The size of the MSI package in MB."
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
    desc "Version - The version number of the MSI package."
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
    desc "PackageDescription - The description of the MSI package."
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
    desc "Publisher - The publisher of the MSI package."
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

Puppet::Type.type(:dsc_xmsipackage).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
