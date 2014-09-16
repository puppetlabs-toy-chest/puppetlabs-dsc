#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xaddomaincontroller) do

  let :dsc_xaddomaincontroller do
    Puppet::Type.type(:dsc_xaddomaincontroller).new(
      :name     => 'foo',
      :dsc_domainname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xaddomaincontroller.to_s).to eq("Dsc_xaddomaincontroller[foo]")
  end

  it 'should require that dsc_domainname is specified' do
    #dsc_xaddomaincontroller[:dsc_domainname]
    expect { Puppet::Type.type(:dsc_xaddomaincontroller).new(
      :name     => 'foo',
      :dsc_domainadministratorcredential => 'foo',
      :dsc_safemodeadministratorpassword => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_domainname is a required attribute/)
  end

  it 'should not accept array for dsc_domainname' do
    expect{dsc_xaddomaincontroller[:dsc_domainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainname' do
    expect{dsc_xaddomaincontroller[:dsc_domainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainname' do
    expect{dsc_xaddomaincontroller[:dsc_domainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainname' do
    expect{dsc_xaddomaincontroller[:dsc_domainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainadministratorcredential' do
    expect{dsc_xaddomaincontroller[:dsc_domainadministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainadministratorcredential' do
    expect{dsc_xaddomaincontroller[:dsc_domainadministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainadministratorcredential' do
    expect{dsc_xaddomaincontroller[:dsc_domainadministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainadministratorcredential' do
    expect{dsc_xaddomaincontroller[:dsc_domainadministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_safemodeadministratorpassword' do
    expect{dsc_xaddomaincontroller[:dsc_safemodeadministratorpassword] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_safemodeadministratorpassword' do
    expect{dsc_xaddomaincontroller[:dsc_safemodeadministratorpassword] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_safemodeadministratorpassword' do
    expect{dsc_xaddomaincontroller[:dsc_safemodeadministratorpassword] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_safemodeadministratorpassword' do
    expect{dsc_xaddomaincontroller[:dsc_safemodeadministratorpassword] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xaddomaincontroller)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xaddomaincontroller)
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
        dsc_xaddomaincontroller[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xaddomaincontroller[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xaddomaincontroller)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xaddomaincontroller)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xADDomainController as $MSFT_xADDomainController1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xADDomainController/)
    end


  end
end
