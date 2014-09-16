#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdnsserverzonetransfer) do

  let :dsc_xdnsserverzonetransfer do
    Puppet::Type.type(:dsc_xdnsserverzonetransfer).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xdnsserverzonetransfer.to_s).to eq("Dsc_xdnsserverzonetransfer[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xdnsserverzonetransfer[:dsc_name]
    expect { Puppet::Type.type(:dsc_xdnsserverzonetransfer).new(
      :name     => 'foo',
      :dsc_type => 'None',
      :dsc_secondaryserver => ["foo", "bar", "spec"],
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xdnsserverzonetransfer[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xdnsserverzonetransfer[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xdnsserverzonetransfer[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xdnsserverzonetransfer[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_type predefined value None' do
    dsc_xdnsserverzonetransfer[:dsc_type] = 'None'
    expect(dsc_xdnsserverzonetransfer[:dsc_type]).to eq('None')
  end

  it 'should accept dsc_type predefined value none' do
    dsc_xdnsserverzonetransfer[:dsc_type] = 'none'
    expect(dsc_xdnsserverzonetransfer[:dsc_type]).to eq('none')
  end

  it 'should accept dsc_type predefined value Any' do
    dsc_xdnsserverzonetransfer[:dsc_type] = 'Any'
    expect(dsc_xdnsserverzonetransfer[:dsc_type]).to eq('Any')
  end

  it 'should accept dsc_type predefined value any' do
    dsc_xdnsserverzonetransfer[:dsc_type] = 'any'
    expect(dsc_xdnsserverzonetransfer[:dsc_type]).to eq('any')
  end

  it 'should accept dsc_type predefined value Named' do
    dsc_xdnsserverzonetransfer[:dsc_type] = 'Named'
    expect(dsc_xdnsserverzonetransfer[:dsc_type]).to eq('Named')
  end

  it 'should accept dsc_type predefined value named' do
    dsc_xdnsserverzonetransfer[:dsc_type] = 'named'
    expect(dsc_xdnsserverzonetransfer[:dsc_type]).to eq('named')
  end

  it 'should accept dsc_type predefined value Specific' do
    dsc_xdnsserverzonetransfer[:dsc_type] = 'Specific'
    expect(dsc_xdnsserverzonetransfer[:dsc_type]).to eq('Specific')
  end

  it 'should accept dsc_type predefined value specific' do
    dsc_xdnsserverzonetransfer[:dsc_type] = 'specific'
    expect(dsc_xdnsserverzonetransfer[:dsc_type]).to eq('specific')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdnsserverzonetransfer[:dsc_type] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_type' do
    expect{dsc_xdnsserverzonetransfer[:dsc_type] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_type' do
    expect{dsc_xdnsserverzonetransfer[:dsc_type] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_type' do
    expect{dsc_xdnsserverzonetransfer[:dsc_type] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_type' do
    expect{dsc_xdnsserverzonetransfer[:dsc_type] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_secondaryserver' do
    dsc_xdnsserverzonetransfer[:dsc_secondaryserver] = ["foo", "bar", "spec"]
    expect(dsc_xdnsserverzonetransfer[:dsc_secondaryserver]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_secondaryserver' do
    expect{dsc_xdnsserverzonetransfer[:dsc_secondaryserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_secondaryserver' do
    expect{dsc_xdnsserverzonetransfer[:dsc_secondaryserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_secondaryserver' do
    expect{dsc_xdnsserverzonetransfer[:dsc_secondaryserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xdnsserverzonetransfer)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xdnsserverzonetransfer)
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
        dsc_xdnsserverzonetransfer[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xdnsserverzonetransfer[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xdnsserverzonetransfer)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xdnsserverzonetransfer)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xDnsServerZoneTransfer as $MSFT_xDnsServerZoneTransfer1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xDnsServerZoneTransfer/)
    end


  end
end
