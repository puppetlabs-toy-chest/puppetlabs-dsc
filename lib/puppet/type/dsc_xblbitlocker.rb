require 'pathname'

Puppet::Type.newtype(:dsc_xblbitlocker) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xBLBitlocker resource type.
    Automatically generated from
    'xBitlocker/DSCResources/MSFT_xBLBitlocker/MSFT_xBLBitlocker.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_mountpoint is a required attribute') if self[:dsc_mountpoint].nil?
    end

  def dscmeta_resource_friendly_name; 'xBLBitlocker' end
  def dscmeta_resource_name; 'MSFT_xBLBitlocker' end
  def dscmeta_module_name; 'xBitlocker' end
  def dscmeta_module_version; '1.1.0.0' end

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

  # Name:         MountPoint
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_mountpoint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MountPoint"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PrimaryProtector
  # Type:         string
  # IsMandatory:  False
  # Values:       ["PasswordProtector", "RecoveryPasswordProtector", "StartupKeyProtector", "TpmProtector"]
  newparam(:dsc_primaryprotector) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PrimaryProtector - Valid values are PasswordProtector, RecoveryPasswordProtector, StartupKeyProtector, TpmProtector."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['PasswordProtector', 'passwordprotector', 'RecoveryPasswordProtector', 'recoverypasswordprotector', 'StartupKeyProtector', 'startupkeyprotector', 'TpmProtector', 'tpmprotector'].include?(value)
        fail("Invalid value '#{value}'. Valid values are PasswordProtector, RecoveryPasswordProtector, StartupKeyProtector, TpmProtector")
      end
    end
  end

  # Name:         AutoUnlock
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autounlock) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AutoUnlock"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowImmediateReboot
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowimmediatereboot) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowImmediateReboot"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AdAccountOrGroup
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adaccountorgroup) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AdAccountOrGroup"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AdAccountOrGroupProtector
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adaccountorgroupprotector) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AdAccountOrGroupProtector"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EncryptionMethod
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Aes128", "Aes256"]
  newparam(:dsc_encryptionmethod) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EncryptionMethod - Valid values are Aes128, Aes256."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Aes128', 'aes128', 'Aes256', 'aes256'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Aes128, Aes256")
      end
    end
  end

  # Name:         HardwareEncryption
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_hardwareencryption) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "HardwareEncryption"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Password
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_password) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Password"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Password", value)
    end
  end

  # Name:         PasswordProtector
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_passwordprotector) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "PasswordProtector"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Pin
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pin) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Pin"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Pin", value)
    end
  end

  # Name:         RecoveryKeyPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recoverykeypath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RecoveryKeyPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RecoveryKeyProtector
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recoverykeyprotector) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RecoveryKeyProtector"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RecoveryPasswordProtector
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recoverypasswordprotector) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RecoveryPasswordProtector"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Service
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_service) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Service"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SkipHardwareTest
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_skiphardwaretest) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SkipHardwareTest"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         StartupKeyPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_startupkeypath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StartupKeyPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StartupKeyProtector
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_startupkeyprotector) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "StartupKeyProtector"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         TpmProtector
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tpmprotector) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "TpmProtector"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         UsedSpaceOnly
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usedspaceonly) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UsedSpaceOnly"
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

Puppet::Type.type(:dsc_xblbitlocker).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
