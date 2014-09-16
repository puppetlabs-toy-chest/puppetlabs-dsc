#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlhaservice) do

  let :dsc_xsqlhaservice do
    Puppet::Type.type(:dsc_xsqlhaservice).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsqlhaservice.to_s).to eq("Dsc_xsqlhaservice[foo]")
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlhaservice[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlhaservice).new(
      :name     => 'foo',
      :dsc_sqladministratorcredential => 'foo',
      :dsc_servicecredential => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_instancename is a required attribute/)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlhaservice[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlhaservice[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlhaservice[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlhaservice[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqladministratorcredential' do
    expect{dsc_xsqlhaservice[:dsc_sqladministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqladministratorcredential' do
    expect{dsc_xsqlhaservice[:dsc_sqladministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqladministratorcredential' do
    expect{dsc_xsqlhaservice[:dsc_sqladministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqladministratorcredential' do
    expect{dsc_xsqlhaservice[:dsc_sqladministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_servicecredential' do
    expect{dsc_xsqlhaservice[:dsc_servicecredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servicecredential' do
    expect{dsc_xsqlhaservice[:dsc_servicecredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servicecredential' do
    expect{dsc_xsqlhaservice[:dsc_servicecredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servicecredential' do
    expect{dsc_xsqlhaservice[:dsc_servicecredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xsqlhaservice)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xsqlhaservice)
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
        dsc_xsqlhaservice[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xsqlhaservice[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xsqlhaservice)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xsqlhaservice)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xSqlHAService as $MSFT_xSqlHAService1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xSqlHAService/)
    end


  end
end
