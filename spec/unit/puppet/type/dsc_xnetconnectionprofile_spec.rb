#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xnetconnectionprofile) do

  let :dsc_xnetconnectionprofile do
    Puppet::Type.type(:dsc_xnetconnectionprofile).new(
      :name     => 'foo',
      :dsc_interfacealias => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xnetconnectionprofile.to_s).to eq("Dsc_xnetconnectionprofile[foo]")
  end

  it 'should require that dsc_interfacealias is specified' do
    #dsc_xnetconnectionprofile[:dsc_interfacealias]
    expect { Puppet::Type.type(:dsc_xnetconnectionprofile).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_interfacealias is a required attribute/)
  end

  it 'should not accept array for dsc_interfacealias' do
    expect{dsc_xnetconnectionprofile[:dsc_interfacealias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_interfacealias' do
    expect{dsc_xnetconnectionprofile[:dsc_interfacealias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_interfacealias' do
    expect{dsc_xnetconnectionprofile[:dsc_interfacealias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_interfacealias' do
    expect{dsc_xnetconnectionprofile[:dsc_interfacealias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ipv4connectivity predefined value Disconnected' do
    dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = 'Disconnected'
    expect(dsc_xnetconnectionprofile[:dsc_ipv4connectivity]).to eq('Disconnected')
  end

  it 'should accept dsc_ipv4connectivity predefined value disconnected' do
    dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = 'disconnected'
    expect(dsc_xnetconnectionprofile[:dsc_ipv4connectivity]).to eq('disconnected')
  end

  it 'should accept dsc_ipv4connectivity predefined value NoTraffic' do
    dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = 'NoTraffic'
    expect(dsc_xnetconnectionprofile[:dsc_ipv4connectivity]).to eq('NoTraffic')
  end

  it 'should accept dsc_ipv4connectivity predefined value notraffic' do
    dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = 'notraffic'
    expect(dsc_xnetconnectionprofile[:dsc_ipv4connectivity]).to eq('notraffic')
  end

  it 'should accept dsc_ipv4connectivity predefined value Subnet' do
    dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = 'Subnet'
    expect(dsc_xnetconnectionprofile[:dsc_ipv4connectivity]).to eq('Subnet')
  end

  it 'should accept dsc_ipv4connectivity predefined value subnet' do
    dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = 'subnet'
    expect(dsc_xnetconnectionprofile[:dsc_ipv4connectivity]).to eq('subnet')
  end

  it 'should accept dsc_ipv4connectivity predefined value LocalNetwork' do
    dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = 'LocalNetwork'
    expect(dsc_xnetconnectionprofile[:dsc_ipv4connectivity]).to eq('LocalNetwork')
  end

  it 'should accept dsc_ipv4connectivity predefined value localnetwork' do
    dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = 'localnetwork'
    expect(dsc_xnetconnectionprofile[:dsc_ipv4connectivity]).to eq('localnetwork')
  end

  it 'should accept dsc_ipv4connectivity predefined value Internet' do
    dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = 'Internet'
    expect(dsc_xnetconnectionprofile[:dsc_ipv4connectivity]).to eq('Internet')
  end

  it 'should accept dsc_ipv4connectivity predefined value internet' do
    dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = 'internet'
    expect(dsc_xnetconnectionprofile[:dsc_ipv4connectivity]).to eq('internet')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ipv4connectivity' do
    expect{dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ipv4connectivity' do
    expect{dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ipv4connectivity' do
    expect{dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ipv4connectivity' do
    expect{dsc_xnetconnectionprofile[:dsc_ipv4connectivity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ipv6connectivity predefined value Disconnected' do
    dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = 'Disconnected'
    expect(dsc_xnetconnectionprofile[:dsc_ipv6connectivity]).to eq('Disconnected')
  end

  it 'should accept dsc_ipv6connectivity predefined value disconnected' do
    dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = 'disconnected'
    expect(dsc_xnetconnectionprofile[:dsc_ipv6connectivity]).to eq('disconnected')
  end

  it 'should accept dsc_ipv6connectivity predefined value NoTraffic' do
    dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = 'NoTraffic'
    expect(dsc_xnetconnectionprofile[:dsc_ipv6connectivity]).to eq('NoTraffic')
  end

  it 'should accept dsc_ipv6connectivity predefined value notraffic' do
    dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = 'notraffic'
    expect(dsc_xnetconnectionprofile[:dsc_ipv6connectivity]).to eq('notraffic')
  end

  it 'should accept dsc_ipv6connectivity predefined value Subnet' do
    dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = 'Subnet'
    expect(dsc_xnetconnectionprofile[:dsc_ipv6connectivity]).to eq('Subnet')
  end

  it 'should accept dsc_ipv6connectivity predefined value subnet' do
    dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = 'subnet'
    expect(dsc_xnetconnectionprofile[:dsc_ipv6connectivity]).to eq('subnet')
  end

  it 'should accept dsc_ipv6connectivity predefined value LocalNetwork' do
    dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = 'LocalNetwork'
    expect(dsc_xnetconnectionprofile[:dsc_ipv6connectivity]).to eq('LocalNetwork')
  end

  it 'should accept dsc_ipv6connectivity predefined value localnetwork' do
    dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = 'localnetwork'
    expect(dsc_xnetconnectionprofile[:dsc_ipv6connectivity]).to eq('localnetwork')
  end

  it 'should accept dsc_ipv6connectivity predefined value Internet' do
    dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = 'Internet'
    expect(dsc_xnetconnectionprofile[:dsc_ipv6connectivity]).to eq('Internet')
  end

  it 'should accept dsc_ipv6connectivity predefined value internet' do
    dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = 'internet'
    expect(dsc_xnetconnectionprofile[:dsc_ipv6connectivity]).to eq('internet')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ipv6connectivity' do
    expect{dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ipv6connectivity' do
    expect{dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ipv6connectivity' do
    expect{dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ipv6connectivity' do
    expect{dsc_xnetconnectionprofile[:dsc_ipv6connectivity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_networkcategory predefined value Public' do
    dsc_xnetconnectionprofile[:dsc_networkcategory] = 'Public'
    expect(dsc_xnetconnectionprofile[:dsc_networkcategory]).to eq('Public')
  end

  it 'should accept dsc_networkcategory predefined value public' do
    dsc_xnetconnectionprofile[:dsc_networkcategory] = 'public'
    expect(dsc_xnetconnectionprofile[:dsc_networkcategory]).to eq('public')
  end

  it 'should accept dsc_networkcategory predefined value Private' do
    dsc_xnetconnectionprofile[:dsc_networkcategory] = 'Private'
    expect(dsc_xnetconnectionprofile[:dsc_networkcategory]).to eq('Private')
  end

  it 'should accept dsc_networkcategory predefined value private' do
    dsc_xnetconnectionprofile[:dsc_networkcategory] = 'private'
    expect(dsc_xnetconnectionprofile[:dsc_networkcategory]).to eq('private')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xnetconnectionprofile[:dsc_networkcategory] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_networkcategory' do
    expect{dsc_xnetconnectionprofile[:dsc_networkcategory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_networkcategory' do
    expect{dsc_xnetconnectionprofile[:dsc_networkcategory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_networkcategory' do
    expect{dsc_xnetconnectionprofile[:dsc_networkcategory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_networkcategory' do
    expect{dsc_xnetconnectionprofile[:dsc_networkcategory] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xnetconnectionprofile)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xnetconnectionprofile)
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
