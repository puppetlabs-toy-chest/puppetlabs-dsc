#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_log) do

  let :dsc_log do
    Puppet::Type.type(:dsc_log).new(
      :name     => 'foo',
    )
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

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_log)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_log)
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
        dsc_log[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_log[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_log)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_log)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_LogResource as $MSFT_LogResource1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_LogResource/)
    end


  end
end
