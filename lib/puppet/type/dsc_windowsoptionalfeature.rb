require 'pathname'

Puppet::Type.newtype(:dsc_windowsoptionalfeature) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows

    def ensure_value
        'enable'
    end

    def absent_value
        'disable'
    end

  end

  @doc = %q{
    The DSC WindowsOptionalFeature resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_WindowsOptionalFeature/MSFT_WindowsOptionalFeature.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "WindowsOptionalFeature"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_WindowsOptionalFeature"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "PSDesiredStateConfiguration"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto :present
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

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enable", "Disable"]
  newparam(:dsc_ensure) do
    validate do |value|
      resource[:ensure] = provider.munge_ensure(value.downcase)
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enable', 'enable', 'Disable', 'disable'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enable, Disable")
      end
    end
  end

  # Name:         Source
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_source, :array_matching => :all) do
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         NoWindowsUpdateCheck
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_nowindowsupdatecheck) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         RemoveFilesOnDisable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_removefilesondisable) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         LogLevel
  # Type:         string
  # IsMandatory:  False
  # Values:       ["ErrorsOnly", "ErrorsAndWarning", "ErrorsAndWarningAndInformation"]
  newparam(:dsc_loglevel) do
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
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
