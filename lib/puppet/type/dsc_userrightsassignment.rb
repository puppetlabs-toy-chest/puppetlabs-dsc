require 'pathname'

Puppet::Type.newtype(:dsc_userrightsassignment) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC UserRightsAssignment resource type.
    Automatically generated from
    'SecurityPolicyDsc/DSCResources/MSFT_UserRightsAssignment/MSFT_UserRightsAssignment.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_policy is a required attribute') if self[:dsc_policy].nil?
    end

  def dscmeta_resource_friendly_name; 'UserRightsAssignment' end
  def dscmeta_resource_name; 'MSFT_UserRightsAssignment' end
  def dscmeta_module_name; 'SecurityPolicyDsc' end
  def dscmeta_module_version; '1.2.0.0' end

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

  # Name:         Policy
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Create_a_token_object", "Access_this_computer_from_the_network", "Change_the_system_time", "Deny_log_on_as_a_batch_job", "Deny_log_on_through_Remote_Desktop_Services", "Create_global_objects", "Remove_computer_from_docking_station", "Deny_access_to_this_computer_from_the_network", "Act_as_part_of_the_operating_system", "Modify_firmware_environment_values", "Deny_log_on_locally", "Access_Credential_Manager_as_a_trusted_caller", "Restore_files_and_directories", "Change_the_time_zone", "Replace_a_process_level_token", "Manage_auditing_and_security_log", "Create_symbolic_links", "Modify_an_object_label", "Enable_computer_and_user_accounts_to_be_trusted_for_delegation", "Generate_security_audits", "Increase_a_process_working_set", "Take_ownership_of_files_or_other_objects", "Bypass_traverse_checking", "Log_on_as_a_service", "Shut_down_the_system", "Lock_pages_in_memory", "Impersonate_a_client_after_authentication", "Profile_system_performance", "Debug_programs", "Profile_single_process", "Allow_log_on_through_Remote_Desktop_Services", "Allow_log_on_locally", "Increase_scheduling_priority", "Synchronize_directory_service_data", "Add_workstations_to_domain", "Adjust_memory_quotas_for_a_process", "Obtain_an_impersonation_token_for_another_user_in_the_same_session", "Perform_volume_maintenance_tasks", "Load_and_unload_device_drivers", "Force_shutdown_from_a_remote_system", "Back_up_files_and_directories", "Create_a_pagefile", "Deny_log_on_as_a_service", "Log_on_as_a_batch_job", "Create_permanent_shared_objects"]
  newparam(:dsc_policy) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Policy - The policy name of the user rights assignment to be configured. Valid values are Create_a_token_object, Access_this_computer_from_the_network, Change_the_system_time, Deny_log_on_as_a_batch_job, Deny_log_on_through_Remote_Desktop_Services, Create_global_objects, Remove_computer_from_docking_station, Deny_access_to_this_computer_from_the_network, Act_as_part_of_the_operating_system, Modify_firmware_environment_values, Deny_log_on_locally, Access_Credential_Manager_as_a_trusted_caller, Restore_files_and_directories, Change_the_time_zone, Replace_a_process_level_token, Manage_auditing_and_security_log, Create_symbolic_links, Modify_an_object_label, Enable_computer_and_user_accounts_to_be_trusted_for_delegation, Generate_security_audits, Increase_a_process_working_set, Take_ownership_of_files_or_other_objects, Bypass_traverse_checking, Log_on_as_a_service, Shut_down_the_system, Lock_pages_in_memory, Impersonate_a_client_after_authentication, Profile_system_performance, Debug_programs, Profile_single_process, Allow_log_on_through_Remote_Desktop_Services, Allow_log_on_locally, Increase_scheduling_priority, Synchronize_directory_service_data, Add_workstations_to_domain, Adjust_memory_quotas_for_a_process, Obtain_an_impersonation_token_for_another_user_in_the_same_session, Perform_volume_maintenance_tasks, Load_and_unload_device_drivers, Force_shutdown_from_a_remote_system, Back_up_files_and_directories, Create_a_pagefile, Deny_log_on_as_a_service, Log_on_as_a_batch_job, Create_permanent_shared_objects."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Create_a_token_object', 'create_a_token_object', 'Access_this_computer_from_the_network', 'access_this_computer_from_the_network', 'Change_the_system_time', 'change_the_system_time', 'Deny_log_on_as_a_batch_job', 'deny_log_on_as_a_batch_job', 'Deny_log_on_through_Remote_Desktop_Services', 'deny_log_on_through_remote_desktop_services', 'Create_global_objects', 'create_global_objects', 'Remove_computer_from_docking_station', 'remove_computer_from_docking_station', 'Deny_access_to_this_computer_from_the_network', 'deny_access_to_this_computer_from_the_network', 'Act_as_part_of_the_operating_system', 'act_as_part_of_the_operating_system', 'Modify_firmware_environment_values', 'modify_firmware_environment_values', 'Deny_log_on_locally', 'deny_log_on_locally', 'Access_Credential_Manager_as_a_trusted_caller', 'access_credential_manager_as_a_trusted_caller', 'Restore_files_and_directories', 'restore_files_and_directories', 'Change_the_time_zone', 'change_the_time_zone', 'Replace_a_process_level_token', 'replace_a_process_level_token', 'Manage_auditing_and_security_log', 'manage_auditing_and_security_log', 'Create_symbolic_links', 'create_symbolic_links', 'Modify_an_object_label', 'modify_an_object_label', 'Enable_computer_and_user_accounts_to_be_trusted_for_delegation', 'enable_computer_and_user_accounts_to_be_trusted_for_delegation', 'Generate_security_audits', 'generate_security_audits', 'Increase_a_process_working_set', 'increase_a_process_working_set', 'Take_ownership_of_files_or_other_objects', 'take_ownership_of_files_or_other_objects', 'Bypass_traverse_checking', 'bypass_traverse_checking', 'Log_on_as_a_service', 'log_on_as_a_service', 'Shut_down_the_system', 'shut_down_the_system', 'Lock_pages_in_memory', 'lock_pages_in_memory', 'Impersonate_a_client_after_authentication', 'impersonate_a_client_after_authentication', 'Profile_system_performance', 'profile_system_performance', 'Debug_programs', 'debug_programs', 'Profile_single_process', 'profile_single_process', 'Allow_log_on_through_Remote_Desktop_Services', 'allow_log_on_through_remote_desktop_services', 'Allow_log_on_locally', 'allow_log_on_locally', 'Increase_scheduling_priority', 'increase_scheduling_priority', 'Synchronize_directory_service_data', 'synchronize_directory_service_data', 'Add_workstations_to_domain', 'add_workstations_to_domain', 'Adjust_memory_quotas_for_a_process', 'adjust_memory_quotas_for_a_process', 'Obtain_an_impersonation_token_for_another_user_in_the_same_session', 'obtain_an_impersonation_token_for_another_user_in_the_same_session', 'Perform_volume_maintenance_tasks', 'perform_volume_maintenance_tasks', 'Load_and_unload_device_drivers', 'load_and_unload_device_drivers', 'Force_shutdown_from_a_remote_system', 'force_shutdown_from_a_remote_system', 'Back_up_files_and_directories', 'back_up_files_and_directories', 'Create_a_pagefile', 'create_a_pagefile', 'Deny_log_on_as_a_service', 'deny_log_on_as_a_service', 'Log_on_as_a_batch_job', 'log_on_as_a_batch_job', 'Create_permanent_shared_objects', 'create_permanent_shared_objects'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Create_a_token_object, Access_this_computer_from_the_network, Change_the_system_time, Deny_log_on_as_a_batch_job, Deny_log_on_through_Remote_Desktop_Services, Create_global_objects, Remove_computer_from_docking_station, Deny_access_to_this_computer_from_the_network, Act_as_part_of_the_operating_system, Modify_firmware_environment_values, Deny_log_on_locally, Access_Credential_Manager_as_a_trusted_caller, Restore_files_and_directories, Change_the_time_zone, Replace_a_process_level_token, Manage_auditing_and_security_log, Create_symbolic_links, Modify_an_object_label, Enable_computer_and_user_accounts_to_be_trusted_for_delegation, Generate_security_audits, Increase_a_process_working_set, Take_ownership_of_files_or_other_objects, Bypass_traverse_checking, Log_on_as_a_service, Shut_down_the_system, Lock_pages_in_memory, Impersonate_a_client_after_authentication, Profile_system_performance, Debug_programs, Profile_single_process, Allow_log_on_through_Remote_Desktop_Services, Allow_log_on_locally, Increase_scheduling_priority, Synchronize_directory_service_data, Add_workstations_to_domain, Adjust_memory_quotas_for_a_process, Obtain_an_impersonation_token_for_another_user_in_the_same_session, Perform_volume_maintenance_tasks, Load_and_unload_device_drivers, Force_shutdown_from_a_remote_system, Back_up_files_and_directories, Create_a_pagefile, Deny_log_on_as_a_service, Log_on_as_a_batch_job, Create_permanent_shared_objects")
      end
    end
  end

  # Name:         Identity
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_identity, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Identity - The identity of the user or group to be added or removed from the user rights assignment."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_userrightsassignment).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
