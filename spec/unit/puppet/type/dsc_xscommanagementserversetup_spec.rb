#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xscommanagementserversetup) do

  let :dsc_xscommanagementserversetup do
    Puppet::Type.type(:dsc_xscommanagementserversetup).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
    )
  end

  it "should stringify normally" do
    expect(dsc_xscommanagementserversetup.to_s).to eq("Dsc_xscommanagementserversetup[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xscommanagementserversetup[:ensure]).to eq :present
  end

  it 'should require that dsc_ensure is specified' do
    #dsc_xscommanagementserversetup[:dsc_ensure]
    expect { Puppet::Type.type(:dsc_xscommanagementserversetup).new(
      :name     => 'foo',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
      :dsc_productkey => 'foo',
      :dsc_installpath => 'foo',
      :dsc_managementgroupname => 'foo',
      :dsc_firstmanagementserver => true,
      :dsc_managementserviceport => 16,
      :dsc_actionaccount => {"user"=>"user", "password"=>"password"},
      :dsc_actionaccountusername => 'foo',
      :dsc_dasaccount => {"user"=>"user", "password"=>"password"},
      :dsc_dasaccountusername => 'foo',
      :dsc_datareader => {"user"=>"user", "password"=>"password"},
      :dsc_datareaderusername => 'foo',
      :dsc_datawriter => {"user"=>"user", "password"=>"password"},
      :dsc_datawriterusername => 'foo',
      :dsc_sqlserverinstance => 'foo',
      :dsc_databasename => 'foo',
      :dsc_databasesize => 16,
      :dsc_dwsqlserverinstance => 'foo',
      :dsc_dwdatabasename => 'foo',
      :dsc_dwdatabasesize => 16,
      :dsc_usemicrosoftupdate => 1,
      :dsc_sendceipreports => 1,
      :dsc_enableerrorreporting => 'Never',
      :dsc_sendodrreports => 1,
    )}.to raise_error(Puppet::Error, /dsc_ensure is a required attribute/)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xscommanagementserversetup[:dsc_ensure] = 'Present'
    expect(dsc_xscommanagementserversetup[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xscommanagementserversetup[:dsc_ensure] = 'present'
    expect(dsc_xscommanagementserversetup[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscommanagementserversetup[:dsc_ensure] = 'present'
    expect(dsc_xscommanagementserversetup[:ensure]).to eq(dsc_xscommanagementserversetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xscommanagementserversetup[:dsc_ensure] = 'Absent'
    expect(dsc_xscommanagementserversetup[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xscommanagementserversetup[:dsc_ensure] = 'absent'
    expect(dsc_xscommanagementserversetup[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscommanagementserversetup[:dsc_ensure] = 'absent'
    expect(dsc_xscommanagementserversetup[:ensure]).to eq(dsc_xscommanagementserversetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscommanagementserversetup[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xscommanagementserversetup[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xscommanagementserversetup[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xscommanagementserversetup[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xscommanagementserversetup[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xscommanagementserversetup[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xscommanagementserversetup[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xscommanagementserversetup[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xscommanagementserversetup[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefolder' do
    expect{dsc_xscommanagementserversetup[:dsc_sourcefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefolder' do
    expect{dsc_xscommanagementserversetup[:dsc_sourcefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefolder' do
    expect{dsc_xscommanagementserversetup[:dsc_sourcefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefolder' do
    expect{dsc_xscommanagementserversetup[:dsc_sourcefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_setupcredential" do
    expect{dsc_xscommanagementserversetup[:dsc_setupcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setupcredential' do
    expect{dsc_xscommanagementserversetup[:dsc_setupcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setupcredential' do
    expect{dsc_xscommanagementserversetup[:dsc_setupcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setupcredential' do
    expect{dsc_xscommanagementserversetup[:dsc_setupcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setupcredential' do
    expect{dsc_xscommanagementserversetup[:dsc_setupcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_productkey' do
    expect{dsc_xscommanagementserversetup[:dsc_productkey] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_productkey' do
    expect{dsc_xscommanagementserversetup[:dsc_productkey] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_productkey' do
    expect{dsc_xscommanagementserversetup[:dsc_productkey] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_productkey' do
    expect{dsc_xscommanagementserversetup[:dsc_productkey] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installpath' do
    expect{dsc_xscommanagementserversetup[:dsc_installpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installpath' do
    expect{dsc_xscommanagementserversetup[:dsc_installpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installpath' do
    expect{dsc_xscommanagementserversetup[:dsc_installpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installpath' do
    expect{dsc_xscommanagementserversetup[:dsc_installpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_managementgroupname' do
    expect{dsc_xscommanagementserversetup[:dsc_managementgroupname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_managementgroupname' do
    expect{dsc_xscommanagementserversetup[:dsc_managementgroupname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_managementgroupname' do
    expect{dsc_xscommanagementserversetup[:dsc_managementgroupname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_managementgroupname' do
    expect{dsc_xscommanagementserversetup[:dsc_managementgroupname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_firstmanagementserver' do
    expect{dsc_xscommanagementserversetup[:dsc_firstmanagementserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_firstmanagementserver' do
    dsc_xscommanagementserversetup[:dsc_firstmanagementserver] = true
    expect(dsc_xscommanagementserversetup[:dsc_firstmanagementserver]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_firstmanagementserver" do
    dsc_xscommanagementserversetup[:dsc_firstmanagementserver] = 'true'
    expect(dsc_xscommanagementserversetup[:dsc_firstmanagementserver]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_firstmanagementserver" do
    dsc_xscommanagementserversetup[:dsc_firstmanagementserver] = 'false'
    expect(dsc_xscommanagementserversetup[:dsc_firstmanagementserver]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_firstmanagementserver" do
    dsc_xscommanagementserversetup[:dsc_firstmanagementserver] = 'True'
    expect(dsc_xscommanagementserversetup[:dsc_firstmanagementserver]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_firstmanagementserver" do
    dsc_xscommanagementserversetup[:dsc_firstmanagementserver] = 'False'
    expect(dsc_xscommanagementserversetup[:dsc_firstmanagementserver]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_firstmanagementserver" do
    dsc_xscommanagementserversetup[:dsc_firstmanagementserver] = :true
    expect(dsc_xscommanagementserversetup[:dsc_firstmanagementserver]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_firstmanagementserver" do
    dsc_xscommanagementserversetup[:dsc_firstmanagementserver] = :false
    expect(dsc_xscommanagementserversetup[:dsc_firstmanagementserver]).to eq(false)
  end

  it 'should not accept int for dsc_firstmanagementserver' do
    expect{dsc_xscommanagementserversetup[:dsc_firstmanagementserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_firstmanagementserver' do
    expect{dsc_xscommanagementserversetup[:dsc_firstmanagementserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_managementserviceport' do
    expect{dsc_xscommanagementserversetup[:dsc_managementserviceport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_managementserviceport' do
    expect{dsc_xscommanagementserversetup[:dsc_managementserviceport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_managementserviceport' do
    dsc_xscommanagementserversetup[:dsc_managementserviceport] = 16
    expect(dsc_xscommanagementserversetup[:dsc_managementserviceport]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_managementserviceport' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscommanagementserversetup[:dsc_managementserviceport] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_managementserviceport' do
    dsc_xscommanagementserversetup[:dsc_managementserviceport] = '16'
    expect(dsc_xscommanagementserversetup[:dsc_managementserviceport]).to eq(16)
  end

  it 'should accept string-like uint for dsc_managementserviceport' do
    dsc_xscommanagementserversetup[:dsc_managementserviceport] = '32'
    expect(dsc_xscommanagementserversetup[:dsc_managementserviceport]).to eq(32)
  end

  it 'should accept string-like uint for dsc_managementserviceport' do
    dsc_xscommanagementserversetup[:dsc_managementserviceport] = '64'
    expect(dsc_xscommanagementserversetup[:dsc_managementserviceport]).to eq(64)
  end

  it "should not accept empty password for dsc_actionaccount" do
    expect{dsc_xscommanagementserversetup[:dsc_actionaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_actionaccount' do
    expect{dsc_xscommanagementserversetup[:dsc_actionaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_actionaccount' do
    expect{dsc_xscommanagementserversetup[:dsc_actionaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_actionaccount' do
    expect{dsc_xscommanagementserversetup[:dsc_actionaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_actionaccount' do
    expect{dsc_xscommanagementserversetup[:dsc_actionaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_actionaccountusername' do
    expect{dsc_xscommanagementserversetup[:dsc_actionaccountusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_actionaccountusername' do
    expect{dsc_xscommanagementserversetup[:dsc_actionaccountusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_actionaccountusername' do
    expect{dsc_xscommanagementserversetup[:dsc_actionaccountusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_actionaccountusername' do
    expect{dsc_xscommanagementserversetup[:dsc_actionaccountusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_dasaccount" do
    expect{dsc_xscommanagementserversetup[:dsc_dasaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dasaccount' do
    expect{dsc_xscommanagementserversetup[:dsc_dasaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dasaccount' do
    expect{dsc_xscommanagementserversetup[:dsc_dasaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dasaccount' do
    expect{dsc_xscommanagementserversetup[:dsc_dasaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dasaccount' do
    expect{dsc_xscommanagementserversetup[:dsc_dasaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dasaccountusername' do
    expect{dsc_xscommanagementserversetup[:dsc_dasaccountusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dasaccountusername' do
    expect{dsc_xscommanagementserversetup[:dsc_dasaccountusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dasaccountusername' do
    expect{dsc_xscommanagementserversetup[:dsc_dasaccountusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dasaccountusername' do
    expect{dsc_xscommanagementserversetup[:dsc_dasaccountusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_datareader" do
    expect{dsc_xscommanagementserversetup[:dsc_datareader] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_datareader' do
    expect{dsc_xscommanagementserversetup[:dsc_datareader] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_datareader' do
    expect{dsc_xscommanagementserversetup[:dsc_datareader] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_datareader' do
    expect{dsc_xscommanagementserversetup[:dsc_datareader] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_datareader' do
    expect{dsc_xscommanagementserversetup[:dsc_datareader] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_datareaderusername' do
    expect{dsc_xscommanagementserversetup[:dsc_datareaderusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_datareaderusername' do
    expect{dsc_xscommanagementserversetup[:dsc_datareaderusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_datareaderusername' do
    expect{dsc_xscommanagementserversetup[:dsc_datareaderusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_datareaderusername' do
    expect{dsc_xscommanagementserversetup[:dsc_datareaderusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_datawriter" do
    expect{dsc_xscommanagementserversetup[:dsc_datawriter] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_datawriter' do
    expect{dsc_xscommanagementserversetup[:dsc_datawriter] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_datawriter' do
    expect{dsc_xscommanagementserversetup[:dsc_datawriter] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_datawriter' do
    expect{dsc_xscommanagementserversetup[:dsc_datawriter] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_datawriter' do
    expect{dsc_xscommanagementserversetup[:dsc_datawriter] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_datawriterusername' do
    expect{dsc_xscommanagementserversetup[:dsc_datawriterusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_datawriterusername' do
    expect{dsc_xscommanagementserversetup[:dsc_datawriterusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_datawriterusername' do
    expect{dsc_xscommanagementserversetup[:dsc_datawriterusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_datawriterusername' do
    expect{dsc_xscommanagementserversetup[:dsc_datawriterusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserverinstance' do
    expect{dsc_xscommanagementserversetup[:dsc_sqlserverinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserverinstance' do
    expect{dsc_xscommanagementserversetup[:dsc_sqlserverinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserverinstance' do
    expect{dsc_xscommanagementserversetup[:dsc_sqlserverinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserverinstance' do
    expect{dsc_xscommanagementserversetup[:dsc_sqlserverinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_xscommanagementserversetup[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_xscommanagementserversetup[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_xscommanagementserversetup[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_xscommanagementserversetup[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasesize' do
    expect{dsc_xscommanagementserversetup[:dsc_databasesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasesize' do
    expect{dsc_xscommanagementserversetup[:dsc_databasesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_databasesize' do
    dsc_xscommanagementserversetup[:dsc_databasesize] = 16
    expect(dsc_xscommanagementserversetup[:dsc_databasesize]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_databasesize' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscommanagementserversetup[:dsc_databasesize] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_databasesize' do
    dsc_xscommanagementserversetup[:dsc_databasesize] = '16'
    expect(dsc_xscommanagementserversetup[:dsc_databasesize]).to eq(16)
  end

  it 'should accept string-like uint for dsc_databasesize' do
    dsc_xscommanagementserversetup[:dsc_databasesize] = '32'
    expect(dsc_xscommanagementserversetup[:dsc_databasesize]).to eq(32)
  end

  it 'should accept string-like uint for dsc_databasesize' do
    dsc_xscommanagementserversetup[:dsc_databasesize] = '64'
    expect(dsc_xscommanagementserversetup[:dsc_databasesize]).to eq(64)
  end

  it 'should not accept array for dsc_dwsqlserverinstance' do
    expect{dsc_xscommanagementserversetup[:dsc_dwsqlserverinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dwsqlserverinstance' do
    expect{dsc_xscommanagementserversetup[:dsc_dwsqlserverinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dwsqlserverinstance' do
    expect{dsc_xscommanagementserversetup[:dsc_dwsqlserverinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dwsqlserverinstance' do
    expect{dsc_xscommanagementserversetup[:dsc_dwsqlserverinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dwdatabasename' do
    expect{dsc_xscommanagementserversetup[:dsc_dwdatabasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dwdatabasename' do
    expect{dsc_xscommanagementserversetup[:dsc_dwdatabasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dwdatabasename' do
    expect{dsc_xscommanagementserversetup[:dsc_dwdatabasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dwdatabasename' do
    expect{dsc_xscommanagementserversetup[:dsc_dwdatabasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dwdatabasesize' do
    expect{dsc_xscommanagementserversetup[:dsc_dwdatabasesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dwdatabasesize' do
    expect{dsc_xscommanagementserversetup[:dsc_dwdatabasesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_dwdatabasesize' do
    dsc_xscommanagementserversetup[:dsc_dwdatabasesize] = 16
    expect(dsc_xscommanagementserversetup[:dsc_dwdatabasesize]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_dwdatabasesize' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscommanagementserversetup[:dsc_dwdatabasesize] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_dwdatabasesize' do
    dsc_xscommanagementserversetup[:dsc_dwdatabasesize] = '16'
    expect(dsc_xscommanagementserversetup[:dsc_dwdatabasesize]).to eq(16)
  end

  it 'should accept string-like uint for dsc_dwdatabasesize' do
    dsc_xscommanagementserversetup[:dsc_dwdatabasesize] = '32'
    expect(dsc_xscommanagementserversetup[:dsc_dwdatabasesize]).to eq(32)
  end

  it 'should accept string-like uint for dsc_dwdatabasesize' do
    dsc_xscommanagementserversetup[:dsc_dwdatabasesize] = '64'
    expect(dsc_xscommanagementserversetup[:dsc_dwdatabasesize]).to eq(64)
  end

  it 'should not accept array for dsc_usemicrosoftupdate' do
    expect{dsc_xscommanagementserversetup[:dsc_usemicrosoftupdate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usemicrosoftupdate' do
    expect{dsc_xscommanagementserversetup[:dsc_usemicrosoftupdate] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_usemicrosoftupdate' do
    dsc_xscommanagementserversetup[:dsc_usemicrosoftupdate] = 1
    expect(dsc_xscommanagementserversetup[:dsc_usemicrosoftupdate]).to eq(1)
  end

  it 'should not accept signed (negative) value for dsc_usemicrosoftupdate' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscommanagementserversetup[:dsc_usemicrosoftupdate] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_usemicrosoftupdate' do
    dsc_xscommanagementserversetup[:dsc_usemicrosoftupdate] = '16'
    expect(dsc_xscommanagementserversetup[:dsc_usemicrosoftupdate]).to eq(16)
  end

  it 'should accept string-like uint for dsc_usemicrosoftupdate' do
    dsc_xscommanagementserversetup[:dsc_usemicrosoftupdate] = '32'
    expect(dsc_xscommanagementserversetup[:dsc_usemicrosoftupdate]).to eq(32)
  end

  it 'should accept string-like uint for dsc_usemicrosoftupdate' do
    dsc_xscommanagementserversetup[:dsc_usemicrosoftupdate] = '64'
    expect(dsc_xscommanagementserversetup[:dsc_usemicrosoftupdate]).to eq(64)
  end

  it 'should not accept array for dsc_sendceipreports' do
    expect{dsc_xscommanagementserversetup[:dsc_sendceipreports] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendceipreports' do
    expect{dsc_xscommanagementserversetup[:dsc_sendceipreports] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_sendceipreports' do
    dsc_xscommanagementserversetup[:dsc_sendceipreports] = 1
    expect(dsc_xscommanagementserversetup[:dsc_sendceipreports]).to eq(1)
  end

  it 'should not accept signed (negative) value for dsc_sendceipreports' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscommanagementserversetup[:dsc_sendceipreports] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_sendceipreports' do
    dsc_xscommanagementserversetup[:dsc_sendceipreports] = '16'
    expect(dsc_xscommanagementserversetup[:dsc_sendceipreports]).to eq(16)
  end

  it 'should accept string-like uint for dsc_sendceipreports' do
    dsc_xscommanagementserversetup[:dsc_sendceipreports] = '32'
    expect(dsc_xscommanagementserversetup[:dsc_sendceipreports]).to eq(32)
  end

  it 'should accept string-like uint for dsc_sendceipreports' do
    dsc_xscommanagementserversetup[:dsc_sendceipreports] = '64'
    expect(dsc_xscommanagementserversetup[:dsc_sendceipreports]).to eq(64)
  end

  it 'should accept dsc_enableerrorreporting predefined value Never' do
    dsc_xscommanagementserversetup[:dsc_enableerrorreporting] = 'Never'
    expect(dsc_xscommanagementserversetup[:dsc_enableerrorreporting]).to eq('Never')
  end

  it 'should accept dsc_enableerrorreporting predefined value never' do
    dsc_xscommanagementserversetup[:dsc_enableerrorreporting] = 'never'
    expect(dsc_xscommanagementserversetup[:dsc_enableerrorreporting]).to eq('never')
  end

  it 'should accept dsc_enableerrorreporting predefined value Queued' do
    dsc_xscommanagementserversetup[:dsc_enableerrorreporting] = 'Queued'
    expect(dsc_xscommanagementserversetup[:dsc_enableerrorreporting]).to eq('Queued')
  end

  it 'should accept dsc_enableerrorreporting predefined value queued' do
    dsc_xscommanagementserversetup[:dsc_enableerrorreporting] = 'queued'
    expect(dsc_xscommanagementserversetup[:dsc_enableerrorreporting]).to eq('queued')
  end

  it 'should accept dsc_enableerrorreporting predefined value Always' do
    dsc_xscommanagementserversetup[:dsc_enableerrorreporting] = 'Always'
    expect(dsc_xscommanagementserversetup[:dsc_enableerrorreporting]).to eq('Always')
  end

  it 'should accept dsc_enableerrorreporting predefined value always' do
    dsc_xscommanagementserversetup[:dsc_enableerrorreporting] = 'always'
    expect(dsc_xscommanagementserversetup[:dsc_enableerrorreporting]).to eq('always')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscommanagementserversetup[:dsc_enableerrorreporting] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enableerrorreporting' do
    expect{dsc_xscommanagementserversetup[:dsc_enableerrorreporting] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_enableerrorreporting' do
    expect{dsc_xscommanagementserversetup[:dsc_enableerrorreporting] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_enableerrorreporting' do
    expect{dsc_xscommanagementserversetup[:dsc_enableerrorreporting] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enableerrorreporting' do
    expect{dsc_xscommanagementserversetup[:dsc_enableerrorreporting] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendodrreports' do
    expect{dsc_xscommanagementserversetup[:dsc_sendodrreports] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendodrreports' do
    expect{dsc_xscommanagementserversetup[:dsc_sendodrreports] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_sendodrreports' do
    dsc_xscommanagementserversetup[:dsc_sendodrreports] = 1
    expect(dsc_xscommanagementserversetup[:dsc_sendodrreports]).to eq(1)
  end

  it 'should not accept signed (negative) value for dsc_sendodrreports' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscommanagementserversetup[:dsc_sendodrreports] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_sendodrreports' do
    dsc_xscommanagementserversetup[:dsc_sendodrreports] = '16'
    expect(dsc_xscommanagementserversetup[:dsc_sendodrreports]).to eq(16)
  end

  it 'should accept string-like uint for dsc_sendodrreports' do
    dsc_xscommanagementserversetup[:dsc_sendodrreports] = '32'
    expect(dsc_xscommanagementserversetup[:dsc_sendodrreports]).to eq(32)
  end

  it 'should accept string-like uint for dsc_sendodrreports' do
    dsc_xscommanagementserversetup[:dsc_sendodrreports] = '64'
    expect(dsc_xscommanagementserversetup[:dsc_sendodrreports]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xscommanagementserversetup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xscommanagementserversetup)
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
        dsc_xscommanagementserversetup.original_parameters[:dsc_ensure] = 'present'
        dsc_xscommanagementserversetup[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xscommanagementserversetup)
      end

      it "should update :ensure to :present" do
        expect(dsc_xscommanagementserversetup[:ensure]).to eq(:present)
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
        dsc_xscommanagementserversetup.original_parameters[:dsc_ensure] = 'absent'
        dsc_xscommanagementserversetup[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xscommanagementserversetup)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xscommanagementserversetup[:ensure]).to eq(:absent)
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
