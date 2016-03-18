#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_environment) do

  let :dsc_environment do
    Puppet::Type.type(:dsc_environment).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_environment).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_value => 'foo',
      :dsc_ensure => 'Present',
      :dsc_path => true,
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_environment.to_s).to eq("Dsc_environment[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_environment[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_environment[:dsc_name]
    expect { Puppet::Type.type(:dsc_environment).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_environment[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_environment[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_environment[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_environment[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_value' do
    expect{dsc_environment[:dsc_value] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_value' do
    expect{dsc_environment[:dsc_value] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_value' do
    expect{dsc_environment[:dsc_value] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_value' do
    expect{dsc_environment[:dsc_value] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_environment[:dsc_ensure] = 'Present'
    expect(dsc_environment[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_environment[:dsc_ensure] = 'present'
    expect(dsc_environment[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_environment[:dsc_ensure] = 'present'
    expect(dsc_environment[:ensure]).to eq(dsc_environment[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_environment[:dsc_ensure] = 'Absent'
    expect(dsc_environment[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_environment[:dsc_ensure] = 'absent'
    expect(dsc_environment[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_environment[:dsc_ensure] = 'absent'
    expect(dsc_environment[:ensure]).to eq(dsc_environment[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_environment[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_environment[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_environment[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_environment[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_environment[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_environment[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_path' do
    dsc_environment[:dsc_path] = true
    expect(dsc_environment[:dsc_path]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_path" do
    dsc_environment[:dsc_path] = 'true'
    expect(dsc_environment[:dsc_path]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_path" do
    dsc_environment[:dsc_path] = 'false'
    expect(dsc_environment[:dsc_path]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_path" do
    dsc_environment[:dsc_path] = 'True'
    expect(dsc_environment[:dsc_path]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_path" do
    dsc_environment[:dsc_path] = 'False'
    expect(dsc_environment[:dsc_path]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_path" do
    dsc_environment[:dsc_path] = :true
    expect(dsc_environment[:dsc_path]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_path" do
    dsc_environment[:dsc_path] = :false
    expect(dsc_environment[:dsc_path]).to eq(false)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_environment[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_environment[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_environment)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_environment)
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
        dsc_environment.original_parameters[:dsc_ensure] = 'present'
        dsc_environment[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_environment)
      end

      it "should update :ensure to :present" do
        expect(dsc_environment[:ensure]).to eq(:present)
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
        dsc_environment.original_parameters[:dsc_ensure] = 'absent'
        dsc_environment[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_environment)
      end

      it "should update :ensure to :absent" do
        expect(dsc_environment[:ensure]).to eq(:absent)
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
