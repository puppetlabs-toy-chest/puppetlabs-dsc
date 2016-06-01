#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xclusternetwork) do

  let :dsc_xclusternetwork do
    Puppet::Type.type(:dsc_xclusternetwork).new(
      :name     => 'foo',
      :dsc_address => 'foo',
      :dsc_addressmask => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xclusternetwork).new(
      :name     => 'foo',
      :dsc_address => 'foo',
      :dsc_addressmask => 'foo',
      :dsc_name => 'foo',
      :dsc_role => '0',
      :dsc_metric => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xclusternetwork.to_s).to eq("Dsc_xclusternetwork[foo]")
  end

  it 'should require that dsc_address is specified' do
    #dsc_xclusternetwork[:dsc_address]
    expect { Puppet::Type.type(:dsc_xclusternetwork).new(
      :name     => 'foo',
      :dsc_addressmask => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_address is a required attribute/)
  end

  it 'should not accept array for dsc_address' do
    expect{dsc_xclusternetwork[:dsc_address] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_address' do
    expect{dsc_xclusternetwork[:dsc_address] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_address' do
    expect{dsc_xclusternetwork[:dsc_address] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_address' do
    expect{dsc_xclusternetwork[:dsc_address] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_addressmask is specified' do
    #dsc_xclusternetwork[:dsc_addressmask]
    expect { Puppet::Type.type(:dsc_xclusternetwork).new(
      :name     => 'foo',
      :dsc_address => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_addressmask is a required attribute/)
  end

  it 'should not accept array for dsc_addressmask' do
    expect{dsc_xclusternetwork[:dsc_addressmask] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_addressmask' do
    expect{dsc_xclusternetwork[:dsc_addressmask] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_addressmask' do
    expect{dsc_xclusternetwork[:dsc_addressmask] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_addressmask' do
    expect{dsc_xclusternetwork[:dsc_addressmask] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xclusternetwork[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xclusternetwork[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xclusternetwork[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xclusternetwork[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_role predefined value 0' do
    dsc_xclusternetwork[:dsc_role] = '0'
    expect(dsc_xclusternetwork[:dsc_role]).to eq('0')
  end

  it 'should accept dsc_role predefined value 0' do
    dsc_xclusternetwork[:dsc_role] = '0'
    expect(dsc_xclusternetwork[:dsc_role]).to eq('0')
  end

  it 'should accept dsc_role predefined value 1' do
    dsc_xclusternetwork[:dsc_role] = '1'
    expect(dsc_xclusternetwork[:dsc_role]).to eq('1')
  end

  it 'should accept dsc_role predefined value 1' do
    dsc_xclusternetwork[:dsc_role] = '1'
    expect(dsc_xclusternetwork[:dsc_role]).to eq('1')
  end

  it 'should accept dsc_role predefined value 3' do
    dsc_xclusternetwork[:dsc_role] = '3'
    expect(dsc_xclusternetwork[:dsc_role]).to eq('3')
  end

  it 'should accept dsc_role predefined value 3' do
    dsc_xclusternetwork[:dsc_role] = '3'
    expect(dsc_xclusternetwork[:dsc_role]).to eq('3')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xclusternetwork[:dsc_role] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_role' do
    expect{dsc_xclusternetwork[:dsc_role] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_role' do
    expect{dsc_xclusternetwork[:dsc_role] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_role' do
    expect{dsc_xclusternetwork[:dsc_role] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_role' do
    expect{dsc_xclusternetwork[:dsc_role] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_metric' do
    expect{dsc_xclusternetwork[:dsc_metric] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_metric' do
    expect{dsc_xclusternetwork[:dsc_metric] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_metric' do
    expect{dsc_xclusternetwork[:dsc_metric] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_metric' do
    expect{dsc_xclusternetwork[:dsc_metric] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xclusternetwork)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xclusternetwork)
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
