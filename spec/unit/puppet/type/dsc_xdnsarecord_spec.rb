#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdnsarecord) do

  let :dsc_xdnsarecord do
    Puppet::Type.type(:dsc_xdnsarecord).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_zone => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xdnsarecord.to_s).to eq("Dsc_xdnsarecord[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xdnsarecord[:dsc_name]
    expect { Puppet::Type.type(:dsc_xdnsarecord).new(
      :name     => 'foo',
      :dsc_zone => 'foo',
      :dsc_target => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xdnsarecord[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xdnsarecord[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xdnsarecord[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xdnsarecord[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_zone is specified' do
    #dsc_xdnsarecord[:dsc_zone]
    expect { Puppet::Type.type(:dsc_xdnsarecord).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_target => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_zone is a required attribute/)
  end

  it 'should not accept array for dsc_zone' do
    expect{dsc_xdnsarecord[:dsc_zone] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_zone' do
    expect{dsc_xdnsarecord[:dsc_zone] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_zone' do
    expect{dsc_xdnsarecord[:dsc_zone] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_zone' do
    expect{dsc_xdnsarecord[:dsc_zone] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_target' do
    expect{dsc_xdnsarecord[:dsc_target] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_target' do
    expect{dsc_xdnsarecord[:dsc_target] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_target' do
    expect{dsc_xdnsarecord[:dsc_target] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_target' do
    expect{dsc_xdnsarecord[:dsc_target] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdnsarecord)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdnsarecord)
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
