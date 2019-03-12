require 'pathname'

Puppet::Type.newtype(:dsc_webapplicationhandler) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC WebApplicationHandler resource type.
    Automatically generated from
    'xWebAdministration/DSCResources/MSFT_WebApplicationHandler/MSFT_WebApplicationHandler.schema.mof'

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

  def dscmeta_resource_friendly_name; 'WebApplicationHandler' end
  def dscmeta_resource_name; 'MSFT_WebApplicationHandler' end
  def dscmeta_module_name; 'xWebAdministration' end
  def dscmeta_module_version; '2.5.0.0' end

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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Specifies the name of the new request handler."
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
    desc "Ensure - Indicates if the application handler exists. Set this property to `Absent` to ensure that the application handler does not exist. Default value is 'Present'. Valid values are Present, Absent."
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

  # Name:         physicalHandlerPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_physicalhandlerpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "physicalHandlerPath - Specifies the physical path to the handler. This parameter applies to native modules only."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Verb
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_verb) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Verb - Specifies the HTTP verbs that are handled by the new handler."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Path
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_path, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Path - Specifies an IIS configuration path."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Type
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type - Specifies the managed type of the new module. This parameter applies to managed modules only."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Modules
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_modules) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Modules - Specifies the modules used for the handler."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ScriptProcessor
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scriptprocessor) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ScriptProcessor - Specifies the script processor that runs for the module."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PreCondition
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_precondition) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PreCondition - Specifies preconditions for the new handler."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RequireAccess
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Read", "Write", "Script", "Execute"]
  newparam(:dsc_requireaccess) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RequireAccess - Specifies the user rights that are required for the new handler. Valid values are None, Read, Write, Script, Execute."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Read', 'read', 'Write', 'write', 'Script', 'script', 'Execute', 'execute'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Read, Write, Script, Execute")
      end
    end
  end

  # Name:         ResourceType
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_resourcetype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ResourceType - Specifies the resource type this handler runs."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AllowPathInfo
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowpathinfo) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowPathInfo - Specifies whether the handler processes full path information in a URI, such as contoso/marketing/imageGallery.aspx. If the value is true, the handler processes the full path, contoso/marketing/imageGallery. If the value is false, the handler processes only the last section of the path, /imageGallery."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ResponseBufferLimit
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_responsebufferlimit) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ResponseBufferLimit - Specifies the maximum size, in bytes, of the response buffer for a request handler runs."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Location
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_location) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Location - Specifies The location of the configuration setting. Location tags are frequently used for configuration settings that must be set more precisely than per application or per virtual directory."
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

Puppet::Type.type(:dsc_webapplicationhandler).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
