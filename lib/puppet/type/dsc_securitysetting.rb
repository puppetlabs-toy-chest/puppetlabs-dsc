require 'pathname'

Puppet::Type.newtype(:dsc_securitysetting) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SecuritySetting resource type.
    Automatically generated from
    'SecurityPolicyDsc/DSCResources/MSFT_SecuritySetting/MSFT_SecuritySetting.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SecuritySetting' end
  def dscmeta_resource_name; 'MSFT_SecuritySetting' end
  def dscmeta_module_name; 'SecurityPolicyDsc' end
  def dscmeta_module_version; '1.5.0.0' end

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
  # Values:       ["MinimumPasswordAge", "MaximumPasswordAge", "MinimumPasswordLength", "PasswordComplexity", "PasswordHistorySize", "LockoutBadCount", "ForceLogoffWhenHourExpire", "NewAdministratorName", "NewGuestName", "ClearTextPassword", "LSAAnonymousNameLookup", "EnableAdminAccount", "EnableGuestAccount", "ResetLockoutCount", "LockoutDuration", "MaxServiceAge", "MaxTicketAge", "MaxRenewAge", "MaxClockSkew", "TicketValidateClient"]
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - This is just here to avoid conflicts Valid values are MinimumPasswordAge, MaximumPasswordAge, MinimumPasswordLength, PasswordComplexity, PasswordHistorySize, LockoutBadCount, ForceLogoffWhenHourExpire, NewAdministratorName, NewGuestName, ClearTextPassword, LSAAnonymousNameLookup, EnableAdminAccount, EnableGuestAccount, ResetLockoutCount, LockoutDuration, MaxServiceAge, MaxTicketAge, MaxRenewAge, MaxClockSkew, TicketValidateClient."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['MinimumPasswordAge', 'minimumpasswordage', 'MaximumPasswordAge', 'maximumpasswordage', 'MinimumPasswordLength', 'minimumpasswordlength', 'PasswordComplexity', 'passwordcomplexity', 'PasswordHistorySize', 'passwordhistorysize', 'LockoutBadCount', 'lockoutbadcount', 'ForceLogoffWhenHourExpire', 'forcelogoffwhenhourexpire', 'NewAdministratorName', 'newadministratorname', 'NewGuestName', 'newguestname', 'ClearTextPassword', 'cleartextpassword', 'LSAAnonymousNameLookup', 'lsaanonymousnamelookup', 'EnableAdminAccount', 'enableadminaccount', 'EnableGuestAccount', 'enableguestaccount', 'ResetLockoutCount', 'resetlockoutcount', 'LockoutDuration', 'lockoutduration', 'MaxServiceAge', 'maxserviceage', 'MaxTicketAge', 'maxticketage', 'MaxRenewAge', 'maxrenewage', 'MaxClockSkew', 'maxclockskew', 'TicketValidateClient', 'ticketvalidateclient'].include?(value)
        fail("Invalid value '#{value}'. Valid values are MinimumPasswordAge, MaximumPasswordAge, MinimumPasswordLength, PasswordComplexity, PasswordHistorySize, LockoutBadCount, ForceLogoffWhenHourExpire, NewAdministratorName, NewGuestName, ClearTextPassword, LSAAnonymousNameLookup, EnableAdminAccount, EnableGuestAccount, ResetLockoutCount, LockoutDuration, MaxServiceAge, MaxTicketAge, MaxRenewAge, MaxClockSkew, TicketValidateClient")
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
    desc "Ensure - Desired state of resource. Valid values are Present, Absent."
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

  # Name:         MinimumPasswordAge
  # Type:         sint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_minimumpasswordage) do
    def mof_type; 'sint16' end
    def mof_is_embedded?; false end
    desc "MinimumPasswordAge"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaximumPasswordAge
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumpasswordage) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "MaximumPasswordAge"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MinimumPasswordLength
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_minimumpasswordlength) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "MinimumPasswordLength"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         PasswordComplexity
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_passwordcomplexity) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "PasswordComplexity"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         PasswordHistorySize
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_passwordhistorysize) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "PasswordHistorySize"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         LockoutBadCount
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_lockoutbadcount) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "LockoutBadCount"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ForceLogoffWhenHourExpire
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_forcelogoffwhenhourexpire) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "ForceLogoffWhenHourExpire"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         NewAdministratorName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_newadministratorname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NewAdministratorName"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         NewGuestName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_newguestname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NewGuestName"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ClearTextPassword
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cleartextpassword) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "ClearTextPassword"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         LSAAnonymousNameLookup
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_lsaanonymousnamelookup) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "LSAAnonymousNameLookup"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EnableAdminAccount
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enableadminaccount) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "EnableAdminAccount"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EnableGuestAccount
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enableguestaccount) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "EnableGuestAccount"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ResetLockoutCount
  # Type:         sint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_resetlockoutcount) do
    def mof_type; 'sint16' end
    def mof_is_embedded?; false end
    desc "ResetLockoutCount"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         LockoutDuration
  # Type:         sint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_lockoutduration) do
    def mof_type; 'sint16' end
    def mof_is_embedded?; false end
    desc "LockoutDuration"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxServiceAge
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxserviceage) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "MaxServiceAge"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxTicketAge
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxticketage) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "MaxTicketAge"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxRenewAge
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxrenewage) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "MaxRenewAge"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxClockSkew
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxclockskew) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "MaxClockSkew"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         TicketValidateClient
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ticketvalidateclient) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "TicketValidateClient"
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

Puppet::Type.type(:dsc_securitysetting).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
