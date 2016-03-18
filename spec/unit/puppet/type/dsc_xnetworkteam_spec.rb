#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xnetworkteam) do

  let :dsc_xnetworkteam do
    Puppet::Type.type(:dsc_xnetworkteam).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xnetworkteam.to_s).to eq("Dsc_xnetworkteam[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xnetworkteam[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xnetworkteam[:dsc_name]
    expect { Puppet::Type.type(:dsc_xnetworkteam).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xnetworkteam[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xnetworkteam[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xnetworkteam[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xnetworkteam[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_teamingmode predefined value SwitchIndependent' do
    dsc_xnetworkteam[:dsc_teamingmode] = 'SwitchIndependent'
    expect(dsc_xnetworkteam[:dsc_teamingmode]).to eq('SwitchIndependent')
  end

  it 'should accept dsc_teamingmode predefined value switchindependent' do
    dsc_xnetworkteam[:dsc_teamingmode] = 'switchindependent'
    expect(dsc_xnetworkteam[:dsc_teamingmode]).to eq('switchindependent')
  end

  it 'should accept dsc_teamingmode predefined value LACP' do
    dsc_xnetworkteam[:dsc_teamingmode] = 'LACP'
    expect(dsc_xnetworkteam[:dsc_teamingmode]).to eq('LACP')
  end

  it 'should accept dsc_teamingmode predefined value lacp' do
    dsc_xnetworkteam[:dsc_teamingmode] = 'lacp'
    expect(dsc_xnetworkteam[:dsc_teamingmode]).to eq('lacp')
  end

  it 'should accept dsc_teamingmode predefined value Static' do
    dsc_xnetworkteam[:dsc_teamingmode] = 'Static'
    expect(dsc_xnetworkteam[:dsc_teamingmode]).to eq('Static')
  end

  it 'should accept dsc_teamingmode predefined value static' do
    dsc_xnetworkteam[:dsc_teamingmode] = 'static'
    expect(dsc_xnetworkteam[:dsc_teamingmode]).to eq('static')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xnetworkteam[:dsc_teamingmode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_teamingmode' do
    expect{dsc_xnetworkteam[:dsc_teamingmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_teamingmode' do
    expect{dsc_xnetworkteam[:dsc_teamingmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_teamingmode' do
    expect{dsc_xnetworkteam[:dsc_teamingmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_teamingmode' do
    expect{dsc_xnetworkteam[:dsc_teamingmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_loadbalancingalgorithm predefined value Dynamic' do
    dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = 'Dynamic'
    expect(dsc_xnetworkteam[:dsc_loadbalancingalgorithm]).to eq('Dynamic')
  end

  it 'should accept dsc_loadbalancingalgorithm predefined value dynamic' do
    dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = 'dynamic'
    expect(dsc_xnetworkteam[:dsc_loadbalancingalgorithm]).to eq('dynamic')
  end

  it 'should accept dsc_loadbalancingalgorithm predefined value HyperVPort' do
    dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = 'HyperVPort'
    expect(dsc_xnetworkteam[:dsc_loadbalancingalgorithm]).to eq('HyperVPort')
  end

  it 'should accept dsc_loadbalancingalgorithm predefined value hypervport' do
    dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = 'hypervport'
    expect(dsc_xnetworkteam[:dsc_loadbalancingalgorithm]).to eq('hypervport')
  end

  it 'should accept dsc_loadbalancingalgorithm predefined value IPAddresses' do
    dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = 'IPAddresses'
    expect(dsc_xnetworkteam[:dsc_loadbalancingalgorithm]).to eq('IPAddresses')
  end

  it 'should accept dsc_loadbalancingalgorithm predefined value ipaddresses' do
    dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = 'ipaddresses'
    expect(dsc_xnetworkteam[:dsc_loadbalancingalgorithm]).to eq('ipaddresses')
  end

  it 'should accept dsc_loadbalancingalgorithm predefined value MacAddresses' do
    dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = 'MacAddresses'
    expect(dsc_xnetworkteam[:dsc_loadbalancingalgorithm]).to eq('MacAddresses')
  end

  it 'should accept dsc_loadbalancingalgorithm predefined value macaddresses' do
    dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = 'macaddresses'
    expect(dsc_xnetworkteam[:dsc_loadbalancingalgorithm]).to eq('macaddresses')
  end

  it 'should accept dsc_loadbalancingalgorithm predefined value TransportPorts' do
    dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = 'TransportPorts'
    expect(dsc_xnetworkteam[:dsc_loadbalancingalgorithm]).to eq('TransportPorts')
  end

  it 'should accept dsc_loadbalancingalgorithm predefined value transportports' do
    dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = 'transportports'
    expect(dsc_xnetworkteam[:dsc_loadbalancingalgorithm]).to eq('transportports')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_loadbalancingalgorithm' do
    expect{dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_loadbalancingalgorithm' do
    expect{dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_loadbalancingalgorithm' do
    expect{dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_loadbalancingalgorithm' do
    expect{dsc_xnetworkteam[:dsc_loadbalancingalgorithm] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_teammembers' do
    dsc_xnetworkteam[:dsc_teammembers] = ["foo", "bar", "spec"]
    expect(dsc_xnetworkteam[:dsc_teammembers]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_teammembers' do
    expect{dsc_xnetworkteam[:dsc_teammembers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_teammembers' do
    expect{dsc_xnetworkteam[:dsc_teammembers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_teammembers' do
    expect{dsc_xnetworkteam[:dsc_teammembers] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xnetworkteam[:dsc_ensure] = 'Present'
    expect(dsc_xnetworkteam[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xnetworkteam[:dsc_ensure] = 'present'
    expect(dsc_xnetworkteam[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xnetworkteam[:dsc_ensure] = 'present'
    expect(dsc_xnetworkteam[:ensure]).to eq(dsc_xnetworkteam[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xnetworkteam[:dsc_ensure] = 'Absent'
    expect(dsc_xnetworkteam[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xnetworkteam[:dsc_ensure] = 'absent'
    expect(dsc_xnetworkteam[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xnetworkteam[:dsc_ensure] = 'absent'
    expect(dsc_xnetworkteam[:ensure]).to eq(dsc_xnetworkteam[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xnetworkteam[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xnetworkteam[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xnetworkteam[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xnetworkteam[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xnetworkteam[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xnetworkteam)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xnetworkteam)
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
        dsc_xnetworkteam.original_parameters[:dsc_ensure] = 'present'
        dsc_xnetworkteam[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xnetworkteam)
      end

      it "should update :ensure to :present" do
        expect(dsc_xnetworkteam[:ensure]).to eq(:present)
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
        dsc_xnetworkteam.original_parameters[:dsc_ensure] = 'absent'
        dsc_xnetworkteam[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xnetworkteam)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xnetworkteam[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
