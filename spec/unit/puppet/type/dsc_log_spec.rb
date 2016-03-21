#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_log) do

  let :dsc_log do
    Puppet::Type.type(:dsc_log).new(
      :name     => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_log).new(
      :name     => 'foo',
      :dsc_message => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_log.to_s).to eq("Dsc_log[foo]")
  end

  it 'should not accept array for dsc_message' do
    expect{dsc_log[:dsc_message] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_message' do
    expect{dsc_log[:dsc_message] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_message' do
    expect{dsc_log[:dsc_message] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_message' do
    expect{dsc_log[:dsc_message] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_log)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_log)
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
