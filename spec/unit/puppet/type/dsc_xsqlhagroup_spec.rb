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
      :dsc_domaincredential => {"user"=>"user", "password"=>"password"},
      :dsc_sqladministratorcredential => {"user"=>"user", "password"=>"password"},
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

  it "should not accept empty password for dsc_domaincredential" do
    expect{dsc_xsqlhagroup[:dsc_domaincredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
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

  it "should not accept empty password for dsc_sqladministratorcredential" do
    expect{dsc_xsqlhagroup[:dsc_sqladministratorcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
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

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlhagroup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlhagroup)
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
