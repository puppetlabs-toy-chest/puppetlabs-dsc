#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwineventlog) do

  let :dsc_xwineventlog do
    Puppet::Type.type(:dsc_xwineventlog).new(
      :name     => 'foo',
      :dsc_logname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwineventlog.to_s).to eq("Dsc_xwineventlog[foo]")
  end

  it 'should require that dsc_logname is specified' do
    #dsc_xwineventlog[:dsc_logname]
    expect { Puppet::Type.type(:dsc_xwineventlog).new(
      :name     => 'foo',
      :dsc_maximumsizeinbytes => -64,
      :dsc_isenabled => true,
      :dsc_logmode => 'AutoBackup',
      :dsc_securitydescriptor => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_logname is a required attribute/)
  end

  it 'should not accept array for dsc_logname' do
    expect{dsc_xwineventlog[:dsc_logname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logname' do
    expect{dsc_xwineventlog[:dsc_logname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logname' do
    expect{dsc_xwineventlog[:dsc_logname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logname' do
    expect{dsc_xwineventlog[:dsc_logname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maximumsizeinbytes' do
    expect{dsc_xwineventlog[:dsc_maximumsizeinbytes] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maximumsizeinbytes' do
    expect{dsc_xwineventlog[:dsc_maximumsizeinbytes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_maximumsizeinbytes' do
    dsc_xwineventlog[:dsc_maximumsizeinbytes] = -64
    expect(dsc_xwineventlog[:dsc_maximumsizeinbytes]).to eq(-64)
  end


  it 'should accept string-like int for dsc_maximumsizeinbytes' do
    dsc_xwineventlog[:dsc_maximumsizeinbytes] = '16'
    expect(dsc_xwineventlog[:dsc_maximumsizeinbytes]).to eq(16)
  end


  it 'should accept string-like int for dsc_maximumsizeinbytes' do
    dsc_xwineventlog[:dsc_maximumsizeinbytes] = '-16'
    expect(dsc_xwineventlog[:dsc_maximumsizeinbytes]).to eq(-16)
  end


  it 'should accept string-like int for dsc_maximumsizeinbytes' do
    dsc_xwineventlog[:dsc_maximumsizeinbytes] = '32'
    expect(dsc_xwineventlog[:dsc_maximumsizeinbytes]).to eq(32)
  end


  it 'should accept string-like int for dsc_maximumsizeinbytes' do
    dsc_xwineventlog[:dsc_maximumsizeinbytes] = '-32'
    expect(dsc_xwineventlog[:dsc_maximumsizeinbytes]).to eq(-32)
  end


  it 'should accept uint for dsc_maximumsizeinbytes' do
    dsc_xwineventlog[:dsc_maximumsizeinbytes] = -64
    expect(dsc_xwineventlog[:dsc_maximumsizeinbytes]).to eq(-64)
  end


  it 'should accept string-like int for dsc_maximumsizeinbytes' do
    dsc_xwineventlog[:dsc_maximumsizeinbytes] = '16'
    expect(dsc_xwineventlog[:dsc_maximumsizeinbytes]).to eq(16)
  end


  it 'should accept string-like int for dsc_maximumsizeinbytes' do
    dsc_xwineventlog[:dsc_maximumsizeinbytes] = '32'
    expect(dsc_xwineventlog[:dsc_maximumsizeinbytes]).to eq(32)
  end


  it 'should accept string-like int for dsc_maximumsizeinbytes' do
    dsc_xwineventlog[:dsc_maximumsizeinbytes] = '64'
    expect(dsc_xwineventlog[:dsc_maximumsizeinbytes]).to eq(64)
  end

  it 'should not accept array for dsc_isenabled' do
    expect{dsc_xwineventlog[:dsc_isenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_isenabled' do
    dsc_xwineventlog[:dsc_isenabled] = true
    expect(dsc_xwineventlog[:dsc_isenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_isenabled" do
    dsc_xwineventlog[:dsc_isenabled] = 'true'
    expect(dsc_xwineventlog[:dsc_isenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_isenabled" do
    dsc_xwineventlog[:dsc_isenabled] = 'false'
    expect(dsc_xwineventlog[:dsc_isenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_isenabled" do
    dsc_xwineventlog[:dsc_isenabled] = 'True'
    expect(dsc_xwineventlog[:dsc_isenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_isenabled" do
    dsc_xwineventlog[:dsc_isenabled] = 'False'
    expect(dsc_xwineventlog[:dsc_isenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_isenabled" do
    dsc_xwineventlog[:dsc_isenabled] = :true
    expect(dsc_xwineventlog[:dsc_isenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_isenabled" do
    dsc_xwineventlog[:dsc_isenabled] = :false
    expect(dsc_xwineventlog[:dsc_isenabled]).to eq(false)
  end

  it 'should not accept int for dsc_isenabled' do
    expect{dsc_xwineventlog[:dsc_isenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_isenabled' do
    expect{dsc_xwineventlog[:dsc_isenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_logmode predefined value AutoBackup' do
    dsc_xwineventlog[:dsc_logmode] = 'AutoBackup'
    expect(dsc_xwineventlog[:dsc_logmode]).to eq('AutoBackup')
  end

  it 'should accept dsc_logmode predefined value autobackup' do
    dsc_xwineventlog[:dsc_logmode] = 'autobackup'
    expect(dsc_xwineventlog[:dsc_logmode]).to eq('autobackup')
  end

  it 'should accept dsc_logmode predefined value Circular' do
    dsc_xwineventlog[:dsc_logmode] = 'Circular'
    expect(dsc_xwineventlog[:dsc_logmode]).to eq('Circular')
  end

  it 'should accept dsc_logmode predefined value circular' do
    dsc_xwineventlog[:dsc_logmode] = 'circular'
    expect(dsc_xwineventlog[:dsc_logmode]).to eq('circular')
  end

  it 'should accept dsc_logmode predefined value Retain' do
    dsc_xwineventlog[:dsc_logmode] = 'Retain'
    expect(dsc_xwineventlog[:dsc_logmode]).to eq('Retain')
  end

  it 'should accept dsc_logmode predefined value retain' do
    dsc_xwineventlog[:dsc_logmode] = 'retain'
    expect(dsc_xwineventlog[:dsc_logmode]).to eq('retain')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwineventlog[:dsc_logmode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logmode' do
    expect{dsc_xwineventlog[:dsc_logmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logmode' do
    expect{dsc_xwineventlog[:dsc_logmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logmode' do
    expect{dsc_xwineventlog[:dsc_logmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logmode' do
    expect{dsc_xwineventlog[:dsc_logmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_securitydescriptor' do
    expect{dsc_xwineventlog[:dsc_securitydescriptor] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_securitydescriptor' do
    expect{dsc_xwineventlog[:dsc_securitydescriptor] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_securitydescriptor' do
    expect{dsc_xwineventlog[:dsc_securitydescriptor] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_securitydescriptor' do
    expect{dsc_xwineventlog[:dsc_securitydescriptor] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xwineventlog)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xwineventlog)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Import-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script with Import-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Import-DscResource/)
      end

    end

    describe "when dscmeta_import_resource is false" do

      it "should compute powershell dsc test script without Import-DscResource" do
        dsc_xwineventlog[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xwineventlog[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xwineventlog)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xwineventlog)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xWinEventLog as $MSFT_xWinEventLog1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xWinEventLog/)
    end


  end
end
