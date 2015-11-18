#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdatabaseserver) do

  let :dsc_xdatabaseserver do
    Puppet::Type.type(:dsc_xdatabaseserver).new(
      :name     => 'foo',
      :dsc_loginmode => 'Windows',
    )
  end

  it "should stringify normally" do
    expect(dsc_xdatabaseserver.to_s).to eq("Dsc_xdatabaseserver[foo]")
  end

  it 'should require that dsc_loginmode is specified' do
    #dsc_xdatabaseserver[:dsc_loginmode]
    expect { Puppet::Type.type(:dsc_xdatabaseserver).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_loginmode is a required attribute/)
  end

  it 'should accept dsc_loginmode predefined value Windows' do
    dsc_xdatabaseserver[:dsc_loginmode] = 'Windows'
    expect(dsc_xdatabaseserver[:dsc_loginmode]).to eq('Windows')
  end

  it 'should accept dsc_loginmode predefined value windows' do
    dsc_xdatabaseserver[:dsc_loginmode] = 'windows'
    expect(dsc_xdatabaseserver[:dsc_loginmode]).to eq('windows')
  end

  it 'should accept dsc_loginmode predefined value Mixed' do
    dsc_xdatabaseserver[:dsc_loginmode] = 'Mixed'
    expect(dsc_xdatabaseserver[:dsc_loginmode]).to eq('Mixed')
  end

  it 'should accept dsc_loginmode predefined value mixed' do
    dsc_xdatabaseserver[:dsc_loginmode] = 'mixed'
    expect(dsc_xdatabaseserver[:dsc_loginmode]).to eq('mixed')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdatabaseserver[:dsc_loginmode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_loginmode' do
    expect{dsc_xdatabaseserver[:dsc_loginmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_loginmode' do
    expect{dsc_xdatabaseserver[:dsc_loginmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_loginmode' do
    expect{dsc_xdatabaseserver[:dsc_loginmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_loginmode' do
    expect{dsc_xdatabaseserver[:dsc_loginmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdatabaseserver)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdatabaseserver)
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
