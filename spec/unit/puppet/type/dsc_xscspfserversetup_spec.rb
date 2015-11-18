#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xscspfserversetup) do

  let :dsc_xscspfserversetup do
    Puppet::Type.type(:dsc_xscspfserversetup).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
    )
  end

  it "should stringify normally" do
    expect(dsc_xscspfserversetup.to_s).to eq("Dsc_xscspfserversetup[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xscspfserversetup[:ensure]).to eq :present
  end

  it 'should require that dsc_ensure is specified' do
    #dsc_xscspfserversetup[:dsc_ensure]
    expect { Puppet::Type.type(:dsc_xscspfserversetup).new(
      :name     => 'foo',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
      :dsc_sendceipreports => 'foo',
      :dsc_usemicrosoftupdate => 'foo',
      :dsc_specifycertificate => true,
      :dsc_certificatename => 'foo',
      :dsc_databaseserver => 'foo',
      :dsc_databaseportnumber => 16,
      :dsc_databasename => 'foo',
      :dsc_websiteportnumber => 16,
      :dsc_scvmm => {"user"=>"user", "password"=>"password"},
      :dsc_scvmmusername => 'foo',
      :dsc_scadmin => {"user"=>"user", "password"=>"password"},
      :dsc_scadminusername => 'foo',
      :dsc_scprovider => {"user"=>"user", "password"=>"password"},
      :dsc_scproviderusername => 'foo',
      :dsc_scusage => {"user"=>"user", "password"=>"password"},
      :dsc_scusageusername => 'foo',
      :dsc_vmmsecuritygroupusers => 'foo',
      :dsc_adminsecuritygroupusers => 'foo',
      :dsc_providersecuritygroupusers => 'foo',
      :dsc_usagesecuritygroupusers => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_ensure is a required attribute/)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xscspfserversetup[:dsc_ensure] = 'Present'
    expect(dsc_xscspfserversetup[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xscspfserversetup[:dsc_ensure] = 'present'
    expect(dsc_xscspfserversetup[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscspfserversetup[:dsc_ensure] = 'present'
    expect(dsc_xscspfserversetup[:ensure]).to eq(dsc_xscspfserversetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xscspfserversetup[:dsc_ensure] = 'Absent'
    expect(dsc_xscspfserversetup[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xscspfserversetup[:dsc_ensure] = 'absent'
    expect(dsc_xscspfserversetup[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscspfserversetup[:dsc_ensure] = 'absent'
    expect(dsc_xscspfserversetup[:ensure]).to eq(dsc_xscspfserversetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscspfserversetup[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xscspfserversetup[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xscspfserversetup[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xscspfserversetup[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xscspfserversetup[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xscspfserversetup[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xscspfserversetup[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xscspfserversetup[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xscspfserversetup[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefolder' do
    expect{dsc_xscspfserversetup[:dsc_sourcefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefolder' do
    expect{dsc_xscspfserversetup[:dsc_sourcefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefolder' do
    expect{dsc_xscspfserversetup[:dsc_sourcefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefolder' do
    expect{dsc_xscspfserversetup[:dsc_sourcefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_setupcredential" do
    expect{dsc_xscspfserversetup[:dsc_setupcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setupcredential' do
    expect{dsc_xscspfserversetup[:dsc_setupcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setupcredential' do
    expect{dsc_xscspfserversetup[:dsc_setupcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setupcredential' do
    expect{dsc_xscspfserversetup[:dsc_setupcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setupcredential' do
    expect{dsc_xscspfserversetup[:dsc_setupcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendceipreports' do
    expect{dsc_xscspfserversetup[:dsc_sendceipreports] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendceipreports' do
    expect{dsc_xscspfserversetup[:dsc_sendceipreports] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sendceipreports' do
    expect{dsc_xscspfserversetup[:dsc_sendceipreports] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sendceipreports' do
    expect{dsc_xscspfserversetup[:dsc_sendceipreports] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usemicrosoftupdate' do
    expect{dsc_xscspfserversetup[:dsc_usemicrosoftupdate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usemicrosoftupdate' do
    expect{dsc_xscspfserversetup[:dsc_usemicrosoftupdate] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usemicrosoftupdate' do
    expect{dsc_xscspfserversetup[:dsc_usemicrosoftupdate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usemicrosoftupdate' do
    expect{dsc_xscspfserversetup[:dsc_usemicrosoftupdate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_specifycertificate' do
    expect{dsc_xscspfserversetup[:dsc_specifycertificate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_specifycertificate' do
    dsc_xscspfserversetup[:dsc_specifycertificate] = true
    expect(dsc_xscspfserversetup[:dsc_specifycertificate]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_specifycertificate" do
    dsc_xscspfserversetup[:dsc_specifycertificate] = 'true'
    expect(dsc_xscspfserversetup[:dsc_specifycertificate]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_specifycertificate" do
    dsc_xscspfserversetup[:dsc_specifycertificate] = 'false'
    expect(dsc_xscspfserversetup[:dsc_specifycertificate]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_specifycertificate" do
    dsc_xscspfserversetup[:dsc_specifycertificate] = 'True'
    expect(dsc_xscspfserversetup[:dsc_specifycertificate]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_specifycertificate" do
    dsc_xscspfserversetup[:dsc_specifycertificate] = 'False'
    expect(dsc_xscspfserversetup[:dsc_specifycertificate]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_specifycertificate" do
    dsc_xscspfserversetup[:dsc_specifycertificate] = :true
    expect(dsc_xscspfserversetup[:dsc_specifycertificate]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_specifycertificate" do
    dsc_xscspfserversetup[:dsc_specifycertificate] = :false
    expect(dsc_xscspfserversetup[:dsc_specifycertificate]).to eq(false)
  end

  it 'should not accept int for dsc_specifycertificate' do
    expect{dsc_xscspfserversetup[:dsc_specifycertificate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_specifycertificate' do
    expect{dsc_xscspfserversetup[:dsc_specifycertificate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_certificatename' do
    expect{dsc_xscspfserversetup[:dsc_certificatename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_certificatename' do
    expect{dsc_xscspfserversetup[:dsc_certificatename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_certificatename' do
    expect{dsc_xscspfserversetup[:dsc_certificatename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_certificatename' do
    expect{dsc_xscspfserversetup[:dsc_certificatename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_xscspfserversetup[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_xscspfserversetup[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_xscspfserversetup[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_xscspfserversetup[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseportnumber' do
    expect{dsc_xscspfserversetup[:dsc_databaseportnumber] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseportnumber' do
    expect{dsc_xscspfserversetup[:dsc_databaseportnumber] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_databaseportnumber' do
    dsc_xscspfserversetup[:dsc_databaseportnumber] = 16
    expect(dsc_xscspfserversetup[:dsc_databaseportnumber]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_databaseportnumber' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscspfserversetup[:dsc_databaseportnumber] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_databaseportnumber' do
    dsc_xscspfserversetup[:dsc_databaseportnumber] = '16'
    expect(dsc_xscspfserversetup[:dsc_databaseportnumber]).to eq(16)
  end

  it 'should accept string-like uint for dsc_databaseportnumber' do
    dsc_xscspfserversetup[:dsc_databaseportnumber] = '32'
    expect(dsc_xscspfserversetup[:dsc_databaseportnumber]).to eq(32)
  end

  it 'should accept string-like uint for dsc_databaseportnumber' do
    dsc_xscspfserversetup[:dsc_databaseportnumber] = '64'
    expect(dsc_xscspfserversetup[:dsc_databaseportnumber]).to eq(64)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_xscspfserversetup[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_xscspfserversetup[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_xscspfserversetup[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_xscspfserversetup[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_websiteportnumber' do
    expect{dsc_xscspfserversetup[:dsc_websiteportnumber] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_websiteportnumber' do
    expect{dsc_xscspfserversetup[:dsc_websiteportnumber] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_websiteportnumber' do
    dsc_xscspfserversetup[:dsc_websiteportnumber] = 16
    expect(dsc_xscspfserversetup[:dsc_websiteportnumber]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_websiteportnumber' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscspfserversetup[:dsc_websiteportnumber] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_websiteportnumber' do
    dsc_xscspfserversetup[:dsc_websiteportnumber] = '16'
    expect(dsc_xscspfserversetup[:dsc_websiteportnumber]).to eq(16)
  end

  it 'should accept string-like uint for dsc_websiteportnumber' do
    dsc_xscspfserversetup[:dsc_websiteportnumber] = '32'
    expect(dsc_xscspfserversetup[:dsc_websiteportnumber]).to eq(32)
  end

  it 'should accept string-like uint for dsc_websiteportnumber' do
    dsc_xscspfserversetup[:dsc_websiteportnumber] = '64'
    expect(dsc_xscspfserversetup[:dsc_websiteportnumber]).to eq(64)
  end

  it "should not accept empty password for dsc_scvmm" do
    expect{dsc_xscspfserversetup[:dsc_scvmm] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scvmm' do
    expect{dsc_xscspfserversetup[:dsc_scvmm] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scvmm' do
    expect{dsc_xscspfserversetup[:dsc_scvmm] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scvmm' do
    expect{dsc_xscspfserversetup[:dsc_scvmm] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scvmm' do
    expect{dsc_xscspfserversetup[:dsc_scvmm] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scvmmusername' do
    expect{dsc_xscspfserversetup[:dsc_scvmmusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scvmmusername' do
    expect{dsc_xscspfserversetup[:dsc_scvmmusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scvmmusername' do
    expect{dsc_xscspfserversetup[:dsc_scvmmusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scvmmusername' do
    expect{dsc_xscspfserversetup[:dsc_scvmmusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_scadmin" do
    expect{dsc_xscspfserversetup[:dsc_scadmin] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scadmin' do
    expect{dsc_xscspfserversetup[:dsc_scadmin] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scadmin' do
    expect{dsc_xscspfserversetup[:dsc_scadmin] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scadmin' do
    expect{dsc_xscspfserversetup[:dsc_scadmin] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scadmin' do
    expect{dsc_xscspfserversetup[:dsc_scadmin] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scadminusername' do
    expect{dsc_xscspfserversetup[:dsc_scadminusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scadminusername' do
    expect{dsc_xscspfserversetup[:dsc_scadminusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scadminusername' do
    expect{dsc_xscspfserversetup[:dsc_scadminusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scadminusername' do
    expect{dsc_xscspfserversetup[:dsc_scadminusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_scprovider" do
    expect{dsc_xscspfserversetup[:dsc_scprovider] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scprovider' do
    expect{dsc_xscspfserversetup[:dsc_scprovider] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scprovider' do
    expect{dsc_xscspfserversetup[:dsc_scprovider] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scprovider' do
    expect{dsc_xscspfserversetup[:dsc_scprovider] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scprovider' do
    expect{dsc_xscspfserversetup[:dsc_scprovider] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scproviderusername' do
    expect{dsc_xscspfserversetup[:dsc_scproviderusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scproviderusername' do
    expect{dsc_xscspfserversetup[:dsc_scproviderusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scproviderusername' do
    expect{dsc_xscspfserversetup[:dsc_scproviderusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scproviderusername' do
    expect{dsc_xscspfserversetup[:dsc_scproviderusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_scusage" do
    expect{dsc_xscspfserversetup[:dsc_scusage] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scusage' do
    expect{dsc_xscspfserversetup[:dsc_scusage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scusage' do
    expect{dsc_xscspfserversetup[:dsc_scusage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scusage' do
    expect{dsc_xscspfserversetup[:dsc_scusage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scusage' do
    expect{dsc_xscspfserversetup[:dsc_scusage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scusageusername' do
    expect{dsc_xscspfserversetup[:dsc_scusageusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scusageusername' do
    expect{dsc_xscspfserversetup[:dsc_scusageusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scusageusername' do
    expect{dsc_xscspfserversetup[:dsc_scusageusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scusageusername' do
    expect{dsc_xscspfserversetup[:dsc_scusageusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_vmmsecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_vmmsecuritygroupusers] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_vmmsecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_vmmsecuritygroupusers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_vmmsecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_vmmsecuritygroupusers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_vmmsecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_vmmsecuritygroupusers] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adminsecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_adminsecuritygroupusers] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_adminsecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_adminsecuritygroupusers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_adminsecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_adminsecuritygroupusers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adminsecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_adminsecuritygroupusers] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_providersecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_providersecuritygroupusers] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_providersecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_providersecuritygroupusers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_providersecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_providersecuritygroupusers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_providersecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_providersecuritygroupusers] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usagesecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_usagesecuritygroupusers] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usagesecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_usagesecuritygroupusers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usagesecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_usagesecuritygroupusers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usagesecuritygroupusers' do
    expect{dsc_xscspfserversetup[:dsc_usagesecuritygroupusers] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xscspfserversetup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xscspfserversetup)
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
        dsc_xscspfserversetup.original_parameters[:dsc_ensure] = 'present'
        dsc_xscspfserversetup[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xscspfserversetup)
      end

      it "should update :ensure to :present" do
        expect(dsc_xscspfserversetup[:ensure]).to eq(:present)
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
        dsc_xscspfserversetup.original_parameters[:dsc_ensure] = 'absent'
        dsc_xscspfserversetup[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xscspfserversetup)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xscspfserversetup[:ensure]).to eq(:absent)
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
