#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchclientaccessserver) do

  let :dsc_xexchclientaccessserver do
    Puppet::Type.type(:dsc_xexchclientaccessserver).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchclientaccessserver.to_s).to eq("Dsc_xexchclientaccessserver[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchclientaccessserver[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchclientaccessserver).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_autodiscoverserviceinternaluri => 'foo',
      :dsc_autodiscoversitescope => ["foo", "bar", "spec"],
      :dsc_domaincontroller => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchclientaccessserver[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchclientaccessserver[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchclientaccessserver[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchclientaccessserver[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchclientaccessserver[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchclientaccessserver[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchclientaccessserver[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchclientaccessserver[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchclientaccessserver[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autodiscoverserviceinternaluri' do
    expect{dsc_xexchclientaccessserver[:dsc_autodiscoverserviceinternaluri] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autodiscoverserviceinternaluri' do
    expect{dsc_xexchclientaccessserver[:dsc_autodiscoverserviceinternaluri] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_autodiscoverserviceinternaluri' do
    expect{dsc_xexchclientaccessserver[:dsc_autodiscoverserviceinternaluri] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autodiscoverserviceinternaluri' do
    expect{dsc_xexchclientaccessserver[:dsc_autodiscoverserviceinternaluri] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_autodiscoversitescope' do
    dsc_xexchclientaccessserver[:dsc_autodiscoversitescope] = ["foo", "bar", "spec"]
    expect(dsc_xexchclientaccessserver[:dsc_autodiscoversitescope]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_autodiscoversitescope' do
    expect{dsc_xexchclientaccessserver[:dsc_autodiscoversitescope] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_autodiscoversitescope' do
    expect{dsc_xexchclientaccessserver[:dsc_autodiscoversitescope] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autodiscoversitescope' do
    expect{dsc_xexchclientaccessserver[:dsc_autodiscoversitescope] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchclientaccessserver[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchclientaccessserver[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchclientaccessserver[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchclientaccessserver[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchclientaccessserver)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchclientaccessserver)
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
