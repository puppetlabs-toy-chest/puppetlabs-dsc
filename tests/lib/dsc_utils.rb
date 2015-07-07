# Verify the expected state of a DSC resource on a given host.
#
# ==== Attributes
#
# * +host+ - The target Windows host for verification.
# * +dsc_resource_type+ - The DSC resource type name to verify.
# * +opts:expect_failure?+ - Indicates that the DSC test configuration will fail.
# * +opts:*+ - Any other key/values in the opts hash is considered to be DSC properties to verify.
#
# ==== Returns
#
# +BeakerResult+
#
# ==== Examples
#
# test_dsc_resource(agents, 'File', expect_failure? => false, :DestinationPath=>'C:\test.txt', :Contents=>'catcat')
def test_dsc_resource(host, dsc_resource_type, opts)
  #Init
  ps_launch = 'powershell.exe -ExecutionPolicy Bypass -InputFormat Text -OutputFormat Text -NoLogo -NoProfile -NonInteractive'
  opts[:expect_failure?] ||= false
  exit_code = opts[:expect_failure?] ? 1 : 0

  #Flatten hash into formatted string.
  opts.delete(:expect_failure?)
  dsc_prop_merge = '@{'
  opts.each do |k, v|
    dsc_prop_merge << "\\\"#{k}\\\"=\\\"#{v}\\\";"
  end
  dsc_prop_merge.chop!
  dsc_prop_merge << '}'

  #Compose strings for PS command.
  dsc_command = "Invoke-DscResource -Name #{dsc_resource_type} -Method Test -Verbose -Property #{dsc_prop_merge}"
  ps_command = "#{ps_launch} -Command \"if ( #{dsc_command} ) { exit 0 } else { exit 1 }\""

  on(host, ps_command, :acceptable_exit_codes => exit_code)
end
