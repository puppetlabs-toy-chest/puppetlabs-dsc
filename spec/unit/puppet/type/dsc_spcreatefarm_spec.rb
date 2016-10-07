#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spcreatefarm) do

  let :dsc_spcreatefarm do
    Puppet::Type.type(:dsc_spcreatefarm).new(
      :name     => 'foo',
      :dsc_farmconfigdatabasename => 'foo',
      :dsc_databaseserver => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spcreatefarm).new(
      :name     => 'foo',
      :dsc_farmconfigdatabasename => 'foo',
      :dsc_databaseserver => 'foo',
      :dsc_farmaccount => {"user"=>"user", "password"=>"password"},
      :dsc_passphrase => {"user"=>"user", "password"=>"password"},
      :dsc_admincontentdatabasename => 'foo',
      :dsc_centraladministrationport => 32,
      :dsc_centraladministrationauth => 'NTLM',
      :dsc_serverrole => 'Application',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spcreatefarm.to_s).to eq("Dsc_spcreatefarm[foo]")
  end

  it 'should require that dsc_farmconfigdatabasename is specified' do
    #dsc_spcreatefarm[:dsc_farmconfigdatabasename]
    expect { Puppet::Type.type(:dsc_spcreatefarm).new(
      :name     => 'foo',
      :dsc_databaseserver => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_farmconfigdatabasename is a required attribute/)
  end

  it 'should not accept array for dsc_farmconfigdatabasename' do
    expect{dsc_spcreatefarm[:dsc_farmconfigdatabasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_farmconfigdatabasename' do
    expect{dsc_spcreatefarm[:dsc_farmconfigdatabasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_farmconfigdatabasename' do
    expect{dsc_spcreatefarm[:dsc_farmconfigdatabasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_farmconfigdatabasename' do
    expect{dsc_spcreatefarm[:dsc_farmconfigdatabasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_databaseserver is specified' do
    #dsc_spcreatefarm[:dsc_databaseserver]
    expect { Puppet::Type.type(:dsc_spcreatefarm).new(
      :name     => 'foo',
      :dsc_farmconfigdatabasename => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_databaseserver is a required attribute/)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_spcreatefarm[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_spcreatefarm[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_spcreatefarm[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_spcreatefarm[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_farmaccount" do
    expect{dsc_spcreatefarm[:dsc_farmaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_farmaccount' do
    expect{dsc_spcreatefarm[:dsc_farmaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_farmaccount' do
    expect{dsc_spcreatefarm[:dsc_farmaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_farmaccount' do
    expect{dsc_spcreatefarm[:dsc_farmaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_farmaccount' do
    expect{dsc_spcreatefarm[:dsc_farmaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_passphrase" do
    expect{dsc_spcreatefarm[:dsc_passphrase] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_passphrase' do
    expect{dsc_spcreatefarm[:dsc_passphrase] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_passphrase' do
    expect{dsc_spcreatefarm[:dsc_passphrase] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_passphrase' do
    expect{dsc_spcreatefarm[:dsc_passphrase] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_passphrase' do
    expect{dsc_spcreatefarm[:dsc_passphrase] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_admincontentdatabasename' do
    expect{dsc_spcreatefarm[:dsc_admincontentdatabasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_admincontentdatabasename' do
    expect{dsc_spcreatefarm[:dsc_admincontentdatabasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_admincontentdatabasename' do
    expect{dsc_spcreatefarm[:dsc_admincontentdatabasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_admincontentdatabasename' do
    expect{dsc_spcreatefarm[:dsc_admincontentdatabasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_centraladministrationport' do
    expect{dsc_spcreatefarm[:dsc_centraladministrationport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_centraladministrationport' do
    expect{dsc_spcreatefarm[:dsc_centraladministrationport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_centraladministrationport' do
    dsc_spcreatefarm[:dsc_centraladministrationport] = 32
    expect(dsc_spcreatefarm[:dsc_centraladministrationport]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_centraladministrationport' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spcreatefarm[:dsc_centraladministrationport] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_centraladministrationport' do
    dsc_spcreatefarm[:dsc_centraladministrationport] = '16'
    expect(dsc_spcreatefarm[:dsc_centraladministrationport]).to eq(16)
  end

  it 'should accept string-like uint for dsc_centraladministrationport' do
    dsc_spcreatefarm[:dsc_centraladministrationport] = '32'
    expect(dsc_spcreatefarm[:dsc_centraladministrationport]).to eq(32)
  end

  it 'should accept string-like uint for dsc_centraladministrationport' do
    dsc_spcreatefarm[:dsc_centraladministrationport] = '64'
    expect(dsc_spcreatefarm[:dsc_centraladministrationport]).to eq(64)
  end

  it 'should accept dsc_centraladministrationauth predefined value NTLM' do
    dsc_spcreatefarm[:dsc_centraladministrationauth] = 'NTLM'
    expect(dsc_spcreatefarm[:dsc_centraladministrationauth]).to eq('NTLM')
  end

  it 'should accept dsc_centraladministrationauth predefined value ntlm' do
    dsc_spcreatefarm[:dsc_centraladministrationauth] = 'ntlm'
    expect(dsc_spcreatefarm[:dsc_centraladministrationauth]).to eq('ntlm')
  end

  it 'should accept dsc_centraladministrationauth predefined value Kerberos' do
    dsc_spcreatefarm[:dsc_centraladministrationauth] = 'Kerberos'
    expect(dsc_spcreatefarm[:dsc_centraladministrationauth]).to eq('Kerberos')
  end

  it 'should accept dsc_centraladministrationauth predefined value kerberos' do
    dsc_spcreatefarm[:dsc_centraladministrationauth] = 'kerberos'
    expect(dsc_spcreatefarm[:dsc_centraladministrationauth]).to eq('kerberos')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spcreatefarm[:dsc_centraladministrationauth] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_centraladministrationauth' do
    expect{dsc_spcreatefarm[:dsc_centraladministrationauth] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_centraladministrationauth' do
    expect{dsc_spcreatefarm[:dsc_centraladministrationauth] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_centraladministrationauth' do
    expect{dsc_spcreatefarm[:dsc_centraladministrationauth] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_centraladministrationauth' do
    expect{dsc_spcreatefarm[:dsc_centraladministrationauth] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_serverrole predefined value Application' do
    dsc_spcreatefarm[:dsc_serverrole] = 'Application'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('Application')
  end

  it 'should accept dsc_serverrole predefined value application' do
    dsc_spcreatefarm[:dsc_serverrole] = 'application'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('application')
  end

  it 'should accept dsc_serverrole predefined value Custom' do
    dsc_spcreatefarm[:dsc_serverrole] = 'Custom'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('Custom')
  end

  it 'should accept dsc_serverrole predefined value custom' do
    dsc_spcreatefarm[:dsc_serverrole] = 'custom'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('custom')
  end

  it 'should accept dsc_serverrole predefined value DistributedCache' do
    dsc_spcreatefarm[:dsc_serverrole] = 'DistributedCache'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('DistributedCache')
  end

  it 'should accept dsc_serverrole predefined value distributedcache' do
    dsc_spcreatefarm[:dsc_serverrole] = 'distributedcache'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('distributedcache')
  end

  it 'should accept dsc_serverrole predefined value Search' do
    dsc_spcreatefarm[:dsc_serverrole] = 'Search'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('Search')
  end

  it 'should accept dsc_serverrole predefined value search' do
    dsc_spcreatefarm[:dsc_serverrole] = 'search'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('search')
  end

  it 'should accept dsc_serverrole predefined value SingleServer' do
    dsc_spcreatefarm[:dsc_serverrole] = 'SingleServer'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('SingleServer')
  end

  it 'should accept dsc_serverrole predefined value singleserver' do
    dsc_spcreatefarm[:dsc_serverrole] = 'singleserver'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('singleserver')
  end

  it 'should accept dsc_serverrole predefined value SingleServerFarm' do
    dsc_spcreatefarm[:dsc_serverrole] = 'SingleServerFarm'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('SingleServerFarm')
  end

  it 'should accept dsc_serverrole predefined value singleserverfarm' do
    dsc_spcreatefarm[:dsc_serverrole] = 'singleserverfarm'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('singleserverfarm')
  end

  it 'should accept dsc_serverrole predefined value SpecialLoad' do
    dsc_spcreatefarm[:dsc_serverrole] = 'SpecialLoad'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('SpecialLoad')
  end

  it 'should accept dsc_serverrole predefined value specialload' do
    dsc_spcreatefarm[:dsc_serverrole] = 'specialload'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('specialload')
  end

  it 'should accept dsc_serverrole predefined value WebFrontEnd' do
    dsc_spcreatefarm[:dsc_serverrole] = 'WebFrontEnd'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('WebFrontEnd')
  end

  it 'should accept dsc_serverrole predefined value webfrontend' do
    dsc_spcreatefarm[:dsc_serverrole] = 'webfrontend'
    expect(dsc_spcreatefarm[:dsc_serverrole]).to eq('webfrontend')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spcreatefarm[:dsc_serverrole] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_serverrole' do
    expect{dsc_spcreatefarm[:dsc_serverrole] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serverrole' do
    expect{dsc_spcreatefarm[:dsc_serverrole] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serverrole' do
    expect{dsc_spcreatefarm[:dsc_serverrole] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serverrole' do
    expect{dsc_spcreatefarm[:dsc_serverrole] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spcreatefarm[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spcreatefarm[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spcreatefarm[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spcreatefarm[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spcreatefarm[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spcreatefarm)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spcreatefarm)
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
