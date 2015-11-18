#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xrdsessioncollection) do

  let :dsc_xrdsessioncollection do
    Puppet::Type.type(:dsc_xrdsessioncollection).new(
      :name     => 'foo',
      :dsc_collectionname => 'foo',
      :dsc_sessionhost => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xrdsessioncollection.to_s).to eq("Dsc_xrdsessioncollection[foo]")
  end

  it 'should require that dsc_collectionname is specified' do
    #dsc_xrdsessioncollection[:dsc_collectionname]
    expect { Puppet::Type.type(:dsc_xrdsessioncollection).new(
      :name     => 'foo',
      :dsc_sessionhost => 'foo',
      :dsc_collectiondescription => 'foo',
      :dsc_connectionbroker => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_collectionname is a required attribute/)
  end

  it 'should not accept array for dsc_collectionname' do
    expect{dsc_xrdsessioncollection[:dsc_collectionname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_collectionname' do
    expect{dsc_xrdsessioncollection[:dsc_collectionname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_collectionname' do
    expect{dsc_xrdsessioncollection[:dsc_collectionname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_collectionname' do
    expect{dsc_xrdsessioncollection[:dsc_collectionname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_sessionhost is specified' do
    #dsc_xrdsessioncollection[:dsc_sessionhost]
    expect { Puppet::Type.type(:dsc_xrdsessioncollection).new(
      :name     => 'foo',
      :dsc_collectionname => 'foo',
      :dsc_collectiondescription => 'foo',
      :dsc_connectionbroker => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_sessionhost is a required attribute/)
  end

  it 'should not accept array for dsc_sessionhost' do
    expect{dsc_xrdsessioncollection[:dsc_sessionhost] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sessionhost' do
    expect{dsc_xrdsessioncollection[:dsc_sessionhost] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sessionhost' do
    expect{dsc_xrdsessioncollection[:dsc_sessionhost] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sessionhost' do
    expect{dsc_xrdsessioncollection[:dsc_sessionhost] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_collectiondescription' do
    expect{dsc_xrdsessioncollection[:dsc_collectiondescription] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_collectiondescription' do
    expect{dsc_xrdsessioncollection[:dsc_collectiondescription] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_collectiondescription' do
    expect{dsc_xrdsessioncollection[:dsc_collectiondescription] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_collectiondescription' do
    expect{dsc_xrdsessioncollection[:dsc_collectiondescription] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectionbroker' do
    expect{dsc_xrdsessioncollection[:dsc_connectionbroker] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectionbroker' do
    expect{dsc_xrdsessioncollection[:dsc_connectionbroker] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectionbroker' do
    expect{dsc_xrdsessioncollection[:dsc_connectionbroker] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectionbroker' do
    expect{dsc_xrdsessioncollection[:dsc_connectionbroker] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xrdsessioncollection)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xrdsessioncollection)
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
