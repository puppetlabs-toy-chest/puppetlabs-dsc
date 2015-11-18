#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchdatabaseavailabilitygroupmember) do

  let :dsc_xexchdatabaseavailabilitygroupmember do
    Puppet::Type.type(:dsc_xexchdatabaseavailabilitygroupmember).new(
      :name     => 'foo',
      :dsc_mailboxserver => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchdatabaseavailabilitygroupmember.to_s).to eq("Dsc_xexchdatabaseavailabilitygroupmember[foo]")
  end

  it 'should require that dsc_mailboxserver is specified' do
    #dsc_xexchdatabaseavailabilitygroupmember[:dsc_mailboxserver]
    expect { Puppet::Type.type(:dsc_xexchdatabaseavailabilitygroupmember).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_dagname => 'foo',
      :dsc_domaincontroller => 'foo',
      :dsc_skipdagvalidation => true,
    )}.to raise_error(Puppet::Error, /dsc_mailboxserver is a required attribute/)
  end

  it 'should not accept array for dsc_mailboxserver' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_mailboxserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mailboxserver' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_mailboxserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mailboxserver' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_mailboxserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mailboxserver' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_mailboxserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dagname' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_dagname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dagname' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_dagname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dagname' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_dagname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dagname' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_dagname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_skipdagvalidation' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_skipdagvalidation' do
    dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation] = true
    expect(dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_skipdagvalidation" do
    dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation] = 'true'
    expect(dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_skipdagvalidation" do
    dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation] = 'false'
    expect(dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_skipdagvalidation" do
    dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation] = 'True'
    expect(dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_skipdagvalidation" do
    dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation] = 'False'
    expect(dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_skipdagvalidation" do
    dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation] = :true
    expect(dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_skipdagvalidation" do
    dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation] = :false
    expect(dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation]).to eq(false)
  end

  it 'should not accept int for dsc_skipdagvalidation' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_skipdagvalidation' do
    expect{dsc_xexchdatabaseavailabilitygroupmember[:dsc_skipdagvalidation] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchdatabaseavailabilitygroupmember)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchdatabaseavailabilitygroupmember)
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
