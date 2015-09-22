require 'pathname'

Puppet::Type.newtype(:dsc_xpackage) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xPackage resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xPSDesiredStateConfiguration/DSCResources/MSFT_xPackageResource/MSFT_xPackageResource.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_productid is a required attribute') if self[:dsc_productid].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xPackage"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xPackageResource"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xPSDesiredStateConfiguration"
  end

  newparam(:dscmeta_module_version) do
    defaultto "3.4.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
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
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Credential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReturnCode
  # Type:         uint32[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_returncode, :array_matching => :all) do
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         LogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logpath) do
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
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         Version
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_version) do
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
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RunAsCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_runascredential) do
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
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
