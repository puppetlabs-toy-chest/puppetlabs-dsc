#! /usr/bin/env ruby
require 'spec_helper'
require 'puppet/type'
require 'puppet_x/puppetlabs/powershell_manager'

describe PuppetX::Dsc::PowerShellManager, :if => Puppet::Util::Platform.windows? do
  before(:each) do
    @ps = PuppetX::Dsc::PowerShellManager.instance("powershell.exe -NoProfile -NonInteractive -NoLogo -ExecutionPolicy, Bypass -Command -'")
  end

  describe "when powershell is present" do
    describe "when provided simple commands" do
      it "should exectue and return" do
        result = ps.execute('Write-Output foo')
        expect(result).to eq 'foo'
      end
    end
  end

end
