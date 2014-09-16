#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xarchive) do

  let :dsc_xarchive do
    Puppet::Type.type(:dsc_xarchive).new(
      :name     => 'foo',
      :dsc_destination => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xarchive.to_s).to eq("Dsc_xarchive[foo]")
  end

  it 'should require that dsc_destination is specified' do
    #dsc_xarchive[:dsc_destination]
    expect { Puppet::Type.type(:dsc_xarchive).new(
      :name     => 'foo',
      :dsc_path => ["foo", "bar", "spec"],
      :dsc_compressionlevel => 'Optimal',
      :dsc_destinationtype => 'File',
      :dsc_matchsource => true,
      :dsc_creationtime => '20140711',
      :dsc_attributes => 'foo',
      :dsc_mode => 'foo',
      :dsc_size => 64,
    )}.to raise_error(Puppet::Error, /dsc_destination is a required attribute/)
  end

  it 'should not accept array for dsc_destination' do
    expect{dsc_xarchive[:dsc_destination] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_destination' do
    expect{dsc_xarchive[:dsc_destination] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_destination' do
    expect{dsc_xarchive[:dsc_destination] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_destination' do
    expect{dsc_xarchive[:dsc_destination] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_path' do
    dsc_xarchive[:dsc_path] = ["foo", "bar", "spec"]
    expect(dsc_xarchive[:dsc_path]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xarchive[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xarchive[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xarchive[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_compressionlevel predefined value Optimal' do
    dsc_xarchive[:dsc_compressionlevel] = 'Optimal'
    expect(dsc_xarchive[:dsc_compressionlevel]).to eq('Optimal')
  end

  it 'should accept dsc_compressionlevel predefined value optimal' do
    dsc_xarchive[:dsc_compressionlevel] = 'optimal'
    expect(dsc_xarchive[:dsc_compressionlevel]).to eq('optimal')
  end

  it 'should accept dsc_compressionlevel predefined value NoCompression' do
    dsc_xarchive[:dsc_compressionlevel] = 'NoCompression'
    expect(dsc_xarchive[:dsc_compressionlevel]).to eq('NoCompression')
  end

  it 'should accept dsc_compressionlevel predefined value nocompression' do
    dsc_xarchive[:dsc_compressionlevel] = 'nocompression'
    expect(dsc_xarchive[:dsc_compressionlevel]).to eq('nocompression')
  end

  it 'should accept dsc_compressionlevel predefined value Fastest' do
    dsc_xarchive[:dsc_compressionlevel] = 'Fastest'
    expect(dsc_xarchive[:dsc_compressionlevel]).to eq('Fastest')
  end

  it 'should accept dsc_compressionlevel predefined value fastest' do
    dsc_xarchive[:dsc_compressionlevel] = 'fastest'
    expect(dsc_xarchive[:dsc_compressionlevel]).to eq('fastest')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xarchive[:dsc_compressionlevel] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_compressionlevel' do
    expect{dsc_xarchive[:dsc_compressionlevel] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_compressionlevel' do
    expect{dsc_xarchive[:dsc_compressionlevel] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_compressionlevel' do
    expect{dsc_xarchive[:dsc_compressionlevel] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_compressionlevel' do
    expect{dsc_xarchive[:dsc_compressionlevel] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_destinationtype predefined value File' do
    dsc_xarchive[:dsc_destinationtype] = 'File'
    expect(dsc_xarchive[:dsc_destinationtype]).to eq('File')
  end

  it 'should accept dsc_destinationtype predefined value file' do
    dsc_xarchive[:dsc_destinationtype] = 'file'
    expect(dsc_xarchive[:dsc_destinationtype]).to eq('file')
  end

  it 'should accept dsc_destinationtype predefined value Directory' do
    dsc_xarchive[:dsc_destinationtype] = 'Directory'
    expect(dsc_xarchive[:dsc_destinationtype]).to eq('Directory')
  end

  it 'should accept dsc_destinationtype predefined value directory' do
    dsc_xarchive[:dsc_destinationtype] = 'directory'
    expect(dsc_xarchive[:dsc_destinationtype]).to eq('directory')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xarchive[:dsc_destinationtype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_destinationtype' do
    expect{dsc_xarchive[:dsc_destinationtype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_destinationtype' do
    expect{dsc_xarchive[:dsc_destinationtype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_destinationtype' do
    expect{dsc_xarchive[:dsc_destinationtype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_destinationtype' do
    expect{dsc_xarchive[:dsc_destinationtype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_matchsource' do
    expect{dsc_xarchive[:dsc_matchsource] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_matchsource' do
    dsc_xarchive[:dsc_matchsource] = true
    expect(dsc_xarchive[:dsc_matchsource]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_matchsource" do
    dsc_xarchive[:dsc_matchsource] = 'true'
    expect(dsc_xarchive[:dsc_matchsource]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_matchsource" do
    dsc_xarchive[:dsc_matchsource] = 'false'
    expect(dsc_xarchive[:dsc_matchsource]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_matchsource" do
    dsc_xarchive[:dsc_matchsource] = 'True'
    expect(dsc_xarchive[:dsc_matchsource]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_matchsource" do
    dsc_xarchive[:dsc_matchsource] = 'False'
    expect(dsc_xarchive[:dsc_matchsource]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_matchsource" do
    dsc_xarchive[:dsc_matchsource] = :true
    expect(dsc_xarchive[:dsc_matchsource]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_matchsource" do
    dsc_xarchive[:dsc_matchsource] = :false
    expect(dsc_xarchive[:dsc_matchsource]).to eq(false)
  end

  it 'should not accept int for dsc_matchsource' do
    expect{dsc_xarchive[:dsc_matchsource] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_matchsource' do
    expect{dsc_xarchive[:dsc_matchsource] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_creationtime' do
    expect{dsc_xarchive[:dsc_creationtime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_creationtime' do
    expect{dsc_xarchive[:dsc_creationtime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_creationtime' do
    expect{dsc_xarchive[:dsc_creationtime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_creationtime' do
    expect{dsc_xarchive[:dsc_creationtime] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_attributes' do
    expect{dsc_xarchive[:dsc_attributes] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_attributes' do
    expect{dsc_xarchive[:dsc_attributes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_attributes' do
    expect{dsc_xarchive[:dsc_attributes] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_attributes' do
    expect{dsc_xarchive[:dsc_attributes] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_mode' do
    expect{dsc_xarchive[:dsc_mode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mode' do
    expect{dsc_xarchive[:dsc_mode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mode' do
    expect{dsc_xarchive[:dsc_mode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mode' do
    expect{dsc_xarchive[:dsc_mode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_size' do
    expect{dsc_xarchive[:dsc_size] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_size' do
    expect{dsc_xarchive[:dsc_size] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_size' do
    expect{dsc_xarchive[:dsc_size] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_size' do
    dsc_xarchive[:dsc_size] = 64
    expect(dsc_xarchive[:dsc_size]).to eq(64)
  end


  it 'should accept string-like int for dsc_size' do
    dsc_xarchive[:dsc_size] = '16'
    expect(dsc_xarchive[:dsc_size]).to eq(16)
  end


  it 'should accept string-like int for dsc_size' do
    dsc_xarchive[:dsc_size] = '32'
    expect(dsc_xarchive[:dsc_size]).to eq(32)
  end


  it 'should accept string-like int for dsc_size' do
    dsc_xarchive[:dsc_size] = '64'
    expect(dsc_xarchive[:dsc_size]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xarchive)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xarchive)
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
        dsc_xarchive[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xarchive[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xarchive)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xarchive)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xArchive as $MSFT_xArchive1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xArchive/)
    end


  end
end
