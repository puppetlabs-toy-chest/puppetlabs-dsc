#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdatabaselogin) do

  let :dsc_xdatabaselogin do
    Puppet::Type.type(:dsc_xdatabaselogin).new(
      :name     => 'foo',
      :dsc_loginname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xdatabaselogin.to_s).to eq("Dsc_xdatabaselogin[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xdatabaselogin[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xdatabaselogin[:dsc_ensure] = 'Present'
    expect(dsc_xdatabaselogin[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xdatabaselogin[:dsc_ensure] = 'present'
    expect(dsc_xdatabaselogin[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdatabaselogin[:dsc_ensure] = 'present'
    expect(dsc_xdatabaselogin[:ensure]).to eq(dsc_xdatabaselogin[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xdatabaselogin[:dsc_ensure] = 'Absent'
    expect(dsc_xdatabaselogin[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xdatabaselogin[:dsc_ensure] = 'absent'
    expect(dsc_xdatabaselogin[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdatabaselogin[:dsc_ensure] = 'absent'
    expect(dsc_xdatabaselogin[:ensure]).to eq(dsc_xdatabaselogin[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdatabaselogin[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xdatabaselogin[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xdatabaselogin[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xdatabaselogin[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xdatabaselogin[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_loginname is specified' do
    #dsc_xdatabaselogin[:dsc_loginname]
    expect { Puppet::Type.type(:dsc_xdatabaselogin).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_loginpassword => 'foo',
      :dsc_sqlauthtype => 'Windows',
      :dsc_sqlserver => 'foo',
      :dsc_sqlconnectioncredential => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_loginname is a required attribute/)
  end

  it 'should not accept array for dsc_loginname' do
    expect{dsc_xdatabaselogin[:dsc_loginname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_loginname' do
    expect{dsc_xdatabaselogin[:dsc_loginname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_loginname' do
    expect{dsc_xdatabaselogin[:dsc_loginname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_loginname' do
    expect{dsc_xdatabaselogin[:dsc_loginname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_loginpassword' do
    expect{dsc_xdatabaselogin[:dsc_loginpassword] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_loginpassword' do
    expect{dsc_xdatabaselogin[:dsc_loginpassword] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_loginpassword' do
    expect{dsc_xdatabaselogin[:dsc_loginpassword] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_loginpassword' do
    expect{dsc_xdatabaselogin[:dsc_loginpassword] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_sqlauthtype predefined value Windows' do
    dsc_xdatabaselogin[:dsc_sqlauthtype] = 'Windows'
    expect(dsc_xdatabaselogin[:dsc_sqlauthtype]).to eq('Windows')
  end

  it 'should accept dsc_sqlauthtype predefined value windows' do
    dsc_xdatabaselogin[:dsc_sqlauthtype] = 'windows'
    expect(dsc_xdatabaselogin[:dsc_sqlauthtype]).to eq('windows')
  end

  it 'should accept dsc_sqlauthtype predefined value SQL' do
    dsc_xdatabaselogin[:dsc_sqlauthtype] = 'SQL'
    expect(dsc_xdatabaselogin[:dsc_sqlauthtype]).to eq('SQL')
  end

  it 'should accept dsc_sqlauthtype predefined value sql' do
    dsc_xdatabaselogin[:dsc_sqlauthtype] = 'sql'
    expect(dsc_xdatabaselogin[:dsc_sqlauthtype]).to eq('sql')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdatabaselogin[:dsc_sqlauthtype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlauthtype' do
    expect{dsc_xdatabaselogin[:dsc_sqlauthtype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlauthtype' do
    expect{dsc_xdatabaselogin[:dsc_sqlauthtype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlauthtype' do
    expect{dsc_xdatabaselogin[:dsc_sqlauthtype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlauthtype' do
    expect{dsc_xdatabaselogin[:dsc_sqlauthtype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xdatabaselogin[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xdatabaselogin[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xdatabaselogin[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xdatabaselogin[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_sqlconnectioncredential" do
    expect{dsc_xdatabaselogin[:dsc_sqlconnectioncredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlconnectioncredential' do
    expect{dsc_xdatabaselogin[:dsc_sqlconnectioncredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlconnectioncredential' do
    expect{dsc_xdatabaselogin[:dsc_sqlconnectioncredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlconnectioncredential' do
    expect{dsc_xdatabaselogin[:dsc_sqlconnectioncredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlconnectioncredential' do
    expect{dsc_xdatabaselogin[:dsc_sqlconnectioncredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdatabaselogin)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdatabaselogin)
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

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xdatabaselogin.original_parameters[:dsc_ensure] = 'present'
        dsc_xdatabaselogin[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xdatabaselogin)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdatabaselogin[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xdatabaselogin.original_parameters[:dsc_ensure] = 'absent'
        dsc_xdatabaselogin[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xdatabaselogin)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdatabaselogin[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
