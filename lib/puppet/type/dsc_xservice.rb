require 'pathname'

Puppet::Type.newtype(:dsc_xservice) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xService resource type.
    Automatically generated from
    'xPSDesiredStateConfiguration/DSCResources/MSFT_xServiceResource/MSFT_xServiceResource.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xService' end
  def dscmeta_resource_name; 'MSFT_xServiceResource' end
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
    desc "Name - Indicates the service name. Note that sometimes this is different from the display name. You can get a list of the services and their current state with the Get-Service cmdlet."
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
    desc "Ensure - Ensures that the service is present or absent. Defaults to Present. Valid values are Present, Absent."
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

  # Name:         Path
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - The path to the service executable file."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StartupType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Automatic", "Manual", "Disabled"]
  newparam(:dsc_startuptype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StartupType - Indicates the startup type for the service. Valid values are Automatic, Manual, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Automatic', 'automatic', 'Manual', 'manual', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Automatic, Manual, Disabled")
      end
    end
  end

  # Name:         BuiltInAccount
  # Type:         string
  # IsMandatory:  False
  # Values:       ["LocalSystem", "LocalService", "NetworkService"]
  newparam(:dsc_builtinaccount) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "BuiltInAccount - Indicates the sign-in account to use for the service. Valid values are LocalSystem, LocalService, NetworkService."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['LocalSystem', 'localsystem', 'LocalService', 'localservice', 'NetworkService', 'networkservice'].include?(value)
        fail("Invalid value '#{value}'. Valid values are LocalSystem, LocalService, NetworkService")
      end
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential - The credential to run the service under."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         DesktopInteract
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_desktopinteract) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DesktopInteract - The service can create or communicate with a window on the desktop. Must be false for services not running as LocalSystem. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         State
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Running", "Stopped", "Ignore"]
  newparam(:dsc_state) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "State - Indicates the state you want to ensure for the service. Defaults to Running. Valid values are Running, Stopped, Ignore."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Running', 'running', 'Stopped', 'stopped', 'Ignore', 'ignore'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Running, Stopped, Ignore")
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
    desc "DisplayName - The display name of the service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Description - The description of the service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Dependencies
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dependencies, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Dependencies - An array of strings indicating the names of the dependencies of the service."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         StartupTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_startuptimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "StartupTimeout - The time to wait for the service to start in milliseconds. Defaults to 30000."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         TerminateTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_terminatetimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "TerminateTimeout - The time to wait for the service to stop in milliseconds. Defaults to 30000."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xservice).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
