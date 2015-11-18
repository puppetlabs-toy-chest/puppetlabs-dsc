#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchautodiscovervirtualdirectory) do

  let :dsc_xexchautodiscovervirtualdirectory do
    Puppet::Type.type(:dsc_xexchautodiscovervirtualdirectory).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchautodiscovervirtualdirectory.to_s).to eq("Dsc_xexchautodiscovervirtualdirectory[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchautodiscovervirtualdirectory[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchautodiscovervirtualdirectory).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_allowservicerestart => true,
      :dsc_basicauthentication => true,
      :dsc_digestauthentication => true,
      :dsc_domaincontroller => 'foo',
      :dsc_windowsauthentication => true,
      :dsc_wssecurityauthentication => true,
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart] = true
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart] = :true
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart] = :false
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_basicauthentication' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_basicauthentication' do
    dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication] = true
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication] = 'true'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication] = 'false'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication] = 'True'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication] = 'False'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication] = :true
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication] = :false
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_basicauthentication' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_basicauthentication' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_basicauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_digestauthentication' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_digestauthentication' do
    dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication] = true
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication] = 'true'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication] = 'false'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication] = 'True'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication] = 'False'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication] = :true
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication] = :false
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_digestauthentication' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_digestauthentication' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_digestauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_windowsauthentication' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_windowsauthentication' do
    dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication] = true
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication] = 'true'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication] = 'false'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication] = 'True'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication] = 'False'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication] = :true
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication] = :false
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_windowsauthentication' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_windowsauthentication' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_windowsauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_wssecurityauthentication' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_wssecurityauthentication' do
    dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication] = true
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_wssecurityauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication] = 'true'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_wssecurityauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication] = 'false'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_wssecurityauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication] = 'True'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_wssecurityauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication] = 'False'
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_wssecurityauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication] = :true
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_wssecurityauthentication" do
    dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication] = :false
    expect(dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_wssecurityauthentication' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_wssecurityauthentication' do
    expect{dsc_xexchautodiscovervirtualdirectory[:dsc_wssecurityauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchautodiscovervirtualdirectory)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchautodiscovervirtualdirectory)
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
