#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xhostsfile) do

  let :dsc_xhostsfile do
    Puppet::Type.type(:dsc_xhostsfile).new(
      :name     => 'foo',
      :dsc_hostname => 'foo',
      :dsc_ipaddress => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xhostsfile).new(
      :name     => 'foo',
      :dsc_hostname => 'foo',
      :dsc_ipaddress => 'foo',
      :dsc_ensure => 'Present',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xhostsfile.to_s).to eq("Dsc_xhostsfile[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xhostsfile[:ensure]).to eq :present
  end

  it 'should require that dsc_hostname is specified' do
    #dsc_xhostsfile[:dsc_hostname]
    expect { Puppet::Type.type(:dsc_xhostsfile).new(
      :name     => 'foo',
      :dsc_ipaddress => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_hostname is a required attribute/)
  end

  it 'should not accept array for dsc_hostname' do
    expect{dsc_xhostsfile[:dsc_hostname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_hostname' do
    expect{dsc_xhostsfile[:dsc_hostname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_hostname' do
    expect{dsc_xhostsfile[:dsc_hostname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_hostname' do
    expect{dsc_xhostsfile[:dsc_hostname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_ipaddress is specified' do
    #dsc_xhostsfile[:dsc_ipaddress]
    expect { Puppet::Type.type(:dsc_xhostsfile).new(
      :name     => 'foo',
      :dsc_hostname => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_ipaddress is a required attribute/)
  end

  it 'should not accept array for dsc_ipaddress' do
    expect{dsc_xhostsfile[:dsc_ipaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ipaddress' do
    expect{dsc_xhostsfile[:dsc_ipaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ipaddress' do
    expect{dsc_xhostsfile[:dsc_ipaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ipaddress' do
    expect{dsc_xhostsfile[:dsc_ipaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xhostsfile[:dsc_ensure] = 'Present'
    expect(dsc_xhostsfile[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xhostsfile[:dsc_ensure] = 'present'
    expect(dsc_xhostsfile[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xhostsfile[:dsc_ensure] = 'present'
    expect(dsc_xhostsfile[:ensure]).to eq(dsc_xhostsfile[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xhostsfile[:dsc_ensure] = 'Absent'
    expect(dsc_xhostsfile[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xhostsfile[:dsc_ensure] = 'absent'
    expect(dsc_xhostsfile[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xhostsfile[:dsc_ensure] = 'absent'
    expect(dsc_xhostsfile[:ensure]).to eq(dsc_xhostsfile[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xhostsfile[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xhostsfile[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xhostsfile[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xhostsfile[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xhostsfile[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xhostsfile)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xhostsfile)
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
        dsc_xhostsfile.original_parameters[:dsc_ensure] = 'present'
        dsc_xhostsfile[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xhostsfile)
      end

      it "should update :ensure to :present" do
        expect(dsc_xhostsfile[:ensure]).to eq(:present)
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
        dsc_xhostsfile.original_parameters[:dsc_ensure] = 'absent'
        dsc_xhostsfile[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xhostsfile)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xhostsfile[:ensure]).to eq(:absent)
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
