#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchjetstresscleanup) do

  let :dsc_xexchjetstresscleanup do
    Puppet::Type.type(:dsc_xexchjetstresscleanup).new(
      :name     => 'foo',
      :dsc_jetstresspath => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchjetstresscleanup.to_s).to eq("Dsc_xexchjetstresscleanup[foo]")
  end

  it 'should require that dsc_jetstresspath is specified' do
    #dsc_xexchjetstresscleanup[:dsc_jetstresspath]
    expect { Puppet::Type.type(:dsc_xexchjetstresscleanup).new(
      :name     => 'foo',
      :dsc_configfilepath => 'foo',
      :dsc_databasepaths => ["foo", "bar", "spec"],
      :dsc_deleteassociatedmountpoints => true,
      :dsc_logpaths => ["foo", "bar", "spec"],
      :dsc_outputsavelocation => 'foo',
      :dsc_removebinaries => true,
    )}.to raise_error(Puppet::Error, /dsc_jetstresspath is a required attribute/)
  end

  it 'should not accept array for dsc_jetstresspath' do
    expect{dsc_xexchjetstresscleanup[:dsc_jetstresspath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_jetstresspath' do
    expect{dsc_xexchjetstresscleanup[:dsc_jetstresspath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_jetstresspath' do
    expect{dsc_xexchjetstresscleanup[:dsc_jetstresspath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_jetstresspath' do
    expect{dsc_xexchjetstresscleanup[:dsc_jetstresspath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_configfilepath' do
    expect{dsc_xexchjetstresscleanup[:dsc_configfilepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_configfilepath' do
    expect{dsc_xexchjetstresscleanup[:dsc_configfilepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_configfilepath' do
    expect{dsc_xexchjetstresscleanup[:dsc_configfilepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_configfilepath' do
    expect{dsc_xexchjetstresscleanup[:dsc_configfilepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_databasepaths' do
    dsc_xexchjetstresscleanup[:dsc_databasepaths] = ["foo", "bar", "spec"]
    expect(dsc_xexchjetstresscleanup[:dsc_databasepaths]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_databasepaths' do
    expect{dsc_xexchjetstresscleanup[:dsc_databasepaths] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasepaths' do
    expect{dsc_xexchjetstresscleanup[:dsc_databasepaths] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasepaths' do
    expect{dsc_xexchjetstresscleanup[:dsc_databasepaths] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_deleteassociatedmountpoints' do
    expect{dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_deleteassociatedmountpoints' do
    dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints] = true
    expect(dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_deleteassociatedmountpoints" do
    dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints] = 'true'
    expect(dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_deleteassociatedmountpoints" do
    dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints] = 'false'
    expect(dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_deleteassociatedmountpoints" do
    dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints] = 'True'
    expect(dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_deleteassociatedmountpoints" do
    dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints] = 'False'
    expect(dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_deleteassociatedmountpoints" do
    dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints] = :true
    expect(dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_deleteassociatedmountpoints" do
    dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints] = :false
    expect(dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints]).to eq(false)
  end

  it 'should not accept int for dsc_deleteassociatedmountpoints' do
    expect{dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_deleteassociatedmountpoints' do
    expect{dsc_xexchjetstresscleanup[:dsc_deleteassociatedmountpoints] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_logpaths' do
    dsc_xexchjetstresscleanup[:dsc_logpaths] = ["foo", "bar", "spec"]
    expect(dsc_xexchjetstresscleanup[:dsc_logpaths]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_logpaths' do
    expect{dsc_xexchjetstresscleanup[:dsc_logpaths] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logpaths' do
    expect{dsc_xexchjetstresscleanup[:dsc_logpaths] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logpaths' do
    expect{dsc_xexchjetstresscleanup[:dsc_logpaths] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_outputsavelocation' do
    expect{dsc_xexchjetstresscleanup[:dsc_outputsavelocation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_outputsavelocation' do
    expect{dsc_xexchjetstresscleanup[:dsc_outputsavelocation] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_outputsavelocation' do
    expect{dsc_xexchjetstresscleanup[:dsc_outputsavelocation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_outputsavelocation' do
    expect{dsc_xexchjetstresscleanup[:dsc_outputsavelocation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_removebinaries' do
    expect{dsc_xexchjetstresscleanup[:dsc_removebinaries] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_removebinaries' do
    dsc_xexchjetstresscleanup[:dsc_removebinaries] = true
    expect(dsc_xexchjetstresscleanup[:dsc_removebinaries]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_removebinaries" do
    dsc_xexchjetstresscleanup[:dsc_removebinaries] = 'true'
    expect(dsc_xexchjetstresscleanup[:dsc_removebinaries]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_removebinaries" do
    dsc_xexchjetstresscleanup[:dsc_removebinaries] = 'false'
    expect(dsc_xexchjetstresscleanup[:dsc_removebinaries]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_removebinaries" do
    dsc_xexchjetstresscleanup[:dsc_removebinaries] = 'True'
    expect(dsc_xexchjetstresscleanup[:dsc_removebinaries]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_removebinaries" do
    dsc_xexchjetstresscleanup[:dsc_removebinaries] = 'False'
    expect(dsc_xexchjetstresscleanup[:dsc_removebinaries]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_removebinaries" do
    dsc_xexchjetstresscleanup[:dsc_removebinaries] = :true
    expect(dsc_xexchjetstresscleanup[:dsc_removebinaries]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_removebinaries" do
    dsc_xexchjetstresscleanup[:dsc_removebinaries] = :false
    expect(dsc_xexchjetstresscleanup[:dsc_removebinaries]).to eq(false)
  end

  it 'should not accept int for dsc_removebinaries' do
    expect{dsc_xexchjetstresscleanup[:dsc_removebinaries] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_removebinaries' do
    expect{dsc_xexchjetstresscleanup[:dsc_removebinaries] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchjetstresscleanup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchjetstresscleanup)
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
