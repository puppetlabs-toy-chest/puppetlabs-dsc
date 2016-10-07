#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spwebappthrottlingsettings) do

  let :dsc_spwebappthrottlingsettings do
    Puppet::Type.type(:dsc_spwebappthrottlingsettings).new(
      :name     => 'foo',
      :dsc_url => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spwebappthrottlingsettings).new(
      :name     => 'foo',
      :dsc_url => 'foo',
      :dsc_listviewthreshold => 32,
      :dsc_allowobjectmodeloverride => true,
      :dsc_adminthreshold => 32,
      :dsc_listviewlookupthreshold => 32,
      :dsc_happyhourenabled => true,
      :dsc_happyhour => {"Hour"=>32, "Minute"=>32, "Duration"=>32},
      :dsc_uniquepermissionthreshold => 32,
      :dsc_requestthrottling => true,
      :dsc_changelogenabled => true,
      :dsc_changelogexpirydays => 32,
      :dsc_eventhandlersenabled => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spwebappthrottlingsettings.to_s).to eq("Dsc_spwebappthrottlingsettings[foo]")
  end

  it 'should require that dsc_url is specified' do
    #dsc_spwebappthrottlingsettings[:dsc_url]
    expect { Puppet::Type.type(:dsc_spwebappthrottlingsettings).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_url is a required attribute/)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_spwebappthrottlingsettings[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_spwebappthrottlingsettings[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_spwebappthrottlingsettings[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_listviewthreshold' do
    expect{dsc_spwebappthrottlingsettings[:dsc_listviewthreshold] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_listviewthreshold' do
    expect{dsc_spwebappthrottlingsettings[:dsc_listviewthreshold] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowobjectmodeloverride' do
    expect{dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowobjectmodeloverride" do
    dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = 'true'
    expect(dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowobjectmodeloverride" do
    dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = 'false'
    expect(dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowobjectmodeloverride" do
    dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = 'True'
    expect(dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowobjectmodeloverride" do
    dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = 'False'
    expect(dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowobjectmodeloverride" do
    dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = :true
    expect(dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowobjectmodeloverride" do
    dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = :false
    expect(dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_allowobjectmodeloverride' do
    expect{dsc_spwebappthrottlingsettings[:dsc_allowobjectmodeloverride] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adminthreshold' do
    expect{dsc_spwebappthrottlingsettings[:dsc_adminthreshold] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_adminthreshold' do
    expect{dsc_spwebappthrottlingsettings[:dsc_adminthreshold] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_listviewlookupthreshold' do
    expect{dsc_spwebappthrottlingsettings[:dsc_listviewlookupthreshold] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_listviewlookupthreshold' do
    expect{dsc_spwebappthrottlingsettings[:dsc_listviewlookupthreshold] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_happyhourenabled' do
    expect{dsc_spwebappthrottlingsettings[:dsc_happyhourenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_happyhourenabled" do
    dsc_spwebappthrottlingsettings[:dsc_happyhourenabled] = 'true'
    expect(dsc_spwebappthrottlingsettings[:dsc_happyhourenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_happyhourenabled" do
    dsc_spwebappthrottlingsettings[:dsc_happyhourenabled] = 'false'
    expect(dsc_spwebappthrottlingsettings[:dsc_happyhourenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_happyhourenabled" do
    dsc_spwebappthrottlingsettings[:dsc_happyhourenabled] = 'True'
    expect(dsc_spwebappthrottlingsettings[:dsc_happyhourenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_happyhourenabled" do
    dsc_spwebappthrottlingsettings[:dsc_happyhourenabled] = 'False'
    expect(dsc_spwebappthrottlingsettings[:dsc_happyhourenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_happyhourenabled" do
    dsc_spwebappthrottlingsettings[:dsc_happyhourenabled] = :true
    expect(dsc_spwebappthrottlingsettings[:dsc_happyhourenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_happyhourenabled" do
    dsc_spwebappthrottlingsettings[:dsc_happyhourenabled] = :false
    expect(dsc_spwebappthrottlingsettings[:dsc_happyhourenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_happyhourenabled' do
    expect{dsc_spwebappthrottlingsettings[:dsc_happyhourenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_happyhour' do
    expect{dsc_spwebappthrottlingsettings[:dsc_happyhour] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_happyhour' do
    expect{dsc_spwebappthrottlingsettings[:dsc_happyhour] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_happyhour' do
    expect{dsc_spwebappthrottlingsettings[:dsc_happyhour] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_uniquepermissionthreshold' do
    expect{dsc_spwebappthrottlingsettings[:dsc_uniquepermissionthreshold] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_uniquepermissionthreshold' do
    expect{dsc_spwebappthrottlingsettings[:dsc_uniquepermissionthreshold] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_requestthrottling' do
    expect{dsc_spwebappthrottlingsettings[:dsc_requestthrottling] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_requestthrottling" do
    dsc_spwebappthrottlingsettings[:dsc_requestthrottling] = 'true'
    expect(dsc_spwebappthrottlingsettings[:dsc_requestthrottling]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_requestthrottling" do
    dsc_spwebappthrottlingsettings[:dsc_requestthrottling] = 'false'
    expect(dsc_spwebappthrottlingsettings[:dsc_requestthrottling]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_requestthrottling" do
    dsc_spwebappthrottlingsettings[:dsc_requestthrottling] = 'True'
    expect(dsc_spwebappthrottlingsettings[:dsc_requestthrottling]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_requestthrottling" do
    dsc_spwebappthrottlingsettings[:dsc_requestthrottling] = 'False'
    expect(dsc_spwebappthrottlingsettings[:dsc_requestthrottling]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_requestthrottling" do
    dsc_spwebappthrottlingsettings[:dsc_requestthrottling] = :true
    expect(dsc_spwebappthrottlingsettings[:dsc_requestthrottling]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_requestthrottling" do
    dsc_spwebappthrottlingsettings[:dsc_requestthrottling] = :false
    expect(dsc_spwebappthrottlingsettings[:dsc_requestthrottling]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_requestthrottling' do
    expect{dsc_spwebappthrottlingsettings[:dsc_requestthrottling] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_changelogenabled' do
    expect{dsc_spwebappthrottlingsettings[:dsc_changelogenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_changelogenabled" do
    dsc_spwebappthrottlingsettings[:dsc_changelogenabled] = 'true'
    expect(dsc_spwebappthrottlingsettings[:dsc_changelogenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_changelogenabled" do
    dsc_spwebappthrottlingsettings[:dsc_changelogenabled] = 'false'
    expect(dsc_spwebappthrottlingsettings[:dsc_changelogenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_changelogenabled" do
    dsc_spwebappthrottlingsettings[:dsc_changelogenabled] = 'True'
    expect(dsc_spwebappthrottlingsettings[:dsc_changelogenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_changelogenabled" do
    dsc_spwebappthrottlingsettings[:dsc_changelogenabled] = 'False'
    expect(dsc_spwebappthrottlingsettings[:dsc_changelogenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_changelogenabled" do
    dsc_spwebappthrottlingsettings[:dsc_changelogenabled] = :true
    expect(dsc_spwebappthrottlingsettings[:dsc_changelogenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_changelogenabled" do
    dsc_spwebappthrottlingsettings[:dsc_changelogenabled] = :false
    expect(dsc_spwebappthrottlingsettings[:dsc_changelogenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_changelogenabled' do
    expect{dsc_spwebappthrottlingsettings[:dsc_changelogenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_changelogexpirydays' do
    expect{dsc_spwebappthrottlingsettings[:dsc_changelogexpirydays] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_changelogexpirydays' do
    expect{dsc_spwebappthrottlingsettings[:dsc_changelogexpirydays] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_eventhandlersenabled' do
    expect{dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_eventhandlersenabled" do
    dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled] = 'true'
    expect(dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_eventhandlersenabled" do
    dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled] = 'false'
    expect(dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_eventhandlersenabled" do
    dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled] = 'True'
    expect(dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_eventhandlersenabled" do
    dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled] = 'False'
    expect(dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_eventhandlersenabled" do
    dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled] = :true
    expect(dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_eventhandlersenabled" do
    dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled] = :false
    expect(dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_eventhandlersenabled' do
    expect{dsc_spwebappthrottlingsettings[:dsc_eventhandlersenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spwebappthrottlingsettings[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spwebappthrottlingsettings[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spwebappthrottlingsettings[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spwebappthrottlingsettings[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spwebappthrottlingsettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spwebappthrottlingsettings)
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
