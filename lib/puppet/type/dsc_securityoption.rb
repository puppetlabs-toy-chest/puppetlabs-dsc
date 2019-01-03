require 'pathname'

Puppet::Type.newtype(:dsc_securityoption) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SecurityOption resource type.
    Automatically generated from
    'SecurityPolicyDsc/DSCResources/MSFT_SecurityOption/MSFT_SecurityOption.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SecurityOption' end
  def dscmeta_resource_name; 'MSFT_SecurityOption' end
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
    desc "Name - Describes the security option to be managed. This could be anything as long as it is unique"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Accounts_Administrator_account_status
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_accounts_administrator_account_status) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Accounts_Administrator_account_status - Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         Accounts_Block_Microsoft_accounts
  # Type:         string
  # IsMandatory:  False
  # Values:       ["This policy is disabled", "Users cant add Microsoft accounts", "Users cant add or log on with Microsoft accounts"]
  newparam(:dsc_accounts_block_microsoft_accounts) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Accounts_Block_Microsoft_accounts - Valid values are This policy is disabled, Users cant add Microsoft accounts, Users cant add or log on with Microsoft accounts."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['This policy is disabled', 'this policy is disabled', 'Users cant add Microsoft accounts', 'users cant add microsoft accounts', 'Users cant add or log on with Microsoft accounts', 'users cant add or log on with microsoft accounts'].include?(value)
        fail("Invalid value '#{value}'. Valid values are This policy is disabled, Users cant add Microsoft accounts, Users cant add or log on with Microsoft accounts")
      end
    end
  end

  # Name:         Accounts_Guest_account_status
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_accounts_guest_account_status) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Accounts_Guest_account_status - Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         Accounts_Limit_local_account_use_of_blank_passwords_to_console_logon_only
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_accounts_limit_local_account_use_of_blank_passwords_to_console_logon_only) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Accounts_Limit_local_account_use_of_blank_passwords_to_console_logon_only - Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         Accounts_Rename_administrator_account
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_accounts_rename_administrator_account) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Accounts_Rename_administrator_account"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Accounts_Rename_guest_account
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_accounts_rename_guest_account) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Accounts_Rename_guest_account"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Audit_Audit_the_access_of_global_system_objects
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_audit_audit_the_access_of_global_system_objects) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Audit_Audit_the_access_of_global_system_objects - Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         Audit_Audit_the_use_of_Backup_and_Restore_privilege
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_audit_audit_the_use_of_backup_and_restore_privilege) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Audit_Audit_the_use_of_Backup_and_Restore_privilege - Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         Audit_Force_audit_policy_subcategory_settings_Windows_Vista_or_later_to_override_audit_policy_category_settings
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_audit_force_audit_policy_subcategory_settings_windows_vista_or_later_to_override_audit_policy_category_settings) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Audit_Force_audit_policy_subcategory_settings_Windows_Vista_or_later_to_override_audit_policy_category_settings - Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         Audit_Shut_down_system_immediately_if_unable_to_log_security_audits
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_audit_shut_down_system_immediately_if_unable_to_log_security_audits) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Audit_Shut_down_system_immediately_if_unable_to_log_security_audits - Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         DCOM_Machine_Access_Restrictions_in_Security_Descriptor_Definition_Language_SDDL_syntax
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dcom_machine_access_restrictions_in_security_descriptor_definition_language_sddl_syntax) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DCOM_Machine_Access_Restrictions_in_Security_Descriptor_Definition_Language_SDDL_syntax"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DCOM_Machine_Launch_Restrictions_in_Security_Descriptor_Definition_Language_SDDL_syntax
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dcom_machine_launch_restrictions_in_security_descriptor_definition_language_sddl_syntax) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DCOM_Machine_Launch_Restrictions_in_Security_Descriptor_Definition_Language_SDDL_syntax"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Devices_Allow_undock_without_having_to_log_on
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_devices_allow_undock_without_having_to_log_on) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Devices_Allow_undock_without_having_to_log_on"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Devices_Allowed_to_format_and_eject_removable_media
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Administrators", "Administrators and Power Users", "Administrators and Interactive Users"]
  newparam(:dsc_devices_allowed_to_format_and_eject_removable_media) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Devices_Allowed_to_format_and_eject_removable_media - Valid values are Administrators, Administrators and Power Users, Administrators and Interactive Users."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Administrators', 'administrators', 'Administrators and Power Users', 'administrators and power users', 'Administrators and Interactive Users', 'administrators and interactive users'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Administrators, Administrators and Power Users, Administrators and Interactive Users")
      end
    end
  end

  # Name:         Devices_Prevent_users_from_installing_printer_drivers
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_devices_prevent_users_from_installing_printer_drivers) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Devices_Prevent_users_from_installing_printer_drivers"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Devices_Restrict_CD_ROM_access_to_locally_logged_on_user_only
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_devices_restrict_cd_rom_access_to_locally_logged_on_user_only) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Devices_Restrict_CD_ROM_access_to_locally_logged_on_user_only"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Devices_Restrict_floppy_access_to_locally_logged_on_user_only
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_devices_restrict_floppy_access_to_locally_logged_on_user_only) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Devices_Restrict_floppy_access_to_locally_logged_on_user_only"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Domain_controller_Allow_server_operators_to_schedule_tasks
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domain_controller_allow_server_operators_to_schedule_tasks) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Domain_controller_Allow_server_operators_to_schedule_tasks"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Domain_controller_LDAP_server_signing_requirements
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domain_controller_ldap_server_signing_requirements) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Domain_controller_LDAP_server_signing_requirements"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Domain_controller_Refuse_machine_account_password_changes
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domain_controller_refuse_machine_account_password_changes) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Domain_controller_Refuse_machine_account_password_changes"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Domain_member_Digitally_encrypt_or_sign_secure_channel_data_always
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domain_member_digitally_encrypt_or_sign_secure_channel_data_always) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Domain_member_Digitally_encrypt_or_sign_secure_channel_data_always"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Domain_member_Digitally_encrypt_secure_channel_data_when_possible
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domain_member_digitally_encrypt_secure_channel_data_when_possible) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Domain_member_Digitally_encrypt_secure_channel_data_when_possible"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Domain_member_Digitally_sign_secure_channel_data_when_possible
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domain_member_digitally_sign_secure_channel_data_when_possible) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Domain_member_Digitally_sign_secure_channel_data_when_possible"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Domain_member_Disable_machine_account_password_changes
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domain_member_disable_machine_account_password_changes) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Domain_member_Disable_machine_account_password_changes"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Domain_member_Maximum_machine_account_password_age
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domain_member_maximum_machine_account_password_age) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Domain_member_Maximum_machine_account_password_age"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Domain_member_Require_strong_Windows_2000_or_later_session_key
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domain_member_require_strong_windows_2000_or_later_session_key) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Domain_member_Require_strong_Windows_2000_or_later_session_key"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Interactive_logon_Display_user_information_when_the_session_is_locked
  # Type:         string
  # IsMandatory:  False
  # Values:       ["User displayname, domain and user names", "User display name only", "Do not display user information"]
  newparam(:dsc_interactive_logon_display_user_information_when_the_session_is_locked) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Interactive_logon_Display_user_information_when_the_session_is_locked - Valid values are User displayname, domain and user names, User display name only, Do not display user information."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['User displayname, domain and user names', 'user displayname, domain and user names', 'User display name only', 'user display name only', 'Do not display user information', 'do not display user information'].include?(value)
        fail("Invalid value '#{value}'. Valid values are User displayname, domain and user names, User display name only, Do not display user information")
      end
    end
  end

  # Name:         Interactive_logon_Do_not_display_last_user_name
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interactive_logon_do_not_display_last_user_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Interactive_logon_Do_not_display_last_user_name"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Interactive_logon_Do_not_require_CTRL_ALT_DEL
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interactive_logon_do_not_require_ctrl_alt_del) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Interactive_logon_Do_not_require_CTRL_ALT_DEL"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Interactive_logon_Machine_account_lockout_threshold
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interactive_logon_machine_account_lockout_threshold) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Interactive_logon_Machine_account_lockout_threshold"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Interactive_logon_Machine_inactivity_limit
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interactive_logon_machine_inactivity_limit) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Interactive_logon_Machine_inactivity_limit"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Interactive_logon_Message_text_for_users_attempting_to_log_on
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interactive_logon_message_text_for_users_attempting_to_log_on) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Interactive_logon_Message_text_for_users_attempting_to_log_on"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Interactive_logon_Message_title_for_users_attempting_to_log_on
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interactive_logon_message_title_for_users_attempting_to_log_on) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Interactive_logon_Message_title_for_users_attempting_to_log_on"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Interactive_logon_Number_of_previous_logons_to_cache_in_case_domain_controller_is_not_available
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interactive_logon_number_of_previous_logons_to_cache_in_case_domain_controller_is_not_available) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Interactive_logon_Number_of_previous_logons_to_cache_in_case_domain_controller_is_not_available"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Interactive_logon_Prompt_user_to_change_password_before_expiration
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interactive_logon_prompt_user_to_change_password_before_expiration) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Interactive_logon_Prompt_user_to_change_password_before_expiration"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Interactive_logon_Require_Domain_Controller_authentication_to_unlock_workstation
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interactive_logon_require_domain_controller_authentication_to_unlock_workstation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Interactive_logon_Require_Domain_Controller_authentication_to_unlock_workstation"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Interactive_logon_Require_smart_card
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interactive_logon_require_smart_card) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Interactive_logon_Require_smart_card"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Interactive_logon_Smart_card_removal_behavior
  # Type:         string
  # IsMandatory:  False
  # Values:       ["No Action", "Lock workstation", "Force logoff", "Disconnect if a remote Remote Desktop Services session"]
  newparam(:dsc_interactive_logon_smart_card_removal_behavior) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Interactive_logon_Smart_card_removal_behavior - Valid values are No Action, Lock workstation, Force logoff, Disconnect if a remote Remote Desktop Services session."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['No Action', 'no action', 'Lock workstation', 'lock workstation', 'Force logoff', 'force logoff', 'Disconnect if a remote Remote Desktop Services session', 'disconnect if a remote remote desktop services session'].include?(value)
        fail("Invalid value '#{value}'. Valid values are No Action, Lock workstation, Force logoff, Disconnect if a remote Remote Desktop Services session")
      end
    end
  end

  # Name:         Microsoft_network_client_Digitally_sign_communications_always
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_microsoft_network_client_digitally_sign_communications_always) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Microsoft_network_client_Digitally_sign_communications_always"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Microsoft_network_client_Digitally_sign_communications_if_server_agrees
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_microsoft_network_client_digitally_sign_communications_if_server_agrees) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Microsoft_network_client_Digitally_sign_communications_if_server_agrees"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Microsoft_network_client_Send_unencrypted_password_to_third_party_SMB_servers
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_microsoft_network_client_send_unencrypted_password_to_third_party_smb_servers) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Microsoft_network_client_Send_unencrypted_password_to_third_party_SMB_servers"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Microsoft_network_server_Amount_of_idle_time_required_before_suspending_session
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_microsoft_network_server_amount_of_idle_time_required_before_suspending_session) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Microsoft_network_server_Amount_of_idle_time_required_before_suspending_session"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Microsoft_network_server_Attempt_S4U2Self_to_obtain_claim_information
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_microsoft_network_server_attempt_s4u2self_to_obtain_claim_information) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Microsoft_network_server_Attempt_S4U2Self_to_obtain_claim_information"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Microsoft_network_server_Digitally_sign_communications_always
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_microsoft_network_server_digitally_sign_communications_always) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Microsoft_network_server_Digitally_sign_communications_always"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Microsoft_network_server_Digitally_sign_communications_if_client_agrees
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_microsoft_network_server_digitally_sign_communications_if_client_agrees) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Microsoft_network_server_Digitally_sign_communications_if_client_agrees"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Microsoft_network_server_Disconnect_clients_when_logon_hours_expire
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_microsoft_network_server_disconnect_clients_when_logon_hours_expire) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Microsoft_network_server_Disconnect_clients_when_logon_hours_expire"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Microsoft_network_server_Server_SPN_target_name_validation_level
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Off", "Accept if provided by the client", "Required from client"]
  newparam(:dsc_microsoft_network_server_server_spn_target_name_validation_level) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Microsoft_network_server_Server_SPN_target_name_validation_level - Valid values are Off, Accept if provided by the client, Required from client."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Off', 'off', 'Accept if provided by the client', 'accept if provided by the client', 'Required from client', 'required from client'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Off, Accept if provided by the client, Required from client")
      end
    end
  end

  # Name:         Network_access_Allow_anonymous_SID_Name_translation
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_access_allow_anonymous_sid_name_translation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_access_Allow_anonymous_SID_Name_translation"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_access_Do_not_allow_anonymous_enumeration_of_SAM_accounts
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_access_do_not_allow_anonymous_enumeration_of_sam_accounts) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_access_Do_not_allow_anonymous_enumeration_of_SAM_accounts"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_access_Do_not_allow_anonymous_enumeration_of_SAM_accounts_and_shares
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_access_do_not_allow_anonymous_enumeration_of_sam_accounts_and_shares) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_access_Do_not_allow_anonymous_enumeration_of_SAM_accounts_and_shares"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_access_Do_not_allow_storage_of_passwords_and_credentials_for_network_authentication
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_access_do_not_allow_storage_of_passwords_and_credentials_for_network_authentication) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_access_Do_not_allow_storage_of_passwords_and_credentials_for_network_authentication"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_access_Let_Everyone_permissions_apply_to_anonymous_users
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_access_let_everyone_permissions_apply_to_anonymous_users) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_access_Let_Everyone_permissions_apply_to_anonymous_users"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_access_Named_Pipes_that_can_be_accessed_anonymously
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_access_named_pipes_that_can_be_accessed_anonymously) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_access_Named_Pipes_that_can_be_accessed_anonymously"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_access_Remotely_accessible_registry_paths
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_access_remotely_accessible_registry_paths) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_access_Remotely_accessible_registry_paths"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_access_Remotely_accessible_registry_paths_and_subpaths
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_access_remotely_accessible_registry_paths_and_subpaths) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_access_Remotely_accessible_registry_paths_and_subpaths"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_access_Restrict_anonymous_access_to_Named_Pipes_and_Shares
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_access_restrict_anonymous_access_to_named_pipes_and_shares) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_access_Restrict_anonymous_access_to_Named_Pipes_and_Shares"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_access_Shares_that_can_be_accessed_anonymously
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_access_shares_that_can_be_accessed_anonymously) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_access_Shares_that_can_be_accessed_anonymously"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_access_Sharing_and_security_model_for_local_accounts
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Classic - Local users authenticate as themselves", "Guest only - Local users authenticate as Guest"]
  newparam(:dsc_network_access_sharing_and_security_model_for_local_accounts) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_access_Sharing_and_security_model_for_local_accounts - Valid values are Classic - Local users authenticate as themselves, Guest only - Local users authenticate as Guest."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Classic - Local users authenticate as themselves', 'classic - local users authenticate as themselves', 'Guest only - Local users authenticate as Guest', 'guest only - local users authenticate as guest'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Classic - Local users authenticate as themselves, Guest only - Local users authenticate as Guest")
      end
    end
  end

  # Name:         Network_security_Allow_Local_System_to_use_computer_identity_for_NTLM
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_security_allow_local_system_to_use_computer_identity_for_ntlm) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_security_Allow_Local_System_to_use_computer_identity_for_NTLM"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_security_Allow_LocalSystem_NULL_session_fallback
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_security_allow_localsystem_null_session_fallback) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_security_Allow_LocalSystem_NULL_session_fallback"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_Security_Allow_PKU2U_authentication_requests_to_this_computer_to_use_online_identities
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_security_allow_pku2u_authentication_requests_to_this_computer_to_use_online_identities) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_Security_Allow_PKU2U_authentication_requests_to_this_computer_to_use_online_identities"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_security_Configure_encryption_types_allowed_for_Kerberos
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["DES_CBC_CRC", "DES_CBC_MD5", "RC4_HMAC_MD5", "AES128_HMAC_SHA1", "AES256_HMAC_SHA1"]
  newparam(:dsc_network_security_configure_encryption_types_allowed_for_kerberos, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Network_security_Configure_encryption_types_allowed_for_Kerberos - Valid values are DES_CBC_CRC, DES_CBC_MD5, RC4_HMAC_MD5, AES128_HMAC_SHA1, AES256_HMAC_SHA1."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['DES_CBC_CRC', 'des_cbc_crc', 'DES_CBC_MD5', 'des_cbc_md5', 'RC4_HMAC_MD5', 'rc4_hmac_md5', 'AES128_HMAC_SHA1', 'aes128_hmac_sha1', 'AES256_HMAC_SHA1', 'aes256_hmac_sha1'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are DES_CBC_CRC, DES_CBC_MD5, RC4_HMAC_MD5, AES128_HMAC_SHA1, AES256_HMAC_SHA1")
        end
      end
      if value.kind_of?(String)
        unless ['DES_CBC_CRC', 'des_cbc_crc', 'DES_CBC_MD5', 'des_cbc_md5', 'RC4_HMAC_MD5', 'rc4_hmac_md5', 'AES128_HMAC_SHA1', 'aes128_hmac_sha1', 'AES256_HMAC_SHA1', 'aes256_hmac_sha1'].include?(value)
          fail("Invalid value #{value}. Valid values are DES_CBC_CRC, DES_CBC_MD5, RC4_HMAC_MD5, AES128_HMAC_SHA1, AES256_HMAC_SHA1")
        end
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Network_security_Do_not_store_LAN_Manager_hash_value_on_next_password_change
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_security_do_not_store_lan_manager_hash_value_on_next_password_change) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_security_Do_not_store_LAN_Manager_hash_value_on_next_password_change"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_security_Force_logoff_when_logon_hours_expire
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_security_force_logoff_when_logon_hours_expire) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_security_Force_logoff_when_logon_hours_expire"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_security_LAN_Manager_authentication_level
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Send LM & NTLM responses", "Send LM & NTLM - use NTLMv2 session security if negotiated", "Send NTLM responses only", "Send NTLMv2 responses only", "Send NTLMv2 responses only. Refuse LM", "Send NTLMv2 responses only. Refuse LM & NTLM"]
  newparam(:dsc_network_security_lan_manager_authentication_level) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_security_LAN_Manager_authentication_level - Valid values are Send LM & NTLM responses, Send LM & NTLM - use NTLMv2 session security if negotiated, Send NTLM responses only, Send NTLMv2 responses only, Send NTLMv2 responses only. Refuse LM, Send NTLMv2 responses only. Refuse LM & NTLM."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Send LM & NTLM responses', 'send lm & ntlm responses', 'Send LM & NTLM - use NTLMv2 session security if negotiated', 'send lm & ntlm - use ntlmv2 session security if negotiated', 'Send NTLM responses only', 'send ntlm responses only', 'Send NTLMv2 responses only', 'send ntlmv2 responses only', 'Send NTLMv2 responses only. Refuse LM', 'send ntlmv2 responses only. refuse lm', 'Send NTLMv2 responses only. Refuse LM & NTLM', 'send ntlmv2 responses only. refuse lm & ntlm'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Send LM & NTLM responses, Send LM & NTLM - use NTLMv2 session security if negotiated, Send NTLM responses only, Send NTLMv2 responses only, Send NTLMv2 responses only. Refuse LM, Send NTLMv2 responses only. Refuse LM & NTLM")
      end
    end
  end

  # Name:         Network_security_LDAP_client_signing_requirements
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Negotiate Signing", "Require Signing"]
  newparam(:dsc_network_security_ldap_client_signing_requirements) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_security_LDAP_client_signing_requirements - Valid values are None, Negotiate Signing, Require Signing."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Negotiate Signing', 'negotiate signing', 'Require Signing', 'require signing'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Negotiate Signing, Require Signing")
      end
    end
  end

  # Name:         Network_security_Minimum_session_security_for_NTLM_SSP_based_including_secure_RPC_clients
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Require NTLMv2 session security", "Require 128-bit encryption", "Both options checked"]
  newparam(:dsc_network_security_minimum_session_security_for_ntlm_ssp_based_including_secure_rpc_clients) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_security_Minimum_session_security_for_NTLM_SSP_based_including_secure_RPC_clients - Valid values are Require NTLMv2 session security, Require 128-bit encryption, Both options checked."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Require NTLMv2 session security', 'require ntlmv2 session security', 'Require 128-bit encryption', 'require 128-bit encryption', 'Both options checked', 'both options checked'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Require NTLMv2 session security, Require 128-bit encryption, Both options checked")
      end
    end
  end

  # Name:         Network_security_Minimum_session_security_for_NTLM_SSP_based_including_secure_RPC_servers
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Require NTLMv2 session security", "Require 128-bit encryption", "Both options checked"]
  newparam(:dsc_network_security_minimum_session_security_for_ntlm_ssp_based_including_secure_rpc_servers) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_security_Minimum_session_security_for_NTLM_SSP_based_including_secure_RPC_servers - Valid values are Require NTLMv2 session security, Require 128-bit encryption, Both options checked."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Require NTLMv2 session security', 'require ntlmv2 session security', 'Require 128-bit encryption', 'require 128-bit encryption', 'Both options checked', 'both options checked'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Require NTLMv2 session security, Require 128-bit encryption, Both options checked")
      end
    end
  end

  # Name:         Network_security_Restrict_NTLM_Add_remote_server_exceptions_for_NTLM_authentication
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_security_restrict_ntlm_add_remote_server_exceptions_for_ntlm_authentication) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_security_Restrict_NTLM_Add_remote_server_exceptions_for_NTLM_authentication"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_security_Restrict_NTLM_Add_server_exceptions_in_this_domain
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_network_security_restrict_ntlm_add_server_exceptions_in_this_domain) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_security_Restrict_NTLM_Add_server_exceptions_in_this_domain"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Network_Security_Restrict_NTLM_Incoming_NTLM_Traffic
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Disabled", "Enable auditing for domain accounts", "Enable auditing for all accounts"]
  newparam(:dsc_network_security_restrict_ntlm_incoming_ntlm_traffic) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_Security_Restrict_NTLM_Incoming_NTLM_Traffic - Valid values are Disabled, Enable auditing for domain accounts, Enable auditing for all accounts."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Disabled', 'disabled', 'Enable auditing for domain accounts', 'enable auditing for domain accounts', 'Enable auditing for all accounts', 'enable auditing for all accounts'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Disabled, Enable auditing for domain accounts, Enable auditing for all accounts")
      end
    end
  end

  # Name:         Network_Security_Restrict_NTLM_NTLM_authentication_in_this_domain
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Disable", "Enable for domain accounts to domain servers", "Enable for domain accounts", "Enable for domain servers", "Enable all"]
  newparam(:dsc_network_security_restrict_ntlm_ntlm_authentication_in_this_domain) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_Security_Restrict_NTLM_NTLM_authentication_in_this_domain - Valid values are Disable, Enable for domain accounts to domain servers, Enable for domain accounts, Enable for domain servers, Enable all."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Disable', 'disable', 'Enable for domain accounts to domain servers', 'enable for domain accounts to domain servers', 'Enable for domain accounts', 'enable for domain accounts', 'Enable for domain servers', 'enable for domain servers', 'Enable all', 'enable all'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Disable, Enable for domain accounts to domain servers, Enable for domain accounts, Enable for domain servers, Enable all")
      end
    end
  end

  # Name:         Network_Security_Restrict_NTLM_Outgoing_NTLM_traffic_to_remote_servers
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Allow all", "Deny all domain accounts", "Deny all accounts"]
  newparam(:dsc_network_security_restrict_ntlm_outgoing_ntlm_traffic_to_remote_servers) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_Security_Restrict_NTLM_Outgoing_NTLM_traffic_to_remote_servers - Valid values are Allow all, Deny all domain accounts, Deny all accounts."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Allow all', 'allow all', 'Deny all domain accounts', 'deny all domain accounts', 'Deny all accounts', 'deny all accounts'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Allow all, Deny all domain accounts, Deny all accounts")
      end
    end
  end

  # Name:         Network_Security_Restrict_NTLM_Audit_Incoming_NTLM_Traffic
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Disable", "Deny for domain accounts to domain servers", "Deny for domain accounts", "Deny for domain servers", "Deny all"]
  newparam(:dsc_network_security_restrict_ntlm_audit_incoming_ntlm_traffic) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_Security_Restrict_NTLM_Audit_Incoming_NTLM_Traffic - Valid values are Disable, Deny for domain accounts to domain servers, Deny for domain accounts, Deny for domain servers, Deny all."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Disable', 'disable', 'Deny for domain accounts to domain servers', 'deny for domain accounts to domain servers', 'Deny for domain accounts', 'deny for domain accounts', 'Deny for domain servers', 'deny for domain servers', 'Deny all', 'deny all'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Disable, Deny for domain accounts to domain servers, Deny for domain accounts, Deny for domain servers, Deny all")
      end
    end
  end

  # Name:         Network_Security_Restrict_NTLM_Audit_NTLM_authentication_in_this_domain
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Allow all", "Audit all", "Deny all"]
  newparam(:dsc_network_security_restrict_ntlm_audit_ntlm_authentication_in_this_domain) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Network_Security_Restrict_NTLM_Audit_NTLM_authentication_in_this_domain - Valid values are Allow all, Audit all, Deny all."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Allow all', 'allow all', 'Audit all', 'audit all', 'Deny all', 'deny all'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Allow all, Audit all, Deny all")
      end
    end
  end

  # Name:         Recovery_console_Allow_automatic_administrative_logon
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recovery_console_allow_automatic_administrative_logon) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Recovery_console_Allow_automatic_administrative_logon"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Recovery_console_Allow_floppy_copy_and_access_to_all_drives_and_folders
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recovery_console_allow_floppy_copy_and_access_to_all_drives_and_folders) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Recovery_console_Allow_floppy_copy_and_access_to_all_drives_and_folders"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Shutdown_Allow_system_to_be_shut_down_without_having_to_log_on
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_shutdown_allow_system_to_be_shut_down_without_having_to_log_on) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Shutdown_Allow_system_to_be_shut_down_without_having_to_log_on"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Shutdown_Clear_virtual_memory_pagefile
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_shutdown_clear_virtual_memory_pagefile) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Shutdown_Clear_virtual_memory_pagefile"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         System_cryptography_Force_strong_key_protection_for_user_keys_stored_on_the_computer
  # Type:         string
  # IsMandatory:  False
  # Values:       ["User input is not required when new keys are stored and used", "User is prompted when the key is first used", "User must enter a password each time they use a key"]
  newparam(:dsc_system_cryptography_force_strong_key_protection_for_user_keys_stored_on_the_computer) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "System_cryptography_Force_strong_key_protection_for_user_keys_stored_on_the_computer - Valid values are User input is not required when new keys are stored and used, User is prompted when the key is first used, User must enter a password each time they use a key."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['User input is not required when new keys are stored and used', 'user input is not required when new keys are stored and used', 'User is prompted when the key is first used', 'user is prompted when the key is first used', 'User must enter a password each time they use a key', 'user must enter a password each time they use a key'].include?(value)
        fail("Invalid value '#{value}'. Valid values are User input is not required when new keys are stored and used, User is prompted when the key is first used, User must enter a password each time they use a key")
      end
    end
  end

  # Name:         System_cryptography_Use_FIPS_compliant_algorithms_for_encryption_hashing_and_signing
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_system_cryptography_use_fips_compliant_algorithms_for_encryption_hashing_and_signing) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "System_cryptography_Use_FIPS_compliant_algorithms_for_encryption_hashing_and_signing"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         System_objects_Require_case_insensitivity_for_non_Windows_subsystems
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_system_objects_require_case_insensitivity_for_non_windows_subsystems) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "System_objects_Require_case_insensitivity_for_non_Windows_subsystems"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         System_objects_Strengthen_default_permissions_of_internal_system_objects_eg_Symbolic_Links
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_system_objects_strengthen_default_permissions_of_internal_system_objects_eg_symbolic_links) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "System_objects_Strengthen_default_permissions_of_internal_system_objects_eg_Symbolic_Links"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         System_settings_Optional_subsystems
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_system_settings_optional_subsystems) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "System_settings_Optional_subsystems"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         System_settings_Use_Certificate_Rules_on_Windows_Executables_for_Software_Restriction_Policies
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_system_settings_use_certificate_rules_on_windows_executables_for_software_restriction_policies) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "System_settings_Use_Certificate_Rules_on_Windows_Executables_for_Software_Restriction_Policies"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         User_Account_Control_Admin_Approval_Mode_for_the_Built_in_Administrator_account
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_user_account_control_admin_approval_mode_for_the_built_in_administrator_account) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "User_Account_Control_Admin_Approval_Mode_for_the_Built_in_Administrator_account"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         User_Account_Control_Allow_UIAccess_applications_to_prompt_for_elevation_without_using_the_secure_desktop
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_user_account_control_allow_uiaccess_applications_to_prompt_for_elevation_without_using_the_secure_desktop) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "User_Account_Control_Allow_UIAccess_applications_to_prompt_for_elevation_without_using_the_secure_desktop"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         User_Account_Control_Behavior_of_the_elevation_prompt_for_administrators_in_Admin_Approval_Mode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Elevate without prompting", "Prompt for credentials on the secure desktop", "Prompt for consent on the secure desktop", "Prompt for credentials", "Prompt for consent", "Prompt for consent for non-Windows binaries"]
  newparam(:dsc_user_account_control_behavior_of_the_elevation_prompt_for_administrators_in_admin_approval_mode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "User_Account_Control_Behavior_of_the_elevation_prompt_for_administrators_in_Admin_Approval_Mode - Valid values are Elevate without prompting, Prompt for credentials on the secure desktop, Prompt for consent on the secure desktop, Prompt for credentials, Prompt for consent, Prompt for consent for non-Windows binaries."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Elevate without prompting', 'elevate without prompting', 'Prompt for credentials on the secure desktop', 'prompt for credentials on the secure desktop', 'Prompt for consent on the secure desktop', 'prompt for consent on the secure desktop', 'Prompt for credentials', 'prompt for credentials', 'Prompt for consent', 'prompt for consent', 'Prompt for consent for non-Windows binaries', 'prompt for consent for non-windows binaries'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Elevate without prompting, Prompt for credentials on the secure desktop, Prompt for consent on the secure desktop, Prompt for credentials, Prompt for consent, Prompt for consent for non-Windows binaries")
      end
    end
  end

  # Name:         User_Account_Control_Behavior_of_the_elevation_prompt_for_standard_users
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Automatically deny elevation request", "Prompt for credentials on the secure desktop", "Prompt for crendentials"]
  newparam(:dsc_user_account_control_behavior_of_the_elevation_prompt_for_standard_users) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "User_Account_Control_Behavior_of_the_elevation_prompt_for_standard_users - Valid values are Automatically deny elevation request, Prompt for credentials on the secure desktop, Prompt for crendentials."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Automatically deny elevation request', 'automatically deny elevation request', 'Prompt for credentials on the secure desktop', 'prompt for credentials on the secure desktop', 'Prompt for crendentials', 'prompt for crendentials'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Automatically deny elevation request, Prompt for credentials on the secure desktop, Prompt for crendentials")
      end
    end
  end

  # Name:         User_Account_Control_Detect_application_installations_and_prompt_for_elevation
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_user_account_control_detect_application_installations_and_prompt_for_elevation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "User_Account_Control_Detect_application_installations_and_prompt_for_elevation"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         User_Account_Control_Only_elevate_executables_that_are_signed_and_validated
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_user_account_control_only_elevate_executables_that_are_signed_and_validated) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "User_Account_Control_Only_elevate_executables_that_are_signed_and_validated"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         User_Account_Control_Only_elevate_UIAccess_applications_that_are_installed_in_secure_locations
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_user_account_control_only_elevate_uiaccess_applications_that_are_installed_in_secure_locations) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "User_Account_Control_Only_elevate_UIAccess_applications_that_are_installed_in_secure_locations"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         User_Account_Control_Run_all_administrators_in_Admin_Approval_Mode
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_user_account_control_run_all_administrators_in_admin_approval_mode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "User_Account_Control_Run_all_administrators_in_Admin_Approval_Mode"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         User_Account_Control_Switch_to_the_secure_desktop_when_prompting_for_elevation
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_user_account_control_switch_to_the_secure_desktop_when_prompting_for_elevation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "User_Account_Control_Switch_to_the_secure_desktop_when_prompting_for_elevation"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         User_Account_Control_Virtualize_file_and_registry_write_failures_to_per_user_locations
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_user_account_control_virtualize_file_and_registry_write_failures_to_per_user_locations) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "User_Account_Control_Virtualize_file_and_registry_write_failures_to_per_user_locations"
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

Puppet::Type.type(:dsc_securityoption).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
