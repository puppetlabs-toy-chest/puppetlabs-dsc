#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchmailboxdatabase) do

  let :dsc_xexchmailboxdatabase do
    Puppet::Type.type(:dsc_xexchmailboxdatabase).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchmailboxdatabase.to_s).to eq("Dsc_xexchmailboxdatabase[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xexchmailboxdatabase[:dsc_name]
    expect { Puppet::Type.type(:dsc_xexchmailboxdatabase).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_databasecopycount => 32,
      :dsc_server => 'foo',
      :dsc_edbfilepath => 'foo',
      :dsc_logfolderpath => 'foo',
      :dsc_adserversettingspreferredserver => 'foo',
      :dsc_skipinitialdatabasemount => true,
      :dsc_allowservicerestart => true,
      :dsc_autodagexcludefrommonitoring => true,
      :dsc_backgrounddatabasemaintenance => true,
      :dsc_calendarloggingquota => 'foo',
      :dsc_circularloggingenabled => true,
      :dsc_datamovereplicationconstraint => 'None',
      :dsc_deleteditemretention => 'foo',
      :dsc_domaincontroller => 'foo',
      :dsc_eventhistoryretentionperiod => 'foo',
      :dsc_indexenabled => true,
      :dsc_isexcludedfromprovisioning => true,
      :dsc_issuewarningquota => 'foo',
      :dsc_issuspendedfromprovisioning => true,
      :dsc_journalrecipient => 'foo',
      :dsc_mailboxretention => 'foo',
      :dsc_mountatstartup => true,
      :dsc_offlineaddressbook => 'foo',
      :dsc_prohibitsendquota => 'foo',
      :dsc_prohibitsendreceivequota => 'foo',
      :dsc_recoverableitemsquota => 'foo',
      :dsc_recoverableitemswarningquota => 'foo',
      :dsc_retaindeleteditemsuntilbackup => true,
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xexchmailboxdatabase[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xexchmailboxdatabase[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xexchmailboxdatabase[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xexchmailboxdatabase[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchmailboxdatabase[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchmailboxdatabase[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchmailboxdatabase[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchmailboxdatabase[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchmailboxdatabase[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasecopycount' do
    expect{dsc_xexchmailboxdatabase[:dsc_databasecopycount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasecopycount' do
    expect{dsc_xexchmailboxdatabase[:dsc_databasecopycount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_databasecopycount' do
    dsc_xexchmailboxdatabase[:dsc_databasecopycount] = 32
    expect(dsc_xexchmailboxdatabase[:dsc_databasecopycount]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_databasecopycount' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xexchmailboxdatabase[:dsc_databasecopycount] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_databasecopycount' do
    dsc_xexchmailboxdatabase[:dsc_databasecopycount] = '16'
    expect(dsc_xexchmailboxdatabase[:dsc_databasecopycount]).to eq(16)
  end

  it 'should accept string-like uint for dsc_databasecopycount' do
    dsc_xexchmailboxdatabase[:dsc_databasecopycount] = '32'
    expect(dsc_xexchmailboxdatabase[:dsc_databasecopycount]).to eq(32)
  end

  it 'should accept string-like uint for dsc_databasecopycount' do
    dsc_xexchmailboxdatabase[:dsc_databasecopycount] = '64'
    expect(dsc_xexchmailboxdatabase[:dsc_databasecopycount]).to eq(64)
  end

  it 'should not accept array for dsc_server' do
    expect{dsc_xexchmailboxdatabase[:dsc_server] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_server' do
    expect{dsc_xexchmailboxdatabase[:dsc_server] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_server' do
    expect{dsc_xexchmailboxdatabase[:dsc_server] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_server' do
    expect{dsc_xexchmailboxdatabase[:dsc_server] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_edbfilepath' do
    expect{dsc_xexchmailboxdatabase[:dsc_edbfilepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_edbfilepath' do
    expect{dsc_xexchmailboxdatabase[:dsc_edbfilepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_edbfilepath' do
    expect{dsc_xexchmailboxdatabase[:dsc_edbfilepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_edbfilepath' do
    expect{dsc_xexchmailboxdatabase[:dsc_edbfilepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logfolderpath' do
    expect{dsc_xexchmailboxdatabase[:dsc_logfolderpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logfolderpath' do
    expect{dsc_xexchmailboxdatabase[:dsc_logfolderpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logfolderpath' do
    expect{dsc_xexchmailboxdatabase[:dsc_logfolderpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logfolderpath' do
    expect{dsc_xexchmailboxdatabase[:dsc_logfolderpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adserversettingspreferredserver' do
    expect{dsc_xexchmailboxdatabase[:dsc_adserversettingspreferredserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_adserversettingspreferredserver' do
    expect{dsc_xexchmailboxdatabase[:dsc_adserversettingspreferredserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_adserversettingspreferredserver' do
    expect{dsc_xexchmailboxdatabase[:dsc_adserversettingspreferredserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adserversettingspreferredserver' do
    expect{dsc_xexchmailboxdatabase[:dsc_adserversettingspreferredserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_skipinitialdatabasemount' do
    expect{dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_skipinitialdatabasemount' do
    dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount] = true
    expect(dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_skipinitialdatabasemount" do
    dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount] = 'true'
    expect(dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_skipinitialdatabasemount" do
    dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount] = 'false'
    expect(dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_skipinitialdatabasemount" do
    dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount] = 'True'
    expect(dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_skipinitialdatabasemount" do
    dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount] = 'False'
    expect(dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_skipinitialdatabasemount" do
    dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount] = :true
    expect(dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_skipinitialdatabasemount" do
    dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount] = :false
    expect(dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount]).to eq(false)
  end

  it 'should not accept int for dsc_skipinitialdatabasemount' do
    expect{dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_skipinitialdatabasemount' do
    expect{dsc_xexchmailboxdatabase[:dsc_skipinitialdatabasemount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchmailboxdatabase[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchmailboxdatabase[:dsc_allowservicerestart] = true
    expect(dsc_xexchmailboxdatabase[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxdatabase[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchmailboxdatabase[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxdatabase[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchmailboxdatabase[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxdatabase[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchmailboxdatabase[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxdatabase[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchmailboxdatabase[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxdatabase[:dsc_allowservicerestart] = :true
    expect(dsc_xexchmailboxdatabase[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxdatabase[:dsc_allowservicerestart] = :false
    expect(dsc_xexchmailboxdatabase[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchmailboxdatabase[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchmailboxdatabase[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autodagexcludefrommonitoring' do
    expect{dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_autodagexcludefrommonitoring' do
    dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring] = true
    expect(dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_autodagexcludefrommonitoring" do
    dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring] = 'true'
    expect(dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_autodagexcludefrommonitoring" do
    dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring] = 'false'
    expect(dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_autodagexcludefrommonitoring" do
    dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring] = 'True'
    expect(dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_autodagexcludefrommonitoring" do
    dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring] = 'False'
    expect(dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_autodagexcludefrommonitoring" do
    dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring] = :true
    expect(dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_autodagexcludefrommonitoring" do
    dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring] = :false
    expect(dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring]).to eq(false)
  end

  it 'should not accept int for dsc_autodagexcludefrommonitoring' do
    expect{dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autodagexcludefrommonitoring' do
    expect{dsc_xexchmailboxdatabase[:dsc_autodagexcludefrommonitoring] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_backgrounddatabasemaintenance' do
    expect{dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_backgrounddatabasemaintenance' do
    dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance] = true
    expect(dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_backgrounddatabasemaintenance" do
    dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance] = 'true'
    expect(dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_backgrounddatabasemaintenance" do
    dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance] = 'false'
    expect(dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_backgrounddatabasemaintenance" do
    dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance] = 'True'
    expect(dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_backgrounddatabasemaintenance" do
    dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance] = 'False'
    expect(dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_backgrounddatabasemaintenance" do
    dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance] = :true
    expect(dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_backgrounddatabasemaintenance" do
    dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance] = :false
    expect(dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance]).to eq(false)
  end

  it 'should not accept int for dsc_backgrounddatabasemaintenance' do
    expect{dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_backgrounddatabasemaintenance' do
    expect{dsc_xexchmailboxdatabase[:dsc_backgrounddatabasemaintenance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_calendarloggingquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_calendarloggingquota] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_calendarloggingquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_calendarloggingquota] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_calendarloggingquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_calendarloggingquota] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_calendarloggingquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_calendarloggingquota] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_circularloggingenabled' do
    expect{dsc_xexchmailboxdatabase[:dsc_circularloggingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_circularloggingenabled' do
    dsc_xexchmailboxdatabase[:dsc_circularloggingenabled] = true
    expect(dsc_xexchmailboxdatabase[:dsc_circularloggingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_circularloggingenabled" do
    dsc_xexchmailboxdatabase[:dsc_circularloggingenabled] = 'true'
    expect(dsc_xexchmailboxdatabase[:dsc_circularloggingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_circularloggingenabled" do
    dsc_xexchmailboxdatabase[:dsc_circularloggingenabled] = 'false'
    expect(dsc_xexchmailboxdatabase[:dsc_circularloggingenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_circularloggingenabled" do
    dsc_xexchmailboxdatabase[:dsc_circularloggingenabled] = 'True'
    expect(dsc_xexchmailboxdatabase[:dsc_circularloggingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_circularloggingenabled" do
    dsc_xexchmailboxdatabase[:dsc_circularloggingenabled] = 'False'
    expect(dsc_xexchmailboxdatabase[:dsc_circularloggingenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_circularloggingenabled" do
    dsc_xexchmailboxdatabase[:dsc_circularloggingenabled] = :true
    expect(dsc_xexchmailboxdatabase[:dsc_circularloggingenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_circularloggingenabled" do
    dsc_xexchmailboxdatabase[:dsc_circularloggingenabled] = :false
    expect(dsc_xexchmailboxdatabase[:dsc_circularloggingenabled]).to eq(false)
  end

  it 'should not accept int for dsc_circularloggingenabled' do
    expect{dsc_xexchmailboxdatabase[:dsc_circularloggingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_circularloggingenabled' do
    expect{dsc_xexchmailboxdatabase[:dsc_circularloggingenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_datamovereplicationconstraint predefined value None' do
    dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = 'None'
    expect(dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint]).to eq('None')
  end

  it 'should accept dsc_datamovereplicationconstraint predefined value none' do
    dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = 'none'
    expect(dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint]).to eq('none')
  end

  it 'should accept dsc_datamovereplicationconstraint predefined value SecondCopy' do
    dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = 'SecondCopy'
    expect(dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint]).to eq('SecondCopy')
  end

  it 'should accept dsc_datamovereplicationconstraint predefined value secondcopy' do
    dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = 'secondcopy'
    expect(dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint]).to eq('secondcopy')
  end

  it 'should accept dsc_datamovereplicationconstraint predefined value SecondDatacenter' do
    dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = 'SecondDatacenter'
    expect(dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint]).to eq('SecondDatacenter')
  end

  it 'should accept dsc_datamovereplicationconstraint predefined value seconddatacenter' do
    dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = 'seconddatacenter'
    expect(dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint]).to eq('seconddatacenter')
  end

  it 'should accept dsc_datamovereplicationconstraint predefined value AllDatacenters' do
    dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = 'AllDatacenters'
    expect(dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint]).to eq('AllDatacenters')
  end

  it 'should accept dsc_datamovereplicationconstraint predefined value alldatacenters' do
    dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = 'alldatacenters'
    expect(dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint]).to eq('alldatacenters')
  end

  it 'should accept dsc_datamovereplicationconstraint predefined value AllCopies' do
    dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = 'AllCopies'
    expect(dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint]).to eq('AllCopies')
  end

  it 'should accept dsc_datamovereplicationconstraint predefined value allcopies' do
    dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = 'allcopies'
    expect(dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint]).to eq('allcopies')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_datamovereplicationconstraint' do
    expect{dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_datamovereplicationconstraint' do
    expect{dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_datamovereplicationconstraint' do
    expect{dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_datamovereplicationconstraint' do
    expect{dsc_xexchmailboxdatabase[:dsc_datamovereplicationconstraint] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_deleteditemretention' do
    expect{dsc_xexchmailboxdatabase[:dsc_deleteditemretention] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_deleteditemretention' do
    expect{dsc_xexchmailboxdatabase[:dsc_deleteditemretention] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_deleteditemretention' do
    expect{dsc_xexchmailboxdatabase[:dsc_deleteditemretention] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_deleteditemretention' do
    expect{dsc_xexchmailboxdatabase[:dsc_deleteditemretention] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchmailboxdatabase[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchmailboxdatabase[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchmailboxdatabase[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchmailboxdatabase[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_eventhistoryretentionperiod' do
    expect{dsc_xexchmailboxdatabase[:dsc_eventhistoryretentionperiod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_eventhistoryretentionperiod' do
    expect{dsc_xexchmailboxdatabase[:dsc_eventhistoryretentionperiod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_eventhistoryretentionperiod' do
    expect{dsc_xexchmailboxdatabase[:dsc_eventhistoryretentionperiod] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_eventhistoryretentionperiod' do
    expect{dsc_xexchmailboxdatabase[:dsc_eventhistoryretentionperiod] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_indexenabled' do
    expect{dsc_xexchmailboxdatabase[:dsc_indexenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_indexenabled' do
    dsc_xexchmailboxdatabase[:dsc_indexenabled] = true
    expect(dsc_xexchmailboxdatabase[:dsc_indexenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_indexenabled" do
    dsc_xexchmailboxdatabase[:dsc_indexenabled] = 'true'
    expect(dsc_xexchmailboxdatabase[:dsc_indexenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_indexenabled" do
    dsc_xexchmailboxdatabase[:dsc_indexenabled] = 'false'
    expect(dsc_xexchmailboxdatabase[:dsc_indexenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_indexenabled" do
    dsc_xexchmailboxdatabase[:dsc_indexenabled] = 'True'
    expect(dsc_xexchmailboxdatabase[:dsc_indexenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_indexenabled" do
    dsc_xexchmailboxdatabase[:dsc_indexenabled] = 'False'
    expect(dsc_xexchmailboxdatabase[:dsc_indexenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_indexenabled" do
    dsc_xexchmailboxdatabase[:dsc_indexenabled] = :true
    expect(dsc_xexchmailboxdatabase[:dsc_indexenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_indexenabled" do
    dsc_xexchmailboxdatabase[:dsc_indexenabled] = :false
    expect(dsc_xexchmailboxdatabase[:dsc_indexenabled]).to eq(false)
  end

  it 'should not accept int for dsc_indexenabled' do
    expect{dsc_xexchmailboxdatabase[:dsc_indexenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_indexenabled' do
    expect{dsc_xexchmailboxdatabase[:dsc_indexenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_isexcludedfromprovisioning' do
    expect{dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_isexcludedfromprovisioning' do
    dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning] = true
    expect(dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_isexcludedfromprovisioning" do
    dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning] = 'true'
    expect(dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_isexcludedfromprovisioning" do
    dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning] = 'false'
    expect(dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_isexcludedfromprovisioning" do
    dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning] = 'True'
    expect(dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_isexcludedfromprovisioning" do
    dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning] = 'False'
    expect(dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_isexcludedfromprovisioning" do
    dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning] = :true
    expect(dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_isexcludedfromprovisioning" do
    dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning] = :false
    expect(dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning]).to eq(false)
  end

  it 'should not accept int for dsc_isexcludedfromprovisioning' do
    expect{dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_isexcludedfromprovisioning' do
    expect{dsc_xexchmailboxdatabase[:dsc_isexcludedfromprovisioning] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_issuewarningquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_issuewarningquota] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_issuewarningquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_issuewarningquota] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_issuewarningquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_issuewarningquota] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_issuewarningquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_issuewarningquota] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_issuspendedfromprovisioning' do
    expect{dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_issuspendedfromprovisioning' do
    dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning] = true
    expect(dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_issuspendedfromprovisioning" do
    dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning] = 'true'
    expect(dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_issuspendedfromprovisioning" do
    dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning] = 'false'
    expect(dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_issuspendedfromprovisioning" do
    dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning] = 'True'
    expect(dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_issuspendedfromprovisioning" do
    dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning] = 'False'
    expect(dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_issuspendedfromprovisioning" do
    dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning] = :true
    expect(dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_issuspendedfromprovisioning" do
    dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning] = :false
    expect(dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning]).to eq(false)
  end

  it 'should not accept int for dsc_issuspendedfromprovisioning' do
    expect{dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_issuspendedfromprovisioning' do
    expect{dsc_xexchmailboxdatabase[:dsc_issuspendedfromprovisioning] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_journalrecipient' do
    expect{dsc_xexchmailboxdatabase[:dsc_journalrecipient] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_journalrecipient' do
    expect{dsc_xexchmailboxdatabase[:dsc_journalrecipient] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_journalrecipient' do
    expect{dsc_xexchmailboxdatabase[:dsc_journalrecipient] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_journalrecipient' do
    expect{dsc_xexchmailboxdatabase[:dsc_journalrecipient] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_mailboxretention' do
    expect{dsc_xexchmailboxdatabase[:dsc_mailboxretention] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mailboxretention' do
    expect{dsc_xexchmailboxdatabase[:dsc_mailboxretention] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mailboxretention' do
    expect{dsc_xexchmailboxdatabase[:dsc_mailboxretention] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mailboxretention' do
    expect{dsc_xexchmailboxdatabase[:dsc_mailboxretention] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_mountatstartup' do
    expect{dsc_xexchmailboxdatabase[:dsc_mountatstartup] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_mountatstartup' do
    dsc_xexchmailboxdatabase[:dsc_mountatstartup] = true
    expect(dsc_xexchmailboxdatabase[:dsc_mountatstartup]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_mountatstartup" do
    dsc_xexchmailboxdatabase[:dsc_mountatstartup] = 'true'
    expect(dsc_xexchmailboxdatabase[:dsc_mountatstartup]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_mountatstartup" do
    dsc_xexchmailboxdatabase[:dsc_mountatstartup] = 'false'
    expect(dsc_xexchmailboxdatabase[:dsc_mountatstartup]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_mountatstartup" do
    dsc_xexchmailboxdatabase[:dsc_mountatstartup] = 'True'
    expect(dsc_xexchmailboxdatabase[:dsc_mountatstartup]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_mountatstartup" do
    dsc_xexchmailboxdatabase[:dsc_mountatstartup] = 'False'
    expect(dsc_xexchmailboxdatabase[:dsc_mountatstartup]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_mountatstartup" do
    dsc_xexchmailboxdatabase[:dsc_mountatstartup] = :true
    expect(dsc_xexchmailboxdatabase[:dsc_mountatstartup]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_mountatstartup" do
    dsc_xexchmailboxdatabase[:dsc_mountatstartup] = :false
    expect(dsc_xexchmailboxdatabase[:dsc_mountatstartup]).to eq(false)
  end

  it 'should not accept int for dsc_mountatstartup' do
    expect{dsc_xexchmailboxdatabase[:dsc_mountatstartup] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mountatstartup' do
    expect{dsc_xexchmailboxdatabase[:dsc_mountatstartup] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_offlineaddressbook' do
    expect{dsc_xexchmailboxdatabase[:dsc_offlineaddressbook] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_offlineaddressbook' do
    expect{dsc_xexchmailboxdatabase[:dsc_offlineaddressbook] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_offlineaddressbook' do
    expect{dsc_xexchmailboxdatabase[:dsc_offlineaddressbook] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_offlineaddressbook' do
    expect{dsc_xexchmailboxdatabase[:dsc_offlineaddressbook] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_prohibitsendquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_prohibitsendquota] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_prohibitsendquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_prohibitsendquota] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_prohibitsendquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_prohibitsendquota] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_prohibitsendquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_prohibitsendquota] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_prohibitsendreceivequota' do
    expect{dsc_xexchmailboxdatabase[:dsc_prohibitsendreceivequota] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_prohibitsendreceivequota' do
    expect{dsc_xexchmailboxdatabase[:dsc_prohibitsendreceivequota] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_prohibitsendreceivequota' do
    expect{dsc_xexchmailboxdatabase[:dsc_prohibitsendreceivequota] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_prohibitsendreceivequota' do
    expect{dsc_xexchmailboxdatabase[:dsc_prohibitsendreceivequota] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_recoverableitemsquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_recoverableitemsquota] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_recoverableitemsquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_recoverableitemsquota] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_recoverableitemsquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_recoverableitemsquota] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_recoverableitemsquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_recoverableitemsquota] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_recoverableitemswarningquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_recoverableitemswarningquota] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_recoverableitemswarningquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_recoverableitemswarningquota] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_recoverableitemswarningquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_recoverableitemswarningquota] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_recoverableitemswarningquota' do
    expect{dsc_xexchmailboxdatabase[:dsc_recoverableitemswarningquota] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_retaindeleteditemsuntilbackup' do
    expect{dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_retaindeleteditemsuntilbackup' do
    dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup] = true
    expect(dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_retaindeleteditemsuntilbackup" do
    dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup] = 'true'
    expect(dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_retaindeleteditemsuntilbackup" do
    dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup] = 'false'
    expect(dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_retaindeleteditemsuntilbackup" do
    dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup] = 'True'
    expect(dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_retaindeleteditemsuntilbackup" do
    dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup] = 'False'
    expect(dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_retaindeleteditemsuntilbackup" do
    dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup] = :true
    expect(dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_retaindeleteditemsuntilbackup" do
    dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup] = :false
    expect(dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup]).to eq(false)
  end

  it 'should not accept int for dsc_retaindeleteditemsuntilbackup' do
    expect{dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_retaindeleteditemsuntilbackup' do
    expect{dsc_xexchmailboxdatabase[:dsc_retaindeleteditemsuntilbackup] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchmailboxdatabase)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchmailboxdatabase)
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
