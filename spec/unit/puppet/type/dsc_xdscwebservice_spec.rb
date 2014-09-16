#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdscwebservice) do

  let :dsc_xdscwebservice do
    Puppet::Type.type(:dsc_xdscwebservice).new(
      :name     => 'foo',
      :dsc_endpointname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xdscwebservice.to_s).to eq("Dsc_xdscwebservice[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xdscwebservice[:ensure]).to eq :present
  end

  it 'should require that dsc_endpointname is specified' do
    #dsc_xdscwebservice[:dsc_endpointname]
    expect { Puppet::Type.type(:dsc_xdscwebservice).new(
      :name     => 'foo',
      :dsc_certificatethumbprint => 'foo',
      :dsc_port => 32,
      :dsc_physicalpath => 'foo',
      :dsc_ensure => 'Present',
      :dsc_state => 'Started',
      :dsc_modulepath => 'foo',
      :dsc_configurationpath => 'foo',
      :dsc_iscomplianceserver => true,
      :dsc_dscserverurl => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_endpointname is a required attribute/)
  end

  it 'should not accept array for dsc_endpointname' do
    expect{dsc_xdscwebservice[:dsc_endpointname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_endpointname' do
    expect{dsc_xdscwebservice[:dsc_endpointname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_endpointname' do
    expect{dsc_xdscwebservice[:dsc_endpointname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_endpointname' do
    expect{dsc_xdscwebservice[:dsc_endpointname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_certificatethumbprint' do
    expect{dsc_xdscwebservice[:dsc_certificatethumbprint] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_certificatethumbprint' do
    expect{dsc_xdscwebservice[:dsc_certificatethumbprint] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_certificatethumbprint' do
    expect{dsc_xdscwebservice[:dsc_certificatethumbprint] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_certificatethumbprint' do
    expect{dsc_xdscwebservice[:dsc_certificatethumbprint] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_port' do
    expect{dsc_xdscwebservice[:dsc_port] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_port' do
    expect{dsc_xdscwebservice[:dsc_port] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_port' do
    expect{dsc_xdscwebservice[:dsc_port] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_port' do
    dsc_xdscwebservice[:dsc_port] = 32
    expect(dsc_xdscwebservice[:dsc_port]).to eq(32)
  end


  it 'should accept string-like int for dsc_port' do
    dsc_xdscwebservice[:dsc_port] = '16'
    expect(dsc_xdscwebservice[:dsc_port]).to eq(16)
  end


  it 'should accept string-like int for dsc_port' do
    dsc_xdscwebservice[:dsc_port] = '32'
    expect(dsc_xdscwebservice[:dsc_port]).to eq(32)
  end


  it 'should accept string-like int for dsc_port' do
    dsc_xdscwebservice[:dsc_port] = '64'
    expect(dsc_xdscwebservice[:dsc_port]).to eq(64)
  end

  it 'should not accept array for dsc_physicalpath' do
    expect{dsc_xdscwebservice[:dsc_physicalpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_physicalpath' do
    expect{dsc_xdscwebservice[:dsc_physicalpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_physicalpath' do
    expect{dsc_xdscwebservice[:dsc_physicalpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_physicalpath' do
    expect{dsc_xdscwebservice[:dsc_physicalpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xdscwebservice[:dsc_ensure] = 'Present'
    expect(dsc_xdscwebservice[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xdscwebservice[:dsc_ensure] = 'present'
    expect(dsc_xdscwebservice[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdscwebservice[:dsc_ensure] = 'present'
    expect(dsc_xdscwebservice[:ensure]).to eq(dsc_xdscwebservice[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xdscwebservice[:dsc_ensure] = 'Absent'
    expect(dsc_xdscwebservice[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xdscwebservice[:dsc_ensure] = 'absent'
    expect(dsc_xdscwebservice[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdscwebservice[:dsc_ensure] = 'absent'
    expect(dsc_xdscwebservice[:ensure]).to eq(dsc_xdscwebservice[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdscwebservice[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xdscwebservice[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xdscwebservice[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xdscwebservice[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xdscwebservice[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_state predefined value Started' do
    dsc_xdscwebservice[:dsc_state] = 'Started'
    expect(dsc_xdscwebservice[:dsc_state]).to eq('Started')
  end

  it 'should accept dsc_state predefined value started' do
    dsc_xdscwebservice[:dsc_state] = 'started'
    expect(dsc_xdscwebservice[:dsc_state]).to eq('started')
  end

  it 'should accept dsc_state predefined value Stopped' do
    dsc_xdscwebservice[:dsc_state] = 'Stopped'
    expect(dsc_xdscwebservice[:dsc_state]).to eq('Stopped')
  end

  it 'should accept dsc_state predefined value stopped' do
    dsc_xdscwebservice[:dsc_state] = 'stopped'
    expect(dsc_xdscwebservice[:dsc_state]).to eq('stopped')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdscwebservice[:dsc_state] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_state' do
    expect{dsc_xdscwebservice[:dsc_state] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_state' do
    expect{dsc_xdscwebservice[:dsc_state] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_state' do
    expect{dsc_xdscwebservice[:dsc_state] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_state' do
    expect{dsc_xdscwebservice[:dsc_state] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_modulepath' do
    expect{dsc_xdscwebservice[:dsc_modulepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_modulepath' do
    expect{dsc_xdscwebservice[:dsc_modulepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_modulepath' do
    expect{dsc_xdscwebservice[:dsc_modulepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_modulepath' do
    expect{dsc_xdscwebservice[:dsc_modulepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_configurationpath' do
    expect{dsc_xdscwebservice[:dsc_configurationpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_configurationpath' do
    expect{dsc_xdscwebservice[:dsc_configurationpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_configurationpath' do
    expect{dsc_xdscwebservice[:dsc_configurationpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_configurationpath' do
    expect{dsc_xdscwebservice[:dsc_configurationpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_iscomplianceserver' do
    expect{dsc_xdscwebservice[:dsc_iscomplianceserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_iscomplianceserver' do
    dsc_xdscwebservice[:dsc_iscomplianceserver] = true
    expect(dsc_xdscwebservice[:dsc_iscomplianceserver]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_iscomplianceserver" do
    dsc_xdscwebservice[:dsc_iscomplianceserver] = 'true'
    expect(dsc_xdscwebservice[:dsc_iscomplianceserver]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_iscomplianceserver" do
    dsc_xdscwebservice[:dsc_iscomplianceserver] = 'false'
    expect(dsc_xdscwebservice[:dsc_iscomplianceserver]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_iscomplianceserver" do
    dsc_xdscwebservice[:dsc_iscomplianceserver] = 'True'
    expect(dsc_xdscwebservice[:dsc_iscomplianceserver]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_iscomplianceserver" do
    dsc_xdscwebservice[:dsc_iscomplianceserver] = 'False'
    expect(dsc_xdscwebservice[:dsc_iscomplianceserver]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_iscomplianceserver" do
    dsc_xdscwebservice[:dsc_iscomplianceserver] = :true
    expect(dsc_xdscwebservice[:dsc_iscomplianceserver]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_iscomplianceserver" do
    dsc_xdscwebservice[:dsc_iscomplianceserver] = :false
    expect(dsc_xdscwebservice[:dsc_iscomplianceserver]).to eq(false)
  end

  it 'should not accept int for dsc_iscomplianceserver' do
    expect{dsc_xdscwebservice[:dsc_iscomplianceserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_iscomplianceserver' do
    expect{dsc_xdscwebservice[:dsc_iscomplianceserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dscserverurl' do
    expect{dsc_xdscwebservice[:dsc_dscserverurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dscserverurl' do
    expect{dsc_xdscwebservice[:dsc_dscserverurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dscserverurl' do
    expect{dsc_xdscwebservice[:dsc_dscserverurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dscserverurl' do
    expect{dsc_xdscwebservice[:dsc_dscserverurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xdscwebservice)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xdscwebservice)
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
        dsc_xdscwebservice[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xdscwebservice[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xdscwebservice.original_parameters[:dsc_ensure] = 'present'
        dsc_xdscwebservice[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xdscwebservice)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdscwebservice[:ensure]).to eq(:present)
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
        dsc_xdscwebservice.original_parameters[:dsc_ensure] = 'absent'
        dsc_xdscwebservice[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xdscwebservice)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdscwebservice[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xdscwebservice)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xdscwebservice)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xDSCWebService as $MSFT_xDSCWebService1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xDSCWebService/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xdscwebservice[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xdscwebservice)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdscwebservice[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xdscwebservice[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xdscwebservice)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdscwebservice[:ensure]).to eq(:absent)
      end

    end

  end
end
