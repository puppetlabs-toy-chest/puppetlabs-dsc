#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdhcpserveroption) do

  let :dsc_xdhcpserveroption do
    Puppet::Type.type(:dsc_xdhcpserveroption).new(
      :name     => 'foo',
      :dsc_scopeid => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xdhcpserveroption.to_s).to eq("Dsc_xdhcpserveroption[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xdhcpserveroption[:ensure]).to eq :present
  end

  it 'should require that dsc_scopeid is specified' do
    #dsc_xdhcpserveroption[:dsc_scopeid]
    expect { Puppet::Type.type(:dsc_xdhcpserveroption).new(
      :name     => 'foo',
      :dsc_dnsserveripaddress => ["foo", "bar", "spec"],
      :dsc_dnsdomain => 'foo',
      :dsc_router => ["foo", "bar", "spec"],
      :dsc_addressfamily => 'IPv4',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_scopeid is a required attribute/)
  end

  it 'should not accept array for dsc_scopeid' do
    expect{dsc_xdhcpserveroption[:dsc_scopeid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scopeid' do
    expect{dsc_xdhcpserveroption[:dsc_scopeid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scopeid' do
    expect{dsc_xdhcpserveroption[:dsc_scopeid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scopeid' do
    expect{dsc_xdhcpserveroption[:dsc_scopeid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_dnsserveripaddress' do
    dsc_xdhcpserveroption[:dsc_dnsserveripaddress] = ["foo", "bar", "spec"]
    expect(dsc_xdhcpserveroption[:dsc_dnsserveripaddress]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_dnsserveripaddress' do
    expect{dsc_xdhcpserveroption[:dsc_dnsserveripaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dnsserveripaddress' do
    expect{dsc_xdhcpserveroption[:dsc_dnsserveripaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dnsserveripaddress' do
    expect{dsc_xdhcpserveroption[:dsc_dnsserveripaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dnsdomain' do
    expect{dsc_xdhcpserveroption[:dsc_dnsdomain] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dnsdomain' do
    expect{dsc_xdhcpserveroption[:dsc_dnsdomain] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dnsdomain' do
    expect{dsc_xdhcpserveroption[:dsc_dnsdomain] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dnsdomain' do
    expect{dsc_xdhcpserveroption[:dsc_dnsdomain] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_router' do
    dsc_xdhcpserveroption[:dsc_router] = ["foo", "bar", "spec"]
    expect(dsc_xdhcpserveroption[:dsc_router]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_router' do
    expect{dsc_xdhcpserveroption[:dsc_router] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_router' do
    expect{dsc_xdhcpserveroption[:dsc_router] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_router' do
    expect{dsc_xdhcpserveroption[:dsc_router] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_addressfamily predefined value IPv4' do
    dsc_xdhcpserveroption[:dsc_addressfamily] = 'IPv4'
    expect(dsc_xdhcpserveroption[:dsc_addressfamily]).to eq('IPv4')
  end

  it 'should accept dsc_addressfamily predefined value ipv4' do
    dsc_xdhcpserveroption[:dsc_addressfamily] = 'ipv4'
    expect(dsc_xdhcpserveroption[:dsc_addressfamily]).to eq('ipv4')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdhcpserveroption[:dsc_addressfamily] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_addressfamily' do
    expect{dsc_xdhcpserveroption[:dsc_addressfamily] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_addressfamily' do
    expect{dsc_xdhcpserveroption[:dsc_addressfamily] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_addressfamily' do
    expect{dsc_xdhcpserveroption[:dsc_addressfamily] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_addressfamily' do
    expect{dsc_xdhcpserveroption[:dsc_addressfamily] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xdhcpserveroption[:dsc_ensure] = 'Present'
    expect(dsc_xdhcpserveroption[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xdhcpserveroption[:dsc_ensure] = 'present'
    expect(dsc_xdhcpserveroption[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdhcpserveroption[:dsc_ensure] = 'present'
    expect(dsc_xdhcpserveroption[:ensure]).to eq(dsc_xdhcpserveroption[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xdhcpserveroption[:dsc_ensure] = 'Absent'
    expect(dsc_xdhcpserveroption[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xdhcpserveroption[:dsc_ensure] = 'absent'
    expect(dsc_xdhcpserveroption[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdhcpserveroption[:dsc_ensure] = 'absent'
    expect(dsc_xdhcpserveroption[:ensure]).to eq(dsc_xdhcpserveroption[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdhcpserveroption[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xdhcpserveroption[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xdhcpserveroption[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xdhcpserveroption[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xdhcpserveroption[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdhcpserveroption)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdhcpserveroption)
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
        dsc_xdhcpserveroption.original_parameters[:dsc_ensure] = 'present'
        dsc_xdhcpserveroption[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xdhcpserveroption)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdhcpserveroption[:ensure]).to eq(:present)
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
        dsc_xdhcpserveroption.original_parameters[:dsc_ensure] = 'absent'
        dsc_xdhcpserveroption[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xdhcpserveroption)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdhcpserveroption[:ensure]).to eq(:absent)
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
