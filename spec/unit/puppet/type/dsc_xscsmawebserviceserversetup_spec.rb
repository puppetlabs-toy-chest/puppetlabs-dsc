#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xscsmawebserviceserversetup) do

  let :dsc_xscsmawebserviceserversetup do
    Puppet::Type.type(:dsc_xscsmawebserviceserversetup).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
    )
  end

  it "should stringify normally" do
    expect(dsc_xscsmawebserviceserversetup.to_s).to eq("Dsc_xscsmawebserviceserversetup[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xscsmawebserviceserversetup[:ensure]).to eq :present
  end

  it 'should require that dsc_ensure is specified' do
    #dsc_xscsmawebserviceserversetup[:dsc_ensure]
    expect { Puppet::Type.type(:dsc_xscsmawebserviceserversetup).new(
      :name     => 'foo',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
      :dsc_firstwebserviceserver => true,
      :dsc_appool => {"user"=>"user", "password"=>"password"},
      :dsc_appoolusername => 'foo',
      :dsc_admingroupmembers => 'foo',
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstance => 'foo',
      :dsc_sqldatabase => 'foo',
      :dsc_sitename => 'foo',
      :dsc_webserviceport => 16,
      :dsc_installfolder => 'foo',
      :dsc_usessl => 'foo',
      :dsc_specifycertificate => 'foo',
      :dsc_certificatename => 'foo',
      :dsc_etwmanifest => 'foo',
      :dsc_sendceipreports => 'foo',
      :dsc_msupdate => 'foo',
      :dsc_productkey => 'foo',
      :dsc_runbookworkerservers => ["foo", "bar", "spec"],
    )}.to raise_error(Puppet::Error, /dsc_ensure is a required attribute/)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xscsmawebserviceserversetup[:dsc_ensure] = 'Present'
    expect(dsc_xscsmawebserviceserversetup[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xscsmawebserviceserversetup[:dsc_ensure] = 'present'
    expect(dsc_xscsmawebserviceserversetup[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscsmawebserviceserversetup[:dsc_ensure] = 'present'
    expect(dsc_xscsmawebserviceserversetup[:ensure]).to eq(dsc_xscsmawebserviceserversetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xscsmawebserviceserversetup[:dsc_ensure] = 'Absent'
    expect(dsc_xscsmawebserviceserversetup[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xscsmawebserviceserversetup[:dsc_ensure] = 'absent'
    expect(dsc_xscsmawebserviceserversetup[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscsmawebserviceserversetup[:dsc_ensure] = 'absent'
    expect(dsc_xscsmawebserviceserversetup[:ensure]).to eq(dsc_xscsmawebserviceserversetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefolder' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sourcefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefolder' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sourcefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefolder' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sourcefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefolder' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sourcefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_setupcredential" do
    expect{dsc_xscsmawebserviceserversetup[:dsc_setupcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setupcredential' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_setupcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setupcredential' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_setupcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setupcredential' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_setupcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setupcredential' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_setupcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_firstwebserviceserver' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_firstwebserviceserver' do
    dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver] = true
    expect(dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_firstwebserviceserver" do
    dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver] = 'true'
    expect(dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_firstwebserviceserver" do
    dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver] = 'false'
    expect(dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_firstwebserviceserver" do
    dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver] = 'True'
    expect(dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_firstwebserviceserver" do
    dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver] = 'False'
    expect(dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_firstwebserviceserver" do
    dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver] = :true
    expect(dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_firstwebserviceserver" do
    dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver] = :false
    expect(dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver]).to eq(false)
  end

  it 'should not accept int for dsc_firstwebserviceserver' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_firstwebserviceserver' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_firstwebserviceserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_appool" do
    expect{dsc_xscsmawebserviceserversetup[:dsc_appool] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_appool' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_appool] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_appool' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_appool] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_appool' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_appool] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_appool' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_appool] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_appoolusername' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_appoolusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_appoolusername' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_appoolusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_appoolusername' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_appoolusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_appoolusername' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_appoolusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_admingroupmembers' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_admingroupmembers] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_admingroupmembers' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_admingroupmembers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_admingroupmembers' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_admingroupmembers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_admingroupmembers' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_admingroupmembers] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstance' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sqlinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstance' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sqlinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstance' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sqlinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstance' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sqlinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqldatabase' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sqldatabase] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqldatabase' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sqldatabase] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqldatabase' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sqldatabase] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqldatabase' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sqldatabase] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sitename' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sitename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sitename' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sitename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sitename' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sitename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sitename' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sitename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_webserviceport' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_webserviceport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webserviceport' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_webserviceport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_webserviceport' do
    dsc_xscsmawebserviceserversetup[:dsc_webserviceport] = 16
    expect(dsc_xscsmawebserviceserversetup[:dsc_webserviceport]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_webserviceport' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscsmawebserviceserversetup[:dsc_webserviceport] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_webserviceport' do
    dsc_xscsmawebserviceserversetup[:dsc_webserviceport] = '16'
    expect(dsc_xscsmawebserviceserversetup[:dsc_webserviceport]).to eq(16)
  end

  it 'should accept string-like uint for dsc_webserviceport' do
    dsc_xscsmawebserviceserversetup[:dsc_webserviceport] = '32'
    expect(dsc_xscsmawebserviceserversetup[:dsc_webserviceport]).to eq(32)
  end

  it 'should accept string-like uint for dsc_webserviceport' do
    dsc_xscsmawebserviceserversetup[:dsc_webserviceport] = '64'
    expect(dsc_xscsmawebserviceserversetup[:dsc_webserviceport]).to eq(64)
  end

  it 'should not accept array for dsc_installfolder' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_installfolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installfolder' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_installfolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installfolder' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_installfolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installfolder' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_installfolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usessl' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_usessl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usessl' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_usessl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usessl' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_usessl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usessl' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_usessl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_specifycertificate' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_specifycertificate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_specifycertificate' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_specifycertificate] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_specifycertificate' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_specifycertificate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_specifycertificate' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_specifycertificate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_certificatename' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_certificatename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_certificatename' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_certificatename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_certificatename' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_certificatename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_certificatename' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_certificatename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_etwmanifest' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_etwmanifest] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_etwmanifest' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_etwmanifest] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_etwmanifest' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_etwmanifest] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_etwmanifest' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_etwmanifest] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendceipreports' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sendceipreports] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendceipreports' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sendceipreports] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sendceipreports' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sendceipreports] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sendceipreports' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_sendceipreports] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_msupdate' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_msupdate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_msupdate' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_msupdate] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_msupdate' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_msupdate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_msupdate' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_msupdate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_productkey' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_productkey] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_productkey' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_productkey] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_productkey' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_productkey] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_productkey' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_productkey] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_runbookworkerservers' do
    dsc_xscsmawebserviceserversetup[:dsc_runbookworkerservers] = ["foo", "bar", "spec"]
    expect(dsc_xscsmawebserviceserversetup[:dsc_runbookworkerservers]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_runbookworkerservers' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_runbookworkerservers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_runbookworkerservers' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_runbookworkerservers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_runbookworkerservers' do
    expect{dsc_xscsmawebserviceserversetup[:dsc_runbookworkerservers] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xscsmawebserviceserversetup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xscsmawebserviceserversetup)
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

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xscsmawebserviceserversetup.original_parameters[:dsc_ensure] = 'present'
        dsc_xscsmawebserviceserversetup[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xscsmawebserviceserversetup)
      end

      it "should update :ensure to :present" do
        expect(dsc_xscsmawebserviceserversetup[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xscsmawebserviceserversetup.original_parameters[:dsc_ensure] = 'absent'
        dsc_xscsmawebserviceserversetup[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xscsmawebserviceserversetup)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xscsmawebserviceserversetup[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
