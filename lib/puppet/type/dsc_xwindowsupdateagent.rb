require 'pathname'

Puppet::Type.newtype(:dsc_xwindowsupdateagent) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xWindowsUpdateAgent resource type.
    Automatically generated from
    'xWindowsUpdate/DscResources/MSFT_xWindowsUpdateAgent/MSFT_xWindowsUpdateAgent.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_issingleinstance is a required attribute') if self[:dsc_issingleinstance].nil?
    end

  def dscmeta_resource_friendly_name; 'xWindowsUpdateAgent' end
  def dscmeta_resource_name; 'MSFT_xWindowsUpdateAgent' end
  def dscmeta_module_name; 'xWindowsUpdate' end
  def dscmeta_module_version; '2.5.0.0' end

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

  # Name:         IsSingleInstance
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Yes"]
  newparam(:dsc_issingleinstance) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IsSingleInstance - Specifies the resource is a single instance, the value must be 'Yes' Valid values are Yes."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Yes', 'yes'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Yes")
      end
    end
  end

  # Name:         Category
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["Security", "Important", "Optional"]
  newparam(:dsc_category, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Category - Indicates if the resource should ensure all Windows Updates are installed or if Automatic updates should be disabled. Valid values are Security, Important, Optional."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['Security', 'security', 'Important', 'important', 'Optional', 'optional'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are Security, Important, Optional")
        end
      end
      if value.kind_of?(String)
        unless ['Security', 'security', 'Important', 'important', 'Optional', 'optional'].include?(value)
          fail("Invalid value #{value}. Valid values are Security, Important, Optional")
        end
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Notifications
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Disabled", "ScheduledInstallation"]
  newparam(:dsc_notifications) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Notifications - Indicates if Windows update agent should notify about updates, see:https://msdn.microsoft.com/en-us/library/windows/desktop/aa385806%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396. Valid values are Disabled, ScheduledInstallation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Disabled', 'disabled', 'ScheduledInstallation', 'scheduledinstallation'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Disabled, ScheduledInstallation")
      end
    end
  end

  # Name:         Source
  # Type:         string
  # IsMandatory:  False
  # Values:       ["WindowsUpdate", "MicrosoftUpdate", "WSUS"]
  newparam(:dsc_source) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Source - Indicates which source service Windows update agent should use.  Note: WSUS is not implemented in this resource. Valid values are WindowsUpdate, MicrosoftUpdate, WSUS."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['WindowsUpdate', 'windowsupdate', 'MicrosoftUpdate', 'microsoftupdate', 'WSUS', 'wsus'].include?(value)
        fail("Invalid value '#{value}'. Valid values are WindowsUpdate, MicrosoftUpdate, WSUS")
      end
    end
  end

  # Name:         UpdateNow
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_updatenow) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UpdateNow - Indicates if the resource should trigger an update during consistency."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AutomaticUpdatesNotificationSetting
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_automaticupdatesnotificationsetting) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AutomaticUpdatesNotificationSetting - Automatic Updates Notification Setting"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TotalUpdatesNotInstalled
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_totalupdatesnotinstalled) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "TotalUpdatesNotInstalled - Count of updates not installed.  Only returned if UpdateNow is specified."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RebootRequired
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_rebootrequired) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RebootRequired - Indicates if Wua Requires a reboot.  Only returned if UpdateNow is specified."
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

Puppet::Type.type(:dsc_xwindowsupdateagent).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
