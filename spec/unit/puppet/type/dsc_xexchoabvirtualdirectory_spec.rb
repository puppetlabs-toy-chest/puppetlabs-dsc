#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchoabvirtualdirectory) do

  let :dsc_xexchoabvirtualdirectory do
    Puppet::Type.type(:dsc_xexchoabvirtualdirectory).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchoabvirtualdirectory.to_s).to eq("Dsc_xexchoabvirtualdirectory[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchoabvirtualdirectory[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchoabvirtualdirectory).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_oabstodistribute => ["foo", "bar", "spec"],
      :dsc_allowservicerestart => true,
      :dsc_basicauthentication => true,
      :dsc_domaincontroller => 'foo',
      :dsc_extendedprotectionflags => ["foo", "bar", "spec"],
      :dsc_extendedprotectionspnlist => ["foo", "bar", "spec"],
      :dsc_extendedprotectiontokenchecking => 'None',
      :dsc_externalurl => 'foo',
      :dsc_internalurl => 'foo',
      :dsc_pollinterval => -32,
      :dsc_requiressl => true,
      :dsc_windowsauthentication => true,
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchoabvirtualdirectory[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_oabstodistribute' do
    dsc_xexchoabvirtualdirectory[:dsc_oabstodistribute] = ["foo", "bar", "spec"]
    expect(dsc_xexchoabvirtualdirectory[:dsc_oabstodistribute]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_oabstodistribute' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_oabstodistribute] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_oabstodistribute' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_oabstodistribute] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_oabstodistribute' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_oabstodistribute] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart] = true
    expect(dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart] = :true
    expect(dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart] = :false
    expect(dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_basicauthentication' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_basicauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_basicauthentication' do
    dsc_xexchoabvirtualdirectory[:dsc_basicauthentication] = true
    expect(dsc_xexchoabvirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchoabvirtualdirectory[:dsc_basicauthentication] = 'true'
    expect(dsc_xexchoabvirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchoabvirtualdirectory[:dsc_basicauthentication] = 'false'
    expect(dsc_xexchoabvirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchoabvirtualdirectory[:dsc_basicauthentication] = 'True'
    expect(dsc_xexchoabvirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchoabvirtualdirectory[:dsc_basicauthentication] = 'False'
    expect(dsc_xexchoabvirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchoabvirtualdirectory[:dsc_basicauthentication] = :true
    expect(dsc_xexchoabvirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchoabvirtualdirectory[:dsc_basicauthentication] = :false
    expect(dsc_xexchoabvirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_basicauthentication' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_basicauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_basicauthentication' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_basicauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_extendedprotectionflags' do
    dsc_xexchoabvirtualdirectory[:dsc_extendedprotectionflags] = ["foo", "bar", "spec"]
    expect(dsc_xexchoabvirtualdirectory[:dsc_extendedprotectionflags]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_extendedprotectionflags' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_extendedprotectionflags] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_extendedprotectionflags' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_extendedprotectionflags] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_extendedprotectionflags' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_extendedprotectionflags] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_extendedprotectionspnlist' do
    dsc_xexchoabvirtualdirectory[:dsc_extendedprotectionspnlist] = ["foo", "bar", "spec"]
    expect(dsc_xexchoabvirtualdirectory[:dsc_extendedprotectionspnlist]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_extendedprotectionspnlist' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_extendedprotectionspnlist] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_extendedprotectionspnlist' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_extendedprotectionspnlist] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_extendedprotectionspnlist' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_extendedprotectionspnlist] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_extendedprotectiontokenchecking predefined value None' do
    dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking] = 'None'
    expect(dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking]).to eq('None')
  end

  it 'should accept dsc_extendedprotectiontokenchecking predefined value none' do
    dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking] = 'none'
    expect(dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking]).to eq('none')
  end

  it 'should accept dsc_extendedprotectiontokenchecking predefined value Allow' do
    dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking] = 'Allow'
    expect(dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking]).to eq('Allow')
  end

  it 'should accept dsc_extendedprotectiontokenchecking predefined value allow' do
    dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking] = 'allow'
    expect(dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking]).to eq('allow')
  end

  it 'should accept dsc_extendedprotectiontokenchecking predefined value Require' do
    dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking] = 'Require'
    expect(dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking]).to eq('Require')
  end

  it 'should accept dsc_extendedprotectiontokenchecking predefined value require' do
    dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking] = 'require'
    expect(dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking]).to eq('require')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_extendedprotectiontokenchecking' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_extendedprotectiontokenchecking' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_extendedprotectiontokenchecking' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_extendedprotectiontokenchecking' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_extendedprotectiontokenchecking] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externalurl' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_externalurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_externalurl' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_externalurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externalurl' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_externalurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalurl' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_externalurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internalurl' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_internalurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_internalurl' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_internalurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internalurl' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_internalurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internalurl' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_internalurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pollinterval' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_pollinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pollinterval' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_pollinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_pollinterval' do
    dsc_xexchoabvirtualdirectory[:dsc_pollinterval] = -32
    expect(dsc_xexchoabvirtualdirectory[:dsc_pollinterval]).to eq(-32)
  end

  it 'should accept string-like int for dsc_pollinterval' do
    dsc_xexchoabvirtualdirectory[:dsc_pollinterval] = '16'
    expect(dsc_xexchoabvirtualdirectory[:dsc_pollinterval]).to eq(16)
  end

  it 'should accept string-like int for dsc_pollinterval' do
    dsc_xexchoabvirtualdirectory[:dsc_pollinterval] = '-16'
    expect(dsc_xexchoabvirtualdirectory[:dsc_pollinterval]).to eq(-16)
  end

  it 'should accept string-like int for dsc_pollinterval' do
    dsc_xexchoabvirtualdirectory[:dsc_pollinterval] = '32'
    expect(dsc_xexchoabvirtualdirectory[:dsc_pollinterval]).to eq(32)
  end

  it 'should accept string-like int for dsc_pollinterval' do
    dsc_xexchoabvirtualdirectory[:dsc_pollinterval] = '-32'
    expect(dsc_xexchoabvirtualdirectory[:dsc_pollinterval]).to eq(-32)
  end


  it 'should not accept array for dsc_requiressl' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_requiressl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_requiressl' do
    dsc_xexchoabvirtualdirectory[:dsc_requiressl] = true
    expect(dsc_xexchoabvirtualdirectory[:dsc_requiressl]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_requiressl" do
    dsc_xexchoabvirtualdirectory[:dsc_requiressl] = 'true'
    expect(dsc_xexchoabvirtualdirectory[:dsc_requiressl]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_requiressl" do
    dsc_xexchoabvirtualdirectory[:dsc_requiressl] = 'false'
    expect(dsc_xexchoabvirtualdirectory[:dsc_requiressl]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_requiressl" do
    dsc_xexchoabvirtualdirectory[:dsc_requiressl] = 'True'
    expect(dsc_xexchoabvirtualdirectory[:dsc_requiressl]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_requiressl" do
    dsc_xexchoabvirtualdirectory[:dsc_requiressl] = 'False'
    expect(dsc_xexchoabvirtualdirectory[:dsc_requiressl]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_requiressl" do
    dsc_xexchoabvirtualdirectory[:dsc_requiressl] = :true
    expect(dsc_xexchoabvirtualdirectory[:dsc_requiressl]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_requiressl" do
    dsc_xexchoabvirtualdirectory[:dsc_requiressl] = :false
    expect(dsc_xexchoabvirtualdirectory[:dsc_requiressl]).to eq(false)
  end

  it 'should not accept int for dsc_requiressl' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_requiressl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_requiressl' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_requiressl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_windowsauthentication' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_windowsauthentication' do
    dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication] = true
    expect(dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication] = 'true'
    expect(dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication] = 'false'
    expect(dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication] = 'True'
    expect(dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication] = 'False'
    expect(dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication] = :true
    expect(dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication] = :false
    expect(dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_windowsauthentication' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_windowsauthentication' do
    expect{dsc_xexchoabvirtualdirectory[:dsc_windowsauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchoabvirtualdirectory)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchoabvirtualdirectory)
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
