require 'pathname'

Puppet::Type.newtype(:dsc_xbltpm) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xBLTpm resource type.
    Automatically generated from
    'xBitlocker/DSCResources/MSFT_xBLTpm/MSFT_xBLTpm.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  def dscmeta_resource_friendly_name; 'xBLTpm' end
  def dscmeta_resource_name; 'MSFT_xBLTpm' end
  def dscmeta_module_name; 'xBitlocker' end
  def dscmeta_module_version; '1.4.0.0' end

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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         Identity
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identity) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Identity - A required string value which is used as a Key for the resource. The value does not matter, as long as its not empty."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AllowClear
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowclear) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowClear - Indicates that the provisioning process clears the TPM, if necessary, to move the TPM closer to complying with Windows Server 2012 standards."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowPhysicalPresence
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowphysicalpresence) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowPhysicalPresence - Indicates that the provisioning process may send physical presence commands that require a user to be present in order to continue."
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
    desc "AllowImmediateReboot - Whether the computer can rebooted immediately after initializing the TPM."
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

Puppet::Type.type(:dsc_xbltpm).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
