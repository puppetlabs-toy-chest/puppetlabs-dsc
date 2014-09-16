#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xiiswordpresssite) do

  let :dsc_xiiswordpresssite do
    Puppet::Type.type(:dsc_xiiswordpresssite).new(
      :name     => 'foo',
      :dsc_destinationpath => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xiiswordpresssite.to_s).to eq("Dsc_xiiswordpresssite[foo]")
  end

  it 'should require that dsc_destinationpath is specified' do
    #dsc_xiiswordpresssite[:dsc_destinationpath]
    expect { Puppet::Type.type(:dsc_xiiswordpresssite).new(
      :name     => 'foo',
      :dsc_downloaduri => 'foo',
      :dsc_packagefolder => 'foo',
      :dsc_configuration => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_destinationpath is a required attribute/)
  end

  it 'should not accept array for dsc_destinationpath' do
    expect{dsc_xiiswordpresssite[:dsc_destinationpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_destinationpath' do
    expect{dsc_xiiswordpresssite[:dsc_destinationpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_destinationpath' do
    expect{dsc_xiiswordpresssite[:dsc_destinationpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_destinationpath' do
    expect{dsc_xiiswordpresssite[:dsc_destinationpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_downloaduri' do
    expect{dsc_xiiswordpresssite[:dsc_downloaduri] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_downloaduri' do
    expect{dsc_xiiswordpresssite[:dsc_downloaduri] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_downloaduri' do
    expect{dsc_xiiswordpresssite[:dsc_downloaduri] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_downloaduri' do
    expect{dsc_xiiswordpresssite[:dsc_downloaduri] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_packagefolder' do
    expect{dsc_xiiswordpresssite[:dsc_packagefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_packagefolder' do
    expect{dsc_xiiswordpresssite[:dsc_packagefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_packagefolder' do
    expect{dsc_xiiswordpresssite[:dsc_packagefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_packagefolder' do
    expect{dsc_xiiswordpresssite[:dsc_packagefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_configuration' do
    expect{dsc_xiiswordpresssite[:dsc_configuration] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_configuration' do
    expect{dsc_xiiswordpresssite[:dsc_configuration] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_configuration' do
    expect{dsc_xiiswordpresssite[:dsc_configuration] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_configuration' do
    expect{dsc_xiiswordpresssite[:dsc_configuration] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xiiswordpresssite)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xiiswordpresssite)
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
        dsc_xiiswordpresssite[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xiiswordpresssite[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xiiswordpresssite)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xiiswordpresssite)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of xIisWordPressSite as $xIisWordPressSite1ref$/)
      expect(@provider.mof_test_content).to match(/instance of xIisWordPressSite/)
    end


  end
end
