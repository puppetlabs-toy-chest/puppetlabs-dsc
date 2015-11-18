#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchinstall) do

  let :dsc_xexchinstall do
    Puppet::Type.type(:dsc_xexchinstall).new(
      :name     => 'foo',
      :dsc_path => 'foo',
      :dsc_arguments => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchinstall.to_s).to eq("Dsc_xexchinstall[foo]")
  end

  it 'should require that dsc_path is specified' do
    #dsc_xexchinstall[:dsc_path]
    expect { Puppet::Type.type(:dsc_xexchinstall).new(
      :name     => 'foo',
      :dsc_arguments => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_path is a required attribute/)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xexchinstall[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xexchinstall[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xexchinstall[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xexchinstall[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_arguments is specified' do
    #dsc_xexchinstall[:dsc_arguments]
    expect { Puppet::Type.type(:dsc_xexchinstall).new(
      :name     => 'foo',
      :dsc_path => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_arguments is a required attribute/)
  end

  it 'should not accept array for dsc_arguments' do
    expect{dsc_xexchinstall[:dsc_arguments] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_arguments' do
    expect{dsc_xexchinstall[:dsc_arguments] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_arguments' do
    expect{dsc_xexchinstall[:dsc_arguments] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_arguments' do
    expect{dsc_xexchinstall[:dsc_arguments] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchinstall[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchinstall[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchinstall[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchinstall[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchinstall[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchinstall)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchinstall)
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

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
