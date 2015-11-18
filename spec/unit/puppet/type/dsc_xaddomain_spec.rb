#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xaddomain) do

  let :dsc_xaddomain do
    Puppet::Type.type(:dsc_xaddomain).new(
      :name     => 'foo',
      :dsc_domainname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xaddomain.to_s).to eq("Dsc_xaddomain[foo]")
  end

  it 'should require that dsc_domainname is specified' do
    #dsc_xaddomain[:dsc_domainname]
    expect { Puppet::Type.type(:dsc_xaddomain).new(
      :name     => 'foo',
      :dsc_parentdomainname => 'foo',
      :dsc_domainnetbiosname => 'foo',
      :dsc_domainadministratorcredential => {"user"=>"user", "password"=>"password"},
      :dsc_safemodeadministratorpassword => {"user"=>"user", "password"=>"password"},
      :dsc_dnsdelegationcredential => {"user"=>"user", "password"=>"password"},
      :dsc_databasepath => 'foo',
      :dsc_logpath => 'foo',
      :dsc_sysvolpath => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_domainname is a required attribute/)
  end

  it 'should not accept array for dsc_domainname' do
    expect{dsc_xaddomain[:dsc_domainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainname' do
    expect{dsc_xaddomain[:dsc_domainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainname' do
    expect{dsc_xaddomain[:dsc_domainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainname' do
    expect{dsc_xaddomain[:dsc_domainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_parentdomainname' do
    expect{dsc_xaddomain[:dsc_parentdomainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_parentdomainname' do
    expect{dsc_xaddomain[:dsc_parentdomainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_parentdomainname' do
    expect{dsc_xaddomain[:dsc_parentdomainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_parentdomainname' do
    expect{dsc_xaddomain[:dsc_parentdomainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainnetbiosname' do
    expect{dsc_xaddomain[:dsc_domainnetbiosname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainnetbiosname' do
    expect{dsc_xaddomain[:dsc_domainnetbiosname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainnetbiosname' do
    expect{dsc_xaddomain[:dsc_domainnetbiosname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainnetbiosname' do
    expect{dsc_xaddomain[:dsc_domainnetbiosname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_domainadministratorcredential" do
    expect{dsc_xaddomain[:dsc_domainadministratorcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainadministratorcredential' do
    expect{dsc_xaddomain[:dsc_domainadministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainadministratorcredential' do
    expect{dsc_xaddomain[:dsc_domainadministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainadministratorcredential' do
    expect{dsc_xaddomain[:dsc_domainadministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainadministratorcredential' do
    expect{dsc_xaddomain[:dsc_domainadministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_safemodeadministratorpassword" do
    expect{dsc_xaddomain[:dsc_safemodeadministratorpassword] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_safemodeadministratorpassword' do
    expect{dsc_xaddomain[:dsc_safemodeadministratorpassword] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_safemodeadministratorpassword' do
    expect{dsc_xaddomain[:dsc_safemodeadministratorpassword] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_safemodeadministratorpassword' do
    expect{dsc_xaddomain[:dsc_safemodeadministratorpassword] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_safemodeadministratorpassword' do
    expect{dsc_xaddomain[:dsc_safemodeadministratorpassword] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_dnsdelegationcredential" do
    expect{dsc_xaddomain[:dsc_dnsdelegationcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dnsdelegationcredential' do
    expect{dsc_xaddomain[:dsc_dnsdelegationcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dnsdelegationcredential' do
    expect{dsc_xaddomain[:dsc_dnsdelegationcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dnsdelegationcredential' do
    expect{dsc_xaddomain[:dsc_dnsdelegationcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dnsdelegationcredential' do
    expect{dsc_xaddomain[:dsc_dnsdelegationcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasepath' do
    expect{dsc_xaddomain[:dsc_databasepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasepath' do
    expect{dsc_xaddomain[:dsc_databasepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasepath' do
    expect{dsc_xaddomain[:dsc_databasepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasepath' do
    expect{dsc_xaddomain[:dsc_databasepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logpath' do
    expect{dsc_xaddomain[:dsc_logpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logpath' do
    expect{dsc_xaddomain[:dsc_logpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logpath' do
    expect{dsc_xaddomain[:dsc_logpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logpath' do
    expect{dsc_xaddomain[:dsc_logpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sysvolpath' do
    expect{dsc_xaddomain[:dsc_sysvolpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sysvolpath' do
    expect{dsc_xaddomain[:dsc_sysvolpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sysvolpath' do
    expect{dsc_xaddomain[:dsc_sysvolpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sysvolpath' do
    expect{dsc_xaddomain[:dsc_sysvolpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xaddomain)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xaddomain)
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
