#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xcluster) do

  let :dsc_xcluster do
    Puppet::Type.type(:dsc_xcluster).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xcluster.to_s).to eq("Dsc_xcluster[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xcluster[:dsc_name]
    expect { Puppet::Type.type(:dsc_xcluster).new(
      :name     => 'foo',
      :dsc_staticipaddress => 'foo',
      :dsc_domainadministratorcredential => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xcluster[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xcluster[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xcluster[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xcluster[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_staticipaddress' do
    expect{dsc_xcluster[:dsc_staticipaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_staticipaddress' do
    expect{dsc_xcluster[:dsc_staticipaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_staticipaddress' do
    expect{dsc_xcluster[:dsc_staticipaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_staticipaddress' do
    expect{dsc_xcluster[:dsc_staticipaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainadministratorcredential' do
    expect{dsc_xcluster[:dsc_domainadministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainadministratorcredential' do
    expect{dsc_xcluster[:dsc_domainadministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainadministratorcredential' do
    expect{dsc_xcluster[:dsc_domainadministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainadministratorcredential' do
    expect{dsc_xcluster[:dsc_domainadministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xcluster)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xcluster)
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
        dsc_xcluster[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xcluster[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xcluster)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xcluster)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xCluster as $MSFT_xCluster1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xCluster/)
    end


  end
end
