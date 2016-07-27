#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spusageapplication) do

  let :dsc_spusageapplication do
    Puppet::Type.type(:dsc_spusageapplication).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spusageapplication).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_databasename => 'foo',
      :dsc_databaseserver => 'foo',
      :dsc_databasecredentials => {"user"=>"user", "password"=>"password"},
      :dsc_failoverdatabaseserver => 'foo',
      :dsc_usagelogcuttime => 32,
      :dsc_usageloglocation => 'foo',
      :dsc_usagelogmaxfilesizekb => 32,
      :dsc_usagelogmaxspacegb => 32,
      :dsc_ensure => 'Present',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spusageapplication.to_s).to eq("Dsc_spusageapplication[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spusageapplication[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_spusageapplication[:dsc_name]
    expect { Puppet::Type.type(:dsc_spusageapplication).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_spusageapplication[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_spusageapplication[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_spusageapplication[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_spusageapplication[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_spusageapplication[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_spusageapplication[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_spusageapplication[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_spusageapplication[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_spusageapplication[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_spusageapplication[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_spusageapplication[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_spusageapplication[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_databasecredentials" do
    expect{dsc_spusageapplication[:dsc_databasecredentials] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasecredentials' do
    expect{dsc_spusageapplication[:dsc_databasecredentials] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasecredentials' do
    expect{dsc_spusageapplication[:dsc_databasecredentials] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasecredentials' do
    expect{dsc_spusageapplication[:dsc_databasecredentials] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasecredentials' do
    expect{dsc_spusageapplication[:dsc_databasecredentials] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_failoverdatabaseserver' do
    expect{dsc_spusageapplication[:dsc_failoverdatabaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_failoverdatabaseserver' do
    expect{dsc_spusageapplication[:dsc_failoverdatabaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_failoverdatabaseserver' do
    expect{dsc_spusageapplication[:dsc_failoverdatabaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_failoverdatabaseserver' do
    expect{dsc_spusageapplication[:dsc_failoverdatabaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usagelogcuttime' do
    expect{dsc_spusageapplication[:dsc_usagelogcuttime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usagelogcuttime' do
    expect{dsc_spusageapplication[:dsc_usagelogcuttime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_usagelogcuttime' do
    dsc_spusageapplication[:dsc_usagelogcuttime] = 32
    expect(dsc_spusageapplication[:dsc_usagelogcuttime]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_usagelogcuttime' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spusageapplication[:dsc_usagelogcuttime] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_usagelogcuttime' do
    dsc_spusageapplication[:dsc_usagelogcuttime] = '16'
    expect(dsc_spusageapplication[:dsc_usagelogcuttime]).to eq(16)
  end

  it 'should accept string-like uint for dsc_usagelogcuttime' do
    dsc_spusageapplication[:dsc_usagelogcuttime] = '32'
    expect(dsc_spusageapplication[:dsc_usagelogcuttime]).to eq(32)
  end

  it 'should accept string-like uint for dsc_usagelogcuttime' do
    dsc_spusageapplication[:dsc_usagelogcuttime] = '64'
    expect(dsc_spusageapplication[:dsc_usagelogcuttime]).to eq(64)
  end

  it 'should not accept array for dsc_usageloglocation' do
    expect{dsc_spusageapplication[:dsc_usageloglocation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usageloglocation' do
    expect{dsc_spusageapplication[:dsc_usageloglocation] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usageloglocation' do
    expect{dsc_spusageapplication[:dsc_usageloglocation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usageloglocation' do
    expect{dsc_spusageapplication[:dsc_usageloglocation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usagelogmaxfilesizekb' do
    expect{dsc_spusageapplication[:dsc_usagelogmaxfilesizekb] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usagelogmaxfilesizekb' do
    expect{dsc_spusageapplication[:dsc_usagelogmaxfilesizekb] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_usagelogmaxfilesizekb' do
    dsc_spusageapplication[:dsc_usagelogmaxfilesizekb] = 32
    expect(dsc_spusageapplication[:dsc_usagelogmaxfilesizekb]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_usagelogmaxfilesizekb' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spusageapplication[:dsc_usagelogmaxfilesizekb] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_usagelogmaxfilesizekb' do
    dsc_spusageapplication[:dsc_usagelogmaxfilesizekb] = '16'
    expect(dsc_spusageapplication[:dsc_usagelogmaxfilesizekb]).to eq(16)
  end

  it 'should accept string-like uint for dsc_usagelogmaxfilesizekb' do
    dsc_spusageapplication[:dsc_usagelogmaxfilesizekb] = '32'
    expect(dsc_spusageapplication[:dsc_usagelogmaxfilesizekb]).to eq(32)
  end

  it 'should accept string-like uint for dsc_usagelogmaxfilesizekb' do
    dsc_spusageapplication[:dsc_usagelogmaxfilesizekb] = '64'
    expect(dsc_spusageapplication[:dsc_usagelogmaxfilesizekb]).to eq(64)
  end

  it 'should not accept array for dsc_usagelogmaxspacegb' do
    expect{dsc_spusageapplication[:dsc_usagelogmaxspacegb] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usagelogmaxspacegb' do
    expect{dsc_spusageapplication[:dsc_usagelogmaxspacegb] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_usagelogmaxspacegb' do
    dsc_spusageapplication[:dsc_usagelogmaxspacegb] = 32
    expect(dsc_spusageapplication[:dsc_usagelogmaxspacegb]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_usagelogmaxspacegb' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spusageapplication[:dsc_usagelogmaxspacegb] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_usagelogmaxspacegb' do
    dsc_spusageapplication[:dsc_usagelogmaxspacegb] = '16'
    expect(dsc_spusageapplication[:dsc_usagelogmaxspacegb]).to eq(16)
  end

  it 'should accept string-like uint for dsc_usagelogmaxspacegb' do
    dsc_spusageapplication[:dsc_usagelogmaxspacegb] = '32'
    expect(dsc_spusageapplication[:dsc_usagelogmaxspacegb]).to eq(32)
  end

  it 'should accept string-like uint for dsc_usagelogmaxspacegb' do
    dsc_spusageapplication[:dsc_usagelogmaxspacegb] = '64'
    expect(dsc_spusageapplication[:dsc_usagelogmaxspacegb]).to eq(64)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spusageapplication[:dsc_ensure] = 'Present'
    expect(dsc_spusageapplication[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spusageapplication[:dsc_ensure] = 'present'
    expect(dsc_spusageapplication[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spusageapplication[:dsc_ensure] = 'present'
    expect(dsc_spusageapplication[:ensure]).to eq(dsc_spusageapplication[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spusageapplication[:dsc_ensure] = 'Absent'
    expect(dsc_spusageapplication[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spusageapplication[:dsc_ensure] = 'absent'
    expect(dsc_spusageapplication[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spusageapplication[:dsc_ensure] = 'absent'
    expect(dsc_spusageapplication[:ensure]).to eq(dsc_spusageapplication[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spusageapplication[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spusageapplication[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spusageapplication[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spusageapplication[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spusageapplication[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spusageapplication[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spusageapplication[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spusageapplication[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spusageapplication[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spusageapplication[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spusageapplication)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spusageapplication)
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
        dsc_spusageapplication.original_parameters[:dsc_ensure] = 'present'
        dsc_spusageapplication[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spusageapplication)
      end

      it "should update :ensure to :present" do
        expect(dsc_spusageapplication[:ensure]).to eq(:present)
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
        dsc_spusageapplication.original_parameters[:dsc_ensure] = 'absent'
        dsc_spusageapplication[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spusageapplication)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spusageapplication[:ensure]).to eq(:absent)
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
