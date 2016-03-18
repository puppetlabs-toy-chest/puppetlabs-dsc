#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspwebappthrottlingsettings) do

  let :dsc_xspwebappthrottlingsettings do
    Puppet::Type.type(:dsc_xspwebappthrottlingsettings).new(
      :name     => 'foo',
      :dsc_url => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspwebappthrottlingsettings.to_s).to eq("Dsc_xspwebappthrottlingsettings[foo]")
  end

  it 'should require that dsc_url is specified' do
    #dsc_xspwebappthrottlingsettings[:dsc_url]
    expect { Puppet::Type.type(:dsc_xspwebappthrottlingsettings).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_url is a required attribute/)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_url' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_url] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_listviewthreshold' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_listviewthreshold] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_listviewthreshold' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_listviewthreshold] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_listviewthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_listviewthreshold] = 32
    expect(dsc_xspwebappthrottlingsettings[:dsc_listviewthreshold]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_listviewthreshold' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspwebappthrottlingsettings[:dsc_listviewthreshold] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_listviewthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_listviewthreshold] = '16'
    expect(dsc_xspwebappthrottlingsettings[:dsc_listviewthreshold]).to eq(16)
  end

  it 'should accept string-like uint for dsc_listviewthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_listviewthreshold] = '32'
    expect(dsc_xspwebappthrottlingsettings[:dsc_listviewthreshold]).to eq(32)
  end

  it 'should accept string-like uint for dsc_listviewthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_listviewthreshold] = '64'
    expect(dsc_xspwebappthrottlingsettings[:dsc_listviewthreshold]).to eq(64)
  end

  it 'should not accept array for dsc_allowobjectmodeloverride' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowobjectmodeloverride' do
    dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = true
    expect(dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowobjectmodeloverride" do
    dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = 'true'
    expect(dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowobjectmodeloverride" do
    dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = 'false'
    expect(dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowobjectmodeloverride" do
    dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = 'True'
    expect(dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowobjectmodeloverride" do
    dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = 'False'
    expect(dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowobjectmodeloverride" do
    dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = :true
    expect(dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowobjectmodeloverride" do
    dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = :false
    expect(dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride]).to eq(false)
  end

  it 'should not accept int for dsc_allowobjectmodeloverride' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowobjectmodeloverride' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adminthreshold' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_adminthreshold] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_adminthreshold' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_adminthreshold] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_adminthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_adminthreshold] = 32
    expect(dsc_xspwebappthrottlingsettings[:dsc_adminthreshold]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_adminthreshold' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspwebappthrottlingsettings[:dsc_adminthreshold] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_adminthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_adminthreshold] = '16'
    expect(dsc_xspwebappthrottlingsettings[:dsc_adminthreshold]).to eq(16)
  end

  it 'should accept string-like uint for dsc_adminthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_adminthreshold] = '32'
    expect(dsc_xspwebappthrottlingsettings[:dsc_adminthreshold]).to eq(32)
  end

  it 'should accept string-like uint for dsc_adminthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_adminthreshold] = '64'
    expect(dsc_xspwebappthrottlingsettings[:dsc_adminthreshold]).to eq(64)
  end

  it 'should not accept array for dsc_listviewlookupthreshold' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_listviewlookupthreshold] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_listviewlookupthreshold' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_listviewlookupthreshold] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_listviewlookupthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_listviewlookupthreshold] = 32
    expect(dsc_xspwebappthrottlingsettings[:dsc_listviewlookupthreshold]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_listviewlookupthreshold' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspwebappthrottlingsettings[:dsc_listviewlookupthreshold] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_listviewlookupthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_listviewlookupthreshold] = '16'
    expect(dsc_xspwebappthrottlingsettings[:dsc_listviewlookupthreshold]).to eq(16)
  end

  it 'should accept string-like uint for dsc_listviewlookupthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_listviewlookupthreshold] = '32'
    expect(dsc_xspwebappthrottlingsettings[:dsc_listviewlookupthreshold]).to eq(32)
  end

  it 'should accept string-like uint for dsc_listviewlookupthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_listviewlookupthreshold] = '64'
    expect(dsc_xspwebappthrottlingsettings[:dsc_listviewlookupthreshold]).to eq(64)
  end

  it 'should not accept array for dsc_happyhourenabled' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_happyhourenabled' do
    dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled] = true
    expect(dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_happyhourenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled] = 'true'
    expect(dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_happyhourenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled] = 'false'
    expect(dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_happyhourenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled] = 'True'
    expect(dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_happyhourenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled] = 'False'
    expect(dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_happyhourenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled] = :true
    expect(dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_happyhourenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled] = :false
    expect(dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled]).to eq(false)
  end

  it 'should not accept int for dsc_happyhourenabled' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_happyhourenabled' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_happyhourenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_happyhour' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_happyhour] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_happyhour' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_happyhour] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_happyhour' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_happyhour] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_happyhour' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_happyhour] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_uniquepermissionthreshold' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_uniquepermissionthreshold] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_uniquepermissionthreshold' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_uniquepermissionthreshold] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_uniquepermissionthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_uniquepermissionthreshold] = 32
    expect(dsc_xspwebappthrottlingsettings[:dsc_uniquepermissionthreshold]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_uniquepermissionthreshold' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspwebappthrottlingsettings[:dsc_uniquepermissionthreshold] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_uniquepermissionthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_uniquepermissionthreshold] = '16'
    expect(dsc_xspwebappthrottlingsettings[:dsc_uniquepermissionthreshold]).to eq(16)
  end

  it 'should accept string-like uint for dsc_uniquepermissionthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_uniquepermissionthreshold] = '32'
    expect(dsc_xspwebappthrottlingsettings[:dsc_uniquepermissionthreshold]).to eq(32)
  end

  it 'should accept string-like uint for dsc_uniquepermissionthreshold' do
    dsc_xspwebappthrottlingsettings[:dsc_uniquepermissionthreshold] = '64'
    expect(dsc_xspwebappthrottlingsettings[:dsc_uniquepermissionthreshold]).to eq(64)
  end

  it 'should not accept array for dsc_requestthrottling' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_requestthrottling] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_requestthrottling' do
    dsc_xspwebappthrottlingsettings[:dsc_requestthrottling] = true
    expect(dsc_xspwebappthrottlingsettings[:dsc_requestthrottling]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_requestthrottling" do
    dsc_xspwebappthrottlingsettings[:dsc_requestthrottling] = 'true'
    expect(dsc_xspwebappthrottlingsettings[:dsc_requestthrottling]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_requestthrottling" do
    dsc_xspwebappthrottlingsettings[:dsc_requestthrottling] = 'false'
    expect(dsc_xspwebappthrottlingsettings[:dsc_requestthrottling]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_requestthrottling" do
    dsc_xspwebappthrottlingsettings[:dsc_requestthrottling] = 'True'
    expect(dsc_xspwebappthrottlingsettings[:dsc_requestthrottling]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_requestthrottling" do
    dsc_xspwebappthrottlingsettings[:dsc_requestthrottling] = 'False'
    expect(dsc_xspwebappthrottlingsettings[:dsc_requestthrottling]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_requestthrottling" do
    dsc_xspwebappthrottlingsettings[:dsc_requestthrottling] = :true
    expect(dsc_xspwebappthrottlingsettings[:dsc_requestthrottling]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_requestthrottling" do
    dsc_xspwebappthrottlingsettings[:dsc_requestthrottling] = :false
    expect(dsc_xspwebappthrottlingsettings[:dsc_requestthrottling]).to eq(false)
  end

  it 'should not accept int for dsc_requestthrottling' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_requestthrottling] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_requestthrottling' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_requestthrottling] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_changelogenabled' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_changelogenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_changelogenabled' do
    dsc_xspwebappthrottlingsettings[:dsc_changelogenabled] = true
    expect(dsc_xspwebappthrottlingsettings[:dsc_changelogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_changelogenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_changelogenabled] = 'true'
    expect(dsc_xspwebappthrottlingsettings[:dsc_changelogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_changelogenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_changelogenabled] = 'false'
    expect(dsc_xspwebappthrottlingsettings[:dsc_changelogenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_changelogenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_changelogenabled] = 'True'
    expect(dsc_xspwebappthrottlingsettings[:dsc_changelogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_changelogenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_changelogenabled] = 'False'
    expect(dsc_xspwebappthrottlingsettings[:dsc_changelogenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_changelogenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_changelogenabled] = :true
    expect(dsc_xspwebappthrottlingsettings[:dsc_changelogenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_changelogenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_changelogenabled] = :false
    expect(dsc_xspwebappthrottlingsettings[:dsc_changelogenabled]).to eq(false)
  end

  it 'should not accept int for dsc_changelogenabled' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_changelogenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_changelogenabled' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_changelogenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_changelogexpirydays' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_changelogexpirydays] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_changelogexpirydays' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_changelogexpirydays] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_changelogexpirydays' do
    dsc_xspwebappthrottlingsettings[:dsc_changelogexpirydays] = 32
    expect(dsc_xspwebappthrottlingsettings[:dsc_changelogexpirydays]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_changelogexpirydays' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspwebappthrottlingsettings[:dsc_changelogexpirydays] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_changelogexpirydays' do
    dsc_xspwebappthrottlingsettings[:dsc_changelogexpirydays] = '16'
    expect(dsc_xspwebappthrottlingsettings[:dsc_changelogexpirydays]).to eq(16)
  end

  it 'should accept string-like uint for dsc_changelogexpirydays' do
    dsc_xspwebappthrottlingsettings[:dsc_changelogexpirydays] = '32'
    expect(dsc_xspwebappthrottlingsettings[:dsc_changelogexpirydays]).to eq(32)
  end

  it 'should accept string-like uint for dsc_changelogexpirydays' do
    dsc_xspwebappthrottlingsettings[:dsc_changelogexpirydays] = '64'
    expect(dsc_xspwebappthrottlingsettings[:dsc_changelogexpirydays]).to eq(64)
  end

  it 'should not accept array for dsc_eventhandlersenabled' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_eventhandlersenabled' do
    dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled] = true
    expect(dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_eventhandlersenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled] = 'true'
    expect(dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_eventhandlersenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled] = 'false'
    expect(dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_eventhandlersenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled] = 'True'
    expect(dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_eventhandlersenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled] = 'False'
    expect(dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_eventhandlersenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled] = :true
    expect(dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_eventhandlersenabled" do
    dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled] = :false
    expect(dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled]).to eq(false)
  end

  it 'should not accept int for dsc_eventhandlersenabled' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_eventhandlersenabled' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_eventhandlersenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspwebappthrottlingsettings[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspwebappthrottlingsettings[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspwebappthrottlingsettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspwebappthrottlingsettings)
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
