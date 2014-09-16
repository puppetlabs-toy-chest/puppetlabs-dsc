#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xipaddress) do

  let :dsc_xipaddress do
    Puppet::Type.type(:dsc_xipaddress).new(
      :name     => 'foo',
      :dsc_ipaddress => 'foo',
      :dsc_interfacealias => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xipaddress.to_s).to eq("Dsc_xipaddress[foo]")
  end

  it 'should require that dsc_ipaddress is specified' do
    #dsc_xipaddress[:dsc_ipaddress]
    expect { Puppet::Type.type(:dsc_xipaddress).new(
      :name     => 'foo',
      :dsc_interfacealias => 'foo',
      :dsc_defaultgateway => 'foo',
      :dsc_subnetmask => 32,
      :dsc_addressfamily => 'IPv4',
    )}.to raise_error(Puppet::Error, /dsc_ipaddress is a required attribute/)
  end

  it 'should not accept array for dsc_ipaddress' do
    expect{dsc_xipaddress[:dsc_ipaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ipaddress' do
    expect{dsc_xipaddress[:dsc_ipaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ipaddress' do
    expect{dsc_xipaddress[:dsc_ipaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ipaddress' do
    expect{dsc_xipaddress[:dsc_ipaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_interfacealias is specified' do
    #dsc_xipaddress[:dsc_interfacealias]
    expect { Puppet::Type.type(:dsc_xipaddress).new(
      :name     => 'foo',
      :dsc_ipaddress => 'foo',
      :dsc_defaultgateway => 'foo',
      :dsc_subnetmask => 32,
      :dsc_addressfamily => 'IPv4',
    )}.to raise_error(Puppet::Error, /dsc_interfacealias is a required attribute/)
  end

  it 'should not accept array for dsc_interfacealias' do
    expect{dsc_xipaddress[:dsc_interfacealias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_interfacealias' do
    expect{dsc_xipaddress[:dsc_interfacealias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_interfacealias' do
    expect{dsc_xipaddress[:dsc_interfacealias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_interfacealias' do
    expect{dsc_xipaddress[:dsc_interfacealias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_defaultgateway' do
    expect{dsc_xipaddress[:dsc_defaultgateway] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_defaultgateway' do
    expect{dsc_xipaddress[:dsc_defaultgateway] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_defaultgateway' do
    expect{dsc_xipaddress[:dsc_defaultgateway] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_defaultgateway' do
    expect{dsc_xipaddress[:dsc_defaultgateway] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_subnetmask' do
    expect{dsc_xipaddress[:dsc_subnetmask] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_subnetmask' do
    expect{dsc_xipaddress[:dsc_subnetmask] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_subnetmask' do
    expect{dsc_xipaddress[:dsc_subnetmask] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_subnetmask' do
    dsc_xipaddress[:dsc_subnetmask] = 32
    expect(dsc_xipaddress[:dsc_subnetmask]).to eq(32)
  end


  it 'should accept string-like int for dsc_subnetmask' do
    dsc_xipaddress[:dsc_subnetmask] = '16'
    expect(dsc_xipaddress[:dsc_subnetmask]).to eq(16)
  end


  it 'should accept string-like int for dsc_subnetmask' do
    dsc_xipaddress[:dsc_subnetmask] = '32'
    expect(dsc_xipaddress[:dsc_subnetmask]).to eq(32)
  end


  it 'should accept string-like int for dsc_subnetmask' do
    dsc_xipaddress[:dsc_subnetmask] = '64'
    expect(dsc_xipaddress[:dsc_subnetmask]).to eq(64)
  end

  it 'should accept dsc_addressfamily predefined value IPv4' do
    dsc_xipaddress[:dsc_addressfamily] = 'IPv4'
    expect(dsc_xipaddress[:dsc_addressfamily]).to eq('IPv4')
  end

  it 'should accept dsc_addressfamily predefined value ipv4' do
    dsc_xipaddress[:dsc_addressfamily] = 'ipv4'
    expect(dsc_xipaddress[:dsc_addressfamily]).to eq('ipv4')
  end

  it 'should accept dsc_addressfamily predefined value IPv6' do
    dsc_xipaddress[:dsc_addressfamily] = 'IPv6'
    expect(dsc_xipaddress[:dsc_addressfamily]).to eq('IPv6')
  end

  it 'should accept dsc_addressfamily predefined value ipv6' do
    dsc_xipaddress[:dsc_addressfamily] = 'ipv6'
    expect(dsc_xipaddress[:dsc_addressfamily]).to eq('ipv6')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xipaddress[:dsc_addressfamily] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_addressfamily' do
    expect{dsc_xipaddress[:dsc_addressfamily] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_addressfamily' do
    expect{dsc_xipaddress[:dsc_addressfamily] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_addressfamily' do
    expect{dsc_xipaddress[:dsc_addressfamily] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_addressfamily' do
    expect{dsc_xipaddress[:dsc_addressfamily] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xipaddress)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xipaddress)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Import-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script with Import-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Import-DscResource/)
      end

    end

    describe "when dscmeta_import_resource is false" do

      it "should compute powershell dsc test script without Import-DscResource" do
        dsc_xipaddress[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xipaddress[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xipaddress)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xipaddress)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xIPAddress as $MSFT_xIPAddress1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xIPAddress/)
    end


  end
end
