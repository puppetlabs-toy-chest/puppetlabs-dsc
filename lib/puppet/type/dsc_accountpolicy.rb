require 'pathname'

Puppet::Type.newtype(:dsc_accountpolicy) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC AccountPolicy resource type.
    Automatically generated from
    'SecurityPolicyDsc/DSCResources/MSFT_AccountPolicy/MSFT_AccountPolicy.schema.mof'

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

  def dscmeta_resource_friendly_name; 'AccountPolicy' end
  def dscmeta_resource_name; 'MSFT_AccountPolicy' end
  def dscmeta_module_name; 'SecurityPolicyDsc' end
  def dscmeta_module_version; '2.2.0.0' end

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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - A unique name of the AccountPolicy resource instance. This is not used during configuration."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Enforce_password_history
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enforce_password_history) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Enforce_password_history"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Maximum_Password_Age
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximum_password_age) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Maximum_Password_Age"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Minimum_Password_Age
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_minimum_password_age) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Minimum_Password_Age"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Minimum_Password_Length
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_minimum_password_length) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Minimum_Password_Length"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Password_must_meet_complexity_requirements
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_password_must_meet_complexity_requirements) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Password_must_meet_complexity_requirements - Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         Store_passwords_using_reversible_encryption
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_store_passwords_using_reversible_encryption) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Store_passwords_using_reversible_encryption - Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         Account_lockout_duration
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_account_lockout_duration) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Account_lockout_duration"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Account_lockout_threshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_account_lockout_threshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Account_lockout_threshold"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Reset_account_lockout_counter_after
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reset_account_lockout_counter_after) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Reset_account_lockout_counter_after"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Enforce_user_logon_restrictions
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_enforce_user_logon_restrictions) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Enforce_user_logon_restrictions - Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         Maximum_lifetime_for_service_ticket
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximum_lifetime_for_service_ticket) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Maximum_lifetime_for_service_ticket"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Maximum_lifetime_for_user_ticket
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximum_lifetime_for_user_ticket) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Maximum_lifetime_for_user_ticket"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Maximum_lifetime_for_user_ticket_renewal
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximum_lifetime_for_user_ticket_renewal) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Maximum_lifetime_for_user_ticket_renewal"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Maximum_tolerance_for_computer_clock_synchronization
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximum_tolerance_for_computer_clock_synchronization) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Maximum_tolerance_for_computer_clock_synchronization"
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

Puppet::Type.type(:dsc_accountpolicy).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
