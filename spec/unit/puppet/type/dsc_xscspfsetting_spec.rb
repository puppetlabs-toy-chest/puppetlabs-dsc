#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xscspfsetting) do

  let :dsc_xscspfsetting do
    Puppet::Type.type(:dsc_xscspfsetting).new(
      :name     => 'foo',
      :dsc_servername => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xscspfsetting.to_s).to eq("Dsc_xscspfsetting[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xscspfsetting[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xscspfsetting[:dsc_ensure] = 'Present'
    expect(dsc_xscspfsetting[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xscspfsetting[:dsc_ensure] = 'present'
    expect(dsc_xscspfsetting[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscspfsetting[:dsc_ensure] = 'present'
    expect(dsc_xscspfsetting[:ensure]).to eq(dsc_xscspfsetting[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xscspfsetting[:dsc_ensure] = 'Absent'
    expect(dsc_xscspfsetting[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xscspfsetting[:dsc_ensure] = 'absent'
    expect(dsc_xscspfsetting[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscspfsetting[:dsc_ensure] = 'absent'
    expect(dsc_xscspfsetting[:ensure]).to eq(dsc_xscspfsetting[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscspfsetting[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xscspfsetting[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xscspfsetting[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xscspfsetting[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xscspfsetting[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_servername is specified' do
    #dsc_xscspfsetting[:dsc_servername]
    expect { Puppet::Type.type(:dsc_xscspfsetting).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_settingtype => 'DatabaseConnectionString',
      :dsc_name => 'foo',
      :dsc_value => 'foo',
      :dsc_scspfadmincredential => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_servername is a required attribute/)
  end

  it 'should not accept array for dsc_servername' do
    expect{dsc_xscspfsetting[:dsc_servername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servername' do
    expect{dsc_xscspfsetting[:dsc_servername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servername' do
    expect{dsc_xscspfsetting[:dsc_servername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servername' do
    expect{dsc_xscspfsetting[:dsc_servername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_settingtype predefined value DatabaseConnectionString' do
    dsc_xscspfsetting[:dsc_settingtype] = 'DatabaseConnectionString'
    expect(dsc_xscspfsetting[:dsc_settingtype]).to eq('DatabaseConnectionString')
  end

  it 'should accept dsc_settingtype predefined value databaseconnectionstring' do
    dsc_xscspfsetting[:dsc_settingtype] = 'databaseconnectionstring'
    expect(dsc_xscspfsetting[:dsc_settingtype]).to eq('databaseconnectionstring')
  end

  it 'should accept dsc_settingtype predefined value EndPointConnectionString' do
    dsc_xscspfsetting[:dsc_settingtype] = 'EndPointConnectionString'
    expect(dsc_xscspfsetting[:dsc_settingtype]).to eq('EndPointConnectionString')
  end

  it 'should accept dsc_settingtype predefined value endpointconnectionstring' do
    dsc_xscspfsetting[:dsc_settingtype] = 'endpointconnectionstring'
    expect(dsc_xscspfsetting[:dsc_settingtype]).to eq('endpointconnectionstring')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscspfsetting[:dsc_settingtype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_settingtype' do
    expect{dsc_xscspfsetting[:dsc_settingtype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_settingtype' do
    expect{dsc_xscspfsetting[:dsc_settingtype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_settingtype' do
    expect{dsc_xscspfsetting[:dsc_settingtype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_settingtype' do
    expect{dsc_xscspfsetting[:dsc_settingtype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_name is specified' do
    #dsc_xscspfsetting[:dsc_name]
    expect { Puppet::Type.type(:dsc_xscspfsetting).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_servername => 'foo',
      :dsc_settingtype => 'DatabaseConnectionString',
      :dsc_value => 'foo',
      :dsc_scspfadmincredential => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xscspfsetting[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xscspfsetting[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xscspfsetting[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xscspfsetting[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_value' do
    expect{dsc_xscspfsetting[:dsc_value] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_value' do
    expect{dsc_xscspfsetting[:dsc_value] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_value' do
    expect{dsc_xscspfsetting[:dsc_value] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_value' do
    expect{dsc_xscspfsetting[:dsc_value] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_scspfadmincredential" do
    expect{dsc_xscspfsetting[:dsc_scspfadmincredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scspfadmincredential' do
    expect{dsc_xscspfsetting[:dsc_scspfadmincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scspfadmincredential' do
    expect{dsc_xscspfsetting[:dsc_scspfadmincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scspfadmincredential' do
    expect{dsc_xscspfsetting[:dsc_scspfadmincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scspfadmincredential' do
    expect{dsc_xscspfsetting[:dsc_scspfadmincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xscspfsetting)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xscspfsetting)
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
        dsc_xscspfsetting.original_parameters[:dsc_ensure] = 'present'
        dsc_xscspfsetting[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xscspfsetting)
      end

      it "should update :ensure to :present" do
        expect(dsc_xscspfsetting[:ensure]).to eq(:present)
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
        dsc_xscspfsetting.original_parameters[:dsc_ensure] = 'absent'
        dsc_xscspfsetting[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xscspfsetting)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xscspfsetting[:ensure]).to eq(:absent)
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
