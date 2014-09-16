#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xaduser) do

  let :dsc_xaduser do
    Puppet::Type.type(:dsc_xaduser).new(
      :name     => 'foo',
      :dsc_domainname => 'foo',
      :dsc_username => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xaduser.to_s).to eq("Dsc_xaduser[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xaduser[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xaduser[:dsc_ensure] = 'Present'
    expect(dsc_xaduser[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xaduser[:dsc_ensure] = 'present'
    expect(dsc_xaduser[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xaduser[:dsc_ensure] = 'present'
    expect(dsc_xaduser[:ensure]).to eq(dsc_xaduser[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xaduser[:dsc_ensure] = 'Absent'
    expect(dsc_xaduser[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xaduser[:dsc_ensure] = 'absent'
    expect(dsc_xaduser[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xaduser[:dsc_ensure] = 'absent'
    expect(dsc_xaduser[:ensure]).to eq(dsc_xaduser[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xaduser[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xaduser[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xaduser[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xaduser[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xaduser[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_domainname is specified' do
    #dsc_xaduser[:dsc_domainname]
    expect { Puppet::Type.type(:dsc_xaduser).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_username => 'foo',
      :dsc_password => 'foo',
      :dsc_domainadministratorcredential => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_domainname is a required attribute/)
  end

  it 'should not accept array for dsc_domainname' do
    expect{dsc_xaduser[:dsc_domainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainname' do
    expect{dsc_xaduser[:dsc_domainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainname' do
    expect{dsc_xaduser[:dsc_domainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainname' do
    expect{dsc_xaduser[:dsc_domainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_username is specified' do
    #dsc_xaduser[:dsc_username]
    expect { Puppet::Type.type(:dsc_xaduser).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_domainname => 'foo',
      :dsc_password => 'foo',
      :dsc_domainadministratorcredential => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_username is a required attribute/)
  end

  it 'should not accept array for dsc_username' do
    expect{dsc_xaduser[:dsc_username] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_username' do
    expect{dsc_xaduser[:dsc_username] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_username' do
    expect{dsc_xaduser[:dsc_username] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_username' do
    expect{dsc_xaduser[:dsc_username] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_password' do
    expect{dsc_xaduser[:dsc_password] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_password' do
    expect{dsc_xaduser[:dsc_password] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_password' do
    expect{dsc_xaduser[:dsc_password] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_password' do
    expect{dsc_xaduser[:dsc_password] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainadministratorcredential' do
    expect{dsc_xaduser[:dsc_domainadministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainadministratorcredential' do
    expect{dsc_xaduser[:dsc_domainadministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainadministratorcredential' do
    expect{dsc_xaduser[:dsc_domainadministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainadministratorcredential' do
    expect{dsc_xaduser[:dsc_domainadministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xaduser)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xaduser)
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
        dsc_xaduser[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xaduser[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xaduser.original_parameters[:dsc_ensure] = 'present'
        dsc_xaduser[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xaduser)
      end

      it "should update :ensure to :present" do
        expect(dsc_xaduser[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xaduser.original_parameters[:dsc_ensure] = 'absent'
        dsc_xaduser[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xaduser)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xaduser[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xaduser)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xaduser)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xADUser as $MSFT_xADUser1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xADUser/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xaduser[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xaduser)
      end

      it "should update :ensure to :present" do
        expect(dsc_xaduser[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xaduser[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xaduser)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xaduser[:ensure]).to eq(:absent)
      end

    end

  end
end
