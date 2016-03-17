#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspsearchindexpartition) do

  let :dsc_xspsearchindexpartition do
    Puppet::Type.type(:dsc_xspsearchindexpartition).new(
      :name     => 'foo',
      :dsc_index => 32,
    )
  end

  it "should stringify normally" do
    expect(dsc_xspsearchindexpartition.to_s).to eq("Dsc_xspsearchindexpartition[foo]")
  end

  it 'should require that dsc_index is specified' do
    #dsc_xspsearchindexpartition[:dsc_index]
    expect { Puppet::Type.type(:dsc_xspsearchindexpartition).new(
      :name     => 'foo',
      :dsc_servers => ["foo", "bar", "spec"],
      :dsc_rootdirectory => 'foo',
      :dsc_serviceappname => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_index is a required attribute/)
  end

  it 'should not accept array for dsc_index' do
    expect{dsc_xspsearchindexpartition[:dsc_index] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_index' do
    expect{dsc_xspsearchindexpartition[:dsc_index] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_index' do
    dsc_xspsearchindexpartition[:dsc_index] = 32
    expect(dsc_xspsearchindexpartition[:dsc_index]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_index' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspsearchindexpartition[:dsc_index] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_index' do
    dsc_xspsearchindexpartition[:dsc_index] = '16'
    expect(dsc_xspsearchindexpartition[:dsc_index]).to eq(16)
  end

  it 'should accept string-like uint for dsc_index' do
    dsc_xspsearchindexpartition[:dsc_index] = '32'
    expect(dsc_xspsearchindexpartition[:dsc_index]).to eq(32)
  end

  it 'should accept string-like uint for dsc_index' do
    dsc_xspsearchindexpartition[:dsc_index] = '64'
    expect(dsc_xspsearchindexpartition[:dsc_index]).to eq(64)
  end

  it 'should accept array for dsc_servers' do
    dsc_xspsearchindexpartition[:dsc_servers] = ["foo", "bar", "spec"]
    expect(dsc_xspsearchindexpartition[:dsc_servers]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_servers' do
    expect{dsc_xspsearchindexpartition[:dsc_servers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servers' do
    expect{dsc_xspsearchindexpartition[:dsc_servers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servers' do
    expect{dsc_xspsearchindexpartition[:dsc_servers] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_rootdirectory' do
    expect{dsc_xspsearchindexpartition[:dsc_rootdirectory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_rootdirectory' do
    expect{dsc_xspsearchindexpartition[:dsc_rootdirectory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_rootdirectory' do
    expect{dsc_xspsearchindexpartition[:dsc_rootdirectory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rootdirectory' do
    expect{dsc_xspsearchindexpartition[:dsc_rootdirectory] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_serviceappname' do
    expect{dsc_xspsearchindexpartition[:dsc_serviceappname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serviceappname' do
    expect{dsc_xspsearchindexpartition[:dsc_serviceappname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serviceappname' do
    expect{dsc_xspsearchindexpartition[:dsc_serviceappname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serviceappname' do
    expect{dsc_xspsearchindexpartition[:dsc_serviceappname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspsearchindexpartition[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspsearchindexpartition[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspsearchindexpartition[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspsearchindexpartition[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspsearchindexpartition[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspsearchindexpartition)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspsearchindexpartition)
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

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
