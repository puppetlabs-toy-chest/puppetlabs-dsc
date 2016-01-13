require 'spec_helper'
require 'puppet/type'
require 'puppet_x/puppetlabs/powershell_manager' if Puppet::Util::Platform.windows?

module PuppetX
  module Dsc
    class PowerShellManager; end
  end
end

describe PuppetX::Dsc::PowerShellManager,
  :if => Puppet::Util::Platform.windows? && !Facter.value(:uses_win32console) do

  let (:manager) {
    powershell = Puppet::Type.type(:base_dsc).defaultprovider.command(:powershell)
    powershell_args = Puppet::Type.type(:base_dsc).defaultprovider.powershell_args
    PuppetX::Dsc::PowerShellManager.instance("#{powershell} #{powershell_args.join(' ')}")
  }

  describe "when provided powershell commands" do
    it "should return simple output" do
      result = manager.execute('write-output foo')[:stdout]
      expect(result).to eq("foo\n")
    end

    it "should execute cmdlets" do
      result = manager.execute('ls')[:stdout]
      expect(result).not_to eq(nil)
    end

    it "should execute cmdlets with pipes" do
      result = manager.execute('Get-Process | ? { $_.PID -ne $PID }')[:stdout]
      expect(result).not_to eq(nil)
    end

    it "should execute multi-line" do
      result = manager.execute(<<-CODE
$foo = ls
$count = $foo.count
$count
      CODE
      )[:stdout]
      expect(result).not_to eq(nil)
    end

    it "should reuse the same PowerShell process for multiple calls" do
      first_pid = manager.execute('[Diagnostics.Process]::GetCurrentProcess().Id')[:stdout]
      second_pid = manager.execute('[Diagnostics.Process]::GetCurrentProcess().Id')[:stdout]

      expect(first_pid).to eq(second_pid)
    end

    it "should be able to write more than the 64k default buffer size to child process stdout without deadlocking the Ruby parent process" do
      result = manager.execute(<<-CODE
$bytes_in_k = (1024 * 64) + 1
[Text.Encoding]::UTF8.GetString((New-Object Byte[] ($bytes_in_k))) | Write-Output
        CODE
        )[:stdout]
      expect(result).not_to eq(nil)
    end

    it "should return a JSON response with a timeout error if the execution timeout is exceeded" do
      timeout_ms = 100
      result = manager.execute('sleep 1', timeout_ms)
      response = JSON.parse(result[:stdout])
      msg = /Catastrophic failure\: PowerShell DSC resource timeout \(#{timeout_ms} ms\) exceeded while executing/
      expect(response['errormessage']).to match(msg)
    end

    it "should not deadlock and return a valid JSON response given invalid unparseable PowerShell code" do
      result = manager.execute(<<-CODE
        {

        CODE
        )

      response = JSON.parse(result[:stdout])
      expect(response["errormessage"]).not_to be_empty
    end
  end

end
