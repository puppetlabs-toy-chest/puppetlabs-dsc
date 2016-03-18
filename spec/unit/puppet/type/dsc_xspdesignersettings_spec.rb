#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspdesignersettings) do

  let :dsc_xspdesignersettings do
    Puppet::Type.type(:dsc_xspdesignersettings).new(
      :name     => 'foo',
      :dsc_url => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspdesignersettings.to_s).to eq("Dsc_xspdesignersettings[foo]")
  end

  it 'should require that dsc_url is specified' do
    #dsc_xspdesignersettings[:dsc_url]
    expect { Puppet::Type.type(:dsc_xspdesignersettings).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_url is a required attribute/)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_xspdesignersettings[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_xspdesignersettings[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_xspdesignersettings[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_url' do
    expect{dsc_xspdesignersettings[:dsc_url] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_settingsscope predefined value WebApplication' do
    dsc_xspdesignersettings[:dsc_settingsscope] = 'WebApplication'
    expect(dsc_xspdesignersettings[:dsc_settingsscope]).to eq('WebApplication')
  end

  it 'should accept dsc_settingsscope predefined value webapplication' do
    dsc_xspdesignersettings[:dsc_settingsscope] = 'webapplication'
    expect(dsc_xspdesignersettings[:dsc_settingsscope]).to eq('webapplication')
  end

  it 'should accept dsc_settingsscope predefined value SiteCollection' do
    dsc_xspdesignersettings[:dsc_settingsscope] = 'SiteCollection'
    expect(dsc_xspdesignersettings[:dsc_settingsscope]).to eq('SiteCollection')
  end

  it 'should accept dsc_settingsscope predefined value sitecollection' do
    dsc_xspdesignersettings[:dsc_settingsscope] = 'sitecollection'
    expect(dsc_xspdesignersettings[:dsc_settingsscope]).to eq('sitecollection')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspdesignersettings[:dsc_settingsscope] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_settingsscope' do
    expect{dsc_xspdesignersettings[:dsc_settingsscope] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_settingsscope' do
    expect{dsc_xspdesignersettings[:dsc_settingsscope] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_settingsscope' do
    expect{dsc_xspdesignersettings[:dsc_settingsscope] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_settingsscope' do
    expect{dsc_xspdesignersettings[:dsc_settingsscope] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowsharepointdesigner' do
    expect{dsc_xspdesignersettings[:dsc_allowsharepointdesigner] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowsharepointdesigner' do
    dsc_xspdesignersettings[:dsc_allowsharepointdesigner] = true
    expect(dsc_xspdesignersettings[:dsc_allowsharepointdesigner]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowsharepointdesigner" do
    dsc_xspdesignersettings[:dsc_allowsharepointdesigner] = 'true'
    expect(dsc_xspdesignersettings[:dsc_allowsharepointdesigner]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowsharepointdesigner" do
    dsc_xspdesignersettings[:dsc_allowsharepointdesigner] = 'false'
    expect(dsc_xspdesignersettings[:dsc_allowsharepointdesigner]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowsharepointdesigner" do
    dsc_xspdesignersettings[:dsc_allowsharepointdesigner] = 'True'
    expect(dsc_xspdesignersettings[:dsc_allowsharepointdesigner]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowsharepointdesigner" do
    dsc_xspdesignersettings[:dsc_allowsharepointdesigner] = 'False'
    expect(dsc_xspdesignersettings[:dsc_allowsharepointdesigner]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowsharepointdesigner" do
    dsc_xspdesignersettings[:dsc_allowsharepointdesigner] = :true
    expect(dsc_xspdesignersettings[:dsc_allowsharepointdesigner]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowsharepointdesigner" do
    dsc_xspdesignersettings[:dsc_allowsharepointdesigner] = :false
    expect(dsc_xspdesignersettings[:dsc_allowsharepointdesigner]).to eq(false)
  end

  it 'should not accept int for dsc_allowsharepointdesigner' do
    expect{dsc_xspdesignersettings[:dsc_allowsharepointdesigner] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowsharepointdesigner' do
    expect{dsc_xspdesignersettings[:dsc_allowsharepointdesigner] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowdetachpagesfromdefinition' do
    expect{dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowdetachpagesfromdefinition' do
    dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition] = true
    expect(dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowdetachpagesfromdefinition" do
    dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition] = 'true'
    expect(dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowdetachpagesfromdefinition" do
    dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition] = 'false'
    expect(dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowdetachpagesfromdefinition" do
    dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition] = 'True'
    expect(dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowdetachpagesfromdefinition" do
    dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition] = 'False'
    expect(dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowdetachpagesfromdefinition" do
    dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition] = :true
    expect(dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowdetachpagesfromdefinition" do
    dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition] = :false
    expect(dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(false)
  end

  it 'should not accept int for dsc_allowdetachpagesfromdefinition' do
    expect{dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowdetachpagesfromdefinition' do
    expect{dsc_xspdesignersettings[:dsc_allowdetachpagesfromdefinition] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowcustomisemasterpage' do
    expect{dsc_xspdesignersettings[:dsc_allowcustomisemasterpage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowcustomisemasterpage' do
    dsc_xspdesignersettings[:dsc_allowcustomisemasterpage] = true
    expect(dsc_xspdesignersettings[:dsc_allowcustomisemasterpage]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowcustomisemasterpage" do
    dsc_xspdesignersettings[:dsc_allowcustomisemasterpage] = 'true'
    expect(dsc_xspdesignersettings[:dsc_allowcustomisemasterpage]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowcustomisemasterpage" do
    dsc_xspdesignersettings[:dsc_allowcustomisemasterpage] = 'false'
    expect(dsc_xspdesignersettings[:dsc_allowcustomisemasterpage]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowcustomisemasterpage" do
    dsc_xspdesignersettings[:dsc_allowcustomisemasterpage] = 'True'
    expect(dsc_xspdesignersettings[:dsc_allowcustomisemasterpage]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowcustomisemasterpage" do
    dsc_xspdesignersettings[:dsc_allowcustomisemasterpage] = 'False'
    expect(dsc_xspdesignersettings[:dsc_allowcustomisemasterpage]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowcustomisemasterpage" do
    dsc_xspdesignersettings[:dsc_allowcustomisemasterpage] = :true
    expect(dsc_xspdesignersettings[:dsc_allowcustomisemasterpage]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowcustomisemasterpage" do
    dsc_xspdesignersettings[:dsc_allowcustomisemasterpage] = :false
    expect(dsc_xspdesignersettings[:dsc_allowcustomisemasterpage]).to eq(false)
  end

  it 'should not accept int for dsc_allowcustomisemasterpage' do
    expect{dsc_xspdesignersettings[:dsc_allowcustomisemasterpage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowcustomisemasterpage' do
    expect{dsc_xspdesignersettings[:dsc_allowcustomisemasterpage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowmanagesiteurlstructure' do
    expect{dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowmanagesiteurlstructure' do
    dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure] = true
    expect(dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowmanagesiteurlstructure" do
    dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure] = 'true'
    expect(dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowmanagesiteurlstructure" do
    dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure] = 'false'
    expect(dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowmanagesiteurlstructure" do
    dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure] = 'True'
    expect(dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowmanagesiteurlstructure" do
    dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure] = 'False'
    expect(dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowmanagesiteurlstructure" do
    dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure] = :true
    expect(dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowmanagesiteurlstructure" do
    dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure] = :false
    expect(dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(false)
  end

  it 'should not accept int for dsc_allowmanagesiteurlstructure' do
    expect{dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowmanagesiteurlstructure' do
    expect{dsc_xspdesignersettings[:dsc_allowmanagesiteurlstructure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowcreatedeclarativeworkflow' do
    expect{dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowcreatedeclarativeworkflow' do
    dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow] = true
    expect(dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowcreatedeclarativeworkflow" do
    dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow] = 'true'
    expect(dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowcreatedeclarativeworkflow" do
    dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow] = 'false'
    expect(dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowcreatedeclarativeworkflow" do
    dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow] = 'True'
    expect(dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowcreatedeclarativeworkflow" do
    dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow] = 'False'
    expect(dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowcreatedeclarativeworkflow" do
    dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow] = :true
    expect(dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowcreatedeclarativeworkflow" do
    dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow] = :false
    expect(dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(false)
  end

  it 'should not accept int for dsc_allowcreatedeclarativeworkflow' do
    expect{dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowcreatedeclarativeworkflow' do
    expect{dsc_xspdesignersettings[:dsc_allowcreatedeclarativeworkflow] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowsavepublishdeclarativeworkflow' do
    expect{dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowsavepublishdeclarativeworkflow' do
    dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = true
    expect(dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowsavepublishdeclarativeworkflow" do
    dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = 'true'
    expect(dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowsavepublishdeclarativeworkflow" do
    dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = 'false'
    expect(dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowsavepublishdeclarativeworkflow" do
    dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = 'True'
    expect(dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowsavepublishdeclarativeworkflow" do
    dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = 'False'
    expect(dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowsavepublishdeclarativeworkflow" do
    dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = :true
    expect(dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowsavepublishdeclarativeworkflow" do
    dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = :false
    expect(dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(false)
  end

  it 'should not accept int for dsc_allowsavepublishdeclarativeworkflow' do
    expect{dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowsavepublishdeclarativeworkflow' do
    expect{dsc_xspdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowsavedeclarativeworkflowastemplate' do
    expect{dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowsavedeclarativeworkflowastemplate' do
    dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = true
    expect(dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowsavedeclarativeworkflowastemplate" do
    dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = 'true'
    expect(dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowsavedeclarativeworkflowastemplate" do
    dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = 'false'
    expect(dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowsavedeclarativeworkflowastemplate" do
    dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = 'True'
    expect(dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowsavedeclarativeworkflowastemplate" do
    dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = 'False'
    expect(dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowsavedeclarativeworkflowastemplate" do
    dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = :true
    expect(dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowsavedeclarativeworkflowastemplate" do
    dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = :false
    expect(dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(false)
  end

  it 'should not accept int for dsc_allowsavedeclarativeworkflowastemplate' do
    expect{dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowsavedeclarativeworkflowastemplate' do
    expect{dsc_xspdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspdesignersettings[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspdesignersettings[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspdesignersettings[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspdesignersettings[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspdesignersettings[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspdesignersettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspdesignersettings)
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
