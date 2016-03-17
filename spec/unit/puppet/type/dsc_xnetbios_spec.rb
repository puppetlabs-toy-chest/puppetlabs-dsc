#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xnetbios) do

  let :dsc_xnetbios do
    Puppet::Type.type(:dsc_xnetbios).new(
      :name     => 'foo',
      :dsc_interfacealias => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xnetbios.to_s).to eq("Dsc_xnetbios[foo]")
  end

  it 'should require that dsc_interfacealias is specified' do
    #dsc_xnetbios[:dsc_interfacealias]
    expect { Puppet::Type.type(:dsc_xnetbios).new(
      :name     => 'foo',
      :dsc_setting => 'Default',
    )}.to raise_error(Puppet::Error, /dsc_interfacealias is a required attribute/)
  end

  it 'should not accept array for dsc_interfacealias' do
    expect{dsc_xnetbios[:dsc_interfacealias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_interfacealias' do
    expect{dsc_xnetbios[:dsc_interfacealias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_interfacealias' do
    expect{dsc_xnetbios[:dsc_interfacealias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_interfacealias' do
    expect{dsc_xnetbios[:dsc_interfacealias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_setting predefined value Default' do
    dsc_xnetbios[:dsc_setting] = 'Default'
    expect(dsc_xnetbios[:dsc_setting]).to eq('Default')
  end

  it 'should accept dsc_setting predefined value default' do
    dsc_xnetbios[:dsc_setting] = 'default'
    expect(dsc_xnetbios[:dsc_setting]).to eq('default')
  end

  it 'should accept dsc_setting predefined value Enable' do
    dsc_xnetbios[:dsc_setting] = 'Enable'
    expect(dsc_xnetbios[:dsc_setting]).to eq('Enable')
  end

  it 'should accept dsc_setting predefined value enable' do
    dsc_xnetbios[:dsc_setting] = 'enable'
    expect(dsc_xnetbios[:dsc_setting]).to eq('enable')
  end

  it 'should accept dsc_setting predefined value Disable' do
    dsc_xnetbios[:dsc_setting] = 'Disable'
    expect(dsc_xnetbios[:dsc_setting]).to eq('Disable')
  end

  it 'should accept dsc_setting predefined value disable' do
    dsc_xnetbios[:dsc_setting] = 'disable'
    expect(dsc_xnetbios[:dsc_setting]).to eq('disable')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xnetbios[:dsc_setting] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setting' do
    expect{dsc_xnetbios[:dsc_setting] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setting' do
    expect{dsc_xnetbios[:dsc_setting] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setting' do
    expect{dsc_xnetbios[:dsc_setting] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setting' do
    expect{dsc_xnetbios[:dsc_setting] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xnetbios)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xnetbios)
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

  end
end
