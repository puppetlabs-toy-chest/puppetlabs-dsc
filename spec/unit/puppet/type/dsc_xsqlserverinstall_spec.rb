#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverinstall) do

  let :dsc_xsqlserverinstall do
    Puppet::Type.type(:dsc_xsqlserverinstall).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverinstall.to_s).to eq("Dsc_xsqlserverinstall[foo]")
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlserverinstall[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlserverinstall).new(
      :name     => 'foo',
      :dsc_sourcepath => 'foo',
      :dsc_sourcepathcredential => 'foo',
      :dsc_features => 'foo',
      :dsc_sqladministratorcredential => 'foo',
      :dsc_updateenabled => true,
      :dsc_svcaccount => 'foo',
      :dsc_sysadminaccounts => 'foo',
      :dsc_agentsvcaccount => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_instancename is a required attribute/)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlserverinstall[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlserverinstall[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlserverinstall[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlserverinstall[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xsqlserverinstall[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xsqlserverinstall[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xsqlserverinstall[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xsqlserverinstall[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepathcredential' do
    expect{dsc_xsqlserverinstall[:dsc_sourcepathcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepathcredential' do
    expect{dsc_xsqlserverinstall[:dsc_sourcepathcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepathcredential' do
    expect{dsc_xsqlserverinstall[:dsc_sourcepathcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepathcredential' do
    expect{dsc_xsqlserverinstall[:dsc_sourcepathcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_features' do
    expect{dsc_xsqlserverinstall[:dsc_features] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_features' do
    expect{dsc_xsqlserverinstall[:dsc_features] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_features' do
    expect{dsc_xsqlserverinstall[:dsc_features] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_features' do
    expect{dsc_xsqlserverinstall[:dsc_features] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqladministratorcredential' do
    expect{dsc_xsqlserverinstall[:dsc_sqladministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqladministratorcredential' do
    expect{dsc_xsqlserverinstall[:dsc_sqladministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqladministratorcredential' do
    expect{dsc_xsqlserverinstall[:dsc_sqladministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqladministratorcredential' do
    expect{dsc_xsqlserverinstall[:dsc_sqladministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_updateenabled' do
    expect{dsc_xsqlserverinstall[:dsc_updateenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_updateenabled' do
    dsc_xsqlserverinstall[:dsc_updateenabled] = true
    expect(dsc_xsqlserverinstall[:dsc_updateenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_updateenabled" do
    dsc_xsqlserverinstall[:dsc_updateenabled] = 'true'
    expect(dsc_xsqlserverinstall[:dsc_updateenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_updateenabled" do
    dsc_xsqlserverinstall[:dsc_updateenabled] = 'false'
    expect(dsc_xsqlserverinstall[:dsc_updateenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_updateenabled" do
    dsc_xsqlserverinstall[:dsc_updateenabled] = 'True'
    expect(dsc_xsqlserverinstall[:dsc_updateenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_updateenabled" do
    dsc_xsqlserverinstall[:dsc_updateenabled] = 'False'
    expect(dsc_xsqlserverinstall[:dsc_updateenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_updateenabled" do
    dsc_xsqlserverinstall[:dsc_updateenabled] = :true
    expect(dsc_xsqlserverinstall[:dsc_updateenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_updateenabled" do
    dsc_xsqlserverinstall[:dsc_updateenabled] = :false
    expect(dsc_xsqlserverinstall[:dsc_updateenabled]).to eq(false)
  end

  it 'should not accept int for dsc_updateenabled' do
    expect{dsc_xsqlserverinstall[:dsc_updateenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_updateenabled' do
    expect{dsc_xsqlserverinstall[:dsc_updateenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_svcaccount' do
    expect{dsc_xsqlserverinstall[:dsc_svcaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_svcaccount' do
    expect{dsc_xsqlserverinstall[:dsc_svcaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_svcaccount' do
    expect{dsc_xsqlserverinstall[:dsc_svcaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_svcaccount' do
    expect{dsc_xsqlserverinstall[:dsc_svcaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sysadminaccounts' do
    expect{dsc_xsqlserverinstall[:dsc_sysadminaccounts] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sysadminaccounts' do
    expect{dsc_xsqlserverinstall[:dsc_sysadminaccounts] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sysadminaccounts' do
    expect{dsc_xsqlserverinstall[:dsc_sysadminaccounts] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sysadminaccounts' do
    expect{dsc_xsqlserverinstall[:dsc_sysadminaccounts] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_agentsvcaccount' do
    expect{dsc_xsqlserverinstall[:dsc_agentsvcaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_agentsvcaccount' do
    expect{dsc_xsqlserverinstall[:dsc_agentsvcaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_agentsvcaccount' do
    expect{dsc_xsqlserverinstall[:dsc_agentsvcaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_agentsvcaccount' do
    expect{dsc_xsqlserverinstall[:dsc_agentsvcaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xsqlserverinstall)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xsqlserverinstall)
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
        dsc_xsqlserverinstall[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xsqlserverinstall[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xsqlserverinstall)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xsqlserverinstall)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xSqlServerInstall as $MSFT_xSqlServerInstall1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xSqlServerInstall/)
    end


  end
end
