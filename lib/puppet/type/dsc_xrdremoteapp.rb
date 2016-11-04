require 'pathname'

Puppet::Type.newtype(:dsc_xrdremoteapp) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xRDRemoteApp resource type.
    Automatically generated from
    'xRemoteDesktopSessionHost/DSCResources/MSFT_xRDRemoteApp/MSFT_xRDRemoteApp.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_alias is a required attribute') if self[:dsc_alias].nil?
      fail('dsc_collectionname is a required attribute') if self[:dsc_collectionname].nil?
      fail('dsc_displayname is a required attribute') if self[:dsc_displayname].nil?
      fail('dsc_filepath is a required attribute') if self[:dsc_filepath].nil?
    end

  def dscmeta_resource_friendly_name; 'xRDRemoteApp' end
  def dscmeta_resource_name; 'MSFT_xRDRemoteApp' end
  def dscmeta_module_name; 'xRemoteDesktopSessionHost' end
  def dscmeta_module_version; '1.3.0.0' end

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

  # Name:         Alias
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_alias) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Alias - Specifies an alias for the RemoteApp program."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CollectionName - Specifies the name of the personal virtual desktop collection or session collection. The cmdlet publishes the RemoteApp program to this collection. "
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DisplayName - Specifies a name to display to users for the RemoteApp program."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FilePath - Specifies a path for the executable file for the application. Do not include any environment variables."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FileVirtualPath - Specifies a path for the application executable file. This path resolves to the same location as the value of the FilePath parameter, but it can include environment variables. "
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FolderName - Specifies the name of the folder that the RemoteApp program appears in on the Remote Desktop Web Access (RD Web Access) webpage and in the Start menu for subscribed RemoteApp and Desktop Connections. "
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CommandLineSetting - Specifies whether the RemoteApp program accepts command-line arguments from the client at connection time. The acceptable values for this parameter are:  Allow, DoNotAllow, Require"
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RequiredCommandLine - Specifies a string that contains command-line arguments that the client can use at connection time with the RemoteApp program. "
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
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "IconIndex - Specifies the index within the icon file (specified by the IconPath parameter) where the RemoteApp program's icon can be found."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         IconPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_iconpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IconPath - Specifies the path to a file containing the icon to display for the RemoteApp program identified by the Alias parameter."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UserGroups - Specifies a domain group that can view the RemoteApp in RD Web Access, and in RemoteApp and Desktop Connections. To allow all users to see a RemoteApp program, provide a value of Null."
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
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ShowInWebAccess - Specifies whether to show the RemoteApp program in the RD Web Access server, and in RemoteApp and Desktop Connections that the user subscribes to. "
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

Puppet::Type.type(:dsc_xrdremoteapp).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
