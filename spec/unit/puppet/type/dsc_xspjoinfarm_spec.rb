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
      :dsc_farmaccount => {"user"=>"user", "password"=>"password"},
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
      :dsc_passphrase => 'foo',
      :dsc_waittime => 32,
      :dsc_waitcount => 32,
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
      :dsc_farmaccount => {"user"=>"user", "password"=>"password"},
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
      :dsc_passphrase => 'foo',
      :dsc_waittime => 32,
      :dsc_waitcount => 32,
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

  it 'should not accept array for dsc_farmaccount' do
    expect{dsc_xspjoinfarm[:dsc_farmaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_farmaccount' do
    expect{dsc_xspjoinfarm[:dsc_farmaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_farmaccount' do
    expect{dsc_xspjoinfarm[:dsc_farmaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_farmaccount' do
    expect{dsc_xspjoinfarm[:dsc_farmaccount] = 16}.to raise_error(Puppet::ResourceError)
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

  it 'should not accept array for dsc_waittime' do
    expect{dsc_xspjoinfarm[:dsc_waittime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_waittime' do
    expect{dsc_xspjoinfarm[:dsc_waittime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_waittime' do
    expect{dsc_xspjoinfarm[:dsc_waittime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_waittime' do
    dsc_xspjoinfarm[:dsc_waittime] = 32
    expect(dsc_xspjoinfarm[:dsc_waittime]).to eq(32)
  end


  it 'should accept string-like int for dsc_waittime' do
    dsc_xspjoinfarm[:dsc_waittime] = '16'
    expect(dsc_xspjoinfarm[:dsc_waittime]).to eq(16)
  end


  it 'should accept string-like int for dsc_waittime' do
    dsc_xspjoinfarm[:dsc_waittime] = '32'
    expect(dsc_xspjoinfarm[:dsc_waittime]).to eq(32)
  end


  it 'should accept string-like int for dsc_waittime' do
    dsc_xspjoinfarm[:dsc_waittime] = '64'
    expect(dsc_xspjoinfarm[:dsc_waittime]).to eq(64)
  end

  it 'should not accept array for dsc_waitcount' do
    expect{dsc_xspjoinfarm[:dsc_waitcount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_waitcount' do
    expect{dsc_xspjoinfarm[:dsc_waitcount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_waitcount' do
    expect{dsc_xspjoinfarm[:dsc_waitcount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_waitcount' do
    dsc_xspjoinfarm[:dsc_waitcount] = 32
    expect(dsc_xspjoinfarm[:dsc_waitcount]).to eq(32)
  end


  it 'should accept string-like int for dsc_waitcount' do
    dsc_xspjoinfarm[:dsc_waitcount] = '16'
    expect(dsc_xspjoinfarm[:dsc_waitcount]).to eq(16)
  end


  it 'should accept string-like int for dsc_waitcount' do
    dsc_xspjoinfarm[:dsc_waitcount] = '32'
    expect(dsc_xspjoinfarm[:dsc_waitcount]).to eq(32)
  end


  it 'should accept string-like int for dsc_waitcount' do
    dsc_xspjoinfarm[:dsc_waitcount] = '64'
    expect(dsc_xspjoinfarm[:dsc_waitcount]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspjoinfarm)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspjoinfarm)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

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

  end
end
