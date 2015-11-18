#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xscvmmconsolesetup) do

  let :dsc_xscvmmconsolesetup do
    Puppet::Type.type(:dsc_xscvmmconsolesetup).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
    )
  end

  it "should stringify normally" do
    expect(dsc_xscvmmconsolesetup.to_s).to eq("Dsc_xscvmmconsolesetup[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xscvmmconsolesetup[:ensure]).to eq :present
  end

  it 'should require that dsc_ensure is specified' do
    #dsc_xscvmmconsolesetup[:dsc_ensure]
    expect { Puppet::Type.type(:dsc_xscvmmconsolesetup).new(
      :name     => 'foo',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
      :dsc_programfiles => 'foo',
      :dsc_indigotcpport => 16,
      :dsc_muoptin => 1,
    )}.to raise_error(Puppet::Error, /dsc_ensure is a required attribute/)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xscvmmconsolesetup[:dsc_ensure] = 'Present'
    expect(dsc_xscvmmconsolesetup[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xscvmmconsolesetup[:dsc_ensure] = 'present'
    expect(dsc_xscvmmconsolesetup[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscvmmconsolesetup[:dsc_ensure] = 'present'
    expect(dsc_xscvmmconsolesetup[:ensure]).to eq(dsc_xscvmmconsolesetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xscvmmconsolesetup[:dsc_ensure] = 'Absent'
    expect(dsc_xscvmmconsolesetup[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xscvmmconsolesetup[:dsc_ensure] = 'absent'
    expect(dsc_xscvmmconsolesetup[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscvmmconsolesetup[:dsc_ensure] = 'absent'
    expect(dsc_xscvmmconsolesetup[:ensure]).to eq(dsc_xscvmmconsolesetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscvmmconsolesetup[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xscvmmconsolesetup[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xscvmmconsolesetup[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xscvmmconsolesetup[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xscvmmconsolesetup[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xscvmmconsolesetup[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xscvmmconsolesetup[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xscvmmconsolesetup[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xscvmmconsolesetup[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefolder' do
    expect{dsc_xscvmmconsolesetup[:dsc_sourcefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefolder' do
    expect{dsc_xscvmmconsolesetup[:dsc_sourcefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefolder' do
    expect{dsc_xscvmmconsolesetup[:dsc_sourcefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefolder' do
    expect{dsc_xscvmmconsolesetup[:dsc_sourcefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_setupcredential" do
    expect{dsc_xscvmmconsolesetup[:dsc_setupcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setupcredential' do
    expect{dsc_xscvmmconsolesetup[:dsc_setupcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setupcredential' do
    expect{dsc_xscvmmconsolesetup[:dsc_setupcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setupcredential' do
    expect{dsc_xscvmmconsolesetup[:dsc_setupcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setupcredential' do
    expect{dsc_xscvmmconsolesetup[:dsc_setupcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_programfiles' do
    expect{dsc_xscvmmconsolesetup[:dsc_programfiles] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_programfiles' do
    expect{dsc_xscvmmconsolesetup[:dsc_programfiles] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_programfiles' do
    expect{dsc_xscvmmconsolesetup[:dsc_programfiles] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_programfiles' do
    expect{dsc_xscvmmconsolesetup[:dsc_programfiles] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_indigotcpport' do
    expect{dsc_xscvmmconsolesetup[:dsc_indigotcpport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_indigotcpport' do
    expect{dsc_xscvmmconsolesetup[:dsc_indigotcpport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_indigotcpport' do
    dsc_xscvmmconsolesetup[:dsc_indigotcpport] = 16
    expect(dsc_xscvmmconsolesetup[:dsc_indigotcpport]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_indigotcpport' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscvmmconsolesetup[:dsc_indigotcpport] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_indigotcpport' do
    dsc_xscvmmconsolesetup[:dsc_indigotcpport] = '16'
    expect(dsc_xscvmmconsolesetup[:dsc_indigotcpport]).to eq(16)
  end

  it 'should accept string-like uint for dsc_indigotcpport' do
    dsc_xscvmmconsolesetup[:dsc_indigotcpport] = '32'
    expect(dsc_xscvmmconsolesetup[:dsc_indigotcpport]).to eq(32)
  end

  it 'should accept string-like uint for dsc_indigotcpport' do
    dsc_xscvmmconsolesetup[:dsc_indigotcpport] = '64'
    expect(dsc_xscvmmconsolesetup[:dsc_indigotcpport]).to eq(64)
  end

  it 'should not accept array for dsc_muoptin' do
    expect{dsc_xscvmmconsolesetup[:dsc_muoptin] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_muoptin' do
    expect{dsc_xscvmmconsolesetup[:dsc_muoptin] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_muoptin' do
    dsc_xscvmmconsolesetup[:dsc_muoptin] = 1
    expect(dsc_xscvmmconsolesetup[:dsc_muoptin]).to eq(1)
  end

  it 'should not accept signed (negative) value for dsc_muoptin' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xscvmmconsolesetup[:dsc_muoptin] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_muoptin' do
    dsc_xscvmmconsolesetup[:dsc_muoptin] = '16'
    expect(dsc_xscvmmconsolesetup[:dsc_muoptin]).to eq(16)
  end

  it 'should accept string-like uint for dsc_muoptin' do
    dsc_xscvmmconsolesetup[:dsc_muoptin] = '32'
    expect(dsc_xscvmmconsolesetup[:dsc_muoptin]).to eq(32)
  end

  it 'should accept string-like uint for dsc_muoptin' do
    dsc_xscvmmconsolesetup[:dsc_muoptin] = '64'
    expect(dsc_xscvmmconsolesetup[:dsc_muoptin]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xscvmmconsolesetup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xscvmmconsolesetup)
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
        dsc_xscvmmconsolesetup.original_parameters[:dsc_ensure] = 'present'
        dsc_xscvmmconsolesetup[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xscvmmconsolesetup)
      end

      it "should update :ensure to :present" do
        expect(dsc_xscvmmconsolesetup[:ensure]).to eq(:present)
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
        dsc_xscvmmconsolesetup.original_parameters[:dsc_ensure] = 'absent'
        dsc_xscvmmconsolesetup[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xscvmmconsolesetup)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xscvmmconsolesetup[:ensure]).to eq(:absent)
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
