begin
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
rescue LoadError => detail
  require 'pathname'
  lib_path = Pathname.new(__FILE__).dirname.parent.parent
  $:.unshift(lib_path)
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
end

Puppet::Type.newtype(:dsc_xrdremoteapp) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xRDRemoteApp resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xRemoteDesktopSessionHost/DSCResources/MSFT_xRDRemoteApp/MSFT_xRDRemoteApp.schema.mof
  }

  validate do
      fail('dsc_alias is a required attribute') if self[:dsc_alias].nil?
      fail('dsc_collectionname is a required attribute') if self[:dsc_collectionname].nil?
      fail('dsc_displayname is a required attribute') if self[:dsc_displayname].nil?
      fail('dsc_filepath is a required attribute') if self[:dsc_filepath].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xRDRemoteApp"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xRDRemoteApp"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xRemoteDesktopSessionHost"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.0"
  end

  newparam(:name, :namevar => true ) do
  end

  # Name:         Alias
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_alias) do
    desc "Specifies an alias for the RemoteApp program."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CollectionName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_collectionname) do
    desc "Specifies the name of the personal virtual desktop collection or session collection. The cmdlet publishes the RemoteApp program to this collection. "
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DisplayName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_displayname) do
    desc "Specifies a name to display to users for the RemoteApp program."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FilePath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_filepath) do
    desc "Specifies a path for the executable file for the application. Do not include any environment variables."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FileVirtualPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_filevirtualpath) do
    desc "Specifies a path for the application executable file. This path resolves to the same location as the value of the FilePath parameter, but it can include environment variables. "
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FolderName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_foldername) do
    desc "Specifies the name of the folder that the RemoteApp program appears in on the Remote Desktop Web Access (RD Web Access) webpage and in the Start menu for subscribed RemoteApp and Desktop Connections. "
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CommandLineSetting
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_commandlinesetting) do
    desc "Specifies whether the RemoteApp program accepts command-line arguments from the client at connection time. The acceptable values for this parameter are:  Allow, DoNotAllow, Require"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RequiredCommandLine
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_requiredcommandline) do
    desc "Specifies a string that contains command-line arguments that the client can use at connection time with the RemoteApp program. "
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IconIndex
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_iconindex) do
    desc "Specifies the index within the icon file (specified by the IconPath parameter) where the RemoteApp program's icon can be found."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         IconPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_iconpath) do
    desc "Specifies the path to a file containing the icon to display for the RemoteApp program identified by the Alias parameter."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UserGroups
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usergroups) do
    desc "Specifies a domain group that can view the RemoteApp in RD Web Access, and in RemoteApp and Desktop Connections. To allow all users to see a RemoteApp program, provide a value of Null."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ShowInWebAccess
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_showinwebaccess) do
    desc "Specifies whether to show the RemoteApp program in the RD Web Access server, and in RemoteApp and Desktop Connections that the user subscribes to. "
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end


end
