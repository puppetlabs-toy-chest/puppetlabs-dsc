#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazurestorageaccount) do

  let :dsc_xazurestorageaccount do
    Puppet::Type.type(:dsc_xazurestorageaccount).new(
      :name     => 'foo',
      :dsc_storageaccountname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazurestorageaccount.to_s).to eq("Dsc_xazurestorageaccount[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xazurestorageaccount[:ensure]).to eq :present
  end

  it 'should require that dsc_storageaccountname is specified' do
    #dsc_xazurestorageaccount[:dsc_storageaccountname]
    expect { Puppet::Type.type(:dsc_xazurestorageaccount).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_affinitygroup => 'foo',
      :dsc_container => 'foo',
      :dsc_folder => 'foo',
      :dsc_label => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_storageaccountname is a required attribute/)
  end

  it 'should not accept array for dsc_storageaccountname' do
    expect{dsc_xazurestorageaccount[:dsc_storageaccountname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_storageaccountname' do
    expect{dsc_xazurestorageaccount[:dsc_storageaccountname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_storageaccountname' do
    expect{dsc_xazurestorageaccount[:dsc_storageaccountname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_storageaccountname' do
    expect{dsc_xazurestorageaccount[:dsc_storageaccountname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xazurestorageaccount[:dsc_ensure] = 'Present'
    expect(dsc_xazurestorageaccount[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xazurestorageaccount[:dsc_ensure] = 'present'
    expect(dsc_xazurestorageaccount[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazurestorageaccount[:dsc_ensure] = 'present'
    expect(dsc_xazurestorageaccount[:ensure]).to eq(dsc_xazurestorageaccount[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xazurestorageaccount[:dsc_ensure] = 'Absent'
    expect(dsc_xazurestorageaccount[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xazurestorageaccount[:dsc_ensure] = 'absent'
    expect(dsc_xazurestorageaccount[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazurestorageaccount[:dsc_ensure] = 'absent'
    expect(dsc_xazurestorageaccount[:ensure]).to eq(dsc_xazurestorageaccount[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurestorageaccount[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xazurestorageaccount[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xazurestorageaccount[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xazurestorageaccount[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xazurestorageaccount[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_affinitygroup' do
    expect{dsc_xazurestorageaccount[:dsc_affinitygroup] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_affinitygroup' do
    expect{dsc_xazurestorageaccount[:dsc_affinitygroup] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_affinitygroup' do
    expect{dsc_xazurestorageaccount[:dsc_affinitygroup] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_affinitygroup' do
    expect{dsc_xazurestorageaccount[:dsc_affinitygroup] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_container' do
    expect{dsc_xazurestorageaccount[:dsc_container] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_container' do
    expect{dsc_xazurestorageaccount[:dsc_container] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_container' do
    expect{dsc_xazurestorageaccount[:dsc_container] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_container' do
    expect{dsc_xazurestorageaccount[:dsc_container] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_folder' do
    expect{dsc_xazurestorageaccount[:dsc_folder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_folder' do
    expect{dsc_xazurestorageaccount[:dsc_folder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_folder' do
    expect{dsc_xazurestorageaccount[:dsc_folder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_folder' do
    expect{dsc_xazurestorageaccount[:dsc_folder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_label' do
    expect{dsc_xazurestorageaccount[:dsc_label] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_label' do
    expect{dsc_xazurestorageaccount[:dsc_label] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_label' do
    expect{dsc_xazurestorageaccount[:dsc_label] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_label' do
    expect{dsc_xazurestorageaccount[:dsc_label] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xazurestorageaccount)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xazurestorageaccount)
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
        dsc_xazurestorageaccount[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xazurestorageaccount[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xazurestorageaccount.original_parameters[:dsc_ensure] = 'present'
        dsc_xazurestorageaccount[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xazurestorageaccount)
      end

      it "should update :ensure to :present" do
        expect(dsc_xazurestorageaccount[:ensure]).to eq(:present)
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
        dsc_xazurestorageaccount.original_parameters[:dsc_ensure] = 'absent'
        dsc_xazurestorageaccount[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xazurestorageaccount)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xazurestorageaccount[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xazurestorageaccount)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xazurestorageaccount)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xAzureStorageAccount as $MSFT_xAzureStorageAccount1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xAzureStorageAccount/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xazurestorageaccount[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xazurestorageaccount)
      end

      it "should update :ensure to :present" do
        expect(dsc_xazurestorageaccount[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xazurestorageaccount[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xazurestorageaccount)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xazurestorageaccount[:ensure]).to eq(:absent)
      end

    end

  end
end
