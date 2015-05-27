test_name 'FM-2626 - C70297 - Configure LCM for "Disabled" RefreshMode'

confine(:to, :platform => 'windows')

#Init
ps_launch = 'powershell.exe -ExecutionPolicy Bypass -InputFormat Text -OutputFormat Text -NoLogo -NoProfile -NonInteractive'

dsc_conf_path_name = 'LCMSettings'

dsc_conf_mof = <<-CONF
instance of MSFT_DSCMetaConfiguration as $MSFT_DSCMetaConfiguration1ref
{
  RefreshMode = "Disabled";
};

instance of OMI_ConfigurationDocument
{
  Version="2.0.0";
  MinimumCompatibleVersion = "1.0.0";
  CompatibleVersionAdditionalProperties= { "MSFT_DSCMetaConfiguration:StatusRetentionTimeInDays" };
  Author="Administrator";
  Name="LCMSettings";
};
CONF

#Setup
step 'Copy MOF Configuration to Windows Agents'
on(agents, "mkdir -p /cygdrive/c/#{dsc_conf_path_name}")
create_remote_file(agents, "/cygdrive/c/#{dsc_conf_path_name}/localhost.meta.mof", dsc_conf_mof)

step 'Apply MOF to Windows Agents'
on(agents, "#{ps_launch} -Command \"Set-DscLocalConfigurationManager -Verbose -Path C:/#{dsc_conf_path_name}\"")
