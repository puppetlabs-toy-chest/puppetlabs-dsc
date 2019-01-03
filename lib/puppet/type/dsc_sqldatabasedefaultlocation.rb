require 'pathname'

Puppet::Type.newtype(:dsc_sqldatabasedefaultlocation) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SqlDatabaseDefaultLocation resource type.
    Automatically generated from
    'SqlServerDsc/DSCResources/MSFT_SqlDatabaseDefaultLocation/MSFT_SqlDatabaseDefaultLocation.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_servername is a required attribute') if self[:dsc_servername].nil?
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
      fail('dsc_type is a required attribute') if self[:dsc_type].nil?
    end

  def dscmeta_resource_friendly_name; 'SqlDatabaseDefaultLocation' end
  def dscmeta_resource_name; 'MSFT_SqlDatabaseDefaultLocation' end
  def dscmeta_module_name; 'SqlServerDsc' end
  def dscmeta_module_version; '11.1.0.0' end

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

  # Name:         ServerName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_servername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerName - The host name of the SQL Server to be configured."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_instancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceName - The name of the SQL instance to be configured."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Type
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Data", "Log", "Backup"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type - The type of database default location to be configured. { Data | Log | Backup } Valid values are Data, Log, Backup."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Data', 'data', 'Log', 'log', 'Backup', 'backup'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Data, Log, Backup")
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
    desc "Path - The path to the default directory to be configured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RestartService
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartservice) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RestartService - If set to $true then SQL Server and dependent services will be restarted if a change to the default location is made.  The defaul value is $false."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ProcessOnlyOnActiveNode
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_processonlyonactivenode) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ProcessOnlyOnActiveNode - Specifies that the resource will only determine if a change is needed if the target node is the active host of the SQL Server Instance."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsActiveNode
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isactivenode) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsActiveNode - Determines if the current node is actively hosting the SQL Server instance."
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

Puppet::Type.type(:dsc_sqldatabasedefaultlocation).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
