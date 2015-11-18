#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xrobocopy) do

  let :dsc_xrobocopy do
    Puppet::Type.type(:dsc_xrobocopy).new(
      :name     => 'foo',
      :dsc_source => 'foo',
      :dsc_destination => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xrobocopy.to_s).to eq("Dsc_xrobocopy[foo]")
  end

  it 'should require that dsc_source is specified' do
    #dsc_xrobocopy[:dsc_source]
    expect { Puppet::Type.type(:dsc_xrobocopy).new(
      :name     => 'foo',
      :dsc_destination => 'foo',
      :dsc_files => 'foo',
      :dsc_retry => 32,
      :dsc_wait => 32,
      :dsc_subdirectoriesincludingempty => true,
      :dsc_restartable => true,
      :dsc_multithreaded => true,
      :dsc_excludefiles => 'foo',
      :dsc_logoutput => 'foo',
      :dsc_appendlog => true,
      :dsc_additionalargs => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_source is a required attribute/)
  end

  it 'should not accept array for dsc_source' do
    expect{dsc_xrobocopy[:dsc_source] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_source' do
    expect{dsc_xrobocopy[:dsc_source] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_source' do
    expect{dsc_xrobocopy[:dsc_source] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_source' do
    expect{dsc_xrobocopy[:dsc_source] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_destination is specified' do
    #dsc_xrobocopy[:dsc_destination]
    expect { Puppet::Type.type(:dsc_xrobocopy).new(
      :name     => 'foo',
      :dsc_source => 'foo',
      :dsc_files => 'foo',
      :dsc_retry => 32,
      :dsc_wait => 32,
      :dsc_subdirectoriesincludingempty => true,
      :dsc_restartable => true,
      :dsc_multithreaded => true,
      :dsc_excludefiles => 'foo',
      :dsc_logoutput => 'foo',
      :dsc_appendlog => true,
      :dsc_additionalargs => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_destination is a required attribute/)
  end

  it 'should not accept array for dsc_destination' do
    expect{dsc_xrobocopy[:dsc_destination] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_destination' do
    expect{dsc_xrobocopy[:dsc_destination] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_destination' do
    expect{dsc_xrobocopy[:dsc_destination] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_destination' do
    expect{dsc_xrobocopy[:dsc_destination] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_files' do
    expect{dsc_xrobocopy[:dsc_files] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_files' do
    expect{dsc_xrobocopy[:dsc_files] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_files' do
    expect{dsc_xrobocopy[:dsc_files] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_files' do
    expect{dsc_xrobocopy[:dsc_files] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_retry' do
    expect{dsc_xrobocopy[:dsc_retry] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retry' do
    expect{dsc_xrobocopy[:dsc_retry] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retry' do
    dsc_xrobocopy[:dsc_retry] = 32
    expect(dsc_xrobocopy[:dsc_retry]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_retry' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xrobocopy[:dsc_retry] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_retry' do
    dsc_xrobocopy[:dsc_retry] = '16'
    expect(dsc_xrobocopy[:dsc_retry]).to eq(16)
  end

  it 'should accept string-like uint for dsc_retry' do
    dsc_xrobocopy[:dsc_retry] = '32'
    expect(dsc_xrobocopy[:dsc_retry]).to eq(32)
  end

  it 'should accept string-like uint for dsc_retry' do
    dsc_xrobocopy[:dsc_retry] = '64'
    expect(dsc_xrobocopy[:dsc_retry]).to eq(64)
  end

  it 'should not accept array for dsc_wait' do
    expect{dsc_xrobocopy[:dsc_wait] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_wait' do
    expect{dsc_xrobocopy[:dsc_wait] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_wait' do
    dsc_xrobocopy[:dsc_wait] = 32
    expect(dsc_xrobocopy[:dsc_wait]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_wait' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xrobocopy[:dsc_wait] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_wait' do
    dsc_xrobocopy[:dsc_wait] = '16'
    expect(dsc_xrobocopy[:dsc_wait]).to eq(16)
  end

  it 'should accept string-like uint for dsc_wait' do
    dsc_xrobocopy[:dsc_wait] = '32'
    expect(dsc_xrobocopy[:dsc_wait]).to eq(32)
  end

  it 'should accept string-like uint for dsc_wait' do
    dsc_xrobocopy[:dsc_wait] = '64'
    expect(dsc_xrobocopy[:dsc_wait]).to eq(64)
  end

  it 'should not accept array for dsc_subdirectoriesincludingempty' do
    expect{dsc_xrobocopy[:dsc_subdirectoriesincludingempty] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_subdirectoriesincludingempty' do
    dsc_xrobocopy[:dsc_subdirectoriesincludingempty] = true
    expect(dsc_xrobocopy[:dsc_subdirectoriesincludingempty]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_subdirectoriesincludingempty" do
    dsc_xrobocopy[:dsc_subdirectoriesincludingempty] = 'true'
    expect(dsc_xrobocopy[:dsc_subdirectoriesincludingempty]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_subdirectoriesincludingempty" do
    dsc_xrobocopy[:dsc_subdirectoriesincludingempty] = 'false'
    expect(dsc_xrobocopy[:dsc_subdirectoriesincludingempty]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_subdirectoriesincludingempty" do
    dsc_xrobocopy[:dsc_subdirectoriesincludingempty] = 'True'
    expect(dsc_xrobocopy[:dsc_subdirectoriesincludingempty]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_subdirectoriesincludingempty" do
    dsc_xrobocopy[:dsc_subdirectoriesincludingempty] = 'False'
    expect(dsc_xrobocopy[:dsc_subdirectoriesincludingempty]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_subdirectoriesincludingempty" do
    dsc_xrobocopy[:dsc_subdirectoriesincludingempty] = :true
    expect(dsc_xrobocopy[:dsc_subdirectoriesincludingempty]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_subdirectoriesincludingempty" do
    dsc_xrobocopy[:dsc_subdirectoriesincludingempty] = :false
    expect(dsc_xrobocopy[:dsc_subdirectoriesincludingempty]).to eq(false)
  end

  it 'should not accept int for dsc_subdirectoriesincludingempty' do
    expect{dsc_xrobocopy[:dsc_subdirectoriesincludingempty] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_subdirectoriesincludingempty' do
    expect{dsc_xrobocopy[:dsc_subdirectoriesincludingempty] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_restartable' do
    expect{dsc_xrobocopy[:dsc_restartable] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_restartable' do
    dsc_xrobocopy[:dsc_restartable] = true
    expect(dsc_xrobocopy[:dsc_restartable]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_restartable" do
    dsc_xrobocopy[:dsc_restartable] = 'true'
    expect(dsc_xrobocopy[:dsc_restartable]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_restartable" do
    dsc_xrobocopy[:dsc_restartable] = 'false'
    expect(dsc_xrobocopy[:dsc_restartable]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_restartable" do
    dsc_xrobocopy[:dsc_restartable] = 'True'
    expect(dsc_xrobocopy[:dsc_restartable]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_restartable" do
    dsc_xrobocopy[:dsc_restartable] = 'False'
    expect(dsc_xrobocopy[:dsc_restartable]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_restartable" do
    dsc_xrobocopy[:dsc_restartable] = :true
    expect(dsc_xrobocopy[:dsc_restartable]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_restartable" do
    dsc_xrobocopy[:dsc_restartable] = :false
    expect(dsc_xrobocopy[:dsc_restartable]).to eq(false)
  end

  it 'should not accept int for dsc_restartable' do
    expect{dsc_xrobocopy[:dsc_restartable] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_restartable' do
    expect{dsc_xrobocopy[:dsc_restartable] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_multithreaded' do
    expect{dsc_xrobocopy[:dsc_multithreaded] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_multithreaded' do
    dsc_xrobocopy[:dsc_multithreaded] = true
    expect(dsc_xrobocopy[:dsc_multithreaded]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_multithreaded" do
    dsc_xrobocopy[:dsc_multithreaded] = 'true'
    expect(dsc_xrobocopy[:dsc_multithreaded]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_multithreaded" do
    dsc_xrobocopy[:dsc_multithreaded] = 'false'
    expect(dsc_xrobocopy[:dsc_multithreaded]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_multithreaded" do
    dsc_xrobocopy[:dsc_multithreaded] = 'True'
    expect(dsc_xrobocopy[:dsc_multithreaded]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_multithreaded" do
    dsc_xrobocopy[:dsc_multithreaded] = 'False'
    expect(dsc_xrobocopy[:dsc_multithreaded]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_multithreaded" do
    dsc_xrobocopy[:dsc_multithreaded] = :true
    expect(dsc_xrobocopy[:dsc_multithreaded]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_multithreaded" do
    dsc_xrobocopy[:dsc_multithreaded] = :false
    expect(dsc_xrobocopy[:dsc_multithreaded]).to eq(false)
  end

  it 'should not accept int for dsc_multithreaded' do
    expect{dsc_xrobocopy[:dsc_multithreaded] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_multithreaded' do
    expect{dsc_xrobocopy[:dsc_multithreaded] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_excludefiles' do
    expect{dsc_xrobocopy[:dsc_excludefiles] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_excludefiles' do
    expect{dsc_xrobocopy[:dsc_excludefiles] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_excludefiles' do
    expect{dsc_xrobocopy[:dsc_excludefiles] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_excludefiles' do
    expect{dsc_xrobocopy[:dsc_excludefiles] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logoutput' do
    expect{dsc_xrobocopy[:dsc_logoutput] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logoutput' do
    expect{dsc_xrobocopy[:dsc_logoutput] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logoutput' do
    expect{dsc_xrobocopy[:dsc_logoutput] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logoutput' do
    expect{dsc_xrobocopy[:dsc_logoutput] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_appendlog' do
    expect{dsc_xrobocopy[:dsc_appendlog] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_appendlog' do
    dsc_xrobocopy[:dsc_appendlog] = true
    expect(dsc_xrobocopy[:dsc_appendlog]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_appendlog" do
    dsc_xrobocopy[:dsc_appendlog] = 'true'
    expect(dsc_xrobocopy[:dsc_appendlog]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_appendlog" do
    dsc_xrobocopy[:dsc_appendlog] = 'false'
    expect(dsc_xrobocopy[:dsc_appendlog]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_appendlog" do
    dsc_xrobocopy[:dsc_appendlog] = 'True'
    expect(dsc_xrobocopy[:dsc_appendlog]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_appendlog" do
    dsc_xrobocopy[:dsc_appendlog] = 'False'
    expect(dsc_xrobocopy[:dsc_appendlog]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_appendlog" do
    dsc_xrobocopy[:dsc_appendlog] = :true
    expect(dsc_xrobocopy[:dsc_appendlog]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_appendlog" do
    dsc_xrobocopy[:dsc_appendlog] = :false
    expect(dsc_xrobocopy[:dsc_appendlog]).to eq(false)
  end

  it 'should not accept int for dsc_appendlog' do
    expect{dsc_xrobocopy[:dsc_appendlog] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_appendlog' do
    expect{dsc_xrobocopy[:dsc_appendlog] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_additionalargs' do
    expect{dsc_xrobocopy[:dsc_additionalargs] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_additionalargs' do
    expect{dsc_xrobocopy[:dsc_additionalargs] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_additionalargs' do
    expect{dsc_xrobocopy[:dsc_additionalargs] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_additionalargs' do
    expect{dsc_xrobocopy[:dsc_additionalargs] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xrobocopy)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xrobocopy)
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
