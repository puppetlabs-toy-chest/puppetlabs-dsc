#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspclearremotesessions) do

  let :dsc_xspclearremotesessions do
    Puppet::Type.type(:dsc_xspclearremotesessions).new(
      :name     => 'foo',
      :dsc_clearremotesessions => true,
    )
  end

  it "should stringify normally" do
    expect(dsc_xspclearremotesessions.to_s).to eq("Dsc_xspclearremotesessions[foo]")
  end

  it 'should require that dsc_clearremotesessions is specified' do
    #dsc_xspclearremotesessions[:dsc_clearremotesessions]
    expect { Puppet::Type.type(:dsc_xspclearremotesessions).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_clearremotesessions is a required attribute/)
  end

  it 'should not accept array for dsc_clearremotesessions' do
    expect{dsc_xspclearremotesessions[:dsc_clearremotesessions] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_clearremotesessions' do
    dsc_xspclearremotesessions[:dsc_clearremotesessions] = true
    expect(dsc_xspclearremotesessions[:dsc_clearremotesessions]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_clearremotesessions" do
    dsc_xspclearremotesessions[:dsc_clearremotesessions] = 'true'
    expect(dsc_xspclearremotesessions[:dsc_clearremotesessions]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_clearremotesessions" do
    dsc_xspclearremotesessions[:dsc_clearremotesessions] = 'false'
    expect(dsc_xspclearremotesessions[:dsc_clearremotesessions]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_clearremotesessions" do
    dsc_xspclearremotesessions[:dsc_clearremotesessions] = 'True'
    expect(dsc_xspclearremotesessions[:dsc_clearremotesessions]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_clearremotesessions" do
    dsc_xspclearremotesessions[:dsc_clearremotesessions] = 'False'
    expect(dsc_xspclearremotesessions[:dsc_clearremotesessions]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_clearremotesessions" do
    dsc_xspclearremotesessions[:dsc_clearremotesessions] = :true
    expect(dsc_xspclearremotesessions[:dsc_clearremotesessions]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_clearremotesessions" do
    dsc_xspclearremotesessions[:dsc_clearremotesessions] = :false
    expect(dsc_xspclearremotesessions[:dsc_clearremotesessions]).to eq(false)
  end

  it 'should not accept int for dsc_clearremotesessions' do
    expect{dsc_xspclearremotesessions[:dsc_clearremotesessions] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_clearremotesessions' do
    expect{dsc_xspclearremotesessions[:dsc_clearremotesessions] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspclearremotesessions)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspclearremotesessions)
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
end
