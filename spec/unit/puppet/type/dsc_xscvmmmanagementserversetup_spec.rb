#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xscvmmmanagementserversetup) do

  let :dsc_xscvmmmanagementserversetup do
    Puppet::Type.type(:dsc_xscvmmmanagementserversetup).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
    )
  end

  it "should stringify normally" do
    expect(dsc_xscvmmmanagementserversetup.to_s).to eq("Dsc_xscvmmmanagementserversetup[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xscvmmmanagementserversetup[:ensure]).to eq :present
  end

  it 'should require that dsc_ensure is specified' do
    #dsc_xscvmmmanagementserversetup[:dsc_ensure]
    expect { Puppet::Type.type(:dsc_xscvmmmanagementserversetup).new(
      :name     => 'foo',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
      :dsc_vmmservice => {"user"=>"user", "password"=>"password"},
      :dsc_vmmserviceusername => 'foo',
      :dsc_productkey => 'foo',
      :dsc_username => 'foo',
      :dsc_companyname => 'foo',
      :dsc_programfiles => 'foo',
      :dsc_clustermanagementserver => true,
      :dsc_firstmanagementserver => true,
      :dsc_createnewsqldatabase => 'foo',
      :dsc_sqlmachinename => 'foo',
      :dsc_sqlinstancename => 'foo',
      :dsc_sqldatabasename => 'foo',
      :dsc_indigotcpport => 16,
      :dsc_indigohttpsport => 16,
      :dsc_indigonettcpport => 16,
      :dsc_indigohttpport => 16,
      :dsc_wsmantcpport => 16,
      :dsc_bitstcpport => 16,
      :dsc_createnewlibraryshare => 'foo',
      :dsc_librarysharename => 'foo',
      :dsc_librarysharepath => 'foo',
      :dsc_librarysharedescription => 'foo',
      :dsc_topcontainername => 'foo',
      :dsc_vmmservername => 'foo',
      :dsc_vmmstaticipaddress => 'foo',
      :dsc_retainsqldatabase => 1,
      :dsc_forcehavmmuninstall => 1,
      :dsc_sqmoptin => 1,
      :dsc_muoptin => 1,
    )}.to raise_error(Puppet::Error, /dsc_ensure is a required attribute/)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xscvmmmanagementserversetup[:dsc_ensure] = 'Present'
    expect(dsc_xscvmmmanagementserversetup[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xscvmmmanagementserversetup[:dsc_ensure] = 'present'
    expect(dsc_xscvmmmanagementserversetup[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscvmmmanagementserversetup[:dsc_ensure] = 'present'
    expect(dsc_xscvmmmanagementserversetup[:ensure]).to eq(dsc_xscvmmmanagementserversetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xscvmmmanagementserversetup[:dsc_ensure] = 'Absent'
    expect(dsc_xscvmmmanagementserversetup[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xscvmmmanagementserversetup[:dsc_ensure] = 'absent'
    expect(dsc_xscvmmmanagementserversetup[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscvmmmanagementserversetup[:dsc_ensure] = 'absent'
    expect(dsc_xscvmmmanagementserversetup[:ensure]).to eq(dsc_xscvmmmanagementserversetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefolder' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sourcefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefolder' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sourcefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefolder' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sourcefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefolder' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sourcefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_setupcredential" do
    expect{dsc_xscvmmmanagementserversetup[:dsc_setupcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setupcredential' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_setupcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setupcredential' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_setupcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setupcredential' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_setupcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setupcredential' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_setupcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_vmmservice" do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmservice] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_vmmservice' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmservice] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_vmmservice' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmservice] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_vmmservice' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmservice] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_vmmservice' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmservice] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_vmmserviceusername' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmserviceusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_vmmserviceusername' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmserviceusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_vmmserviceusername' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmserviceusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_vmmserviceusername' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmserviceusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_productkey' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_productkey] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_productkey' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_productkey] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_productkey' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_productkey] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_productkey' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_productkey] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_username' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_username] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_username' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_username] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_username' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_username] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_username' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_username] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_companyname' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_companyname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_companyname' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_companyname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_companyname' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_companyname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_companyname' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_companyname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_programfiles' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_programfiles] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_programfiles' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_programfiles] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_programfiles' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_programfiles] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_programfiles' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_programfiles] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_clustermanagementserver' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_clustermanagementserver' do
    dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver] = true
    expect(dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_clustermanagementserver" do
    dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver] = 'true'
    expect(dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_clustermanagementserver" do
    dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver] = 'false'
    expect(dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_clustermanagementserver" do
    dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver] = 'True'
    expect(dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_clustermanagementserver" do
    dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver] = 'False'
    expect(dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_clustermanagementserver" do
    dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver] = :true
    expect(dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_clustermanagementserver" do
    dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver] = :false
    expect(dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver]).to eq(false)
  end

  it 'should not accept int for dsc_clustermanagementserver' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_clustermanagementserver' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_clustermanagementserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_firstmanagementserver' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_firstmanagementserver' do
    dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver] = true
    expect(dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_firstmanagementserver" do
    dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver] = 'true'
    expect(dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_firstmanagementserver" do
    dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver] = 'false'
    expect(dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_firstmanagementserver" do
    dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver] = 'True'
    expect(dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_firstmanagementserver" do
    dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver] = 'False'
    expect(dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_firstmanagementserver" do
    dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver] = :true
    expect(dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_firstmanagementserver" do
    dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver] = :false
    expect(dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver]).to eq(false)
  end

  it 'should not accept int for dsc_firstmanagementserver' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_firstmanagementserver' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_firstmanagementserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_createnewsqldatabase' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_createnewsqldatabase] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_createnewsqldatabase' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_createnewsqldatabase] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_createnewsqldatabase' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_createnewsqldatabase] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_createnewsqldatabase' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_createnewsqldatabase] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlmachinename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqlmachinename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlmachinename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqlmachinename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlmachinename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqlmachinename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlmachinename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqlmachinename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstancename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqlinstancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstancename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqlinstancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstancename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqlinstancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstancename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqlinstancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqldatabasename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqldatabasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqldatabasename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqldatabasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqldatabasename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqldatabasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqldatabasename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqldatabasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_indigotcpport' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_indigotcpport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_indigotcpport' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_indigotcpport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_indigotcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigotcpport] = 16
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigotcpport]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_indigotcpport' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscvmmmanagementserversetup[:dsc_indigotcpport] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_indigotcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigotcpport] = '16'
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigotcpport]).to eq(16)
  end

  it 'should accept string-like uint for dsc_indigotcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigotcpport] = '32'
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigotcpport]).to eq(32)
  end

  it 'should accept string-like uint for dsc_indigotcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigotcpport] = '64'
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigotcpport]).to eq(64)
  end

  it 'should not accept array for dsc_indigohttpsport' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_indigohttpsport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_indigohttpsport' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_indigohttpsport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_indigohttpsport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigohttpsport] = 16
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigohttpsport]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_indigohttpsport' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscvmmmanagementserversetup[:dsc_indigohttpsport] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_indigohttpsport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigohttpsport] = '16'
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigohttpsport]).to eq(16)
  end

  it 'should accept string-like uint for dsc_indigohttpsport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigohttpsport] = '32'
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigohttpsport]).to eq(32)
  end

  it 'should accept string-like uint for dsc_indigohttpsport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigohttpsport] = '64'
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigohttpsport]).to eq(64)
  end

  it 'should not accept array for dsc_indigonettcpport' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_indigonettcpport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_indigonettcpport' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_indigonettcpport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_indigonettcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigonettcpport] = 16
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigonettcpport]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_indigonettcpport' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscvmmmanagementserversetup[:dsc_indigonettcpport] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_indigonettcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigonettcpport] = '16'
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigonettcpport]).to eq(16)
  end

  it 'should accept string-like uint for dsc_indigonettcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigonettcpport] = '32'
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigonettcpport]).to eq(32)
  end

  it 'should accept string-like uint for dsc_indigonettcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigonettcpport] = '64'
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigonettcpport]).to eq(64)
  end

  it 'should not accept array for dsc_indigohttpport' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_indigohttpport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_indigohttpport' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_indigohttpport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_indigohttpport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigohttpport] = 16
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigohttpport]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_indigohttpport' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscvmmmanagementserversetup[:dsc_indigohttpport] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_indigohttpport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigohttpport] = '16'
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigohttpport]).to eq(16)
  end

  it 'should accept string-like uint for dsc_indigohttpport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigohttpport] = '32'
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigohttpport]).to eq(32)
  end

  it 'should accept string-like uint for dsc_indigohttpport' do
    dsc_xscvmmmanagementserversetup[:dsc_indigohttpport] = '64'
    expect(dsc_xscvmmmanagementserversetup[:dsc_indigohttpport]).to eq(64)
  end

  it 'should not accept array for dsc_wsmantcpport' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_wsmantcpport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_wsmantcpport' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_wsmantcpport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_wsmantcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_wsmantcpport] = 16
    expect(dsc_xscvmmmanagementserversetup[:dsc_wsmantcpport]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_wsmantcpport' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscvmmmanagementserversetup[:dsc_wsmantcpport] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_wsmantcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_wsmantcpport] = '16'
    expect(dsc_xscvmmmanagementserversetup[:dsc_wsmantcpport]).to eq(16)
  end

  it 'should accept string-like uint for dsc_wsmantcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_wsmantcpport] = '32'
    expect(dsc_xscvmmmanagementserversetup[:dsc_wsmantcpport]).to eq(32)
  end

  it 'should accept string-like uint for dsc_wsmantcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_wsmantcpport] = '64'
    expect(dsc_xscvmmmanagementserversetup[:dsc_wsmantcpport]).to eq(64)
  end

  it 'should not accept array for dsc_bitstcpport' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_bitstcpport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_bitstcpport' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_bitstcpport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_bitstcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_bitstcpport] = 16
    expect(dsc_xscvmmmanagementserversetup[:dsc_bitstcpport]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_bitstcpport' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscvmmmanagementserversetup[:dsc_bitstcpport] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_bitstcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_bitstcpport] = '16'
    expect(dsc_xscvmmmanagementserversetup[:dsc_bitstcpport]).to eq(16)
  end

  it 'should accept string-like uint for dsc_bitstcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_bitstcpport] = '32'
    expect(dsc_xscvmmmanagementserversetup[:dsc_bitstcpport]).to eq(32)
  end

  it 'should accept string-like uint for dsc_bitstcpport' do
    dsc_xscvmmmanagementserversetup[:dsc_bitstcpport] = '64'
    expect(dsc_xscvmmmanagementserversetup[:dsc_bitstcpport]).to eq(64)
  end

  it 'should not accept array for dsc_createnewlibraryshare' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_createnewlibraryshare] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_createnewlibraryshare' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_createnewlibraryshare] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_createnewlibraryshare' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_createnewlibraryshare] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_createnewlibraryshare' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_createnewlibraryshare] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_librarysharename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_librarysharename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_librarysharename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_librarysharename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_librarysharename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_librarysharename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_librarysharename' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_librarysharename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_librarysharepath' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_librarysharepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_librarysharepath' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_librarysharepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_librarysharepath' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_librarysharepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_librarysharepath' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_librarysharepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_librarysharedescription' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_librarysharedescription] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_librarysharedescription' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_librarysharedescription] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_librarysharedescription' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_librarysharedescription] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_librarysharedescription' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_librarysharedescription] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_topcontainername' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_topcontainername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_topcontainername' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_topcontainername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_topcontainername' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_topcontainername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_topcontainername' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_topcontainername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_vmmservername' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmservername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_vmmservername' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmservername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_vmmservername' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmservername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_vmmservername' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmservername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_vmmstaticipaddress' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmstaticipaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_vmmstaticipaddress' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmstaticipaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_vmmstaticipaddress' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmstaticipaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_vmmstaticipaddress' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_vmmstaticipaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_retainsqldatabase' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_retainsqldatabase] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retainsqldatabase' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_retainsqldatabase] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retainsqldatabase' do
    dsc_xscvmmmanagementserversetup[:dsc_retainsqldatabase] = 1
    expect(dsc_xscvmmmanagementserversetup[:dsc_retainsqldatabase]).to eq(1)
  end

  it 'should not accept signed (negative) value for dsc_retainsqldatabase' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscvmmmanagementserversetup[:dsc_retainsqldatabase] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_retainsqldatabase' do
    dsc_xscvmmmanagementserversetup[:dsc_retainsqldatabase] = '16'
    expect(dsc_xscvmmmanagementserversetup[:dsc_retainsqldatabase]).to eq(16)
  end

  it 'should accept string-like uint for dsc_retainsqldatabase' do
    dsc_xscvmmmanagementserversetup[:dsc_retainsqldatabase] = '32'
    expect(dsc_xscvmmmanagementserversetup[:dsc_retainsqldatabase]).to eq(32)
  end

  it 'should accept string-like uint for dsc_retainsqldatabase' do
    dsc_xscvmmmanagementserversetup[:dsc_retainsqldatabase] = '64'
    expect(dsc_xscvmmmanagementserversetup[:dsc_retainsqldatabase]).to eq(64)
  end

  it 'should not accept array for dsc_forcehavmmuninstall' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_forcehavmmuninstall] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_forcehavmmuninstall' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_forcehavmmuninstall] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_forcehavmmuninstall' do
    dsc_xscvmmmanagementserversetup[:dsc_forcehavmmuninstall] = 1
    expect(dsc_xscvmmmanagementserversetup[:dsc_forcehavmmuninstall]).to eq(1)
  end

  it 'should not accept signed (negative) value for dsc_forcehavmmuninstall' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscvmmmanagementserversetup[:dsc_forcehavmmuninstall] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_forcehavmmuninstall' do
    dsc_xscvmmmanagementserversetup[:dsc_forcehavmmuninstall] = '16'
    expect(dsc_xscvmmmanagementserversetup[:dsc_forcehavmmuninstall]).to eq(16)
  end

  it 'should accept string-like uint for dsc_forcehavmmuninstall' do
    dsc_xscvmmmanagementserversetup[:dsc_forcehavmmuninstall] = '32'
    expect(dsc_xscvmmmanagementserversetup[:dsc_forcehavmmuninstall]).to eq(32)
  end

  it 'should accept string-like uint for dsc_forcehavmmuninstall' do
    dsc_xscvmmmanagementserversetup[:dsc_forcehavmmuninstall] = '64'
    expect(dsc_xscvmmmanagementserversetup[:dsc_forcehavmmuninstall]).to eq(64)
  end

  it 'should not accept array for dsc_sqmoptin' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqmoptin] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqmoptin' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqmoptin] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_sqmoptin' do
    dsc_xscvmmmanagementserversetup[:dsc_sqmoptin] = 1
    expect(dsc_xscvmmmanagementserversetup[:dsc_sqmoptin]).to eq(1)
  end

  it 'should not accept signed (negative) value for dsc_sqmoptin' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscvmmmanagementserversetup[:dsc_sqmoptin] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_sqmoptin' do
    dsc_xscvmmmanagementserversetup[:dsc_sqmoptin] = '16'
    expect(dsc_xscvmmmanagementserversetup[:dsc_sqmoptin]).to eq(16)
  end

  it 'should accept string-like uint for dsc_sqmoptin' do
    dsc_xscvmmmanagementserversetup[:dsc_sqmoptin] = '32'
    expect(dsc_xscvmmmanagementserversetup[:dsc_sqmoptin]).to eq(32)
  end

  it 'should accept string-like uint for dsc_sqmoptin' do
    dsc_xscvmmmanagementserversetup[:dsc_sqmoptin] = '64'
    expect(dsc_xscvmmmanagementserversetup[:dsc_sqmoptin]).to eq(64)
  end

  it 'should not accept array for dsc_muoptin' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_muoptin] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_muoptin' do
    expect{dsc_xscvmmmanagementserversetup[:dsc_muoptin] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_muoptin' do
    dsc_xscvmmmanagementserversetup[:dsc_muoptin] = 1
    expect(dsc_xscvmmmanagementserversetup[:dsc_muoptin]).to eq(1)
  end

  it 'should not accept signed (negative) value for dsc_muoptin' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscvmmmanagementserversetup[:dsc_muoptin] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_muoptin' do
    dsc_xscvmmmanagementserversetup[:dsc_muoptin] = '16'
    expect(dsc_xscvmmmanagementserversetup[:dsc_muoptin]).to eq(16)
  end

  it 'should accept string-like uint for dsc_muoptin' do
    dsc_xscvmmmanagementserversetup[:dsc_muoptin] = '32'
    expect(dsc_xscvmmmanagementserversetup[:dsc_muoptin]).to eq(32)
  end

  it 'should accept string-like uint for dsc_muoptin' do
    dsc_xscvmmmanagementserversetup[:dsc_muoptin] = '64'
    expect(dsc_xscvmmmanagementserversetup[:dsc_muoptin]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xscvmmmanagementserversetup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xscvmmmanagementserversetup)
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
        dsc_xscvmmmanagementserversetup.original_parameters[:dsc_ensure] = 'present'
        dsc_xscvmmmanagementserversetup[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xscvmmmanagementserversetup)
      end

      it "should update :ensure to :present" do
        expect(dsc_xscvmmmanagementserversetup[:ensure]).to eq(:present)
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
        dsc_xscvmmmanagementserversetup.original_parameters[:dsc_ensure] = 'absent'
        dsc_xscvmmmanagementserversetup[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xscvmmmanagementserversetup)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xscvmmmanagementserversetup[:ensure]).to eq(:absent)
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
