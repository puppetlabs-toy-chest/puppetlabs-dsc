require 'pathname'

Puppet::Type.newtype(:dsc_xwindowsoptionalfeature) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xWindowsOptionalFeature resource type.
    Automatically generated from
    'xPSDesiredStateConfiguration/DSCResources/MSFT_xWindowsOptionalFeature/MSFT_xWindowsOptionalFeature.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xWindowsOptionalFeature' end
  def dscmeta_resource_name; 'MSFT_xWindowsOptionalFeature' end
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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of the feature to enable or disable."
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
    desc "Ensure - Specifies whether the feature should be enabled or disabled. To enable the feature, set this property to Present. To disable the feature, set the property to Absent. Valid values are Present, Absent."
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

  # Name:         RemoveFilesOnDisable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_removefilesondisable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RemoveFilesOnDisable - Specifies that all files associated with the feature should be removed if the feature is being disabled."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         NoWindowsUpdateCheck
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_nowindowsupdatecheck) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "NoWindowsUpdateCheck - Specifies whether or not DISM contacts Windows Update (WU) when searching for the source files to enable the feature. If $true, DISM will not contact WU."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         LogLevel
  # Type:         string
  # IsMandatory:  False
  # Values:       ["ErrorsOnly", "ErrorsAndWarning", "ErrorsAndWarningAndInformation"]
  newparam(:dsc_loglevel) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogLevel - The maximum output level to show in the log. Accepted values are: ErrorsOnly (only errors are logged), ErrorsAndWarning (errors and warnings are logged), and ErrorsAndWarningAndInformation (errors, warnings, and debug information are logged). Valid values are ErrorsOnly, ErrorsAndWarning, ErrorsAndWarningAndInformation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['ErrorsOnly', 'errorsonly', 'ErrorsAndWarning', 'errorsandwarning', 'ErrorsAndWarningAndInformation', 'errorsandwarningandinformation'].include?(value)
        fail("Invalid value '#{value}'. Valid values are ErrorsOnly, ErrorsAndWarning, ErrorsAndWarningAndInformation")
      end
    end
  end

  # Name:         LogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogPath - The path to the log file to log this operation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CustomProperties
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_customproperties, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "CustomProperties - The custom properties retrieved from the Windows optional feature as an array of strings."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Description - The description retrieved from the Windows optional feature."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DisplayName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_displayname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DisplayName - The display name retrieved from the Windows optional feature."
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

Puppet::Type.type(:dsc_xwindowsoptionalfeature).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
