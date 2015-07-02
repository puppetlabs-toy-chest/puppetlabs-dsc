#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xvhdfile) do

  let :dsc_xvhdfile do
    Puppet::Type.type(:dsc_xvhdfile).new(
      :name     => 'foo',
      :dsc_vhdpath => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xvhdfile.to_s).to eq("Dsc_xvhdfile[foo]")
  end

  it 'should require that dsc_vhdpath is specified' do
    #dsc_xvhdfile[:dsc_vhdpath]
    expect { Puppet::Type.type(:dsc_xvhdfile).new(
      :name     => 'foo',
      :dsc_filedirectory => ["foo", "bar", "spec"],
    )}.to raise_error(Puppet::Error, /dsc_vhdpath is a required attribute/)
  end

  it 'should not accept array for dsc_vhdpath' do
    expect{dsc_xvhdfile[:dsc_vhdpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_vhdpath' do
    expect{dsc_xvhdfile[:dsc_vhdpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_vhdpath' do
    expect{dsc_xvhdfile[:dsc_vhdpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_vhdpath' do
    expect{dsc_xvhdfile[:dsc_vhdpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_filedirectory' do
    dsc_xvhdfile[:dsc_filedirectory] = ["foo", "bar", "spec"]
    expect(dsc_xvhdfile[:dsc_filedirectory]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_filedirectory' do
    expect{dsc_xvhdfile[:dsc_filedirectory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_filedirectory' do
    expect{dsc_xvhdfile[:dsc_filedirectory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_filedirectory' do
    expect{dsc_xvhdfile[:dsc_filedirectory] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xvhdfile)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xvhdfile)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

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

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:mof).new(dsc_xvhdfile)
    end

    before(:each) do
      @provider = described_class.provider(:mof).new(dsc_xvhdfile)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xVhdFileDirectory as $MSFT_xVhdFileDirectory1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xVhdFileDirectory/)
    end


  end
end
