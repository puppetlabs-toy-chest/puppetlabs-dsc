#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwebpackagedeploy) do

  let :dsc_xwebpackagedeploy do
    Puppet::Type.type(:dsc_xwebpackagedeploy).new(
      :name     => 'foo',
      :dsc_destination => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwebpackagedeploy.to_s).to eq("Dsc_xwebpackagedeploy[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xwebpackagedeploy[:ensure]).to eq :present
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xwebpackagedeploy[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xwebpackagedeploy[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xwebpackagedeploy[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xwebpackagedeploy[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_destination is specified' do
    #dsc_xwebpackagedeploy[:dsc_destination]
    expect { Puppet::Type.type(:dsc_xwebpackagedeploy).new(
      :name     => 'foo',
      :dsc_sourcepath => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_destination is a required attribute/)
  end

  it 'should not accept array for dsc_destination' do
    expect{dsc_xwebpackagedeploy[:dsc_destination] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_destination' do
    expect{dsc_xwebpackagedeploy[:dsc_destination] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_destination' do
    expect{dsc_xwebpackagedeploy[:dsc_destination] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_destination' do
    expect{dsc_xwebpackagedeploy[:dsc_destination] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xwebpackagedeploy[:dsc_ensure] = 'Present'
    expect(dsc_xwebpackagedeploy[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xwebpackagedeploy[:dsc_ensure] = 'present'
    expect(dsc_xwebpackagedeploy[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebpackagedeploy[:dsc_ensure] = 'present'
    expect(dsc_xwebpackagedeploy[:ensure]).to eq(dsc_xwebpackagedeploy.provider.munge_ensure(dsc_xwebpackagedeploy[:dsc_ensure].downcase).to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xwebpackagedeploy[:dsc_ensure] = 'Absent'
    expect(dsc_xwebpackagedeploy[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xwebpackagedeploy[:dsc_ensure] = 'absent'
    expect(dsc_xwebpackagedeploy[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebpackagedeploy[:dsc_ensure] = 'absent'
    expect(dsc_xwebpackagedeploy[:ensure]).to eq(dsc_xwebpackagedeploy.provider.munge_ensure(dsc_xwebpackagedeploy[:dsc_ensure].downcase).to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebpackagedeploy[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xwebpackagedeploy[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xwebpackagedeploy[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xwebpackagedeploy[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xwebpackagedeploy[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwebpackagedeploy)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwebpackagedeploy)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

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
        dsc_xwebpackagedeploy.original_parameters[:dsc_ensure] = 'present'
        dsc_xwebpackagedeploy[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xwebpackagedeploy)
      end

      it "should update :ensure to :present" do
        expect(dsc_xwebpackagedeploy[:ensure]).to eq(:present)
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
        dsc_xwebpackagedeploy.original_parameters[:dsc_ensure] = 'present'
        dsc_xwebpackagedeploy[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xwebpackagedeploy)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xwebpackagedeploy[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

  end
end
