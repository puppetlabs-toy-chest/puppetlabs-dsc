#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdnsserversecondaryzone) do

  let :dsc_xdnsserversecondaryzone do
    Puppet::Type.type(:dsc_xdnsserversecondaryzone).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xdnsserversecondaryzone.to_s).to eq("Dsc_xdnsserversecondaryzone[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xdnsserversecondaryzone[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xdnsserversecondaryzone[:dsc_name]
    expect { Puppet::Type.type(:dsc_xdnsserversecondaryzone).new(
      :name     => 'foo',
      :dsc_masterservers => ["foo", "bar", "spec"],
      :dsc_ensure => 'Present',
      :dsc_type => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xdnsserversecondaryzone[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xdnsserversecondaryzone[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xdnsserversecondaryzone[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xdnsserversecondaryzone[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_masterservers' do
    dsc_xdnsserversecondaryzone[:dsc_masterservers] = ["foo", "bar", "spec"]
    expect(dsc_xdnsserversecondaryzone[:dsc_masterservers]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_masterservers' do
    expect{dsc_xdnsserversecondaryzone[:dsc_masterservers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_masterservers' do
    expect{dsc_xdnsserversecondaryzone[:dsc_masterservers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_masterservers' do
    expect{dsc_xdnsserversecondaryzone[:dsc_masterservers] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xdnsserversecondaryzone[:dsc_ensure] = 'Present'
    expect(dsc_xdnsserversecondaryzone[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xdnsserversecondaryzone[:dsc_ensure] = 'present'
    expect(dsc_xdnsserversecondaryzone[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdnsserversecondaryzone[:dsc_ensure] = 'present'
    expect(dsc_xdnsserversecondaryzone[:ensure]).to eq(dsc_xdnsserversecondaryzone[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xdnsserversecondaryzone[:dsc_ensure] = 'Absent'
    expect(dsc_xdnsserversecondaryzone[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xdnsserversecondaryzone[:dsc_ensure] = 'absent'
    expect(dsc_xdnsserversecondaryzone[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdnsserversecondaryzone[:dsc_ensure] = 'absent'
    expect(dsc_xdnsserversecondaryzone[:ensure]).to eq(dsc_xdnsserversecondaryzone[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdnsserversecondaryzone[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xdnsserversecondaryzone[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xdnsserversecondaryzone[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xdnsserversecondaryzone[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xdnsserversecondaryzone[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_type' do
    expect{dsc_xdnsserversecondaryzone[:dsc_type] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_type' do
    expect{dsc_xdnsserversecondaryzone[:dsc_type] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_type' do
    expect{dsc_xdnsserversecondaryzone[:dsc_type] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_type' do
    expect{dsc_xdnsserversecondaryzone[:dsc_type] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdnsserversecondaryzone)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdnsserversecondaryzone)
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
        dsc_xdnsserversecondaryzone.original_parameters[:dsc_ensure] = 'present'
        dsc_xdnsserversecondaryzone[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xdnsserversecondaryzone)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdnsserversecondaryzone[:ensure]).to eq(:present)
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
        dsc_xdnsserversecondaryzone.original_parameters[:dsc_ensure] = 'absent'
        dsc_xdnsserversecondaryzone[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xdnsserversecondaryzone)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdnsserversecondaryzone[:ensure]).to eq(:absent)
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
