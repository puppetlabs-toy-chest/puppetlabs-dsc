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

  it 'should not accept array for dsc_logspaceingb' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logspaceingb] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logspaceingb' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logspaceingb] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_appanalyticsautomaticuploadenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_appanalyticsautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_appanalyticsautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_appanalyticsautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_appanalyticsautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_appanalyticsautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_appanalyticsautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_appanalyticsautomaticuploadenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_appanalyticsautomaticuploadenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_customerexperienceimprovementprogramenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_customerexperienceimprovementprogramenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_customerexperienceimprovementprogramenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_customerexperienceimprovementprogramenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_customerexperienceimprovementprogramenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_customerexperienceimprovementprogramenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_customerexperienceimprovementprogramenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_customerexperienceimprovementprogramenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_customerexperienceimprovementprogramenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_daystokeeplogs' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_daystokeeplogs] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_daystokeeplogs' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_daystokeeplogs] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_downloaderrorreportingupdatesenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_downloaderrorreportingupdatesenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_downloaderrorreportingupdatesenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_downloaderrorreportingupdatesenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_downloaderrorreportingupdatesenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_downloaderrorreportingupdatesenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_downloaderrorreportingupdatesenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_downloaderrorreportingupdatesenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_downloaderrorreportingupdatesenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_errorreportingautomaticuploadenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_errorreportingautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_errorreportingautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_errorreportingautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_errorreportingautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_errorreportingautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_errorreportingautomaticuploadenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_errorreportingautomaticuploadenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_errorreportingautomaticuploadenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_errorreportingenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_errorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_errorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_errorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_errorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_errorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_errorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_errorreportingenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_errorreportingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_eventlogfloodprotectionenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_eventlogfloodprotectionenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_eventlogfloodprotectionenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_eventlogfloodprotectionenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_eventlogfloodprotectionenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_eventlogfloodprotectionenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_eventlogfloodprotectionenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_eventlogfloodprotectionenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_eventlogfloodprotectionnotifyinterval' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionnotifyinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_eventlogfloodprotectionnotifyinterval' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionnotifyinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_eventlogfloodprotectionquietperiod' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionquietperiod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_eventlogfloodprotectionquietperiod' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionquietperiod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_eventlogfloodprotectionthreshold' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionthreshold] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_eventlogfloodprotectionthreshold' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectionthreshold] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_eventlogfloodprotectiontriggerperiod' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectiontriggerperiod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_eventlogfloodprotectiontriggerperiod' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_eventlogfloodprotectiontriggerperiod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logcutinterval' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logcutinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logcutinterval' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logcutinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logmaxdiskspaceusageenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_logmaxdiskspaceusageenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_logmaxdiskspaceusageenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_logmaxdiskspaceusageenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_logmaxdiskspaceusageenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_logmaxdiskspaceusageenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_logmaxdiskspaceusageenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_logmaxdiskspaceusageenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_logmaxdiskspaceusageenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scripterrorreportingdelay' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingdelay] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scripterrorreportingdelay' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingdelay] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scripterrorreportingenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_scripterrorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_scripterrorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_scripterrorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_scripterrorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_scripterrorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_scripterrorreportingenabled" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_scripterrorreportingenabled' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scripterrorreportingrequireauth' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_scripterrorreportingrequireauth" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = 'true'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_scripterrorreportingrequireauth" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = 'false'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_scripterrorreportingrequireauth" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = 'True'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_scripterrorreportingrequireauth" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = 'False'
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_scripterrorreportingrequireauth" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = :true
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_scripterrorreportingrequireauth" do
    dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = :false
    expect(dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_scripterrorreportingrequireauth' do
    expect{dsc_spdiagnosticloggingsettings[:dsc_scripterrorreportingrequireauth] = -16}.to raise_error(Puppet::ResourceError)
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
