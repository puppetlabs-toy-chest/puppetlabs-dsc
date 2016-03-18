#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverinstall) do

  let :dsc_xsqlserverinstall do
    Puppet::Type.type(:dsc_xsqlserverinstall).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsqlserverinstall).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
      :dsc_sourcepath => 'foo',
      :dsc_versionid => 'foo',
      :dsc_sourcepathcredential => {"user"=>"user", "password"=>"password"},
      :dsc_features => 'foo',
      :dsc_sqladministratorcredential => {"user"=>"user", "password"=>"password"},
      :dsc_updateenabled => true,
      :dsc_svcaccount => 'foo',
      :dsc_sysadminaccounts => 'foo',
      :dsc_agentsvcaccount => 'foo',
      :dsc_sqlcollation => 'foo',
      :dsc_installsqldatadir => 'foo',
      :dsc_sqltempdbdir => 'foo',
      :dsc_sqluserdbdir => 'foo',
      :dsc_sqluserdblogdir => 'foo',
      :dsc_sqlbackupdir => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverinstall.to_s).to eq("Dsc_xsqlserverinstall[foo]")
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlserverinstall[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlserverinstall).new(
      :name     => 'foo',
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

  it 'should not accept array for dsc_versionid' do
    expect{dsc_xsqlserverinstall[:dsc_versionid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_versionid' do
    expect{dsc_xsqlserverinstall[:dsc_versionid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_versionid' do
    expect{dsc_xsqlserverinstall[:dsc_versionid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_versionid' do
    expect{dsc_xsqlserverinstall[:dsc_versionid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_sourcepathcredential" do
    expect{dsc_xsqlserverinstall[:dsc_sourcepathcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
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

  it "should not accept empty password for dsc_sqladministratorcredential" do
    expect{dsc_xsqlserverinstall[:dsc_sqladministratorcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
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

  it 'should not accept array for dsc_sqlcollation' do
    expect{dsc_xsqlserverinstall[:dsc_sqlcollation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlcollation' do
    expect{dsc_xsqlserverinstall[:dsc_sqlcollation] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlcollation' do
    expect{dsc_xsqlserverinstall[:dsc_sqlcollation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlcollation' do
    expect{dsc_xsqlserverinstall[:dsc_sqlcollation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installsqldatadir' do
    expect{dsc_xsqlserverinstall[:dsc_installsqldatadir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installsqldatadir' do
    expect{dsc_xsqlserverinstall[:dsc_installsqldatadir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installsqldatadir' do
    expect{dsc_xsqlserverinstall[:dsc_installsqldatadir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installsqldatadir' do
    expect{dsc_xsqlserverinstall[:dsc_installsqldatadir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqltempdbdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqltempdbdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqltempdbdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqltempdbdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqltempdbdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqltempdbdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqltempdbdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqltempdbdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqluserdbdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqluserdbdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqluserdbdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqluserdbdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqluserdbdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqluserdbdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqluserdbdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqluserdbdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqluserdblogdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqluserdblogdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqluserdblogdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqluserdblogdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqluserdblogdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqluserdblogdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqluserdblogdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqluserdblogdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlbackupdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqlbackupdir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlbackupdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqlbackupdir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlbackupdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqlbackupdir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlbackupdir' do
    expect{dsc_xsqlserverinstall[:dsc_sqlbackupdir] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserverinstall)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserverinstall)
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
