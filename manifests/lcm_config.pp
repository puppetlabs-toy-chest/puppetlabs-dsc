define dsc::lcm_config (
  $refresh_mode = 'Disabled'
) {

  validate_re($refresh_mode, '^(Disabled|Push)$', 'refresh_mode must be one of \'Disabled\', \'Push\'')

  exec { "dsc_provider_set_lcm_refreshmode_${refresh_mode}":
    provider => 'powershell',
    onlyif   => "if ((Get-DscLocalConfigurationManager).RefreshMode -eq '${refresh_mode}') {exit 1} else {exit 0}",
    command  => template('dsc/set-lcm-mode.ps1.erb'),
  }
}
