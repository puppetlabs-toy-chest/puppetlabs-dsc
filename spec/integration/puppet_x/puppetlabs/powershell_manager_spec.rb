require 'spec_helper'
require 'puppet/type'
require 'puppet_x/puppetlabs/powershell_manager' if Puppet::Util::Platform.windows?

module PuppetX
  module Dsc
    class PowerShellManager; end
  end
end

describe PuppetX::Dsc::PowerShellManager, :if => Puppet::Util::Platform.windows? do

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
  end

end
