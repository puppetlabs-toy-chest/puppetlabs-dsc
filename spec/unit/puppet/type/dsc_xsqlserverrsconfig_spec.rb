#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverrsconfig) do

  let :dsc_xsqlserverrsconfig do
    Puppet::Type.type(:dsc_xsqlserverrsconfig).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverrsconfig.to_s).to eq("Dsc_xsqlserverrsconfig[foo]")
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlserverrsconfig[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlserverrsconfig).new(
      :name     => 'foo',
      :dsc_rssqlserver => 'foo',
      :dsc_rssqlinstancename => 'foo',
      :dsc_sqladmincredential => {"user"=>"user", "password"=>"password"},
      :dsc_isinitialized => true,
    )}.to raise_error(Puppet::Error, /dsc_instancename is a required attribute/)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlserverrsconfig[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlserverrsconfig[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlserverrsconfig[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlserverrsconfig[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_rssqlserver' do
    expect{dsc_xsqlserverrsconfig[:dsc_rssqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_rssqlserver' do
    expect{dsc_xsqlserverrsconfig[:dsc_rssqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_rssqlserver' do
    expect{dsc_xsqlserverrsconfig[:dsc_rssqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rssqlserver' do
    expect{dsc_xsqlserverrsconfig[:dsc_rssqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_rssqlinstancename' do
    expect{dsc_xsqlserverrsconfig[:dsc_rssqlinstancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_rssqlinstancename' do
    expect{dsc_xsqlserverrsconfig[:dsc_rssqlinstancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_rssqlinstancename' do
    expect{dsc_xsqlserverrsconfig[:dsc_rssqlinstancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rssqlinstancename' do
    expect{dsc_xsqlserverrsconfig[:dsc_rssqlinstancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_sqladmincredential" do
    expect{dsc_xsqlserverrsconfig[:dsc_sqladmincredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqladmincredential' do
    expect{dsc_xsqlserverrsconfig[:dsc_sqladmincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqladmincredential' do
    expect{dsc_xsqlserverrsconfig[:dsc_sqladmincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqladmincredential' do
    expect{dsc_xsqlserverrsconfig[:dsc_sqladmincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqladmincredential' do
    expect{dsc_xsqlserverrsconfig[:dsc_sqladmincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_isinitialized' do
    expect{dsc_xsqlserverrsconfig[:dsc_isinitialized] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_isinitialized' do
    dsc_xsqlserverrsconfig[:dsc_isinitialized] = true
    expect(dsc_xsqlserverrsconfig[:dsc_isinitialized]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_isinitialized" do
    dsc_xsqlserverrsconfig[:dsc_isinitialized] = 'true'
    expect(dsc_xsqlserverrsconfig[:dsc_isinitialized]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_isinitialized" do
    dsc_xsqlserverrsconfig[:dsc_isinitialized] = 'false'
    expect(dsc_xsqlserverrsconfig[:dsc_isinitialized]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_isinitialized" do
    dsc_xsqlserverrsconfig[:dsc_isinitialized] = 'True'
    expect(dsc_xsqlserverrsconfig[:dsc_isinitialized]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_isinitialized" do
    dsc_xsqlserverrsconfig[:dsc_isinitialized] = 'False'
    expect(dsc_xsqlserverrsconfig[:dsc_isinitialized]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_isinitialized" do
    dsc_xsqlserverrsconfig[:dsc_isinitialized] = :true
    expect(dsc_xsqlserverrsconfig[:dsc_isinitialized]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_isinitialized" do
    dsc_xsqlserverrsconfig[:dsc_isinitialized] = :false
    expect(dsc_xsqlserverrsconfig[:dsc_isinitialized]).to eq(false)
  end

  it 'should not accept int for dsc_isinitialized' do
    expect{dsc_xsqlserverrsconfig[:dsc_isinitialized] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_isinitialized' do
    expect{dsc_xsqlserverrsconfig[:dsc_isinitialized] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserverrsconfig)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserverrsconfig)
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
