#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xvhd) do

  let :dsc_xvhd do
    Puppet::Type.type(:dsc_xvhd).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_path => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xvhd.to_s).to eq("Dsc_xvhd[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xvhd[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xvhd[:dsc_name]
    expect { Puppet::Type.type(:dsc_xvhd).new(
      :name     => 'foo',
      :dsc_path => 'foo',
      :dsc_parentpath => 'foo',
      :dsc_maximumsizebytes => 64,
      :dsc_generation => 'Vhd',
      :dsc_ensure => 'Present',
      :dsc_id => 'foo',
      :dsc_type => 'foo',
      :dsc_filesizebytes => 64,
      :dsc_isattached => true,
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xvhd[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xvhd[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xvhd[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xvhd[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_path is specified' do
    #dsc_xvhd[:dsc_path]
    expect { Puppet::Type.type(:dsc_xvhd).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_parentpath => 'foo',
      :dsc_maximumsizebytes => 64,
      :dsc_generation => 'Vhd',
      :dsc_ensure => 'Present',
      :dsc_id => 'foo',
      :dsc_type => 'foo',
      :dsc_filesizebytes => 64,
      :dsc_isattached => true,
    )}.to raise_error(Puppet::Error, /dsc_path is a required attribute/)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xvhd[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xvhd[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xvhd[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xvhd[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_parentpath' do
    expect{dsc_xvhd[:dsc_parentpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_parentpath' do
    expect{dsc_xvhd[:dsc_parentpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_parentpath' do
    expect{dsc_xvhd[:dsc_parentpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_parentpath' do
    expect{dsc_xvhd[:dsc_parentpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maximumsizebytes' do
    expect{dsc_xvhd[:dsc_maximumsizebytes] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maximumsizebytes' do
    expect{dsc_xvhd[:dsc_maximumsizebytes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maximumsizebytes' do
    expect{dsc_xvhd[:dsc_maximumsizebytes] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maximumsizebytes' do
    dsc_xvhd[:dsc_maximumsizebytes] = 64
    expect(dsc_xvhd[:dsc_maximumsizebytes]).to eq(64)
  end


  it 'should accept string-like int for dsc_maximumsizebytes' do
    dsc_xvhd[:dsc_maximumsizebytes] = '16'
    expect(dsc_xvhd[:dsc_maximumsizebytes]).to eq(16)
  end


  it 'should accept string-like int for dsc_maximumsizebytes' do
    dsc_xvhd[:dsc_maximumsizebytes] = '32'
    expect(dsc_xvhd[:dsc_maximumsizebytes]).to eq(32)
  end


  it 'should accept string-like int for dsc_maximumsizebytes' do
    dsc_xvhd[:dsc_maximumsizebytes] = '64'
    expect(dsc_xvhd[:dsc_maximumsizebytes]).to eq(64)
  end

  it 'should accept dsc_generation predefined value Vhd' do
    dsc_xvhd[:dsc_generation] = 'Vhd'
    expect(dsc_xvhd[:dsc_generation]).to eq('Vhd')
  end

  it 'should accept dsc_generation predefined value vhd' do
    dsc_xvhd[:dsc_generation] = 'vhd'
    expect(dsc_xvhd[:dsc_generation]).to eq('vhd')
  end

  it 'should accept dsc_generation predefined value Vhdx' do
    dsc_xvhd[:dsc_generation] = 'Vhdx'
    expect(dsc_xvhd[:dsc_generation]).to eq('Vhdx')
  end

  it 'should accept dsc_generation predefined value vhdx' do
    dsc_xvhd[:dsc_generation] = 'vhdx'
    expect(dsc_xvhd[:dsc_generation]).to eq('vhdx')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xvhd[:dsc_generation] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_generation' do
    expect{dsc_xvhd[:dsc_generation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_generation' do
    expect{dsc_xvhd[:dsc_generation] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_generation' do
    expect{dsc_xvhd[:dsc_generation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_generation' do
    expect{dsc_xvhd[:dsc_generation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xvhd[:dsc_ensure] = 'Present'
    expect(dsc_xvhd[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xvhd[:dsc_ensure] = 'present'
    expect(dsc_xvhd[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xvhd[:dsc_ensure] = 'present'
    expect(dsc_xvhd[:ensure]).to eq(dsc_xvhd[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xvhd[:dsc_ensure] = 'Absent'
    expect(dsc_xvhd[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xvhd[:dsc_ensure] = 'absent'
    expect(dsc_xvhd[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xvhd[:dsc_ensure] = 'absent'
    expect(dsc_xvhd[:ensure]).to eq(dsc_xvhd[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xvhd[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xvhd[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xvhd[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xvhd[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xvhd[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_id' do
    expect{dsc_xvhd[:dsc_id] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_id' do
    expect{dsc_xvhd[:dsc_id] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_id' do
    expect{dsc_xvhd[:dsc_id] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_id' do
    expect{dsc_xvhd[:dsc_id] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_type' do
    expect{dsc_xvhd[:dsc_type] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_type' do
    expect{dsc_xvhd[:dsc_type] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_type' do
    expect{dsc_xvhd[:dsc_type] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_type' do
    expect{dsc_xvhd[:dsc_type] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_filesizebytes' do
    expect{dsc_xvhd[:dsc_filesizebytes] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_filesizebytes' do
    expect{dsc_xvhd[:dsc_filesizebytes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_filesizebytes' do
    expect{dsc_xvhd[:dsc_filesizebytes] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_filesizebytes' do
    dsc_xvhd[:dsc_filesizebytes] = 64
    expect(dsc_xvhd[:dsc_filesizebytes]).to eq(64)
  end


  it 'should accept string-like int for dsc_filesizebytes' do
    dsc_xvhd[:dsc_filesizebytes] = '16'
    expect(dsc_xvhd[:dsc_filesizebytes]).to eq(16)
  end


  it 'should accept string-like int for dsc_filesizebytes' do
    dsc_xvhd[:dsc_filesizebytes] = '32'
    expect(dsc_xvhd[:dsc_filesizebytes]).to eq(32)
  end


  it 'should accept string-like int for dsc_filesizebytes' do
    dsc_xvhd[:dsc_filesizebytes] = '64'
    expect(dsc_xvhd[:dsc_filesizebytes]).to eq(64)
  end

  it 'should not accept array for dsc_isattached' do
    expect{dsc_xvhd[:dsc_isattached] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_isattached' do
    dsc_xvhd[:dsc_isattached] = true
    expect(dsc_xvhd[:dsc_isattached]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_isattached" do
    dsc_xvhd[:dsc_isattached] = 'true'
    expect(dsc_xvhd[:dsc_isattached]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_isattached" do
    dsc_xvhd[:dsc_isattached] = 'false'
    expect(dsc_xvhd[:dsc_isattached]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_isattached" do
    dsc_xvhd[:dsc_isattached] = 'True'
    expect(dsc_xvhd[:dsc_isattached]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_isattached" do
    dsc_xvhd[:dsc_isattached] = 'False'
    expect(dsc_xvhd[:dsc_isattached]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_isattached" do
    dsc_xvhd[:dsc_isattached] = :true
    expect(dsc_xvhd[:dsc_isattached]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_isattached" do
    dsc_xvhd[:dsc_isattached] = :false
    expect(dsc_xvhd[:dsc_isattached]).to eq(false)
  end

  it 'should not accept int for dsc_isattached' do
    expect{dsc_xvhd[:dsc_isattached] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_isattached' do
    expect{dsc_xvhd[:dsc_isattached] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xvhd)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xvhd)
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
        dsc_xvhd[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xvhd[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xvhd.original_parameters[:dsc_ensure] = 'present'
        dsc_xvhd[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xvhd)
      end

      it "should update :ensure to :present" do
        expect(dsc_xvhd[:ensure]).to eq(:present)
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
        dsc_xvhd.original_parameters[:dsc_ensure] = 'absent'
        dsc_xvhd[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xvhd)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xvhd[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xvhd)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xvhd)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xVHD as $MSFT_xVHD1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xVHD/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xvhd[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xvhd)
      end

      it "should update :ensure to :present" do
        expect(dsc_xvhd[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xvhd[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xvhd)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xvhd[:ensure]).to eq(:absent)
      end

    end

  end
end
