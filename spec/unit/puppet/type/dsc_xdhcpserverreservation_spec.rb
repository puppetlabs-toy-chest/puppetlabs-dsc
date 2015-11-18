#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdhcpserverreservation) do

  let :dsc_xdhcpserverreservation do
    Puppet::Type.type(:dsc_xdhcpserverreservation).new(
      :name     => 'foo',
      :dsc_scopeid => 'foo',
      :dsc_ipaddress => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xdhcpserverreservation.to_s).to eq("Dsc_xdhcpserverreservation[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xdhcpserverreservation[:ensure]).to eq :present
  end

  it 'should require that dsc_scopeid is specified' do
    #dsc_xdhcpserverreservation[:dsc_scopeid]
    expect { Puppet::Type.type(:dsc_xdhcpserverreservation).new(
      :name     => 'foo',
      :dsc_ipaddress => 'foo',
      :dsc_clientmacaddress => 'foo',
      :dsc_name => 'foo',
      :dsc_addressfamily => 'IPv4',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_scopeid is a required attribute/)
  end

  it 'should not accept array for dsc_scopeid' do
    expect{dsc_xdhcpserverreservation[:dsc_scopeid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scopeid' do
    expect{dsc_xdhcpserverreservation[:dsc_scopeid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scopeid' do
    expect{dsc_xdhcpserverreservation[:dsc_scopeid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scopeid' do
    expect{dsc_xdhcpserverreservation[:dsc_scopeid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_ipaddress is specified' do
    #dsc_xdhcpserverreservation[:dsc_ipaddress]
    expect { Puppet::Type.type(:dsc_xdhcpserverreservation).new(
      :name     => 'foo',
      :dsc_scopeid => 'foo',
      :dsc_clientmacaddress => 'foo',
      :dsc_name => 'foo',
      :dsc_addressfamily => 'IPv4',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_ipaddress is a required attribute/)
  end

  it 'should not accept array for dsc_ipaddress' do
    expect{dsc_xdhcpserverreservation[:dsc_ipaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ipaddress' do
    expect{dsc_xdhcpserverreservation[:dsc_ipaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ipaddress' do
    expect{dsc_xdhcpserverreservation[:dsc_ipaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ipaddress' do
    expect{dsc_xdhcpserverreservation[:dsc_ipaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_clientmacaddress' do
    expect{dsc_xdhcpserverreservation[:dsc_clientmacaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_clientmacaddress' do
    expect{dsc_xdhcpserverreservation[:dsc_clientmacaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_clientmacaddress' do
    expect{dsc_xdhcpserverreservation[:dsc_clientmacaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_clientmacaddress' do
    expect{dsc_xdhcpserverreservation[:dsc_clientmacaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xdhcpserverreservation[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xdhcpserverreservation[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xdhcpserverreservation[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xdhcpserverreservation[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_addressfamily predefined value IPv4' do
    dsc_xdhcpserverreservation[:dsc_addressfamily] = 'IPv4'
    expect(dsc_xdhcpserverreservation[:dsc_addressfamily]).to eq('IPv4')
  end

  it 'should accept dsc_addressfamily predefined value ipv4' do
    dsc_xdhcpserverreservation[:dsc_addressfamily] = 'ipv4'
    expect(dsc_xdhcpserverreservation[:dsc_addressfamily]).to eq('ipv4')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdhcpserverreservation[:dsc_addressfamily] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_addressfamily' do
    expect{dsc_xdhcpserverreservation[:dsc_addressfamily] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_addressfamily' do
    expect{dsc_xdhcpserverreservation[:dsc_addressfamily] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_addressfamily' do
    expect{dsc_xdhcpserverreservation[:dsc_addressfamily] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_addressfamily' do
    expect{dsc_xdhcpserverreservation[:dsc_addressfamily] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xdhcpserverreservation[:dsc_ensure] = 'Present'
    expect(dsc_xdhcpserverreservation[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xdhcpserverreservation[:dsc_ensure] = 'present'
    expect(dsc_xdhcpserverreservation[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdhcpserverreservation[:dsc_ensure] = 'present'
    expect(dsc_xdhcpserverreservation[:ensure]).to eq(dsc_xdhcpserverreservation[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xdhcpserverreservation[:dsc_ensure] = 'Absent'
    expect(dsc_xdhcpserverreservation[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xdhcpserverreservation[:dsc_ensure] = 'absent'
    expect(dsc_xdhcpserverreservation[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdhcpserverreservation[:dsc_ensure] = 'absent'
    expect(dsc_xdhcpserverreservation[:ensure]).to eq(dsc_xdhcpserverreservation[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdhcpserverreservation[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xdhcpserverreservation[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xdhcpserverreservation[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xdhcpserverreservation[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xdhcpserverreservation[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdhcpserverreservation)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdhcpserverreservation)
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
        dsc_xdhcpserverreservation.original_parameters[:dsc_ensure] = 'present'
        dsc_xdhcpserverreservation[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xdhcpserverreservation)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdhcpserverreservation[:ensure]).to eq(:present)
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
        dsc_xdhcpserverreservation.original_parameters[:dsc_ensure] = 'absent'
        dsc_xdhcpserverreservation[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xdhcpserverreservation)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdhcpserverreservation[:ensure]).to eq(:absent)
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
