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
      :dsc_domainusercredential => {"user"=>"user", "password"=>"password"},
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

  it "should not accept empty password for dsc_domainusercredential" do
    expect{dsc_xwaitforaddomain[:dsc_domainusercredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
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

  it 'should accept uint for dsc_retryintervalsec' do
    dsc_xwaitforaddomain[:dsc_retryintervalsec] = 64
    expect(dsc_xwaitforaddomain[:dsc_retryintervalsec]).to eq(64)
  end

  it 'should not accept signed (negative) value for dsc_retryintervalsec' do
    value = -64
    expect(value).to be < 0
    expect{dsc_xwaitforaddomain[:dsc_retryintervalsec] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_retryintervalsec' do
    dsc_xwaitforaddomain[:dsc_retryintervalsec] = '16'
    expect(dsc_xwaitforaddomain[:dsc_retryintervalsec]).to eq(16)
  end

  it 'should accept string-like uint for dsc_retryintervalsec' do
    dsc_xwaitforaddomain[:dsc_retryintervalsec] = '32'
    expect(dsc_xwaitforaddomain[:dsc_retryintervalsec]).to eq(32)
  end

  it 'should accept string-like uint for dsc_retryintervalsec' do
    dsc_xwaitforaddomain[:dsc_retryintervalsec] = '64'
    expect(dsc_xwaitforaddomain[:dsc_retryintervalsec]).to eq(64)
  end

  it 'should not accept array for dsc_retrycount' do
    expect{dsc_xwaitforaddomain[:dsc_retrycount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retrycount' do
    expect{dsc_xwaitforaddomain[:dsc_retrycount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retrycount' do
    dsc_xwaitforaddomain[:dsc_retrycount] = 32
    expect(dsc_xwaitforaddomain[:dsc_retrycount]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_retrycount' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xwaitforaddomain[:dsc_retrycount] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_retrycount' do
    dsc_xwaitforaddomain[:dsc_retrycount] = '16'
    expect(dsc_xwaitforaddomain[:dsc_retrycount]).to eq(16)
  end

  it 'should accept string-like uint for dsc_retrycount' do
    dsc_xwaitforaddomain[:dsc_retrycount] = '32'
    expect(dsc_xwaitforaddomain[:dsc_retrycount]).to eq(32)
  end

  it 'should accept string-like uint for dsc_retrycount' do
    dsc_xwaitforaddomain[:dsc_retrycount] = '64'
    expect(dsc_xwaitforaddomain[:dsc_retrycount]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwaitforaddomain)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwaitforaddomain)
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
