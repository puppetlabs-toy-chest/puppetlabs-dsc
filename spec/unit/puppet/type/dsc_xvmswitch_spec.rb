#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xvmswitch) do

  let :dsc_xvmswitch do
    Puppet::Type.type(:dsc_xvmswitch).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_type => 'External',
    )
  end

  it "should stringify normally" do
    expect(dsc_xvmswitch.to_s).to eq("Dsc_xvmswitch[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xvmswitch[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xvmswitch[:dsc_name]
    expect { Puppet::Type.type(:dsc_xvmswitch).new(
      :name     => 'foo',
      :dsc_type => 'External',
      :dsc_netadaptername => 'foo',
      :dsc_allowmanagementos => true,
      :dsc_ensure => 'Present',
      :dsc_id => 'foo',
      :dsc_netadapterinterfacedescription => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xvmswitch[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xvmswitch[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xvmswitch[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xvmswitch[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_type is specified' do
    #dsc_xvmswitch[:dsc_type]
    expect { Puppet::Type.type(:dsc_xvmswitch).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_netadaptername => 'foo',
      :dsc_allowmanagementos => true,
      :dsc_ensure => 'Present',
      :dsc_id => 'foo',
      :dsc_netadapterinterfacedescription => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_type is a required attribute/)
  end

  it 'should accept dsc_type predefined value External' do
    dsc_xvmswitch[:dsc_type] = 'External'
    expect(dsc_xvmswitch[:dsc_type]).to eq('External')
  end

  it 'should accept dsc_type predefined value external' do
    dsc_xvmswitch[:dsc_type] = 'external'
    expect(dsc_xvmswitch[:dsc_type]).to eq('external')
  end

  it 'should accept dsc_type predefined value Internal' do
    dsc_xvmswitch[:dsc_type] = 'Internal'
    expect(dsc_xvmswitch[:dsc_type]).to eq('Internal')
  end

  it 'should accept dsc_type predefined value internal' do
    dsc_xvmswitch[:dsc_type] = 'internal'
    expect(dsc_xvmswitch[:dsc_type]).to eq('internal')
  end

  it 'should accept dsc_type predefined value Private' do
    dsc_xvmswitch[:dsc_type] = 'Private'
    expect(dsc_xvmswitch[:dsc_type]).to eq('Private')
  end

  it 'should accept dsc_type predefined value private' do
    dsc_xvmswitch[:dsc_type] = 'private'
    expect(dsc_xvmswitch[:dsc_type]).to eq('private')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xvmswitch[:dsc_type] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_type' do
    expect{dsc_xvmswitch[:dsc_type] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_type' do
    expect{dsc_xvmswitch[:dsc_type] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_type' do
    expect{dsc_xvmswitch[:dsc_type] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_type' do
    expect{dsc_xvmswitch[:dsc_type] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_netadaptername' do
    expect{dsc_xvmswitch[:dsc_netadaptername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_netadaptername' do
    expect{dsc_xvmswitch[:dsc_netadaptername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_netadaptername' do
    expect{dsc_xvmswitch[:dsc_netadaptername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_netadaptername' do
    expect{dsc_xvmswitch[:dsc_netadaptername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowmanagementos' do
    expect{dsc_xvmswitch[:dsc_allowmanagementos] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowmanagementos' do
    dsc_xvmswitch[:dsc_allowmanagementos] = true
    expect(dsc_xvmswitch[:dsc_allowmanagementos]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowmanagementos" do
    dsc_xvmswitch[:dsc_allowmanagementos] = 'true'
    expect(dsc_xvmswitch[:dsc_allowmanagementos]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowmanagementos" do
    dsc_xvmswitch[:dsc_allowmanagementos] = 'false'
    expect(dsc_xvmswitch[:dsc_allowmanagementos]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowmanagementos" do
    dsc_xvmswitch[:dsc_allowmanagementos] = 'True'
    expect(dsc_xvmswitch[:dsc_allowmanagementos]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowmanagementos" do
    dsc_xvmswitch[:dsc_allowmanagementos] = 'False'
    expect(dsc_xvmswitch[:dsc_allowmanagementos]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowmanagementos" do
    dsc_xvmswitch[:dsc_allowmanagementos] = :true
    expect(dsc_xvmswitch[:dsc_allowmanagementos]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowmanagementos" do
    dsc_xvmswitch[:dsc_allowmanagementos] = :false
    expect(dsc_xvmswitch[:dsc_allowmanagementos]).to eq(false)
  end

  it 'should not accept int for dsc_allowmanagementos' do
    expect{dsc_xvmswitch[:dsc_allowmanagementos] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowmanagementos' do
    expect{dsc_xvmswitch[:dsc_allowmanagementos] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xvmswitch[:dsc_ensure] = 'Present'
    expect(dsc_xvmswitch[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xvmswitch[:dsc_ensure] = 'present'
    expect(dsc_xvmswitch[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xvmswitch[:dsc_ensure] = 'present'
    expect(dsc_xvmswitch[:ensure]).to eq(dsc_xvmswitch[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xvmswitch[:dsc_ensure] = 'Absent'
    expect(dsc_xvmswitch[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xvmswitch[:dsc_ensure] = 'absent'
    expect(dsc_xvmswitch[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xvmswitch[:dsc_ensure] = 'absent'
    expect(dsc_xvmswitch[:ensure]).to eq(dsc_xvmswitch[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xvmswitch[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xvmswitch[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xvmswitch[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xvmswitch[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xvmswitch[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_id' do
    expect{dsc_xvmswitch[:dsc_id] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_id' do
    expect{dsc_xvmswitch[:dsc_id] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_id' do
    expect{dsc_xvmswitch[:dsc_id] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_id' do
    expect{dsc_xvmswitch[:dsc_id] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_netadapterinterfacedescription' do
    expect{dsc_xvmswitch[:dsc_netadapterinterfacedescription] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_netadapterinterfacedescription' do
    expect{dsc_xvmswitch[:dsc_netadapterinterfacedescription] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_netadapterinterfacedescription' do
    expect{dsc_xvmswitch[:dsc_netadapterinterfacedescription] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_netadapterinterfacedescription' do
    expect{dsc_xvmswitch[:dsc_netadapterinterfacedescription] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xvmswitch)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xvmswitch)
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
        dsc_xvmswitch[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xvmswitch[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xvmswitch.original_parameters[:dsc_ensure] = 'present'
        dsc_xvmswitch[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xvmswitch)
      end

      it "should update :ensure to :present" do
        expect(dsc_xvmswitch[:ensure]).to eq(:present)
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
        dsc_xvmswitch.original_parameters[:dsc_ensure] = 'absent'
        dsc_xvmswitch[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xvmswitch)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xvmswitch[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xvmswitch)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xvmswitch)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xVMSwitch as $MSFT_xVMSwitch1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xVMSwitch/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xvmswitch[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xvmswitch)
      end

      it "should update :ensure to :present" do
        expect(dsc_xvmswitch[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xvmswitch[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xvmswitch)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xvmswitch[:ensure]).to eq(:absent)
      end

    end

  end
end
