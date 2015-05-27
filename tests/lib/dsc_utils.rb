# Verify the expected state of a DSC resource on a given host.
#
# ==== Attributes
#
# * +host+ - The target Windows host for verification.
# * +dsc_resource_type+ - The DSC resource type name to verify.
# * +dsc_properties+ - A hash of DSC resource properties to verify.
# * +expect_failure+ - A flag for indicating that the command is expected to fail.
#
# ==== Returns
#
# +BeakerResult+
#
# ==== Examples
#
# test_dsc_resource(agents, 'File', false, :DestinationPath=>'C:\test.txt', :Contents=>'catcat')
def test_dsc_resource(host, dsc_resource_type, expect_failure, dsc_properties)
  #Init
  ps_launch = 'powershell.exe -ExecutionPolicy Bypass -InputFormat Text -OutputFormat Text -NoLogo -NoProfile -NonInteractive'
  exit_code = expect_failure ? 1 : 0

  #Flatten hash into formatted string.
  dsc_prop_merge = '@{'
  dsc_properties.each do |k, v|
    dsc_prop_merge << "\\\"#{k}\\\"=\\\"#{v}\\\";"
  end
  dsc_prop_merge.chop!
  dsc_prop_merge << '}'

  #Compose strings for PS command.
  dsc_command = "Invoke-DscResource -Name #{dsc_resource_type} -Method Test -Verbose -Property #{dsc_prop_merge}"
  ps_command = "#{ps_launch} -Command \"if ( #{dsc_command} ) { exit 0 } else { exit 1 }\""

  on(host, ps_command, :acceptable_exit_codes => exit_code)
end
