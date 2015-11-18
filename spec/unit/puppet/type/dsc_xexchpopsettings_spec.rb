#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchpopsettings) do

  let :dsc_xexchpopsettings do
    Puppet::Type.type(:dsc_xexchpopsettings).new(
      :name     => 'foo',
      :dsc_server => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchpopsettings.to_s).to eq("Dsc_xexchpopsettings[foo]")
  end

  it 'should require that dsc_server is specified' do
    #dsc_xexchpopsettings[:dsc_server]
    expect { Puppet::Type.type(:dsc_xexchpopsettings).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_allowservicerestart => true,
      :dsc_domaincontroller => 'foo',
      :dsc_logintype => 'PlainTextLogin',
      :dsc_externalconnectionsettings => ["foo", "bar", "spec"],
      :dsc_x509certificatename => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_server is a required attribute/)
  end

  it 'should not accept array for dsc_server' do
    expect{dsc_xexchpopsettings[:dsc_server] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_server' do
    expect{dsc_xexchpopsettings[:dsc_server] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_server' do
    expect{dsc_xexchpopsettings[:dsc_server] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_server' do
    expect{dsc_xexchpopsettings[:dsc_server] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchpopsettings[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchpopsettings[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchpopsettings[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchpopsettings[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchpopsettings[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchpopsettings[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchpopsettings[:dsc_allowservicerestart] = true
    expect(dsc_xexchpopsettings[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchpopsettings[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchpopsettings[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchpopsettings[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchpopsettings[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchpopsettings[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchpopsettings[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchpopsettings[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchpopsettings[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchpopsettings[:dsc_allowservicerestart] = :true
    expect(dsc_xexchpopsettings[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchpopsettings[:dsc_allowservicerestart] = :false
    expect(dsc_xexchpopsettings[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchpopsettings[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchpopsettings[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchpopsettings[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchpopsettings[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchpopsettings[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchpopsettings[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_logintype predefined value PlainTextLogin' do
    dsc_xexchpopsettings[:dsc_logintype] = 'PlainTextLogin'
    expect(dsc_xexchpopsettings[:dsc_logintype]).to eq('PlainTextLogin')
  end

  it 'should accept dsc_logintype predefined value plaintextlogin' do
    dsc_xexchpopsettings[:dsc_logintype] = 'plaintextlogin'
    expect(dsc_xexchpopsettings[:dsc_logintype]).to eq('plaintextlogin')
  end

  it 'should accept dsc_logintype predefined value PlainTextAuthentication' do
    dsc_xexchpopsettings[:dsc_logintype] = 'PlainTextAuthentication'
    expect(dsc_xexchpopsettings[:dsc_logintype]).to eq('PlainTextAuthentication')
  end

  it 'should accept dsc_logintype predefined value plaintextauthentication' do
    dsc_xexchpopsettings[:dsc_logintype] = 'plaintextauthentication'
    expect(dsc_xexchpopsettings[:dsc_logintype]).to eq('plaintextauthentication')
  end

  it 'should accept dsc_logintype predefined value SecureLogin' do
    dsc_xexchpopsettings[:dsc_logintype] = 'SecureLogin'
    expect(dsc_xexchpopsettings[:dsc_logintype]).to eq('SecureLogin')
  end

  it 'should accept dsc_logintype predefined value securelogin' do
    dsc_xexchpopsettings[:dsc_logintype] = 'securelogin'
    expect(dsc_xexchpopsettings[:dsc_logintype]).to eq('securelogin')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchpopsettings[:dsc_logintype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logintype' do
    expect{dsc_xexchpopsettings[:dsc_logintype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logintype' do
    expect{dsc_xexchpopsettings[:dsc_logintype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logintype' do
    expect{dsc_xexchpopsettings[:dsc_logintype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logintype' do
    expect{dsc_xexchpopsettings[:dsc_logintype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_externalconnectionsettings' do
    dsc_xexchpopsettings[:dsc_externalconnectionsettings] = ["foo", "bar", "spec"]
    expect(dsc_xexchpopsettings[:dsc_externalconnectionsettings]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_externalconnectionsettings' do
    expect{dsc_xexchpopsettings[:dsc_externalconnectionsettings] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externalconnectionsettings' do
    expect{dsc_xexchpopsettings[:dsc_externalconnectionsettings] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalconnectionsettings' do
    expect{dsc_xexchpopsettings[:dsc_externalconnectionsettings] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_x509certificatename' do
    expect{dsc_xexchpopsettings[:dsc_x509certificatename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_x509certificatename' do
    expect{dsc_xexchpopsettings[:dsc_x509certificatename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_x509certificatename' do
    expect{dsc_xexchpopsettings[:dsc_x509certificatename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_x509certificatename' do
    expect{dsc_xexchpopsettings[:dsc_x509certificatename] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchpopsettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchpopsettings)
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
