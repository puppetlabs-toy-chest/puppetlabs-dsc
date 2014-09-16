#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xremotefile) do

  let :dsc_xremotefile do
    Puppet::Type.type(:dsc_xremotefile).new(
      :name     => 'foo',
      :dsc_destinationpath => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xremotefile.to_s).to eq("Dsc_xremotefile[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xremotefile[:ensure]).to eq :present
  end

  it 'should require that dsc_destinationpath is specified' do
    #dsc_xremotefile[:dsc_destinationpath]
    expect { Puppet::Type.type(:dsc_xremotefile).new(
      :name     => 'foo',
      :dsc_uri => 'foo',
      :dsc_useragent => 'foo',
      :dsc_headers => ["foo", "bar", "spec"],
      :dsc_credential => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_destinationpath is a required attribute/)
  end

  it 'should not accept array for dsc_destinationpath' do
    expect{dsc_xremotefile[:dsc_destinationpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_destinationpath' do
    expect{dsc_xremotefile[:dsc_destinationpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_destinationpath' do
    expect{dsc_xremotefile[:dsc_destinationpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_destinationpath' do
    expect{dsc_xremotefile[:dsc_destinationpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_uri' do
    expect{dsc_xremotefile[:dsc_uri] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_uri' do
    expect{dsc_xremotefile[:dsc_uri] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_uri' do
    expect{dsc_xremotefile[:dsc_uri] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_uri' do
    expect{dsc_xremotefile[:dsc_uri] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_useragent' do
    expect{dsc_xremotefile[:dsc_useragent] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_useragent' do
    expect{dsc_xremotefile[:dsc_useragent] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_useragent' do
    expect{dsc_xremotefile[:dsc_useragent] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_useragent' do
    expect{dsc_xremotefile[:dsc_useragent] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_headers' do
    dsc_xremotefile[:dsc_headers] = ["foo", "bar", "spec"]
    expect(dsc_xremotefile[:dsc_headers]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_headers' do
    expect{dsc_xremotefile[:dsc_headers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_headers' do
    expect{dsc_xremotefile[:dsc_headers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_headers' do
    expect{dsc_xremotefile[:dsc_headers] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xremotefile[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xremotefile[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xremotefile[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xremotefile[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xremotefile[:dsc_ensure] = 'Present'
    expect(dsc_xremotefile[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xremotefile[:dsc_ensure] = 'present'
    expect(dsc_xremotefile[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xremotefile[:dsc_ensure] = 'present'
    expect(dsc_xremotefile[:ensure]).to eq(dsc_xremotefile[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xremotefile[:dsc_ensure] = 'Absent'
    expect(dsc_xremotefile[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xremotefile[:dsc_ensure] = 'absent'
    expect(dsc_xremotefile[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xremotefile[:dsc_ensure] = 'absent'
    expect(dsc_xremotefile[:ensure]).to eq(dsc_xremotefile[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xremotefile[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xremotefile[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xremotefile[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xremotefile[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xremotefile[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xremotefile)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xremotefile)
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
        dsc_xremotefile[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xremotefile[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xremotefile.original_parameters[:dsc_ensure] = 'present'
        dsc_xremotefile[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xremotefile)
      end

      it "should update :ensure to :present" do
        expect(dsc_xremotefile[:ensure]).to eq(:present)
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
        dsc_xremotefile.original_parameters[:dsc_ensure] = 'absent'
        dsc_xremotefile[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xremotefile)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xremotefile[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xremotefile)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xremotefile)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xRemoteFile as $MSFT_xRemoteFile1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xRemoteFile/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xremotefile[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xremotefile)
      end

      it "should update :ensure to :present" do
        expect(dsc_xremotefile[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xremotefile[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xremotefile)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xremotefile[:ensure]).to eq(:absent)
      end

    end

  end
end
