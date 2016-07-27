#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xnetadapterbinding) do

  let :dsc_xnetadapterbinding do
    Puppet::Type.type(:dsc_xnetadapterbinding).new(
      :name     => 'foo',
      :dsc_interfacealias => 'foo',
      :dsc_componentid => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xnetadapterbinding).new(
      :name     => 'foo',
      :dsc_interfacealias => 'foo',
      :dsc_componentid => 'foo',
      :dsc_state => 'Enabled',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xnetadapterbinding.to_s).to eq("Dsc_xnetadapterbinding[foo]")
  end

  it 'should require that dsc_interfacealias is specified' do
    #dsc_xnetadapterbinding[:dsc_interfacealias]
    expect { Puppet::Type.type(:dsc_xnetadapterbinding).new(
      :name     => 'foo',
      :dsc_componentid => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_interfacealias is a required attribute/)
  end

  it 'should not accept array for dsc_interfacealias' do
    expect{dsc_xnetadapterbinding[:dsc_interfacealias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_interfacealias' do
    expect{dsc_xnetadapterbinding[:dsc_interfacealias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_interfacealias' do
    expect{dsc_xnetadapterbinding[:dsc_interfacealias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_interfacealias' do
    expect{dsc_xnetadapterbinding[:dsc_interfacealias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_componentid is specified' do
    #dsc_xnetadapterbinding[:dsc_componentid]
    expect { Puppet::Type.type(:dsc_xnetadapterbinding).new(
      :name     => 'foo',
      :dsc_interfacealias => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_componentid is a required attribute/)
  end

  it 'should not accept array for dsc_componentid' do
    expect{dsc_xnetadapterbinding[:dsc_componentid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_componentid' do
    expect{dsc_xnetadapterbinding[:dsc_componentid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_componentid' do
    expect{dsc_xnetadapterbinding[:dsc_componentid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_componentid' do
    expect{dsc_xnetadapterbinding[:dsc_componentid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_state predefined value Enabled' do
    dsc_xnetadapterbinding[:dsc_state] = 'Enabled'
    expect(dsc_xnetadapterbinding[:dsc_state]).to eq('Enabled')
  end

  it 'should accept dsc_state predefined value enabled' do
    dsc_xnetadapterbinding[:dsc_state] = 'enabled'
    expect(dsc_xnetadapterbinding[:dsc_state]).to eq('enabled')
  end

  it 'should accept dsc_state predefined value Disabled' do
    dsc_xnetadapterbinding[:dsc_state] = 'Disabled'
    expect(dsc_xnetadapterbinding[:dsc_state]).to eq('Disabled')
  end

  it 'should accept dsc_state predefined value disabled' do
    dsc_xnetadapterbinding[:dsc_state] = 'disabled'
    expect(dsc_xnetadapterbinding[:dsc_state]).to eq('disabled')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xnetadapterbinding[:dsc_state] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_state' do
    expect{dsc_xnetadapterbinding[:dsc_state] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_state' do
    expect{dsc_xnetadapterbinding[:dsc_state] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_state' do
    expect{dsc_xnetadapterbinding[:dsc_state] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_state' do
    expect{dsc_xnetadapterbinding[:dsc_state] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xnetadapterbinding)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xnetadapterbinding)
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
