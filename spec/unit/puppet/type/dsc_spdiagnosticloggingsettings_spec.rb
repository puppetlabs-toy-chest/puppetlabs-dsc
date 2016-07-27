#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spdiagnosticloggingsettings) do

  let :dsc_spdiagnosticloggingsettings do
    Puppet::Type.type(:dsc_spdiagnosticloggingsettings).new(
      :name     => 'foo',
      :dsc_logpath => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spdiagnosticloggingsettings).new(
      :name     => 'foo',
      :dsc_logpath => 'foo',
      :dsc_logspaceingb => 32,
      :dsc_appanalyticsautomaticuploadenabled => true,
      :dsc_customerexperienceimprovementprogramenabled => true,
      :dsc_daystokeeplogs => 32,
      :dsc_downloaderrorreportingupdatesenabled => true,
      :dsc_errorreportingautomaticuploadenabled => true,
      :dsc_errorreportingenabled => true,
      :dsc_eventlogfloodprotectionenabled => true,
      :dsc_eventlogfloodprotectionnotifyinterval => 32,
      :dsc_eventlogfloodprotectionquietperiod => 32,
      :dsc_eventlogfloodprotectionthreshold => 32,
      :dsc_eventlogfloodprotectiontriggerperiod => 32,
      :dsc_logcutinterval => 32,
      :dsc_logmaxdiskspaceusageenabled => true,
      :dsc_scripterrorreportingdelay => 32,
      :dsc_scripterrorreportingenabled => true,
      :dsc_scripterrorreportingrequireauth => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spdiagnosticloggingsettings.to_s).to eq("Dsc_spdiagnosticloggingsettings[foo]")
  end

  it 'should require that dsc_logpath is specified' do
    #dsc_spdiagnosticloggingsettings[:dsc_logpath]
    expect { Puppet::Type.type(:dsc_spdiagnosticloggingsettings).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_logpath is a required attribute/)
  end

  it 'should not accept array for dsc_logpath' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logpath' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logpath' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logpath' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logspaceingb' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logspaceingb] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logspaceingb' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logspaceingb] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_logspaceingb' do
    dsc_spdiagnosticloggingsettings[:dsc_logspaceingb] = 32
    expect(dsc_spdiagnosticloggingsettings[:dsc_logspaceingb]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_logspaceingb' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spdiagnosticloggingsettings[:dsc_logspaceingb] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_logspaceingb' do
    dsc_spdiagnosticloggingsettings[:dsc_logspaceingb] = '16'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logspaceingb]).to eq(16)
  end

  it 'should accept string-like uint for dsc_logspaceingb' do
    dsc_spdiagnosticloggingsettings[:dsc_logspaceingb] = '32'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logspaceingb]).to eq(32)
  end

  it 'should accept string-like uint for dsc_logspaceingb' do
    dsc_spdiagnosticloggingsettings[:dsc_logspaceingb] = '64'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logspaceingb]).to eq(64)
  end

  it 'should not accept array for dsc_appanalyticsautomaticuploadenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_appanalyticsautomaticuploadenabled' do
    dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = true
    expect(dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_appanalyticsautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_appanalyticsautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_appanalyticsautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_appanalyticsautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_appanalyticsautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_appanalyticsautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled]).to eq(false)
  end

  it 'should not accept int for dsc_appanalyticsautomaticuploadenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_appanalyticsautomaticuploadenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_customerexperienceimprovementprogramenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_customerexperienceimprovementprogramenabled' do
    dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = true
    expect(dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_customerexperienceimprovementprogramenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_customerexperienceimprovementprogramenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_customerexperienceimprovementprogramenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_customerexperienceimprovementprogramenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_customerexperienceimprovementprogramenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_customerexperienceimprovementprogramenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled]).to eq(false)
  end

  it 'should not accept int for dsc_customerexperienceimprovementprogramenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_customerexperienceimprovementprogramenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_daystokeeplogs' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_daystokeeplogs] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_daystokeeplogs' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_daystokeeplogs] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_daystokeeplogs' do
    dsc_spdiagnosticloggingsettings[:dsc_daystokeeplogs] = 32
    expect(dsc_spdiagnosticloggingsettings[:dsc_daystokeeplogs]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_daystokeeplogs' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spdiagnosticloggingsettings[:dsc_daystokeeplogs] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_daystokeeplogs' do
    dsc_spdiagnosticloggingsettings[:dsc_daystokeeplogs] = '16'
    expect(dsc_spdiagnosticloggingsettings[:dsc_daystokeeplogs]).to eq(16)
  end

  it 'should accept string-like uint for dsc_daystokeeplogs' do
    dsc_spdiagnosticloggingsettings[:dsc_daystokeeplogs] = '32'
    expect(dsc_spdiagnosticloggingsettings[:dsc_daystokeeplogs]).to eq(32)
  end

  it 'should accept string-like uint for dsc_daystokeeplogs' do
    dsc_spdiagnosticloggingsettings[:dsc_daystokeeplogs] = '64'
    expect(dsc_spdiagnosticloggingsettings[:dsc_daystokeeplogs]).to eq(64)
  end

  it 'should not accept array for dsc_downloaderrorreportingupdatesenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_downloaderrorreportingupdatesenabled' do
    dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = true
    expect(dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_downloaderrorreportingupdatesenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_downloaderrorreportingupdatesenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_downloaderrorreportingupdatesenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_downloaderrorreportingupdatesenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_downloaderrorreportingupdatesenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_downloaderrorreportingupdatesenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled]).to eq(false)
  end

  it 'should not accept int for dsc_downloaderrorreportingupdatesenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_downloaderrorreportingupdatesenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_errorreportingautomaticuploadenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_errorreportingautomaticuploadenabled' do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = true
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_errorreportingautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_errorreportingautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_errorreportingautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_errorreportingautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_errorreportingautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_errorreportingautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled]).to eq(false)
  end

  it 'should not accept int for dsc_errorreportingautomaticuploadenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_errorreportingautomaticuploadenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_errorreportingenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_errorreportingenabled' do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = true
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_errorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_errorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_errorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_errorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_errorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_errorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled]).to eq(false)
  end

  it 'should not accept int for dsc_errorreportingenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_errorreportingenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_eventlogfloodprotectionenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_eventlogfloodprotectionenabled' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = true
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_eventlogfloodprotectionenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_eventlogfloodprotectionenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_eventlogfloodprotectionenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_eventlogfloodprotectionenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_eventlogfloodprotectionenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_eventlogfloodprotectionenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled]).to eq(false)
  end

  it 'should not accept int for dsc_eventlogfloodprotectionenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_eventlogfloodprotectionenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_eventlogfloodprotectionnotifyinterval' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionnotifyinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_eventlogfloodprotectionnotifyinterval' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionnotifyinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_eventlogfloodprotectionnotifyinterval' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionnotifyinterval] = 32
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionnotifyinterval]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_eventlogfloodprotectionnotifyinterval' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionnotifyinterval] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_eventlogfloodprotectionnotifyinterval' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionnotifyinterval] = '16'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionnotifyinterval]).to eq(16)
  end

  it 'should accept string-like uint for dsc_eventlogfloodprotectionnotifyinterval' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionnotifyinterval] = '32'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionnotifyinterval]).to eq(32)
  end

  it 'should accept string-like uint for dsc_eventlogfloodprotectionnotifyinterval' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionnotifyinterval] = '64'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionnotifyinterval]).to eq(64)
  end

  it 'should not accept array for dsc_eventlogfloodprotectionquietperiod' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionquietperiod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_eventlogfloodprotectionquietperiod' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionquietperiod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_eventlogfloodprotectionquietperiod' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionquietperiod] = 32
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionquietperiod]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_eventlogfloodprotectionquietperiod' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionquietperiod] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_eventlogfloodprotectionquietperiod' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionquietperiod] = '16'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionquietperiod]).to eq(16)
  end

  it 'should accept string-like uint for dsc_eventlogfloodprotectionquietperiod' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionquietperiod] = '32'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionquietperiod]).to eq(32)
  end

  it 'should accept string-like uint for dsc_eventlogfloodprotectionquietperiod' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionquietperiod] = '64'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionquietperiod]).to eq(64)
  end

  it 'should not accept array for dsc_eventlogfloodprotectionthreshold' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionthreshold] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_eventlogfloodprotectionthreshold' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionthreshold] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_eventlogfloodprotectionthreshold' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionthreshold] = 32
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionthreshold]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_eventlogfloodprotectionthreshold' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionthreshold] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_eventlogfloodprotectionthreshold' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionthreshold] = '16'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionthreshold]).to eq(16)
  end

  it 'should accept string-like uint for dsc_eventlogfloodprotectionthreshold' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionthreshold] = '32'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionthreshold]).to eq(32)
  end

  it 'should accept string-like uint for dsc_eventlogfloodprotectionthreshold' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionthreshold] = '64'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionthreshold]).to eq(64)
  end

  it 'should not accept array for dsc_eventlogfloodprotectiontriggerperiod' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectiontriggerperiod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_eventlogfloodprotectiontriggerperiod' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectiontriggerperiod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_eventlogfloodprotectiontriggerperiod' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectiontriggerperiod] = 32
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectiontriggerperiod]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_eventlogfloodprotectiontriggerperiod' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectiontriggerperiod] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_eventlogfloodprotectiontriggerperiod' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectiontriggerperiod] = '16'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectiontriggerperiod]).to eq(16)
  end

  it 'should accept string-like uint for dsc_eventlogfloodprotectiontriggerperiod' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectiontriggerperiod] = '32'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectiontriggerperiod]).to eq(32)
  end

  it 'should accept string-like uint for dsc_eventlogfloodprotectiontriggerperiod' do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectiontriggerperiod] = '64'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectiontriggerperiod]).to eq(64)
  end

  it 'should not accept array for dsc_logcutinterval' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logcutinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logcutinterval' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logcutinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_logcutinterval' do
    dsc_spdiagnosticloggingsettings[:dsc_logcutinterval] = 32
    expect(dsc_spdiagnosticloggingsettings[:dsc_logcutinterval]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_logcutinterval' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spdiagnosticloggingsettings[:dsc_logcutinterval] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_logcutinterval' do
    dsc_spdiagnosticloggingsettings[:dsc_logcutinterval] = '16'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logcutinterval]).to eq(16)
  end

  it 'should accept string-like uint for dsc_logcutinterval' do
    dsc_spdiagnosticloggingsettings[:dsc_logcutinterval] = '32'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logcutinterval]).to eq(32)
  end

  it 'should accept string-like uint for dsc_logcutinterval' do
    dsc_spdiagnosticloggingsettings[:dsc_logcutinterval] = '64'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logcutinterval]).to eq(64)
  end

  it 'should not accept array for dsc_logmaxdiskspaceusageenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_logmaxdiskspaceusageenabled' do
    dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = true
    expect(dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_logmaxdiskspaceusageenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_logmaxdiskspaceusageenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_logmaxdiskspaceusageenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_logmaxdiskspaceusageenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_logmaxdiskspaceusageenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_logmaxdiskspaceusageenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled]).to eq(false)
  end

  it 'should not accept int for dsc_logmaxdiskspaceusageenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logmaxdiskspaceusageenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scripterrorreportingdelay' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingdelay] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scripterrorreportingdelay' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingdelay] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_scripterrorreportingdelay' do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingdelay] = 32
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingdelay]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_scripterrorreportingdelay' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingdelay] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_scripterrorreportingdelay' do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingdelay] = '16'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingdelay]).to eq(16)
  end

  it 'should accept string-like uint for dsc_scripterrorreportingdelay' do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingdelay] = '32'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingdelay]).to eq(32)
  end

  it 'should accept string-like uint for dsc_scripterrorreportingdelay' do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingdelay] = '64'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingdelay]).to eq(64)
  end

  it 'should not accept array for dsc_scripterrorreportingenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_scripterrorreportingenabled' do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = true
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_scripterrorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_scripterrorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_scripterrorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_scripterrorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_scripterrorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_scripterrorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled]).to eq(false)
  end

  it 'should not accept int for dsc_scripterrorreportingenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scripterrorreportingenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scripterrorreportingrequireauth' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_scripterrorreportingrequireauth' do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = true
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_scripterrorreportingrequireauth" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_scripterrorreportingrequireauth" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_scripterrorreportingrequireauth" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_scripterrorreportingrequireauth" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_scripterrorreportingrequireauth" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_scripterrorreportingrequireauth" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth]).to eq(false)
  end

  it 'should not accept int for dsc_scripterrorreportingrequireauth' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scripterrorreportingrequireauth' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spdiagnosticloggingsettings[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spdiagnosticloggingsettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spdiagnosticloggingsettings)
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
