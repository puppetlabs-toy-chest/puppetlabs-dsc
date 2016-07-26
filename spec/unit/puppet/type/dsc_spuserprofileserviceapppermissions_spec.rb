#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spuserprofileserviceapppermissions) do

  let :dsc_spuserprofileserviceapppermissions do
    Puppet::Type.type(:dsc_spuserprofileserviceapppermissions).new(
      :name     => 'foo',
      :dsc_proxyname => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spuserprofileserviceapppermissions).new(
      :name     => 'foo',
      :dsc_proxyname => 'foo',
      :dsc_createpersonalsite => ["foo", "bar", "spec"],
      :dsc_followandeditprofile => ["foo", "bar", "spec"],
      :dsc_usetagsandnotes => ["foo", "bar", "spec"],
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spuserprofileserviceapppermissions.to_s).to eq("Dsc_spuserprofileserviceapppermissions[foo]")
  end

  it 'should require that dsc_proxyname is specified' do
    #dsc_spuserprofileserviceapppermissions[:dsc_proxyname]
    expect { Puppet::Type.type(:dsc_spuserprofileserviceapppermissions).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_proxyname is a required attribute/)
  end

  it 'should not accept array for dsc_proxyname' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_proxyname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_proxyname' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_proxyname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_proxyname' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_proxyname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_proxyname' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_proxyname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_createpersonalsite' do
    dsc_spuserprofileserviceapppermissions[:dsc_createpersonalsite] = ["foo", "bar", "spec"]
    expect(dsc_spuserprofileserviceapppermissions[:dsc_createpersonalsite]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_createpersonalsite' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_createpersonalsite] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_createpersonalsite' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_createpersonalsite] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_createpersonalsite' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_createpersonalsite] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_followandeditprofile' do
    dsc_spuserprofileserviceapppermissions[:dsc_followandeditprofile] = ["foo", "bar", "spec"]
    expect(dsc_spuserprofileserviceapppermissions[:dsc_followandeditprofile]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_followandeditprofile' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_followandeditprofile] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_followandeditprofile' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_followandeditprofile] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_followandeditprofile' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_followandeditprofile] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_usetagsandnotes' do
    dsc_spuserprofileserviceapppermissions[:dsc_usetagsandnotes] = ["foo", "bar", "spec"]
    expect(dsc_spuserprofileserviceapppermissions[:dsc_usetagsandnotes]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_usetagsandnotes' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_usetagsandnotes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usetagsandnotes' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_usetagsandnotes] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usetagsandnotes' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_usetagsandnotes] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spuserprofileserviceapppermissions[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spuserprofileserviceapppermissions)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spuserprofileserviceapppermissions)
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
