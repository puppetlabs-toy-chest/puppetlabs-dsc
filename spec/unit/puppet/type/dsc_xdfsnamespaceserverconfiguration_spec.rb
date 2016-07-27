#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdfsnamespaceserverconfiguration) do

  let :dsc_xdfsnamespaceserverconfiguration do
    Puppet::Type.type(:dsc_xdfsnamespaceserverconfiguration).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xdfsnamespaceserverconfiguration).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
      :dsc_ldaptimeoutsec => 32,
      :dsc_syncintervalsec => 32,
      :dsc_usefqdn => true,
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xdfsnamespaceserverconfiguration.to_s).to eq("Dsc_xdfsnamespaceserverconfiguration[foo]")
  end

  it 'should require that dsc_issingleinstance is specified' do
    #dsc_xdfsnamespaceserverconfiguration[:dsc_issingleinstance]
    expect { Puppet::Type.type(:dsc_xdfsnamespaceserverconfiguration).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_issingleinstance is a required attribute/)
  end

  it 'should accept dsc_issingleinstance predefined value Yes' do
    dsc_xdfsnamespaceserverconfiguration[:dsc_issingleinstance] = 'Yes'
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_issingleinstance]).to eq('Yes')
  end

  it 'should accept dsc_issingleinstance predefined value yes' do
    dsc_xdfsnamespaceserverconfiguration[:dsc_issingleinstance] = 'yes'
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_issingleinstance]).to eq('yes')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_issingleinstance] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_issingleinstance' do
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_issingleinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_issingleinstance' do
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_issingleinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_issingleinstance' do
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_issingleinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_issingleinstance' do
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_issingleinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ldaptimeoutsec' do
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_ldaptimeoutsec] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ldaptimeoutsec' do
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_ldaptimeoutsec] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_ldaptimeoutsec' do
    dsc_xdfsnamespaceserverconfiguration[:dsc_ldaptimeoutsec] = 32
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_ldaptimeoutsec]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_ldaptimeoutsec' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_ldaptimeoutsec] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_ldaptimeoutsec' do
    dsc_xdfsnamespaceserverconfiguration[:dsc_ldaptimeoutsec] = '16'
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_ldaptimeoutsec]).to eq(16)
  end

  it 'should accept string-like uint for dsc_ldaptimeoutsec' do
    dsc_xdfsnamespaceserverconfiguration[:dsc_ldaptimeoutsec] = '32'
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_ldaptimeoutsec]).to eq(32)
  end

  it 'should accept string-like uint for dsc_ldaptimeoutsec' do
    dsc_xdfsnamespaceserverconfiguration[:dsc_ldaptimeoutsec] = '64'
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_ldaptimeoutsec]).to eq(64)
  end

  it 'should not accept array for dsc_syncintervalsec' do
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_syncintervalsec] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_syncintervalsec' do
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_syncintervalsec] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_syncintervalsec' do
    dsc_xdfsnamespaceserverconfiguration[:dsc_syncintervalsec] = 32
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_syncintervalsec]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_syncintervalsec' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_syncintervalsec] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_syncintervalsec' do
    dsc_xdfsnamespaceserverconfiguration[:dsc_syncintervalsec] = '16'
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_syncintervalsec]).to eq(16)
  end

  it 'should accept string-like uint for dsc_syncintervalsec' do
    dsc_xdfsnamespaceserverconfiguration[:dsc_syncintervalsec] = '32'
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_syncintervalsec]).to eq(32)
  end

  it 'should accept string-like uint for dsc_syncintervalsec' do
    dsc_xdfsnamespaceserverconfiguration[:dsc_syncintervalsec] = '64'
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_syncintervalsec]).to eq(64)
  end

  it 'should not accept array for dsc_usefqdn' do
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_usefqdn' do
    dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn] = true
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_usefqdn" do
    dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn] = 'true'
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_usefqdn" do
    dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn] = 'false'
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_usefqdn" do
    dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn] = 'True'
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_usefqdn" do
    dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn] = 'False'
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_usefqdn" do
    dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn] = :true
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_usefqdn" do
    dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn] = :false
    expect(dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn]).to eq(false)
  end

  it 'should not accept int for dsc_usefqdn' do
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usefqdn' do
    expect{dsc_xdfsnamespaceserverconfiguration[:dsc_usefqdn] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdfsnamespaceserverconfiguration)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdfsnamespaceserverconfiguration)
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
