#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazuresqldatabase) do

  let :dsc_xazuresqldatabase do
    Puppet::Type.type(:dsc_xazuresqldatabase).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazuresqldatabase.to_s).to eq("Dsc_xazuresqldatabase[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xazuresqldatabase[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xazuresqldatabase[:dsc_name]
    expect { Puppet::Type.type(:dsc_xazuresqldatabase).new(
      :name     => 'foo',
      :dsc_maximumsizeingb => 32,
      :dsc_collation => 'foo',
      :dsc_edition => 'foo',
      :dsc_servercredential => 'foo',
      :dsc_servername => 'foo',
      :dsc_azuresubscriptionname => 'foo',
      :dsc_azurepublishsettingsfile => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xazuresqldatabase[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xazuresqldatabase[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xazuresqldatabase[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xazuresqldatabase[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maximumsizeingb' do
    expect{dsc_xazuresqldatabase[:dsc_maximumsizeingb] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maximumsizeingb' do
    expect{dsc_xazuresqldatabase[:dsc_maximumsizeingb] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maximumsizeingb' do
    expect{dsc_xazuresqldatabase[:dsc_maximumsizeingb] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maximumsizeingb' do
    dsc_xazuresqldatabase[:dsc_maximumsizeingb] = 32
    expect(dsc_xazuresqldatabase[:dsc_maximumsizeingb]).to eq(32)
  end


  it 'should accept string-like int for dsc_maximumsizeingb' do
    dsc_xazuresqldatabase[:dsc_maximumsizeingb] = '16'
    expect(dsc_xazuresqldatabase[:dsc_maximumsizeingb]).to eq(16)
  end


  it 'should accept string-like int for dsc_maximumsizeingb' do
    dsc_xazuresqldatabase[:dsc_maximumsizeingb] = '32'
    expect(dsc_xazuresqldatabase[:dsc_maximumsizeingb]).to eq(32)
  end


  it 'should accept string-like int for dsc_maximumsizeingb' do
    dsc_xazuresqldatabase[:dsc_maximumsizeingb] = '64'
    expect(dsc_xazuresqldatabase[:dsc_maximumsizeingb]).to eq(64)
  end

  it 'should not accept array for dsc_collation' do
    expect{dsc_xazuresqldatabase[:dsc_collation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_collation' do
    expect{dsc_xazuresqldatabase[:dsc_collation] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_collation' do
    expect{dsc_xazuresqldatabase[:dsc_collation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_collation' do
    expect{dsc_xazuresqldatabase[:dsc_collation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_edition' do
    expect{dsc_xazuresqldatabase[:dsc_edition] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_edition' do
    expect{dsc_xazuresqldatabase[:dsc_edition] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_edition' do
    expect{dsc_xazuresqldatabase[:dsc_edition] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_edition' do
    expect{dsc_xazuresqldatabase[:dsc_edition] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_servercredential' do
    expect{dsc_xazuresqldatabase[:dsc_servercredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servercredential' do
    expect{dsc_xazuresqldatabase[:dsc_servercredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servercredential' do
    expect{dsc_xazuresqldatabase[:dsc_servercredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servercredential' do
    expect{dsc_xazuresqldatabase[:dsc_servercredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_servername' do
    expect{dsc_xazuresqldatabase[:dsc_servername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servername' do
    expect{dsc_xazuresqldatabase[:dsc_servername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servername' do
    expect{dsc_xazuresqldatabase[:dsc_servername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servername' do
    expect{dsc_xazuresqldatabase[:dsc_servername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_azuresubscriptionname' do
    expect{dsc_xazuresqldatabase[:dsc_azuresubscriptionname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_azuresubscriptionname' do
    expect{dsc_xazuresqldatabase[:dsc_azuresubscriptionname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_azuresubscriptionname' do
    expect{dsc_xazuresqldatabase[:dsc_azuresubscriptionname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_azuresubscriptionname' do
    expect{dsc_xazuresqldatabase[:dsc_azuresubscriptionname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_azurepublishsettingsfile' do
    expect{dsc_xazuresqldatabase[:dsc_azurepublishsettingsfile] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_azurepublishsettingsfile' do
    expect{dsc_xazuresqldatabase[:dsc_azurepublishsettingsfile] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_azurepublishsettingsfile' do
    expect{dsc_xazuresqldatabase[:dsc_azurepublishsettingsfile] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_azurepublishsettingsfile' do
    expect{dsc_xazuresqldatabase[:dsc_azurepublishsettingsfile] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xazuresqldatabase[:dsc_ensure] = 'Present'
    expect(dsc_xazuresqldatabase[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xazuresqldatabase[:dsc_ensure] = 'present'
    expect(dsc_xazuresqldatabase[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazuresqldatabase[:dsc_ensure] = 'present'
    expect(dsc_xazuresqldatabase[:ensure]).to eq(dsc_xazuresqldatabase[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xazuresqldatabase[:dsc_ensure] = 'Absent'
    expect(dsc_xazuresqldatabase[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xazuresqldatabase[:dsc_ensure] = 'absent'
    expect(dsc_xazuresqldatabase[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazuresqldatabase[:dsc_ensure] = 'absent'
    expect(dsc_xazuresqldatabase[:ensure]).to eq(dsc_xazuresqldatabase[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazuresqldatabase[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xazuresqldatabase[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xazuresqldatabase[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xazuresqldatabase[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xazuresqldatabase[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xazuresqldatabase)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xazuresqldatabase)
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
        dsc_xazuresqldatabase[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xazuresqldatabase[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xazuresqldatabase.original_parameters[:dsc_ensure] = 'present'
        dsc_xazuresqldatabase[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xazuresqldatabase)
      end

      it "should update :ensure to :present" do
        expect(dsc_xazuresqldatabase[:ensure]).to eq(:present)
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
        dsc_xazuresqldatabase.original_parameters[:dsc_ensure] = 'absent'
        dsc_xazuresqldatabase[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xazuresqldatabase)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xazuresqldatabase[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xazuresqldatabase)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xazuresqldatabase)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xAzureSqlDatabase as $MSFT_xAzureSqlDatabase1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xAzureSqlDatabase/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xazuresqldatabase[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xazuresqldatabase)
      end

      it "should update :ensure to :present" do
        expect(dsc_xazuresqldatabase[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xazuresqldatabase[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xazuresqldatabase)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xazuresqldatabase[:ensure]).to eq(:absent)
      end

    end

  end
end
