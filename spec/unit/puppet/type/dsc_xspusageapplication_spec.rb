#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspusageapplication) do

  let :dsc_xspusageapplication do
    Puppet::Type.type(:dsc_xspusageapplication).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspusageapplication.to_s).to eq("Dsc_xspusageapplication[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspusageapplication[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspusageapplication).new(
      :name     => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
      :dsc_databasename => 'foo',
      :dsc_databasepassword => 'foo',
      :dsc_databaseserver => 'foo',
      :dsc_databaseusername => 'foo',
      :dsc_failoverdatabaseserver => 'foo',
      :dsc_usagelogcuttime => 32,
      :dsc_usageloglocation => 'foo',
      :dsc_usagelogmaxfilesizekb => 32,
      :dsc_usagelogmaxspacegb => 32,
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspusageapplication[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspusageapplication[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspusageapplication[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspusageapplication[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspusageapplication[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspusageapplication[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspusageapplication[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspusageapplication[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspusageapplication[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_xspusageapplication[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_xspusageapplication[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_xspusageapplication[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_xspusageapplication[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasepassword' do
    expect{dsc_xspusageapplication[:dsc_databasepassword] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasepassword' do
    expect{dsc_xspusageapplication[:dsc_databasepassword] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasepassword' do
    expect{dsc_xspusageapplication[:dsc_databasepassword] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasepassword' do
    expect{dsc_xspusageapplication[:dsc_databasepassword] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_xspusageapplication[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_xspusageapplication[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_xspusageapplication[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_xspusageapplication[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseusername' do
    expect{dsc_xspusageapplication[:dsc_databaseusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseusername' do
    expect{dsc_xspusageapplication[:dsc_databaseusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseusername' do
    expect{dsc_xspusageapplication[:dsc_databaseusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseusername' do
    expect{dsc_xspusageapplication[:dsc_databaseusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_failoverdatabaseserver' do
    expect{dsc_xspusageapplication[:dsc_failoverdatabaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_failoverdatabaseserver' do
    expect{dsc_xspusageapplication[:dsc_failoverdatabaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_failoverdatabaseserver' do
    expect{dsc_xspusageapplication[:dsc_failoverdatabaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_failoverdatabaseserver' do
    expect{dsc_xspusageapplication[:dsc_failoverdatabaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usagelogcuttime' do
    expect{dsc_xspusageapplication[:dsc_usagelogcuttime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usagelogcuttime' do
    expect{dsc_xspusageapplication[:dsc_usagelogcuttime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_usagelogcuttime' do
    dsc_xspusageapplication[:dsc_usagelogcuttime] = 32
    expect(dsc_xspusageapplication[:dsc_usagelogcuttime]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_usagelogcuttime' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspusageapplication[:dsc_usagelogcuttime] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_usagelogcuttime' do
    dsc_xspusageapplication[:dsc_usagelogcuttime] = '16'
    expect(dsc_xspusageapplication[:dsc_usagelogcuttime]).to eq(16)
  end

  it 'should accept string-like uint for dsc_usagelogcuttime' do
    dsc_xspusageapplication[:dsc_usagelogcuttime] = '32'
    expect(dsc_xspusageapplication[:dsc_usagelogcuttime]).to eq(32)
  end

  it 'should accept string-like uint for dsc_usagelogcuttime' do
    dsc_xspusageapplication[:dsc_usagelogcuttime] = '64'
    expect(dsc_xspusageapplication[:dsc_usagelogcuttime]).to eq(64)
  end

  it 'should not accept array for dsc_usageloglocation' do
    expect{dsc_xspusageapplication[:dsc_usageloglocation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usageloglocation' do
    expect{dsc_xspusageapplication[:dsc_usageloglocation] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usageloglocation' do
    expect{dsc_xspusageapplication[:dsc_usageloglocation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usageloglocation' do
    expect{dsc_xspusageapplication[:dsc_usageloglocation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usagelogmaxfilesizekb' do
    expect{dsc_xspusageapplication[:dsc_usagelogmaxfilesizekb] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usagelogmaxfilesizekb' do
    expect{dsc_xspusageapplication[:dsc_usagelogmaxfilesizekb] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_usagelogmaxfilesizekb' do
    dsc_xspusageapplication[:dsc_usagelogmaxfilesizekb] = 32
    expect(dsc_xspusageapplication[:dsc_usagelogmaxfilesizekb]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_usagelogmaxfilesizekb' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspusageapplication[:dsc_usagelogmaxfilesizekb] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_usagelogmaxfilesizekb' do
    dsc_xspusageapplication[:dsc_usagelogmaxfilesizekb] = '16'
    expect(dsc_xspusageapplication[:dsc_usagelogmaxfilesizekb]).to eq(16)
  end

  it 'should accept string-like uint for dsc_usagelogmaxfilesizekb' do
    dsc_xspusageapplication[:dsc_usagelogmaxfilesizekb] = '32'
    expect(dsc_xspusageapplication[:dsc_usagelogmaxfilesizekb]).to eq(32)
  end

  it 'should accept string-like uint for dsc_usagelogmaxfilesizekb' do
    dsc_xspusageapplication[:dsc_usagelogmaxfilesizekb] = '64'
    expect(dsc_xspusageapplication[:dsc_usagelogmaxfilesizekb]).to eq(64)
  end

  it 'should not accept array for dsc_usagelogmaxspacegb' do
    expect{dsc_xspusageapplication[:dsc_usagelogmaxspacegb] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usagelogmaxspacegb' do
    expect{dsc_xspusageapplication[:dsc_usagelogmaxspacegb] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_usagelogmaxspacegb' do
    dsc_xspusageapplication[:dsc_usagelogmaxspacegb] = 32
    expect(dsc_xspusageapplication[:dsc_usagelogmaxspacegb]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_usagelogmaxspacegb' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspusageapplication[:dsc_usagelogmaxspacegb] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_usagelogmaxspacegb' do
    dsc_xspusageapplication[:dsc_usagelogmaxspacegb] = '16'
    expect(dsc_xspusageapplication[:dsc_usagelogmaxspacegb]).to eq(16)
  end

  it 'should accept string-like uint for dsc_usagelogmaxspacegb' do
    dsc_xspusageapplication[:dsc_usagelogmaxspacegb] = '32'
    expect(dsc_xspusageapplication[:dsc_usagelogmaxspacegb]).to eq(32)
  end

  it 'should accept string-like uint for dsc_usagelogmaxspacegb' do
    dsc_xspusageapplication[:dsc_usagelogmaxspacegb] = '64'
    expect(dsc_xspusageapplication[:dsc_usagelogmaxspacegb]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspusageapplication)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspusageapplication)
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
