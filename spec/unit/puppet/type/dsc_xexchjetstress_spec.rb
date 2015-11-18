#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchjetstress) do

  let :dsc_xexchjetstress do
    Puppet::Type.type(:dsc_xexchjetstress).new(
      :name     => 'foo',
      :dsc_type => 'Performance',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchjetstress.to_s).to eq("Dsc_xexchjetstress[foo]")
  end

  it 'should require that dsc_type is specified' do
    #dsc_xexchjetstress[:dsc_type]
    expect { Puppet::Type.type(:dsc_xexchjetstress).new(
      :name     => 'foo',
      :dsc_jetstresspath => 'foo',
      :dsc_jetstressparams => 'foo',
      :dsc_maxwaitminutes => 32,
      :dsc_minachievediops => 32,
    )}.to raise_error(Puppet::Error, /dsc_type is a required attribute/)
  end

  it 'should accept dsc_type predefined value Performance' do
    dsc_xexchjetstress[:dsc_type] = 'Performance'
    expect(dsc_xexchjetstress[:dsc_type]).to eq('Performance')
  end

  it 'should accept dsc_type predefined value performance' do
    dsc_xexchjetstress[:dsc_type] = 'performance'
    expect(dsc_xexchjetstress[:dsc_type]).to eq('performance')
  end

  it 'should accept dsc_type predefined value Stress' do
    dsc_xexchjetstress[:dsc_type] = 'Stress'
    expect(dsc_xexchjetstress[:dsc_type]).to eq('Stress')
  end

  it 'should accept dsc_type predefined value stress' do
    dsc_xexchjetstress[:dsc_type] = 'stress'
    expect(dsc_xexchjetstress[:dsc_type]).to eq('stress')
  end

  it 'should accept dsc_type predefined value DatabaseBackup' do
    dsc_xexchjetstress[:dsc_type] = 'DatabaseBackup'
    expect(dsc_xexchjetstress[:dsc_type]).to eq('DatabaseBackup')
  end

  it 'should accept dsc_type predefined value databasebackup' do
    dsc_xexchjetstress[:dsc_type] = 'databasebackup'
    expect(dsc_xexchjetstress[:dsc_type]).to eq('databasebackup')
  end

  it 'should accept dsc_type predefined value SoftRecovery' do
    dsc_xexchjetstress[:dsc_type] = 'SoftRecovery'
    expect(dsc_xexchjetstress[:dsc_type]).to eq('SoftRecovery')
  end

  it 'should accept dsc_type predefined value softrecovery' do
    dsc_xexchjetstress[:dsc_type] = 'softrecovery'
    expect(dsc_xexchjetstress[:dsc_type]).to eq('softrecovery')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchjetstress[:dsc_type] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_type' do
    expect{dsc_xexchjetstress[:dsc_type] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_type' do
    expect{dsc_xexchjetstress[:dsc_type] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_type' do
    expect{dsc_xexchjetstress[:dsc_type] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_type' do
    expect{dsc_xexchjetstress[:dsc_type] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_jetstresspath' do
    expect{dsc_xexchjetstress[:dsc_jetstresspath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_jetstresspath' do
    expect{dsc_xexchjetstress[:dsc_jetstresspath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_jetstresspath' do
    expect{dsc_xexchjetstress[:dsc_jetstresspath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_jetstresspath' do
    expect{dsc_xexchjetstress[:dsc_jetstresspath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_jetstressparams' do
    expect{dsc_xexchjetstress[:dsc_jetstressparams] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_jetstressparams' do
    expect{dsc_xexchjetstress[:dsc_jetstressparams] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_jetstressparams' do
    expect{dsc_xexchjetstress[:dsc_jetstressparams] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_jetstressparams' do
    expect{dsc_xexchjetstress[:dsc_jetstressparams] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxwaitminutes' do
    expect{dsc_xexchjetstress[:dsc_maxwaitminutes] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxwaitminutes' do
    expect{dsc_xexchjetstress[:dsc_maxwaitminutes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maxwaitminutes' do
    dsc_xexchjetstress[:dsc_maxwaitminutes] = 32
    expect(dsc_xexchjetstress[:dsc_maxwaitminutes]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_maxwaitminutes' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xexchjetstress[:dsc_maxwaitminutes] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_maxwaitminutes' do
    dsc_xexchjetstress[:dsc_maxwaitminutes] = '16'
    expect(dsc_xexchjetstress[:dsc_maxwaitminutes]).to eq(16)
  end

  it 'should accept string-like uint for dsc_maxwaitminutes' do
    dsc_xexchjetstress[:dsc_maxwaitminutes] = '32'
    expect(dsc_xexchjetstress[:dsc_maxwaitminutes]).to eq(32)
  end

  it 'should accept string-like uint for dsc_maxwaitminutes' do
    dsc_xexchjetstress[:dsc_maxwaitminutes] = '64'
    expect(dsc_xexchjetstress[:dsc_maxwaitminutes]).to eq(64)
  end

  it 'should not accept array for dsc_minachievediops' do
    expect{dsc_xexchjetstress[:dsc_minachievediops] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_minachievediops' do
    expect{dsc_xexchjetstress[:dsc_minachievediops] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_minachievediops' do
    dsc_xexchjetstress[:dsc_minachievediops] = 32
    expect(dsc_xexchjetstress[:dsc_minachievediops]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_minachievediops' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xexchjetstress[:dsc_minachievediops] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_minachievediops' do
    dsc_xexchjetstress[:dsc_minachievediops] = '16'
    expect(dsc_xexchjetstress[:dsc_minachievediops]).to eq(16)
  end

  it 'should accept string-like uint for dsc_minachievediops' do
    dsc_xexchjetstress[:dsc_minachievediops] = '32'
    expect(dsc_xexchjetstress[:dsc_minachievediops]).to eq(32)
  end

  it 'should accept string-like uint for dsc_minachievediops' do
    dsc_xexchjetstress[:dsc_minachievediops] = '64'
    expect(dsc_xexchjetstress[:dsc_minachievediops]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchjetstress)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchjetstress)
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
