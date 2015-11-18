#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchwaitforadprep) do

  let :dsc_xexchwaitforadprep do
    Puppet::Type.type(:dsc_xexchwaitforadprep).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchwaitforadprep.to_s).to eq("Dsc_xexchwaitforadprep[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchwaitforadprep[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchwaitforadprep).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_schemaversion => -32,
      :dsc_organizationversion => -32,
      :dsc_domainversion => -32,
      :dsc_exchangedomains => ["foo", "bar", "spec"],
      :dsc_retryintervalsec => 32,
      :dsc_retrycount => 32,
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchwaitforadprep[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchwaitforadprep[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchwaitforadprep[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchwaitforadprep[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchwaitforadprep[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchwaitforadprep[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchwaitforadprep[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchwaitforadprep[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchwaitforadprep[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_schemaversion' do
    expect{dsc_xexchwaitforadprep[:dsc_schemaversion] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_schemaversion' do
    expect{dsc_xexchwaitforadprep[:dsc_schemaversion] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_schemaversion' do
    dsc_xexchwaitforadprep[:dsc_schemaversion] = -32
    expect(dsc_xexchwaitforadprep[:dsc_schemaversion]).to eq(-32)
  end

  it 'should accept string-like int for dsc_schemaversion' do
    dsc_xexchwaitforadprep[:dsc_schemaversion] = '16'
    expect(dsc_xexchwaitforadprep[:dsc_schemaversion]).to eq(16)
  end

  it 'should accept string-like int for dsc_schemaversion' do
    dsc_xexchwaitforadprep[:dsc_schemaversion] = '-16'
    expect(dsc_xexchwaitforadprep[:dsc_schemaversion]).to eq(-16)
  end

  it 'should accept string-like int for dsc_schemaversion' do
    dsc_xexchwaitforadprep[:dsc_schemaversion] = '32'
    expect(dsc_xexchwaitforadprep[:dsc_schemaversion]).to eq(32)
  end

  it 'should accept string-like int for dsc_schemaversion' do
    dsc_xexchwaitforadprep[:dsc_schemaversion] = '-32'
    expect(dsc_xexchwaitforadprep[:dsc_schemaversion]).to eq(-32)
  end


  it 'should not accept array for dsc_organizationversion' do
    expect{dsc_xexchwaitforadprep[:dsc_organizationversion] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_organizationversion' do
    expect{dsc_xexchwaitforadprep[:dsc_organizationversion] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_organizationversion' do
    dsc_xexchwaitforadprep[:dsc_organizationversion] = -32
    expect(dsc_xexchwaitforadprep[:dsc_organizationversion]).to eq(-32)
  end

  it 'should accept string-like int for dsc_organizationversion' do
    dsc_xexchwaitforadprep[:dsc_organizationversion] = '16'
    expect(dsc_xexchwaitforadprep[:dsc_organizationversion]).to eq(16)
  end

  it 'should accept string-like int for dsc_organizationversion' do
    dsc_xexchwaitforadprep[:dsc_organizationversion] = '-16'
    expect(dsc_xexchwaitforadprep[:dsc_organizationversion]).to eq(-16)
  end

  it 'should accept string-like int for dsc_organizationversion' do
    dsc_xexchwaitforadprep[:dsc_organizationversion] = '32'
    expect(dsc_xexchwaitforadprep[:dsc_organizationversion]).to eq(32)
  end

  it 'should accept string-like int for dsc_organizationversion' do
    dsc_xexchwaitforadprep[:dsc_organizationversion] = '-32'
    expect(dsc_xexchwaitforadprep[:dsc_organizationversion]).to eq(-32)
  end


  it 'should not accept array for dsc_domainversion' do
    expect{dsc_xexchwaitforadprep[:dsc_domainversion] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainversion' do
    expect{dsc_xexchwaitforadprep[:dsc_domainversion] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_domainversion' do
    dsc_xexchwaitforadprep[:dsc_domainversion] = -32
    expect(dsc_xexchwaitforadprep[:dsc_domainversion]).to eq(-32)
  end

  it 'should accept string-like int for dsc_domainversion' do
    dsc_xexchwaitforadprep[:dsc_domainversion] = '16'
    expect(dsc_xexchwaitforadprep[:dsc_domainversion]).to eq(16)
  end

  it 'should accept string-like int for dsc_domainversion' do
    dsc_xexchwaitforadprep[:dsc_domainversion] = '-16'
    expect(dsc_xexchwaitforadprep[:dsc_domainversion]).to eq(-16)
  end

  it 'should accept string-like int for dsc_domainversion' do
    dsc_xexchwaitforadprep[:dsc_domainversion] = '32'
    expect(dsc_xexchwaitforadprep[:dsc_domainversion]).to eq(32)
  end

  it 'should accept string-like int for dsc_domainversion' do
    dsc_xexchwaitforadprep[:dsc_domainversion] = '-32'
    expect(dsc_xexchwaitforadprep[:dsc_domainversion]).to eq(-32)
  end


  it 'should accept array for dsc_exchangedomains' do
    dsc_xexchwaitforadprep[:dsc_exchangedomains] = ["foo", "bar", "spec"]
    expect(dsc_xexchwaitforadprep[:dsc_exchangedomains]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_exchangedomains' do
    expect{dsc_xexchwaitforadprep[:dsc_exchangedomains] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_exchangedomains' do
    expect{dsc_xexchwaitforadprep[:dsc_exchangedomains] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_exchangedomains' do
    expect{dsc_xexchwaitforadprep[:dsc_exchangedomains] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_retryintervalsec' do
    expect{dsc_xexchwaitforadprep[:dsc_retryintervalsec] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retryintervalsec' do
    expect{dsc_xexchwaitforadprep[:dsc_retryintervalsec] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retryintervalsec' do
    dsc_xexchwaitforadprep[:dsc_retryintervalsec] = 32
    expect(dsc_xexchwaitforadprep[:dsc_retryintervalsec]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_retryintervalsec' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xexchwaitforadprep[:dsc_retryintervalsec] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_retryintervalsec' do
    dsc_xexchwaitforadprep[:dsc_retryintervalsec] = '16'
    expect(dsc_xexchwaitforadprep[:dsc_retryintervalsec]).to eq(16)
  end

  it 'should accept string-like uint for dsc_retryintervalsec' do
    dsc_xexchwaitforadprep[:dsc_retryintervalsec] = '32'
    expect(dsc_xexchwaitforadprep[:dsc_retryintervalsec]).to eq(32)
  end

  it 'should accept string-like uint for dsc_retryintervalsec' do
    dsc_xexchwaitforadprep[:dsc_retryintervalsec] = '64'
    expect(dsc_xexchwaitforadprep[:dsc_retryintervalsec]).to eq(64)
  end

  it 'should not accept array for dsc_retrycount' do
    expect{dsc_xexchwaitforadprep[:dsc_retrycount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retrycount' do
    expect{dsc_xexchwaitforadprep[:dsc_retrycount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retrycount' do
    dsc_xexchwaitforadprep[:dsc_retrycount] = 32
    expect(dsc_xexchwaitforadprep[:dsc_retrycount]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_retrycount' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xexchwaitforadprep[:dsc_retrycount] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_retrycount' do
    dsc_xexchwaitforadprep[:dsc_retrycount] = '16'
    expect(dsc_xexchwaitforadprep[:dsc_retrycount]).to eq(16)
  end

  it 'should accept string-like uint for dsc_retrycount' do
    dsc_xexchwaitforadprep[:dsc_retrycount] = '32'
    expect(dsc_xexchwaitforadprep[:dsc_retrycount]).to eq(32)
  end

  it 'should accept string-like uint for dsc_retrycount' do
    dsc_xexchwaitforadprep[:dsc_retrycount] = '64'
    expect(dsc_xexchwaitforadprep[:dsc_retrycount]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchwaitforadprep)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchwaitforadprep)
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
