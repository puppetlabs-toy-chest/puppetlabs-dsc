#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdnsserveraddress) do

  let :dsc_xdnsserveraddress do
    Puppet::Type.type(:dsc_xdnsserveraddress).new(
      :name     => 'foo',
      :dsc_interfacealias => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xdnsserveraddress.to_s).to eq("Dsc_xdnsserveraddress[foo]")
  end

  it 'should accept array for dsc_address' do
    dsc_xdnsserveraddress[:dsc_address] = ["foo", "bar", "spec"]
    expect(dsc_xdnsserveraddress[:dsc_address]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_address' do
    expect{dsc_xdnsserveraddress[:dsc_address] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_address' do
    expect{dsc_xdnsserveraddress[:dsc_address] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_address' do
    expect{dsc_xdnsserveraddress[:dsc_address] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_interfacealias is specified' do
    #dsc_xdnsserveraddress[:dsc_interfacealias]
    expect { Puppet::Type.type(:dsc_xdnsserveraddress).new(
      :name     => 'foo',
      :dsc_address => ["foo", "bar", "spec"],
      :dsc_addressfamily => 'IPv4',
    )}.to raise_error(Puppet::Error, /dsc_interfacealias is a required attribute/)
  end

  it 'should not accept array for dsc_interfacealias' do
    expect{dsc_xdnsserveraddress[:dsc_interfacealias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_interfacealias' do
    expect{dsc_xdnsserveraddress[:dsc_interfacealias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_interfacealias' do
    expect{dsc_xdnsserveraddress[:dsc_interfacealias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_interfacealias' do
    expect{dsc_xdnsserveraddress[:dsc_interfacealias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_addressfamily predefined value IPv4' do
    dsc_xdnsserveraddress[:dsc_addressfamily] = 'IPv4'
    expect(dsc_xdnsserveraddress[:dsc_addressfamily]).to eq('IPv4')
  end

  it 'should accept dsc_addressfamily predefined value ipv4' do
    dsc_xdnsserveraddress[:dsc_addressfamily] = 'ipv4'
    expect(dsc_xdnsserveraddress[:dsc_addressfamily]).to eq('ipv4')
  end

  it 'should accept dsc_addressfamily predefined value IPv6' do
    dsc_xdnsserveraddress[:dsc_addressfamily] = 'IPv6'
    expect(dsc_xdnsserveraddress[:dsc_addressfamily]).to eq('IPv6')
  end

  it 'should accept dsc_addressfamily predefined value ipv6' do
    dsc_xdnsserveraddress[:dsc_addressfamily] = 'ipv6'
    expect(dsc_xdnsserveraddress[:dsc_addressfamily]).to eq('ipv6')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdnsserveraddress[:dsc_addressfamily] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_addressfamily' do
    expect{dsc_xdnsserveraddress[:dsc_addressfamily] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_addressfamily' do
    expect{dsc_xdnsserveraddress[:dsc_addressfamily] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_addressfamily' do
    expect{dsc_xdnsserveraddress[:dsc_addressfamily] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_addressfamily' do
    expect{dsc_xdnsserveraddress[:dsc_addressfamily] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xdnsserveraddress)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xdnsserveraddress)
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
        dsc_xdnsserveraddress[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xdnsserveraddress[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xdnsserveraddress)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xdnsserveraddress)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xDNSServerAddress as $MSFT_xDNSServerAddress1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xDNSServerAddress/)
    end


  end
end
