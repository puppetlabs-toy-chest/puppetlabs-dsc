#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdnsserverforwarder) do

  let :dsc_xdnsserverforwarder do
    Puppet::Type.type(:dsc_xdnsserverforwarder).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xdnsserverforwarder).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
      :dsc_ipaddresses => ["foo", "bar", "spec"],
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xdnsserverforwarder.to_s).to eq("Dsc_xdnsserverforwarder[foo]")
  end

  it 'should require that dsc_issingleinstance is specified' do
    #dsc_xdnsserverforwarder[:dsc_issingleinstance]
    expect { Puppet::Type.type(:dsc_xdnsserverforwarder).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_issingleinstance is a required attribute/)
  end

  it 'should accept dsc_issingleinstance predefined value Yes' do
    dsc_xdnsserverforwarder[:dsc_issingleinstance] = 'Yes'
    expect(dsc_xdnsserverforwarder[:dsc_issingleinstance]).to eq('Yes')
  end

  it 'should accept dsc_issingleinstance predefined value yes' do
    dsc_xdnsserverforwarder[:dsc_issingleinstance] = 'yes'
    expect(dsc_xdnsserverforwarder[:dsc_issingleinstance]).to eq('yes')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdnsserverforwarder[:dsc_issingleinstance] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_issingleinstance' do
    expect{dsc_xdnsserverforwarder[:dsc_issingleinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_issingleinstance' do
    expect{dsc_xdnsserverforwarder[:dsc_issingleinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_issingleinstance' do
    expect{dsc_xdnsserverforwarder[:dsc_issingleinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_issingleinstance' do
    expect{dsc_xdnsserverforwarder[:dsc_issingleinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_ipaddresses' do
    dsc_xdnsserverforwarder[:dsc_ipaddresses] = ["foo", "bar", "spec"]
    expect(dsc_xdnsserverforwarder[:dsc_ipaddresses]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_ipaddresses' do
    expect{dsc_xdnsserverforwarder[:dsc_ipaddresses] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ipaddresses' do
    expect{dsc_xdnsserverforwarder[:dsc_ipaddresses] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ipaddresses' do
    expect{dsc_xdnsserverforwarder[:dsc_ipaddresses] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdnsserverforwarder)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdnsserverforwarder)
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
