#! /usr/bin/env ruby
require 'spec_helper'
require 'puppet/type'
require 'puppet_x/puppetlabs/powershell_manager'

describe PuppetX::Dsc::PowerShellManager, :if => Puppet::Util::Platform.windows? do

  let (:powershell) {
    if File.exists?("#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe")
      "#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe"
    elsif File.exists?("#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe")
      "#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe"
    else
      'powershell.exe'
    end
  }

  let (:powershell_args){
    ['-NoProfile', '-NonInteractive', '-NoLogo', '-ExecutionPolicy', 'Bypass', '-Command', '-']
  }

  let (:manager) {
    PuppetX::Dsc::PowerShellManager.instance("#{powershell} #{powershell_args.join(' ')}")
  }

  describe "when provided powershell commands" do
    it "should return simple output" do
      result = manager.execute('write-output foo')[:stdout]
      expect(result).to eq "foo\n"
    end

    it "should exectue cmdlets" do
      result = manager.execute('ls')[:stdout]
      expect(result).not_to eq nil
    end

    it "should exectue cmdlets with pipes" do
      result = manager.execute('Get-Process | ? { $_.PID -ne $PID }')[:stdout]
      expect(result).not_to eq nil
    end

    it "should exectue multi-line" do
      result = manager.execute(<<-CODE
$foo = ls
$count = $foo.count
$count
      CODE
      )[:stdout]
      expect(result).not_to eq nil
    end
  end

end
