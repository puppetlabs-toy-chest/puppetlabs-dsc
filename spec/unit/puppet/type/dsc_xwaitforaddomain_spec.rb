#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwaitforaddomain) do

  let :dsc_xwaitforaddomain do
    Puppet::Type.type(:dsc_xwaitforaddomain).new(
      :name     => 'foo',
      :dsc_domainname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwaitforaddomain.to_s).to eq("Dsc_xwaitforaddomain[foo]")
  end

  it 'should require that dsc_domainname is specified' do
    #dsc_xwaitforaddomain[:dsc_domainname]
    expect { Puppet::Type.type(:dsc_xwaitforaddomain).new(
      :name     => 'foo',
      :dsc_domainusercredential => 'foo',
      :dsc_retryintervalsec => 64,
      :dsc_retrycount => 32,
    )}.to raise_error(Puppet::Error, /dsc_domainname is a required attribute/)
  end

  it 'should not accept array for dsc_domainname' do
    expect{dsc_xwaitforaddomain[:dsc_domainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainname' do
    expect{dsc_xwaitforaddomain[:dsc_domainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainname' do
    expect{dsc_xwaitforaddomain[:dsc_domainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainname' do
    expect{dsc_xwaitforaddomain[:dsc_domainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainusercredential' do
    expect{dsc_xwaitforaddomain[:dsc_domainusercredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainusercredential' do
    expect{dsc_xwaitforaddomain[:dsc_domainusercredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainusercredential' do
    expect{dsc_xwaitforaddomain[:dsc_domainusercredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainusercredential' do
    expect{dsc_xwaitforaddomain[:dsc_domainusercredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_retryintervalsec' do
    expect{dsc_xwaitforaddomain[:dsc_retryintervalsec] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retryintervalsec' do
    expect{dsc_xwaitforaddomain[:dsc_retryintervalsec] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_retryintervalsec' do
    expect{dsc_xwaitforaddomain[:dsc_retryintervalsec] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retryintervalsec' do
    dsc_xwaitforaddomain[:dsc_retryintervalsec] = 64
    expect(dsc_xwaitforaddomain[:dsc_retryintervalsec]).to eq(64)
  end


  it 'should accept string-like int for dsc_retryintervalsec' do
    dsc_xwaitforaddomain[:dsc_retryintervalsec] = '16'
    expect(dsc_xwaitforaddomain[:dsc_retryintervalsec]).to eq(16)
  end


  it 'should accept string-like int for dsc_retryintervalsec' do
    dsc_xwaitforaddomain[:dsc_retryintervalsec] = '32'
    expect(dsc_xwaitforaddomain[:dsc_retryintervalsec]).to eq(32)
  end


  it 'should accept string-like int for dsc_retryintervalsec' do
    dsc_xwaitforaddomain[:dsc_retryintervalsec] = '64'
    expect(dsc_xwaitforaddomain[:dsc_retryintervalsec]).to eq(64)
  end

  it 'should not accept array for dsc_retrycount' do
    expect{dsc_xwaitforaddomain[:dsc_retrycount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retrycount' do
    expect{dsc_xwaitforaddomain[:dsc_retrycount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_retrycount' do
    expect{dsc_xwaitforaddomain[:dsc_retrycount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retrycount' do
    dsc_xwaitforaddomain[:dsc_retrycount] = 32
    expect(dsc_xwaitforaddomain[:dsc_retrycount]).to eq(32)
  end


  it 'should accept string-like int for dsc_retrycount' do
    dsc_xwaitforaddomain[:dsc_retrycount] = '16'
    expect(dsc_xwaitforaddomain[:dsc_retrycount]).to eq(16)
  end


  it 'should accept string-like int for dsc_retrycount' do
    dsc_xwaitforaddomain[:dsc_retrycount] = '32'
    expect(dsc_xwaitforaddomain[:dsc_retrycount]).to eq(32)
  end


  it 'should accept string-like int for dsc_retrycount' do
    dsc_xwaitforaddomain[:dsc_retrycount] = '64'
    expect(dsc_xwaitforaddomain[:dsc_retrycount]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xwaitforaddomain)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xwaitforaddomain)
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
        dsc_xwaitforaddomain[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xwaitforaddomain[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xwaitforaddomain)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xwaitforaddomain)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xWaitForADDomain as $MSFT_xWaitForADDomain1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xWaitForADDomain/)
    end


  end
end
