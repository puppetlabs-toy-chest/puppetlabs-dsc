#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspsessionstateservice) do

  let :dsc_xspsessionstateservice do
    Puppet::Type.type(:dsc_xspsessionstateservice).new(
      :name     => 'foo',
      :dsc_databasename => 'foo',
      :dsc_databaseserver => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspsessionstateservice.to_s).to eq("Dsc_xspsessionstateservice[foo]")
  end

  it 'should require that dsc_databasename is specified' do
    #dsc_xspsessionstateservice[:dsc_databasename]
    expect { Puppet::Type.type(:dsc_xspsessionstateservice).new(
      :name     => 'foo',
      :dsc_databaseserver => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_databasename is a required attribute/)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_xspsessionstateservice[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_xspsessionstateservice[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_xspsessionstateservice[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_xspsessionstateservice[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_databaseserver is specified' do
    #dsc_xspsessionstateservice[:dsc_databaseserver]
    expect { Puppet::Type.type(:dsc_xspsessionstateservice).new(
      :name     => 'foo',
      :dsc_databasename => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_databaseserver is a required attribute/)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_xspsessionstateservice[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_xspsessionstateservice[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_xspsessionstateservice[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_xspsessionstateservice[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enabled' do
    expect{dsc_xspsessionstateservice[:dsc_enabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enabled' do
    dsc_xspsessionstateservice[:dsc_enabled] = true
    expect(dsc_xspsessionstateservice[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enabled" do
    dsc_xspsessionstateservice[:dsc_enabled] = 'true'
    expect(dsc_xspsessionstateservice[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enabled" do
    dsc_xspsessionstateservice[:dsc_enabled] = 'false'
    expect(dsc_xspsessionstateservice[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enabled" do
    dsc_xspsessionstateservice[:dsc_enabled] = 'True'
    expect(dsc_xspsessionstateservice[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enabled" do
    dsc_xspsessionstateservice[:dsc_enabled] = 'False'
    expect(dsc_xspsessionstateservice[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enabled" do
    dsc_xspsessionstateservice[:dsc_enabled] = :true
    expect(dsc_xspsessionstateservice[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enabled" do
    dsc_xspsessionstateservice[:dsc_enabled] = :false
    expect(dsc_xspsessionstateservice[:dsc_enabled]).to eq(false)
  end

  it 'should not accept int for dsc_enabled' do
    expect{dsc_xspsessionstateservice[:dsc_enabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabled' do
    expect{dsc_xspsessionstateservice[:dsc_enabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sessiontimeout' do
    expect{dsc_xspsessionstateservice[:dsc_sessiontimeout] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sessiontimeout' do
    expect{dsc_xspsessionstateservice[:dsc_sessiontimeout] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_sessiontimeout' do
    dsc_xspsessionstateservice[:dsc_sessiontimeout] = 32
    expect(dsc_xspsessionstateservice[:dsc_sessiontimeout]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_sessiontimeout' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspsessionstateservice[:dsc_sessiontimeout] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_sessiontimeout' do
    dsc_xspsessionstateservice[:dsc_sessiontimeout] = '16'
    expect(dsc_xspsessionstateservice[:dsc_sessiontimeout]).to eq(16)
  end

  it 'should accept string-like uint for dsc_sessiontimeout' do
    dsc_xspsessionstateservice[:dsc_sessiontimeout] = '32'
    expect(dsc_xspsessionstateservice[:dsc_sessiontimeout]).to eq(32)
  end

  it 'should accept string-like uint for dsc_sessiontimeout' do
    dsc_xspsessionstateservice[:dsc_sessiontimeout] = '64'
    expect(dsc_xspsessionstateservice[:dsc_sessiontimeout]).to eq(64)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspsessionstateservice[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspsessionstateservice[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspsessionstateservice[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspsessionstateservice[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspsessionstateservice[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspsessionstateservice)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspsessionstateservice)
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
