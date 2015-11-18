#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xscspfserver) do

  let :dsc_xscspfserver do
    Puppet::Type.type(:dsc_xscspfserver).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xscspfserver.to_s).to eq("Dsc_xscspfserver[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xscspfserver[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xscspfserver[:dsc_ensure] = 'Present'
    expect(dsc_xscspfserver[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xscspfserver[:dsc_ensure] = 'present'
    expect(dsc_xscspfserver[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscspfserver[:dsc_ensure] = 'present'
    expect(dsc_xscspfserver[:ensure]).to eq(dsc_xscspfserver[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xscspfserver[:dsc_ensure] = 'Absent'
    expect(dsc_xscspfserver[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xscspfserver[:dsc_ensure] = 'absent'
    expect(dsc_xscspfserver[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscspfserver[:dsc_ensure] = 'absent'
    expect(dsc_xscspfserver[:ensure]).to eq(dsc_xscspfserver[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscspfserver[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xscspfserver[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xscspfserver[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xscspfserver[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xscspfserver[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_name is specified' do
    #dsc_xscspfserver[:dsc_name]
    expect { Puppet::Type.type(:dsc_xscspfserver).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_servertype => 'VMM',
      :dsc_scspfadmincredential => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xscspfserver[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xscspfserver[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xscspfserver[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xscspfserver[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_servertype predefined value VMM' do
    dsc_xscspfserver[:dsc_servertype] = 'VMM'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('VMM')
  end

  it 'should accept dsc_servertype predefined value vmm' do
    dsc_xscspfserver[:dsc_servertype] = 'vmm'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('vmm')
  end

  it 'should accept dsc_servertype predefined value OM' do
    dsc_xscspfserver[:dsc_servertype] = 'OM'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('OM')
  end

  it 'should accept dsc_servertype predefined value om' do
    dsc_xscspfserver[:dsc_servertype] = 'om'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('om')
  end

  it 'should accept dsc_servertype predefined value DPM' do
    dsc_xscspfserver[:dsc_servertype] = 'DPM'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('DPM')
  end

  it 'should accept dsc_servertype predefined value dpm' do
    dsc_xscspfserver[:dsc_servertype] = 'dpm'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('dpm')
  end

  it 'should accept dsc_servertype predefined value OMDW' do
    dsc_xscspfserver[:dsc_servertype] = 'OMDW'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('OMDW')
  end

  it 'should accept dsc_servertype predefined value omdw' do
    dsc_xscspfserver[:dsc_servertype] = 'omdw'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('omdw')
  end

  it 'should accept dsc_servertype predefined value RDGateway' do
    dsc_xscspfserver[:dsc_servertype] = 'RDGateway'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('RDGateway')
  end

  it 'should accept dsc_servertype predefined value rdgateway' do
    dsc_xscspfserver[:dsc_servertype] = 'rdgateway'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('rdgateway')
  end

  it 'should accept dsc_servertype predefined value Orchestrator' do
    dsc_xscspfserver[:dsc_servertype] = 'Orchestrator'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('Orchestrator')
  end

  it 'should accept dsc_servertype predefined value orchestrator' do
    dsc_xscspfserver[:dsc_servertype] = 'orchestrator'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('orchestrator')
  end

  it 'should accept dsc_servertype predefined value None' do
    dsc_xscspfserver[:dsc_servertype] = 'None'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('None')
  end

  it 'should accept dsc_servertype predefined value none' do
    dsc_xscspfserver[:dsc_servertype] = 'none'
    expect(dsc_xscspfserver[:dsc_servertype]).to eq('none')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscspfserver[:dsc_servertype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_servertype' do
    expect{dsc_xscspfserver[:dsc_servertype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servertype' do
    expect{dsc_xscspfserver[:dsc_servertype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servertype' do
    expect{dsc_xscspfserver[:dsc_servertype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servertype' do
    expect{dsc_xscspfserver[:dsc_servertype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_scspfadmincredential" do
    expect{dsc_xscspfserver[:dsc_scspfadmincredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scspfadmincredential' do
    expect{dsc_xscspfserver[:dsc_scspfadmincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scspfadmincredential' do
    expect{dsc_xscspfserver[:dsc_scspfadmincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scspfadmincredential' do
    expect{dsc_xscspfserver[:dsc_scspfadmincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scspfadmincredential' do
    expect{dsc_xscspfserver[:dsc_scspfadmincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xscspfserver)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xscspfserver)
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
        dsc_xscspfserver.original_parameters[:dsc_ensure] = 'present'
        dsc_xscspfserver[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xscspfserver)
      end

      it "should update :ensure to :present" do
        expect(dsc_xscspfserver[:ensure]).to eq(:present)
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
        dsc_xscspfserver.original_parameters[:dsc_ensure] = 'absent'
        dsc_xscspfserver[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xscspfserver)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xscspfserver[:ensure]).to eq(:absent)
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
