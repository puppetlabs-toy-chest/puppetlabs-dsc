#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchmapivirtualdirectory) do

  let :dsc_xexchmapivirtualdirectory do
    Puppet::Type.type(:dsc_xexchmapivirtualdirectory).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchmapivirtualdirectory.to_s).to eq("Dsc_xexchmapivirtualdirectory[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchmapivirtualdirectory[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchmapivirtualdirectory).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_allowservicerestart => true,
      :dsc_domaincontroller => 'foo',
      :dsc_externalurl => 'foo',
      :dsc_iisauthenticationmethods => ["foo", "bar", "spec"],
      :dsc_internalurl => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchmapivirtualdirectory[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart] = true
    expect(dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart] = :true
    expect(dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart] = :false
    expect(dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externalurl' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_externalurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_externalurl' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_externalurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externalurl' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_externalurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalurl' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_externalurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_iisauthenticationmethods' do
    dsc_xexchmapivirtualdirectory[:dsc_iisauthenticationmethods] = ["foo", "bar", "spec"]
    expect(dsc_xexchmapivirtualdirectory[:dsc_iisauthenticationmethods]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_iisauthenticationmethods' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_iisauthenticationmethods] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_iisauthenticationmethods' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_iisauthenticationmethods] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_iisauthenticationmethods' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_iisauthenticationmethods] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internalurl' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_internalurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_internalurl' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_internalurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internalurl' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_internalurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internalurl' do
    expect{dsc_xexchmapivirtualdirectory[:dsc_internalurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchmapivirtualdirectory)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchmapivirtualdirectory)
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
