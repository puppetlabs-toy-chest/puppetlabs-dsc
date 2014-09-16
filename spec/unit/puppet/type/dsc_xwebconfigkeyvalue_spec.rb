#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwebconfigkeyvalue) do

  let :dsc_xwebconfigkeyvalue do
    Puppet::Type.type(:dsc_xwebconfigkeyvalue).new(
      :name     => 'foo',
      :dsc_websitepath => 'foo',
      :dsc_configsection => 'AppSettings',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwebconfigkeyvalue.to_s).to eq("Dsc_xwebconfigkeyvalue[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xwebconfigkeyvalue[:ensure]).to eq :present
  end

  it 'should require that dsc_websitepath is specified' do
    #dsc_xwebconfigkeyvalue[:dsc_websitepath]
    expect { Puppet::Type.type(:dsc_xwebconfigkeyvalue).new(
      :name     => 'foo',
      :dsc_configsection => 'AppSettings',
      :dsc_ensure => 'Present',
      :dsc_key => 'foo',
      :dsc_value => 'foo',
      :dsc_isattribute => true,
    )}.to raise_error(Puppet::Error, /dsc_websitepath is a required attribute/)
  end

  it 'should not accept array for dsc_websitepath' do
    expect{dsc_xwebconfigkeyvalue[:dsc_websitepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_websitepath' do
    expect{dsc_xwebconfigkeyvalue[:dsc_websitepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_websitepath' do
    expect{dsc_xwebconfigkeyvalue[:dsc_websitepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_websitepath' do
    expect{dsc_xwebconfigkeyvalue[:dsc_websitepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_configsection is specified' do
    #dsc_xwebconfigkeyvalue[:dsc_configsection]
    expect { Puppet::Type.type(:dsc_xwebconfigkeyvalue).new(
      :name     => 'foo',
      :dsc_websitepath => 'foo',
      :dsc_ensure => 'Present',
      :dsc_key => 'foo',
      :dsc_value => 'foo',
      :dsc_isattribute => true,
    )}.to raise_error(Puppet::Error, /dsc_configsection is a required attribute/)
  end

  it 'should accept dsc_configsection predefined value AppSettings' do
    dsc_xwebconfigkeyvalue[:dsc_configsection] = 'AppSettings'
    expect(dsc_xwebconfigkeyvalue[:dsc_configsection]).to eq('AppSettings')
  end

  it 'should accept dsc_configsection predefined value appsettings' do
    dsc_xwebconfigkeyvalue[:dsc_configsection] = 'appsettings'
    expect(dsc_xwebconfigkeyvalue[:dsc_configsection]).to eq('appsettings')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebconfigkeyvalue[:dsc_configsection] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_configsection' do
    expect{dsc_xwebconfigkeyvalue[:dsc_configsection] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_configsection' do
    expect{dsc_xwebconfigkeyvalue[:dsc_configsection] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_configsection' do
    expect{dsc_xwebconfigkeyvalue[:dsc_configsection] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_configsection' do
    expect{dsc_xwebconfigkeyvalue[:dsc_configsection] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xwebconfigkeyvalue[:dsc_ensure] = 'Present'
    expect(dsc_xwebconfigkeyvalue[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xwebconfigkeyvalue[:dsc_ensure] = 'present'
    expect(dsc_xwebconfigkeyvalue[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebconfigkeyvalue[:dsc_ensure] = 'present'
    expect(dsc_xwebconfigkeyvalue[:ensure]).to eq(dsc_xwebconfigkeyvalue[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xwebconfigkeyvalue[:dsc_ensure] = 'Absent'
    expect(dsc_xwebconfigkeyvalue[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xwebconfigkeyvalue[:dsc_ensure] = 'absent'
    expect(dsc_xwebconfigkeyvalue[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebconfigkeyvalue[:dsc_ensure] = 'absent'
    expect(dsc_xwebconfigkeyvalue[:ensure]).to eq(dsc_xwebconfigkeyvalue[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebconfigkeyvalue[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xwebconfigkeyvalue[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xwebconfigkeyvalue[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xwebconfigkeyvalue[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xwebconfigkeyvalue[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_key' do
    expect{dsc_xwebconfigkeyvalue[:dsc_key] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_key' do
    expect{dsc_xwebconfigkeyvalue[:dsc_key] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_key' do
    expect{dsc_xwebconfigkeyvalue[:dsc_key] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_key' do
    expect{dsc_xwebconfigkeyvalue[:dsc_key] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_value' do
    expect{dsc_xwebconfigkeyvalue[:dsc_value] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_value' do
    expect{dsc_xwebconfigkeyvalue[:dsc_value] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_value' do
    expect{dsc_xwebconfigkeyvalue[:dsc_value] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_value' do
    expect{dsc_xwebconfigkeyvalue[:dsc_value] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_isattribute' do
    expect{dsc_xwebconfigkeyvalue[:dsc_isattribute] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_isattribute' do
    dsc_xwebconfigkeyvalue[:dsc_isattribute] = true
    expect(dsc_xwebconfigkeyvalue[:dsc_isattribute]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_isattribute" do
    dsc_xwebconfigkeyvalue[:dsc_isattribute] = 'true'
    expect(dsc_xwebconfigkeyvalue[:dsc_isattribute]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_isattribute" do
    dsc_xwebconfigkeyvalue[:dsc_isattribute] = 'false'
    expect(dsc_xwebconfigkeyvalue[:dsc_isattribute]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_isattribute" do
    dsc_xwebconfigkeyvalue[:dsc_isattribute] = 'True'
    expect(dsc_xwebconfigkeyvalue[:dsc_isattribute]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_isattribute" do
    dsc_xwebconfigkeyvalue[:dsc_isattribute] = 'False'
    expect(dsc_xwebconfigkeyvalue[:dsc_isattribute]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_isattribute" do
    dsc_xwebconfigkeyvalue[:dsc_isattribute] = :true
    expect(dsc_xwebconfigkeyvalue[:dsc_isattribute]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_isattribute" do
    dsc_xwebconfigkeyvalue[:dsc_isattribute] = :false
    expect(dsc_xwebconfigkeyvalue[:dsc_isattribute]).to eq(false)
  end

  it 'should not accept int for dsc_isattribute' do
    expect{dsc_xwebconfigkeyvalue[:dsc_isattribute] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_isattribute' do
    expect{dsc_xwebconfigkeyvalue[:dsc_isattribute] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xwebconfigkeyvalue)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xwebconfigkeyvalue)
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
        dsc_xwebconfigkeyvalue[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xwebconfigkeyvalue[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xwebconfigkeyvalue.original_parameters[:dsc_ensure] = 'present'
        dsc_xwebconfigkeyvalue[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xwebconfigkeyvalue)
      end

      it "should update :ensure to :present" do
        expect(dsc_xwebconfigkeyvalue[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xwebconfigkeyvalue.original_parameters[:dsc_ensure] = 'absent'
        dsc_xwebconfigkeyvalue[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xwebconfigkeyvalue)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xwebconfigkeyvalue[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xwebconfigkeyvalue)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xwebconfigkeyvalue)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xWebConfigKeyValue as $MSFT_xWebConfigKeyValue1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xWebConfigKeyValue/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xwebconfigkeyvalue[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xwebconfigkeyvalue)
      end

      it "should update :ensure to :present" do
        expect(dsc_xwebconfigkeyvalue[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xwebconfigkeyvalue[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xwebconfigkeyvalue)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xwebconfigkeyvalue[:ensure]).to eq(:absent)
      end

    end

  end
end
