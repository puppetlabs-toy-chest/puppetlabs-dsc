#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xpowershellexecutionpolicy) do

  let :dsc_xpowershellexecutionpolicy do
    Puppet::Type.type(:dsc_xpowershellexecutionpolicy).new(
      :name     => 'foo',
      :dsc_executionpolicy => 'Bypass',
    )
  end

  it "should stringify normally" do
    expect(dsc_xpowershellexecutionpolicy.to_s).to eq("Dsc_xpowershellexecutionpolicy[foo]")
  end

  it 'should require that dsc_executionpolicy is specified' do
    #dsc_xpowershellexecutionpolicy[:dsc_executionpolicy]
    expect { Puppet::Type.type(:dsc_xpowershellexecutionpolicy).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_executionpolicy is a required attribute/)
  end

  it 'should accept dsc_executionpolicy predefined value Bypass' do
    dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = 'Bypass'
    expect(dsc_xpowershellexecutionpolicy[:dsc_executionpolicy]).to eq('Bypass')
  end

  it 'should accept dsc_executionpolicy predefined value bypass' do
    dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = 'bypass'
    expect(dsc_xpowershellexecutionpolicy[:dsc_executionpolicy]).to eq('bypass')
  end

  it 'should accept dsc_executionpolicy predefined value Restricted' do
    dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = 'Restricted'
    expect(dsc_xpowershellexecutionpolicy[:dsc_executionpolicy]).to eq('Restricted')
  end

  it 'should accept dsc_executionpolicy predefined value restricted' do
    dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = 'restricted'
    expect(dsc_xpowershellexecutionpolicy[:dsc_executionpolicy]).to eq('restricted')
  end

  it 'should accept dsc_executionpolicy predefined value AllSigned' do
    dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = 'AllSigned'
    expect(dsc_xpowershellexecutionpolicy[:dsc_executionpolicy]).to eq('AllSigned')
  end

  it 'should accept dsc_executionpolicy predefined value allsigned' do
    dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = 'allsigned'
    expect(dsc_xpowershellexecutionpolicy[:dsc_executionpolicy]).to eq('allsigned')
  end

  it 'should accept dsc_executionpolicy predefined value RemoteSigned' do
    dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = 'RemoteSigned'
    expect(dsc_xpowershellexecutionpolicy[:dsc_executionpolicy]).to eq('RemoteSigned')
  end

  it 'should accept dsc_executionpolicy predefined value remotesigned' do
    dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = 'remotesigned'
    expect(dsc_xpowershellexecutionpolicy[:dsc_executionpolicy]).to eq('remotesigned')
  end

  it 'should accept dsc_executionpolicy predefined value Unrestricted' do
    dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = 'Unrestricted'
    expect(dsc_xpowershellexecutionpolicy[:dsc_executionpolicy]).to eq('Unrestricted')
  end

  it 'should accept dsc_executionpolicy predefined value unrestricted' do
    dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = 'unrestricted'
    expect(dsc_xpowershellexecutionpolicy[:dsc_executionpolicy]).to eq('unrestricted')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_executionpolicy' do
    expect{dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_executionpolicy' do
    expect{dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_executionpolicy' do
    expect{dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_executionpolicy' do
    expect{dsc_xpowershellexecutionpolicy[:dsc_executionpolicy] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xpowershellexecutionpolicy)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xpowershellexecutionpolicy)
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

  end
end
