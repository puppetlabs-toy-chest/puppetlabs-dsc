#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_windowsoptionalfeature) do

  let :dsc_windowsoptionalfeature do
    Puppet::Type.type(:dsc_windowsoptionalfeature).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_windowsoptionalfeature).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_ensure => 'Enable',
      :dsc_source => ["foo", "bar", "spec"],
      :dsc_nowindowsupdatecheck => true,
      :dsc_removefilesondisable => true,
      :dsc_loglevel => 'ErrorsOnly',
      :dsc_logpath => 'foo',
      :dsc_customproperties => ["foo", "bar", "spec"],
      :dsc_description => 'foo',
      :dsc_displayname => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_windowsoptionalfeature.to_s).to eq("Dsc_windowsoptionalfeature[foo]")
  end

  it 'should default to ensure => enable' do
    expect(dsc_windowsoptionalfeature[:ensure]).to eq :enable
  end

  it 'should require that dsc_name is specified' do
    #dsc_windowsoptionalfeature[:dsc_name]
    expect { Puppet::Type.type(:dsc_windowsoptionalfeature).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_windowsoptionalfeature[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_windowsoptionalfeature[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_windowsoptionalfeature[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_windowsoptionalfeature[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Enable' do
    dsc_windowsoptionalfeature[:dsc_ensure] = 'Enable'
    expect(dsc_windowsoptionalfeature[:dsc_ensure]).to eq('Enable')
  end

  it 'should accept dsc_ensure predefined value enable' do
    dsc_windowsoptionalfeature[:dsc_ensure] = 'enable'
    expect(dsc_windowsoptionalfeature[:dsc_ensure]).to eq('enable')
  end

  it 'should accept dsc_ensure predefined value enable and update ensure with this value (ensure end value should be a symbol)' do
    dsc_windowsoptionalfeature[:dsc_ensure] = 'enable'
    expect(dsc_windowsoptionalfeature[:ensure]).to eq(dsc_windowsoptionalfeature[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Disable' do
    dsc_windowsoptionalfeature[:dsc_ensure] = 'Disable'
    expect(dsc_windowsoptionalfeature[:dsc_ensure]).to eq('Disable')
  end

  it 'should accept dsc_ensure predefined value disable' do
    dsc_windowsoptionalfeature[:dsc_ensure] = 'disable'
    expect(dsc_windowsoptionalfeature[:dsc_ensure]).to eq('disable')
  end

  it 'should accept dsc_ensure predefined value disable and update ensure with this value (ensure end value should be a symbol)' do
    dsc_windowsoptionalfeature[:dsc_ensure] = 'disable'
    expect(dsc_windowsoptionalfeature[:ensure]).to eq(dsc_windowsoptionalfeature[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_windowsoptionalfeature[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_windowsoptionalfeature[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_windowsoptionalfeature[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_windowsoptionalfeature[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_windowsoptionalfeature[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_source' do
    dsc_windowsoptionalfeature[:dsc_source] = ["foo", "bar", "spec"]
    expect(dsc_windowsoptionalfeature[:dsc_source]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_source' do
    expect{dsc_windowsoptionalfeature[:dsc_source] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_source' do
    expect{dsc_windowsoptionalfeature[:dsc_source] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_source' do
    expect{dsc_windowsoptionalfeature[:dsc_source] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_nowindowsupdatecheck' do
    expect{dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_nowindowsupdatecheck' do
    dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck] = true
    expect(dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_nowindowsupdatecheck" do
    dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck] = 'true'
    expect(dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_nowindowsupdatecheck" do
    dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck] = 'false'
    expect(dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_nowindowsupdatecheck" do
    dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck] = 'True'
    expect(dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_nowindowsupdatecheck" do
    dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck] = 'False'
    expect(dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_nowindowsupdatecheck" do
    dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck] = :true
    expect(dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_nowindowsupdatecheck" do
    dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck] = :false
    expect(dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(false)
  end

  it 'should not accept int for dsc_nowindowsupdatecheck' do
    expect{dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_nowindowsupdatecheck' do
    expect{dsc_windowsoptionalfeature[:dsc_nowindowsupdatecheck] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_removefilesondisable' do
    expect{dsc_windowsoptionalfeature[:dsc_removefilesondisable] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_removefilesondisable' do
    dsc_windowsoptionalfeature[:dsc_removefilesondisable] = true
    expect(dsc_windowsoptionalfeature[:dsc_removefilesondisable]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_removefilesondisable" do
    dsc_windowsoptionalfeature[:dsc_removefilesondisable] = 'true'
    expect(dsc_windowsoptionalfeature[:dsc_removefilesondisable]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_removefilesondisable" do
    dsc_windowsoptionalfeature[:dsc_removefilesondisable] = 'false'
    expect(dsc_windowsoptionalfeature[:dsc_removefilesondisable]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_removefilesondisable" do
    dsc_windowsoptionalfeature[:dsc_removefilesondisable] = 'True'
    expect(dsc_windowsoptionalfeature[:dsc_removefilesondisable]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_removefilesondisable" do
    dsc_windowsoptionalfeature[:dsc_removefilesondisable] = 'False'
    expect(dsc_windowsoptionalfeature[:dsc_removefilesondisable]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_removefilesondisable" do
    dsc_windowsoptionalfeature[:dsc_removefilesondisable] = :true
    expect(dsc_windowsoptionalfeature[:dsc_removefilesondisable]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_removefilesondisable" do
    dsc_windowsoptionalfeature[:dsc_removefilesondisable] = :false
    expect(dsc_windowsoptionalfeature[:dsc_removefilesondisable]).to eq(false)
  end

  it 'should not accept int for dsc_removefilesondisable' do
    expect{dsc_windowsoptionalfeature[:dsc_removefilesondisable] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_removefilesondisable' do
    expect{dsc_windowsoptionalfeature[:dsc_removefilesondisable] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_loglevel predefined value ErrorsOnly' do
    dsc_windowsoptionalfeature[:dsc_loglevel] = 'ErrorsOnly'
    expect(dsc_windowsoptionalfeature[:dsc_loglevel]).to eq('ErrorsOnly')
  end

  it 'should accept dsc_loglevel predefined value errorsonly' do
    dsc_windowsoptionalfeature[:dsc_loglevel] = 'errorsonly'
    expect(dsc_windowsoptionalfeature[:dsc_loglevel]).to eq('errorsonly')
  end

  it 'should accept dsc_loglevel predefined value ErrorsAndWarning' do
    dsc_windowsoptionalfeature[:dsc_loglevel] = 'ErrorsAndWarning'
    expect(dsc_windowsoptionalfeature[:dsc_loglevel]).to eq('ErrorsAndWarning')
  end

  it 'should accept dsc_loglevel predefined value errorsandwarning' do
    dsc_windowsoptionalfeature[:dsc_loglevel] = 'errorsandwarning'
    expect(dsc_windowsoptionalfeature[:dsc_loglevel]).to eq('errorsandwarning')
  end

  it 'should accept dsc_loglevel predefined value ErrorsAndWarningAndInformation' do
    dsc_windowsoptionalfeature[:dsc_loglevel] = 'ErrorsAndWarningAndInformation'
    expect(dsc_windowsoptionalfeature[:dsc_loglevel]).to eq('ErrorsAndWarningAndInformation')
  end

  it 'should accept dsc_loglevel predefined value errorsandwarningandinformation' do
    dsc_windowsoptionalfeature[:dsc_loglevel] = 'errorsandwarningandinformation'
    expect(dsc_windowsoptionalfeature[:dsc_loglevel]).to eq('errorsandwarningandinformation')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_windowsoptionalfeature[:dsc_loglevel] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_loglevel' do
    expect{dsc_windowsoptionalfeature[:dsc_loglevel] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_loglevel' do
    expect{dsc_windowsoptionalfeature[:dsc_loglevel] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_loglevel' do
    expect{dsc_windowsoptionalfeature[:dsc_loglevel] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_loglevel' do
    expect{dsc_windowsoptionalfeature[:dsc_loglevel] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logpath' do
    expect{dsc_windowsoptionalfeature[:dsc_logpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logpath' do
    expect{dsc_windowsoptionalfeature[:dsc_logpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logpath' do
    expect{dsc_windowsoptionalfeature[:dsc_logpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logpath' do
    expect{dsc_windowsoptionalfeature[:dsc_logpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_customproperties' do
    dsc_windowsoptionalfeature[:dsc_customproperties] = ["foo", "bar", "spec"]
    expect(dsc_windowsoptionalfeature[:dsc_customproperties]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_customproperties' do
    expect{dsc_windowsoptionalfeature[:dsc_customproperties] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_customproperties' do
    expect{dsc_windowsoptionalfeature[:dsc_customproperties] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_customproperties' do
    expect{dsc_windowsoptionalfeature[:dsc_customproperties] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_windowsoptionalfeature[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_windowsoptionalfeature[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_windowsoptionalfeature[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_windowsoptionalfeature[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displayname' do
    expect{dsc_windowsoptionalfeature[:dsc_displayname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayname' do
    expect{dsc_windowsoptionalfeature[:dsc_displayname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displayname' do
    expect{dsc_windowsoptionalfeature[:dsc_displayname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displayname' do
    expect{dsc_windowsoptionalfeature[:dsc_displayname] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_windowsoptionalfeature)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_windowsoptionalfeature)
    end

    describe "when dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Invoke-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Test" do
        expect(@provider.ps_script_content('test')).to match(/Method\s+=\s*'test'/)
      end

      it "should compute powershell dsc set script with Invoke-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Set" do
        expect(@provider.ps_script_content('set')).to match(/Method\s+=\s*'set'/)
      end

    end

    describe "when dsc_ensure is 'enable'" do

      before(:each) do
        dsc_windowsoptionalfeature.original_parameters[:dsc_ensure] = 'enable'
        dsc_windowsoptionalfeature[:dsc_ensure] = 'enable'
        @provider = described_class.provider(:powershell).new(dsc_windowsoptionalfeature)
      end

      it "should update :ensure to :enable" do
        expect(dsc_windowsoptionalfeature[:ensure]).to eq(:enable)
      end

      it "should compute powershell dsc test script in which ensure value is 'enable'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'enable'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'enable'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'enable'/)
      end

    end

    describe "when dsc_ensure is 'disable'" do

      before(:each) do
        dsc_windowsoptionalfeature.original_parameters[:dsc_ensure] = 'disable'
        dsc_windowsoptionalfeature[:dsc_ensure] = 'disable'
        @provider = described_class.provider(:powershell).new(dsc_windowsoptionalfeature)
      end

      it "should update :ensure to :disable" do
        expect(dsc_windowsoptionalfeature[:ensure]).to eq(:disable)
      end

      it "should compute powershell dsc test script in which ensure value is 'enable'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'enable'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'disable'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'disable'/)
      end

    end

  end
end
