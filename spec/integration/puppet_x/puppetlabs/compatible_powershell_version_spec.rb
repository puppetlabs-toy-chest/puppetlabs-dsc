#! /usr/bin/env ruby
require 'spec_helper'
require 'puppet/type'
require 'puppet_x/puppetlabs/compatible_powershell_version'

describe PuppetX::PuppetLabs::Dsc::CompatiblePowerShellVersion, :if => Puppet::Util::Platform.windows? do
  before(:each) do
    @ps = PuppetX::PuppetLabs::Dsc::CompatiblePowerShellVersion
  end

  describe "when powershell is installed" do

    describe "when evaluating powershell version" do

      it "should reject powershell version less than 5" do
        Win32::Registry.any_instance.expects(:[]).with('PowerShellVersion').returns('4.0.0.0')

        version = @ps.compatible_version?

        expect(version).to eq false
      end


      it "should allow a powershell version 5 or greater" do
        Win32::Registry.any_instance.expects(:[]).with('PowerShellVersion').returns('5.1.0.0')

        version = @ps.compatible_version?

        expect(version).to eq true
      end
    end
  end
end