#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwaitforsqlhagroup) do

  let :dsc_xwaitforsqlhagroup do
    Puppet::Type.type(:dsc_xwaitforsqlhagroup).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwaitforsqlhagroup.to_s).to eq("Dsc_xwaitforsqlhagroup[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xwaitforsqlhagroup[:dsc_name]
    expect { Puppet::Type.type(:dsc_xwaitforsqlhagroup).new(
      :name     => 'foo',
      :dsc_clustername => 'foo',
      :dsc_retryintervalsec => 64,
      :dsc_retrycount => 32,
      :dsc_instancename => 'foo',
      :dsc_domaincredential => {"user"=>"user", "password"=>"password"},
      :dsc_sqladministratorcredential => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xwaitforsqlhagroup[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xwaitforsqlhagroup[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xwaitforsqlhagroup[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xwaitforsqlhagroup[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_clustername' do
    expect{dsc_xwaitforsqlhagroup[:dsc_clustername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_clustername' do
    expect{dsc_xwaitforsqlhagroup[:dsc_clustername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_clustername' do
    expect{dsc_xwaitforsqlhagroup[:dsc_clustername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_clustername' do
    expect{dsc_xwaitforsqlhagroup[:dsc_clustername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_retryintervalsec' do
    expect{dsc_xwaitforsqlhagroup[:dsc_retryintervalsec] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retryintervalsec' do
    expect{dsc_xwaitforsqlhagroup[:dsc_retryintervalsec] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retryintervalsec' do
    dsc_xwaitforsqlhagroup[:dsc_retryintervalsec] = 64
    expect(dsc_xwaitforsqlhagroup[:dsc_retryintervalsec]).to eq(64)
  end

  it 'should not accept signed (negative) value for dsc_retryintervalsec' do
    value = -64
    expect(value).to be < 0
    expect{dsc_xwaitforsqlhagroup[:dsc_retryintervalsec] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_retryintervalsec' do
    dsc_xwaitforsqlhagroup[:dsc_retryintervalsec] = '16'
    expect(dsc_xwaitforsqlhagroup[:dsc_retryintervalsec]).to eq(16)
  end

  it 'should accept string-like uint for dsc_retryintervalsec' do
    dsc_xwaitforsqlhagroup[:dsc_retryintervalsec] = '32'
    expect(dsc_xwaitforsqlhagroup[:dsc_retryintervalsec]).to eq(32)
  end

  it 'should accept string-like uint for dsc_retryintervalsec' do
    dsc_xwaitforsqlhagroup[:dsc_retryintervalsec] = '64'
    expect(dsc_xwaitforsqlhagroup[:dsc_retryintervalsec]).to eq(64)
  end

  it 'should not accept array for dsc_retrycount' do
    expect{dsc_xwaitforsqlhagroup[:dsc_retrycount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retrycount' do
    expect{dsc_xwaitforsqlhagroup[:dsc_retrycount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retrycount' do
    dsc_xwaitforsqlhagroup[:dsc_retrycount] = 32
    expect(dsc_xwaitforsqlhagroup[:dsc_retrycount]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_retrycount' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xwaitforsqlhagroup[:dsc_retrycount] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_retrycount' do
    dsc_xwaitforsqlhagroup[:dsc_retrycount] = '16'
    expect(dsc_xwaitforsqlhagroup[:dsc_retrycount]).to eq(16)
  end

  it 'should accept string-like uint for dsc_retrycount' do
    dsc_xwaitforsqlhagroup[:dsc_retrycount] = '32'
    expect(dsc_xwaitforsqlhagroup[:dsc_retrycount]).to eq(32)
  end

  it 'should accept string-like uint for dsc_retrycount' do
    dsc_xwaitforsqlhagroup[:dsc_retrycount] = '64'
    expect(dsc_xwaitforsqlhagroup[:dsc_retrycount]).to eq(64)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xwaitforsqlhagroup[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xwaitforsqlhagroup[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xwaitforsqlhagroup[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xwaitforsqlhagroup[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_domaincredential" do
    expect{dsc_xwaitforsqlhagroup[:dsc_domaincredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincredential' do
    expect{dsc_xwaitforsqlhagroup[:dsc_domaincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincredential' do
    expect{dsc_xwaitforsqlhagroup[:dsc_domaincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincredential' do
    expect{dsc_xwaitforsqlhagroup[:dsc_domaincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincredential' do
    expect{dsc_xwaitforsqlhagroup[:dsc_domaincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_sqladministratorcredential" do
    expect{dsc_xwaitforsqlhagroup[:dsc_sqladministratorcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqladministratorcredential' do
    expect{dsc_xwaitforsqlhagroup[:dsc_sqladministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqladministratorcredential' do
    expect{dsc_xwaitforsqlhagroup[:dsc_sqladministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqladministratorcredential' do
    expect{dsc_xwaitforsqlhagroup[:dsc_sqladministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqladministratorcredential' do
    expect{dsc_xwaitforsqlhagroup[:dsc_sqladministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwaitforsqlhagroup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwaitforsqlhagroup)
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
