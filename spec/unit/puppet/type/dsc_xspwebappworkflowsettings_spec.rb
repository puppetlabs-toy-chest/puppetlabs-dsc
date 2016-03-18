#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspwebappworkflowsettings) do

  let :dsc_xspwebappworkflowsettings do
    Puppet::Type.type(:dsc_xspwebappworkflowsettings).new(
      :name     => 'foo',
      :dsc_url => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspwebappworkflowsettings.to_s).to eq("Dsc_xspwebappworkflowsettings[foo]")
  end

  it 'should require that dsc_url is specified' do
    #dsc_xspwebappworkflowsettings[:dsc_url]
    expect { Puppet::Type.type(:dsc_xspwebappworkflowsettings).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_url is a required attribute/)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_xspwebappworkflowsettings[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_xspwebappworkflowsettings[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_xspwebappworkflowsettings[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_url' do
    expect{dsc_xspwebappworkflowsettings[:dsc_url] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externalworkflowparticipantsenabled' do
    expect{dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_externalworkflowparticipantsenabled' do
    dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled] = true
    expect(dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_externalworkflowparticipantsenabled" do
    dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled] = 'true'
    expect(dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_externalworkflowparticipantsenabled" do
    dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled] = 'false'
    expect(dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_externalworkflowparticipantsenabled" do
    dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled] = 'True'
    expect(dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_externalworkflowparticipantsenabled" do
    dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled] = 'False'
    expect(dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_externalworkflowparticipantsenabled" do
    dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled] = :true
    expect(dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_externalworkflowparticipantsenabled" do
    dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled] = :false
    expect(dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled]).to eq(false)
  end

  it 'should not accept int for dsc_externalworkflowparticipantsenabled' do
    expect{dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalworkflowparticipantsenabled' do
    expect{dsc_xspwebappworkflowsettings[:dsc_externalworkflowparticipantsenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_userdefinedworkflowsenabled' do
    expect{dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_userdefinedworkflowsenabled' do
    dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled] = true
    expect(dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_userdefinedworkflowsenabled" do
    dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled] = 'true'
    expect(dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_userdefinedworkflowsenabled" do
    dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled] = 'false'
    expect(dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_userdefinedworkflowsenabled" do
    dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled] = 'True'
    expect(dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_userdefinedworkflowsenabled" do
    dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled] = 'False'
    expect(dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_userdefinedworkflowsenabled" do
    dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled] = :true
    expect(dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_userdefinedworkflowsenabled" do
    dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled] = :false
    expect(dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled]).to eq(false)
  end

  it 'should not accept int for dsc_userdefinedworkflowsenabled' do
    expect{dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_userdefinedworkflowsenabled' do
    expect{dsc_xspwebappworkflowsettings[:dsc_userdefinedworkflowsenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_emailtonopermissionworkflowparticipantsenable' do
    expect{dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_emailtonopermissionworkflowparticipantsenable' do
    dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable] = true
    expect(dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_emailtonopermissionworkflowparticipantsenable" do
    dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable] = 'true'
    expect(dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_emailtonopermissionworkflowparticipantsenable" do
    dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable] = 'false'
    expect(dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_emailtonopermissionworkflowparticipantsenable" do
    dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable] = 'True'
    expect(dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_emailtonopermissionworkflowparticipantsenable" do
    dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable] = 'False'
    expect(dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_emailtonopermissionworkflowparticipantsenable" do
    dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable] = :true
    expect(dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_emailtonopermissionworkflowparticipantsenable" do
    dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable] = :false
    expect(dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable]).to eq(false)
  end

  it 'should not accept int for dsc_emailtonopermissionworkflowparticipantsenable' do
    expect{dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_emailtonopermissionworkflowparticipantsenable' do
    expect{dsc_xspwebappworkflowsettings[:dsc_emailtonopermissionworkflowparticipantsenable] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspwebappworkflowsettings[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspwebappworkflowsettings[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspwebappworkflowsettings[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspwebappworkflowsettings[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspwebappworkflowsettings[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspwebappworkflowsettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspwebappworkflowsettings)
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
