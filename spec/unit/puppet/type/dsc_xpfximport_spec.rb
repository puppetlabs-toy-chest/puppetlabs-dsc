#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xpfximport) do

  let :dsc_xpfximport do
    Puppet::Type.type(:dsc_xpfximport).new(
      :name     => 'foo',
      :dsc_thumbprint => 'foo',
      :dsc_path => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xpfximport).new(
      :name     => 'foo',
      :dsc_thumbprint => 'foo',
      :dsc_path => 'foo',
      :dsc_location => 'LocalMachine',
      :dsc_store => 'foo',
      :dsc_exportable => true,
      :dsc_credential => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xpfximport.to_s).to eq("Dsc_xpfximport[foo]")
  end

  it 'should require that dsc_thumbprint is specified' do
    #dsc_xpfximport[:dsc_thumbprint]
    expect { Puppet::Type.type(:dsc_xpfximport).new(
      :name     => 'foo',
      :dsc_path => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_thumbprint is a required attribute/)
  end

  it 'should not accept array for dsc_thumbprint' do
    expect{dsc_xpfximport[:dsc_thumbprint] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_thumbprint' do
    expect{dsc_xpfximport[:dsc_thumbprint] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_thumbprint' do
    expect{dsc_xpfximport[:dsc_thumbprint] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_thumbprint' do
    expect{dsc_xpfximport[:dsc_thumbprint] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_path is specified' do
    #dsc_xpfximport[:dsc_path]
    expect { Puppet::Type.type(:dsc_xpfximport).new(
      :name     => 'foo',
      :dsc_thumbprint => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_path is a required attribute/)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xpfximport[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xpfximport[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xpfximport[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xpfximport[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_location predefined value LocalMachine' do
    dsc_xpfximport[:dsc_location] = 'LocalMachine'
    expect(dsc_xpfximport[:dsc_location]).to eq('LocalMachine')
  end

  it 'should accept dsc_location predefined value localmachine' do
    dsc_xpfximport[:dsc_location] = 'localmachine'
    expect(dsc_xpfximport[:dsc_location]).to eq('localmachine')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xpfximport[:dsc_location] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_location' do
    expect{dsc_xpfximport[:dsc_location] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_location' do
    expect{dsc_xpfximport[:dsc_location] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_location' do
    expect{dsc_xpfximport[:dsc_location] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_location' do
    expect{dsc_xpfximport[:dsc_location] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_store' do
    expect{dsc_xpfximport[:dsc_store] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_store' do
    expect{dsc_xpfximport[:dsc_store] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_store' do
    expect{dsc_xpfximport[:dsc_store] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_store' do
    expect{dsc_xpfximport[:dsc_store] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_exportable' do
    expect{dsc_xpfximport[:dsc_exportable] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_exportable' do
    dsc_xpfximport[:dsc_exportable] = true
    expect(dsc_xpfximport[:dsc_exportable]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_exportable" do
    dsc_xpfximport[:dsc_exportable] = 'true'
    expect(dsc_xpfximport[:dsc_exportable]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_exportable" do
    dsc_xpfximport[:dsc_exportable] = 'false'
    expect(dsc_xpfximport[:dsc_exportable]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_exportable" do
    dsc_xpfximport[:dsc_exportable] = 'True'
    expect(dsc_xpfximport[:dsc_exportable]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_exportable" do
    dsc_xpfximport[:dsc_exportable] = 'False'
    expect(dsc_xpfximport[:dsc_exportable]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_exportable" do
    dsc_xpfximport[:dsc_exportable] = :true
    expect(dsc_xpfximport[:dsc_exportable]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_exportable" do
    dsc_xpfximport[:dsc_exportable] = :false
    expect(dsc_xpfximport[:dsc_exportable]).to eq(false)
  end

  it 'should not accept int for dsc_exportable' do
    expect{dsc_xpfximport[:dsc_exportable] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_exportable' do
    expect{dsc_xpfximport[:dsc_exportable] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xpfximport[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xpfximport[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xpfximport[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xpfximport[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xpfximport[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xpfximport)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xpfximport)
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
