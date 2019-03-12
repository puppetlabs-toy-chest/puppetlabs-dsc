require 'pathname'

Puppet::Type.newtype(:dsc_inisettingsfile) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC IniSettingsFile resource type.
    Automatically generated from
    'FileContentDsc/DSCResources/DSR_IniSettingsFile/DSR_IniSettingsFile.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
      fail('dsc_section is a required attribute') if self[:dsc_section].nil?
      fail('dsc_key is a required attribute') if self[:dsc_key].nil?
    end

  def dscmeta_resource_friendly_name; 'IniSettingsFile' end
  def dscmeta_resource_name; 'DSR_IniSettingsFile' end
  def dscmeta_module_name; 'FileContentDsc' end
  def dscmeta_module_version; '1.2.0.0' end

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

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - The path to the INI settings file to set the entry in."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Section
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_section) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Section - The section to add or set the entry in."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Key
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_key) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Key - The name of the key to add or set in the section."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Type
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Text", "Secret"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type - Specifies the value type that contains the value to set the entry to. Defaults to 'Text'. Valid values are Text, Secret."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Text', 'text', 'Secret', 'secret'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Text, Secret")
      end
    end
  end

  # Name:         Text
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_text) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Text - The text to set the entry value to. Only used when Type is set to 'Text'."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Secret
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_secret) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Secret - The secret text to set the entry value to. Only used when Type is set to 'Secret'."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Secret", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_inisettingsfile).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
