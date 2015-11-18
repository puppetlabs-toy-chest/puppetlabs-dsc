#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserversetup) do

  let :dsc_xsqlserversetup do
    Puppet::Type.type(:dsc_xsqlserversetup).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsqlserversetup.to_s).to eq("Dsc_xsqlserversetup[foo]")
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xsqlserversetup[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xsqlserversetup[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xsqlserversetup[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xsqlserversetup[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefolder' do
    expect{dsc_xsqlserversetup[:dsc_sourcefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefolder' do
    expect{dsc_xsqlserversetup[:dsc_sourcefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefolder' do
    expect{dsc_xsqlserversetup[:dsc_sourcefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefolder' do
    expect{dsc_xsqlserversetup[:dsc_sourcefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_setupcredential" do
    expect{dsc_xsqlserversetup[:dsc_setupcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setupcredential' do
    expect{dsc_xsqlserversetup[:dsc_setupcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setupcredential' do
    expect{dsc_xsqlserversetup[:dsc_setupcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setupcredential' do
    expect{dsc_xsqlserversetup[:dsc_setupcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setupcredential' do
    expect{dsc_xsqlserversetup[:dsc_setupcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_features' do
    expect{dsc_xsqlserversetup[:dsc_features] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_features' do
    expect{dsc_xsqlserversetup[:dsc_features] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_features' do
    expect{dsc_xsqlserversetup[:dsc_features] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_features' do
    expect{dsc_xsqlserversetup[:dsc_features] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlserversetup[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlserversetup).new(
      :name     => 'foo',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
      :dsc_features => 'foo',
      :dsc_instanceid => 'foo',
      :dsc_pid => 'foo',
      :dsc_updateenabled => 'foo',
      :dsc_updatesource => 'foo',
      :dsc_sqmreporting => 'foo',
      :dsc_errorreporting => 'foo',
      :dsc_installshareddir => 'foo',
      :dsc_installsharedwowdir => 'foo',
      :dsc_instancedir => 'foo',
      :dsc_sqlsvcaccount => {"user"=>"user", "password"=>"password"},
      :dsc_sqlsvcaccountusername => 'foo',
      :dsc_agtsvcaccount => {"user"=>"user", "password"=>"password"},
      :dsc_agtsvcaccountusername => 'foo',
      :dsc_sqlcollation => 'foo',
      :dsc_sqlsysadminaccounts => ["foo", "bar", "spec"],
      :dsc_securitymode => 'foo',
      :dsc_sapwd => {"user"=>"user", "password"=>"password"},
      :dsc_installsqldatadir => 'foo',
      :dsc_sqluserdbdir => 'foo',
      :dsc_sqluserdblogdir => 'foo',
      :dsc_sqltempdbdir => 'foo',
      :dsc_sqltempdblogdir => 'foo',
      :dsc_sqlbackupdir => 'foo',
      :dsc_ftsvcaccount => {"user"=>"user", "password"=>"password"},
      :dsc_ftsvcaccountusername => 'foo',
      :dsc_rssvcaccount => {"user"=>"user", "password"=>"password"},
      :dsc_rssvcaccountusername => 'foo',
      :dsc_assvcaccount => {"user"=>"user", "password"=>"password"},
      :dsc_assvcaccountusername => 'foo',
      :dsc_ascollation => 'foo',
      :dsc_assysadminaccounts => ["foo", "bar", "spec"],
      :dsc_asdatadir => 'foo',
      :dsc_aslogdir => 'foo',
      :dsc_asbackupdir => 'foo',
      :dsc_astempdir => 'foo',
      :dsc_asconfigdir => 'foo',
      :dsc_issvcaccount => {"user"=>"user", "password"=>"password"},
      :dsc_issvcaccountusername => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_instancename is a required attribute/)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlserversetup[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlserversetup[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlserversetup[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlserversetup[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_instanceid' do
    expect{dsc_xsqlserversetup[:dsc_instanceid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instanceid' do
    expect{dsc_xsqlserversetup[:dsc_instanceid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instanceid' do
    expect{dsc_xsqlserversetup[:dsc_instanceid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instanceid' do
    expect{dsc_xsqlserversetup[:dsc_instanceid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pid' do
    expect{dsc_xsqlserversetup[:dsc_pid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pid' do
    expect{dsc_xsqlserversetup[:dsc_pid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pid' do
    expect{dsc_xsqlserversetup[:dsc_pid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pid' do
    expect{dsc_xsqlserversetup[:dsc_pid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_updateenabled' do
    expect{dsc_xsqlserversetup[:dsc_updateenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_updateenabled' do
    expect{dsc_xsqlserversetup[:dsc_updateenabled] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_updateenabled' do
    expect{dsc_xsqlserversetup[:dsc_updateenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_updateenabled' do
    expect{dsc_xsqlserversetup[:dsc_updateenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_updatesource' do
    expect{dsc_xsqlserversetup[:dsc_updatesource] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_updatesource' do
    expect{dsc_xsqlserversetup[:dsc_updatesource] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_updatesource' do
    expect{dsc_xsqlserversetup[:dsc_updatesource] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_updatesource' do
    expect{dsc_xsqlserversetup[:dsc_updatesource] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqmreporting' do
    expect{dsc_xsqlserversetup[:dsc_sqmreporting] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqmreporting' do
    expect{dsc_xsqlserversetup[:dsc_sqmreporting] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqmreporting' do
    expect{dsc_xsqlserversetup[:dsc_sqmreporting] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqmreporting' do
    expect{dsc_xsqlserversetup[:dsc_sqmreporting] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_errorreporting' do
    expect{dsc_xsqlserversetup[:dsc_errorreporting] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_errorreporting' do
    expect{dsc_xsqlserversetup[:dsc_errorreporting] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_errorreporting' do
    expect{dsc_xsqlserversetup[:dsc_errorreporting] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_errorreporting' do
    expect{dsc_xsqlserversetup[:dsc_errorreporting] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installshareddir' do
    expect{dsc_xsqlserversetup[:dsc_installshareddir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installshareddir' do
    expect{dsc_xsqlserversetup[:dsc_installshareddir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installshareddir' do
    expect{dsc_xsqlserversetup[:dsc_installshareddir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installshareddir' do
    expect{dsc_xsqlserversetup[:dsc_installshareddir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installsharedwowdir' do
    expect{dsc_xsqlserversetup[:dsc_installsharedwowdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installsharedwowdir' do
    expect{dsc_xsqlserversetup[:dsc_installsharedwowdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installsharedwowdir' do
    expect{dsc_xsqlserversetup[:dsc_installsharedwowdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installsharedwowdir' do
    expect{dsc_xsqlserversetup[:dsc_installsharedwowdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_instancedir' do
    expect{dsc_xsqlserversetup[:dsc_instancedir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancedir' do
    expect{dsc_xsqlserversetup[:dsc_instancedir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancedir' do
    expect{dsc_xsqlserversetup[:dsc_instancedir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancedir' do
    expect{dsc_xsqlserversetup[:dsc_instancedir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_sqlsvcaccount" do
    expect{dsc_xsqlserversetup[:dsc_sqlsvcaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlsvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_sqlsvcaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlsvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_sqlsvcaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlsvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_sqlsvcaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlsvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_sqlsvcaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlsvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_sqlsvcaccountusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlsvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_sqlsvcaccountusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlsvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_sqlsvcaccountusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlsvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_sqlsvcaccountusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_agtsvcaccount" do
    expect{dsc_xsqlserversetup[:dsc_agtsvcaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_agtsvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_agtsvcaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_agtsvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_agtsvcaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_agtsvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_agtsvcaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_agtsvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_agtsvcaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_agtsvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_agtsvcaccountusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_agtsvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_agtsvcaccountusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_agtsvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_agtsvcaccountusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_agtsvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_agtsvcaccountusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlcollation' do
    expect{dsc_xsqlserversetup[:dsc_sqlcollation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlcollation' do
    expect{dsc_xsqlserversetup[:dsc_sqlcollation] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlcollation' do
    expect{dsc_xsqlserversetup[:dsc_sqlcollation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlcollation' do
    expect{dsc_xsqlserversetup[:dsc_sqlcollation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_sqlsysadminaccounts' do
    dsc_xsqlserversetup[:dsc_sqlsysadminaccounts] = ["foo", "bar", "spec"]
    expect(dsc_xsqlserversetup[:dsc_sqlsysadminaccounts]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_sqlsysadminaccounts' do
    expect{dsc_xsqlserversetup[:dsc_sqlsysadminaccounts] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlsysadminaccounts' do
    expect{dsc_xsqlserversetup[:dsc_sqlsysadminaccounts] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlsysadminaccounts' do
    expect{dsc_xsqlserversetup[:dsc_sqlsysadminaccounts] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_securitymode' do
    expect{dsc_xsqlserversetup[:dsc_securitymode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_securitymode' do
    expect{dsc_xsqlserversetup[:dsc_securitymode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_securitymode' do
    expect{dsc_xsqlserversetup[:dsc_securitymode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_securitymode' do
    expect{dsc_xsqlserversetup[:dsc_securitymode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_sapwd" do
    expect{dsc_xsqlserversetup[:dsc_sapwd] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sapwd' do
    expect{dsc_xsqlserversetup[:dsc_sapwd] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sapwd' do
    expect{dsc_xsqlserversetup[:dsc_sapwd] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sapwd' do
    expect{dsc_xsqlserversetup[:dsc_sapwd] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sapwd' do
    expect{dsc_xsqlserversetup[:dsc_sapwd] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installsqldatadir' do
    expect{dsc_xsqlserversetup[:dsc_installsqldatadir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installsqldatadir' do
    expect{dsc_xsqlserversetup[:dsc_installsqldatadir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installsqldatadir' do
    expect{dsc_xsqlserversetup[:dsc_installsqldatadir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installsqldatadir' do
    expect{dsc_xsqlserversetup[:dsc_installsqldatadir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqluserdbdir' do
    expect{dsc_xsqlserversetup[:dsc_sqluserdbdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqluserdbdir' do
    expect{dsc_xsqlserversetup[:dsc_sqluserdbdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqluserdbdir' do
    expect{dsc_xsqlserversetup[:dsc_sqluserdbdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqluserdbdir' do
    expect{dsc_xsqlserversetup[:dsc_sqluserdbdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqluserdblogdir' do
    expect{dsc_xsqlserversetup[:dsc_sqluserdblogdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqluserdblogdir' do
    expect{dsc_xsqlserversetup[:dsc_sqluserdblogdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqluserdblogdir' do
    expect{dsc_xsqlserversetup[:dsc_sqluserdblogdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqluserdblogdir' do
    expect{dsc_xsqlserversetup[:dsc_sqluserdblogdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqltempdbdir' do
    expect{dsc_xsqlserversetup[:dsc_sqltempdbdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqltempdbdir' do
    expect{dsc_xsqlserversetup[:dsc_sqltempdbdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqltempdbdir' do
    expect{dsc_xsqlserversetup[:dsc_sqltempdbdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqltempdbdir' do
    expect{dsc_xsqlserversetup[:dsc_sqltempdbdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqltempdblogdir' do
    expect{dsc_xsqlserversetup[:dsc_sqltempdblogdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqltempdblogdir' do
    expect{dsc_xsqlserversetup[:dsc_sqltempdblogdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqltempdblogdir' do
    expect{dsc_xsqlserversetup[:dsc_sqltempdblogdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqltempdblogdir' do
    expect{dsc_xsqlserversetup[:dsc_sqltempdblogdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlbackupdir' do
    expect{dsc_xsqlserversetup[:dsc_sqlbackupdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlbackupdir' do
    expect{dsc_xsqlserversetup[:dsc_sqlbackupdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlbackupdir' do
    expect{dsc_xsqlserversetup[:dsc_sqlbackupdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlbackupdir' do
    expect{dsc_xsqlserversetup[:dsc_sqlbackupdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_ftsvcaccount" do
    expect{dsc_xsqlserversetup[:dsc_ftsvcaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ftsvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_ftsvcaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ftsvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_ftsvcaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ftsvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_ftsvcaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ftsvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_ftsvcaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ftsvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_ftsvcaccountusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ftsvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_ftsvcaccountusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ftsvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_ftsvcaccountusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ftsvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_ftsvcaccountusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_rssvcaccount" do
    expect{dsc_xsqlserversetup[:dsc_rssvcaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_rssvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_rssvcaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_rssvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_rssvcaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_rssvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_rssvcaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rssvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_rssvcaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_rssvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_rssvcaccountusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_rssvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_rssvcaccountusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_rssvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_rssvcaccountusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rssvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_rssvcaccountusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_assvcaccount" do
    expect{dsc_xsqlserversetup[:dsc_assvcaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_assvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_assvcaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_assvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_assvcaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_assvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_assvcaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_assvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_assvcaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_assvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_assvcaccountusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_assvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_assvcaccountusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_assvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_assvcaccountusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_assvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_assvcaccountusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ascollation' do
    expect{dsc_xsqlserversetup[:dsc_ascollation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ascollation' do
    expect{dsc_xsqlserversetup[:dsc_ascollation] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ascollation' do
    expect{dsc_xsqlserversetup[:dsc_ascollation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ascollation' do
    expect{dsc_xsqlserversetup[:dsc_ascollation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_assysadminaccounts' do
    dsc_xsqlserversetup[:dsc_assysadminaccounts] = ["foo", "bar", "spec"]
    expect(dsc_xsqlserversetup[:dsc_assysadminaccounts]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_assysadminaccounts' do
    expect{dsc_xsqlserversetup[:dsc_assysadminaccounts] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_assysadminaccounts' do
    expect{dsc_xsqlserversetup[:dsc_assysadminaccounts] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_assysadminaccounts' do
    expect{dsc_xsqlserversetup[:dsc_assysadminaccounts] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_asdatadir' do
    expect{dsc_xsqlserversetup[:dsc_asdatadir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_asdatadir' do
    expect{dsc_xsqlserversetup[:dsc_asdatadir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_asdatadir' do
    expect{dsc_xsqlserversetup[:dsc_asdatadir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_asdatadir' do
    expect{dsc_xsqlserversetup[:dsc_asdatadir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_aslogdir' do
    expect{dsc_xsqlserversetup[:dsc_aslogdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_aslogdir' do
    expect{dsc_xsqlserversetup[:dsc_aslogdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_aslogdir' do
    expect{dsc_xsqlserversetup[:dsc_aslogdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_aslogdir' do
    expect{dsc_xsqlserversetup[:dsc_aslogdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_asbackupdir' do
    expect{dsc_xsqlserversetup[:dsc_asbackupdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_asbackupdir' do
    expect{dsc_xsqlserversetup[:dsc_asbackupdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_asbackupdir' do
    expect{dsc_xsqlserversetup[:dsc_asbackupdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_asbackupdir' do
    expect{dsc_xsqlserversetup[:dsc_asbackupdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_astempdir' do
    expect{dsc_xsqlserversetup[:dsc_astempdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_astempdir' do
    expect{dsc_xsqlserversetup[:dsc_astempdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_astempdir' do
    expect{dsc_xsqlserversetup[:dsc_astempdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_astempdir' do
    expect{dsc_xsqlserversetup[:dsc_astempdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_asconfigdir' do
    expect{dsc_xsqlserversetup[:dsc_asconfigdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_asconfigdir' do
    expect{dsc_xsqlserversetup[:dsc_asconfigdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_asconfigdir' do
    expect{dsc_xsqlserversetup[:dsc_asconfigdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_asconfigdir' do
    expect{dsc_xsqlserversetup[:dsc_asconfigdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_issvcaccount" do
    expect{dsc_xsqlserversetup[:dsc_issvcaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_issvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_issvcaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_issvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_issvcaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_issvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_issvcaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_issvcaccount' do
    expect{dsc_xsqlserversetup[:dsc_issvcaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_issvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_issvcaccountusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_issvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_issvcaccountusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_issvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_issvcaccountusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_issvcaccountusername' do
    expect{dsc_xsqlserversetup[:dsc_issvcaccountusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserversetup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserversetup)
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
