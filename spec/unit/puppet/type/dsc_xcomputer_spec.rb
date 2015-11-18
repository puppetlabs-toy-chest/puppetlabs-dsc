#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xcomputer) do

  let :dsc_xcomputer do
    Puppet::Type.type(:dsc_xcomputer).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xcomputer.to_s).to eq("Dsc_xcomputer[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xcomputer[:dsc_name]
    expect { Puppet::Type.type(:dsc_xcomputer).new(
      :name     => 'foo',
      :dsc_domainname => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_unjoincredential => {"user"=>"user", "password"=>"password"},
      :dsc_workgroupname => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xcomputer[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xcomputer[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xcomputer[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xcomputer[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainname' do
    expect{dsc_xcomputer[:dsc_domainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainname' do
    expect{dsc_xcomputer[:dsc_domainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainname' do
    expect{dsc_xcomputer[:dsc_domainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainname' do
    expect{dsc_xcomputer[:dsc_domainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xcomputer[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xcomputer[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xcomputer[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xcomputer[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xcomputer[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_unjoincredential" do
    expect{dsc_xcomputer[:dsc_unjoincredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_unjoincredential' do
    expect{dsc_xcomputer[:dsc_unjoincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_unjoincredential' do
    expect{dsc_xcomputer[:dsc_unjoincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_unjoincredential' do
    expect{dsc_xcomputer[:dsc_unjoincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_unjoincredential' do
    expect{dsc_xcomputer[:dsc_unjoincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_workgroupname' do
    expect{dsc_xcomputer[:dsc_workgroupname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_workgroupname' do
    expect{dsc_xcomputer[:dsc_workgroupname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_workgroupname' do
    expect{dsc_xcomputer[:dsc_workgroupname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_workgroupname' do
    expect{dsc_xcomputer[:dsc_workgroupname] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xcomputer)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xcomputer)
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
