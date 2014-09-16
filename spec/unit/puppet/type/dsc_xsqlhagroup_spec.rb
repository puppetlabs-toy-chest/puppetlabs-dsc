#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlhagroup) do

  let :dsc_xsqlhagroup do
    Puppet::Type.type(:dsc_xsqlhagroup).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsqlhagroup.to_s).to eq("Dsc_xsqlhagroup[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xsqlhagroup[:dsc_name]
    expect { Puppet::Type.type(:dsc_xsqlhagroup).new(
      :name     => 'foo',
      :dsc_database => ["foo", "bar", "spec"],
      :dsc_clustername => 'foo',
      :dsc_databasebackuppath => 'foo',
      :dsc_instancename => 'foo',
      :dsc_endpointname => 'foo',
      :dsc_domaincredential => 'foo',
      :dsc_sqladministratorcredential => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xsqlhagroup[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xsqlhagroup[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xsqlhagroup[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xsqlhagroup[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_database' do
    dsc_xsqlhagroup[:dsc_database] = ["foo", "bar", "spec"]
    expect(dsc_xsqlhagroup[:dsc_database]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_database' do
    expect{dsc_xsqlhagroup[:dsc_database] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_database' do
    expect{dsc_xsqlhagroup[:dsc_database] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_database' do
    expect{dsc_xsqlhagroup[:dsc_database] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_clustername' do
    expect{dsc_xsqlhagroup[:dsc_clustername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_clustername' do
    expect{dsc_xsqlhagroup[:dsc_clustername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_clustername' do
    expect{dsc_xsqlhagroup[:dsc_clustername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_clustername' do
    expect{dsc_xsqlhagroup[:dsc_clustername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasebackuppath' do
    expect{dsc_xsqlhagroup[:dsc_databasebackuppath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasebackuppath' do
    expect{dsc_xsqlhagroup[:dsc_databasebackuppath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasebackuppath' do
    expect{dsc_xsqlhagroup[:dsc_databasebackuppath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasebackuppath' do
    expect{dsc_xsqlhagroup[:dsc_databasebackuppath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlhagroup[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlhagroup[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlhagroup[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlhagroup[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_endpointname' do
    expect{dsc_xsqlhagroup[:dsc_endpointname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_endpointname' do
    expect{dsc_xsqlhagroup[:dsc_endpointname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_endpointname' do
    expect{dsc_xsqlhagroup[:dsc_endpointname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_endpointname' do
    expect{dsc_xsqlhagroup[:dsc_endpointname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincredential' do
    expect{dsc_xsqlhagroup[:dsc_domaincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincredential' do
    expect{dsc_xsqlhagroup[:dsc_domaincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincredential' do
    expect{dsc_xsqlhagroup[:dsc_domaincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincredential' do
    expect{dsc_xsqlhagroup[:dsc_domaincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqladministratorcredential' do
    expect{dsc_xsqlhagroup[:dsc_sqladministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqladministratorcredential' do
    expect{dsc_xsqlhagroup[:dsc_sqladministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqladministratorcredential' do
    expect{dsc_xsqlhagroup[:dsc_sqladministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqladministratorcredential' do
    expect{dsc_xsqlhagroup[:dsc_sqladministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xsqlhagroup)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xsqlhagroup)
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
        dsc_xsqlhagroup[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xsqlhagroup[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xsqlhagroup)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xsqlhagroup)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xSqlHAGroup as $MSFT_xSqlHAGroup1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xSqlHAGroup/)
    end


  end
end
