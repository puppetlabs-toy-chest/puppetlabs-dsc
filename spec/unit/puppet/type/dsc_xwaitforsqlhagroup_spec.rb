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
      :dsc_domaincredential => 'foo',
      :dsc_sqladministratorcredential => 'foo',
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

  it 'should not accept int for dsc_retryintervalsec' do
    expect{dsc_xwaitforsqlhagroup[:dsc_retryintervalsec] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retryintervalsec' do
    dsc_xwaitforsqlhagroup[:dsc_retryintervalsec] = 64
    expect(dsc_xwaitforsqlhagroup[:dsc_retryintervalsec]).to eq(64)
  end


  it 'should accept string-like int for dsc_retryintervalsec' do
    dsc_xwaitforsqlhagroup[:dsc_retryintervalsec] = '16'
    expect(dsc_xwaitforsqlhagroup[:dsc_retryintervalsec]).to eq(16)
  end


  it 'should accept string-like int for dsc_retryintervalsec' do
    dsc_xwaitforsqlhagroup[:dsc_retryintervalsec] = '32'
    expect(dsc_xwaitforsqlhagroup[:dsc_retryintervalsec]).to eq(32)
  end


  it 'should accept string-like int for dsc_retryintervalsec' do
    dsc_xwaitforsqlhagroup[:dsc_retryintervalsec] = '64'
    expect(dsc_xwaitforsqlhagroup[:dsc_retryintervalsec]).to eq(64)
  end

  it 'should not accept array for dsc_retrycount' do
    expect{dsc_xwaitforsqlhagroup[:dsc_retrycount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retrycount' do
    expect{dsc_xwaitforsqlhagroup[:dsc_retrycount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_retrycount' do
    expect{dsc_xwaitforsqlhagroup[:dsc_retrycount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retrycount' do
    dsc_xwaitforsqlhagroup[:dsc_retrycount] = 32
    expect(dsc_xwaitforsqlhagroup[:dsc_retrycount]).to eq(32)
  end


  it 'should accept string-like int for dsc_retrycount' do
    dsc_xwaitforsqlhagroup[:dsc_retrycount] = '16'
    expect(dsc_xwaitforsqlhagroup[:dsc_retrycount]).to eq(16)
  end


  it 'should accept string-like int for dsc_retrycount' do
    dsc_xwaitforsqlhagroup[:dsc_retrycount] = '32'
    expect(dsc_xwaitforsqlhagroup[:dsc_retrycount]).to eq(32)
  end


  it 'should accept string-like int for dsc_retrycount' do
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

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xwaitforsqlhagroup)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xwaitforsqlhagroup)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Import-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script with Import-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Import-DscResource/)
      end

    end

    describe "when dscmeta_import_resource is false" do

      it "should compute powershell dsc test script without Import-DscResource" do
        dsc_xwaitforsqlhagroup[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xwaitforsqlhagroup[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xwaitforsqlhagroup)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xwaitforsqlhagroup)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xWaitForSqlHAGroup as $MSFT_xWaitForSqlHAGroup1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xWaitForSqlHAGroup/)
    end


  end
end
