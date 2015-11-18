#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspjoinfarm) do

  let :dsc_xspjoinfarm do
    Puppet::Type.type(:dsc_xspjoinfarm).new(
      :name     => 'foo',
      :dsc_farmconfigdatabasename => 'foo',
      :dsc_databaseserver => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspjoinfarm.to_s).to eq("Dsc_xspjoinfarm[foo]")
  end

  it 'should require that dsc_farmconfigdatabasename is specified' do
    #dsc_xspjoinfarm[:dsc_farmconfigdatabasename]
    expect { Puppet::Type.type(:dsc_xspjoinfarm).new(
      :name     => 'foo',
      :dsc_databaseserver => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
      :dsc_passphrase => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_farmconfigdatabasename is a required attribute/)
  end

  it 'should not accept array for dsc_farmconfigdatabasename' do
    expect{dsc_xspjoinfarm[:dsc_farmconfigdatabasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_farmconfigdatabasename' do
    expect{dsc_xspjoinfarm[:dsc_farmconfigdatabasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_farmconfigdatabasename' do
    expect{dsc_xspjoinfarm[:dsc_farmconfigdatabasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_farmconfigdatabasename' do
    expect{dsc_xspjoinfarm[:dsc_farmconfigdatabasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_databaseserver is specified' do
    #dsc_xspjoinfarm[:dsc_databaseserver]
    expect { Puppet::Type.type(:dsc_xspjoinfarm).new(
      :name     => 'foo',
      :dsc_farmconfigdatabasename => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
      :dsc_passphrase => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_databaseserver is a required attribute/)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_xspjoinfarm[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_xspjoinfarm[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_xspjoinfarm[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_xspjoinfarm[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspjoinfarm[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspjoinfarm[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspjoinfarm[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspjoinfarm[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspjoinfarm[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_passphrase' do
    expect{dsc_xspjoinfarm[:dsc_passphrase] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_passphrase' do
    expect{dsc_xspjoinfarm[:dsc_passphrase] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_passphrase' do
    expect{dsc_xspjoinfarm[:dsc_passphrase] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_passphrase' do
    expect{dsc_xspjoinfarm[:dsc_passphrase] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspjoinfarm)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspjoinfarm)
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
