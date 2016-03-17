#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverlogin) do

  let :dsc_xsqlserverlogin do
    Puppet::Type.type(:dsc_xsqlserverlogin).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverlogin.to_s).to eq("Dsc_xsqlserverlogin[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xsqlserverlogin[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xsqlserverlogin[:dsc_ensure] = 'Present'
    expect(dsc_xsqlserverlogin[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xsqlserverlogin[:dsc_ensure] = 'present'
    expect(dsc_xsqlserverlogin[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlserverlogin[:dsc_ensure] = 'present'
    expect(dsc_xsqlserverlogin[:ensure]).to eq(dsc_xsqlserverlogin[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xsqlserverlogin[:dsc_ensure] = 'Absent'
    expect(dsc_xsqlserverlogin[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xsqlserverlogin[:dsc_ensure] = 'absent'
    expect(dsc_xsqlserverlogin[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlserverlogin[:dsc_ensure] = 'absent'
    expect(dsc_xsqlserverlogin[:ensure]).to eq(dsc_xsqlserverlogin[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlserverlogin[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xsqlserverlogin[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xsqlserverlogin[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xsqlserverlogin[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xsqlserverlogin[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_name is specified' do
    #dsc_xsqlserverlogin[:dsc_name]
    expect { Puppet::Type.type(:dsc_xsqlserverlogin).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_logincredential => {"user"=>"user", "password"=>"password"},
      :dsc_logintype => 'SqlLogin',
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstancename => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xsqlserverlogin[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xsqlserverlogin[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xsqlserverlogin[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xsqlserverlogin[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_logincredential" do
    expect{dsc_xsqlserverlogin[:dsc_logincredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logincredential' do
    expect{dsc_xsqlserverlogin[:dsc_logincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logincredential' do
    expect{dsc_xsqlserverlogin[:dsc_logincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logincredential' do
    expect{dsc_xsqlserverlogin[:dsc_logincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logincredential' do
    expect{dsc_xsqlserverlogin[:dsc_logincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_logintype predefined value SqlLogin' do
    dsc_xsqlserverlogin[:dsc_logintype] = 'SqlLogin'
    expect(dsc_xsqlserverlogin[:dsc_logintype]).to eq('SqlLogin')
  end

  it 'should accept dsc_logintype predefined value sqllogin' do
    dsc_xsqlserverlogin[:dsc_logintype] = 'sqllogin'
    expect(dsc_xsqlserverlogin[:dsc_logintype]).to eq('sqllogin')
  end

  it 'should accept dsc_logintype predefined value WindowsUser' do
    dsc_xsqlserverlogin[:dsc_logintype] = 'WindowsUser'
    expect(dsc_xsqlserverlogin[:dsc_logintype]).to eq('WindowsUser')
  end

  it 'should accept dsc_logintype predefined value windowsuser' do
    dsc_xsqlserverlogin[:dsc_logintype] = 'windowsuser'
    expect(dsc_xsqlserverlogin[:dsc_logintype]).to eq('windowsuser')
  end

  it 'should accept dsc_logintype predefined value WindowsGroup' do
    dsc_xsqlserverlogin[:dsc_logintype] = 'WindowsGroup'
    expect(dsc_xsqlserverlogin[:dsc_logintype]).to eq('WindowsGroup')
  end

  it 'should accept dsc_logintype predefined value windowsgroup' do
    dsc_xsqlserverlogin[:dsc_logintype] = 'windowsgroup'
    expect(dsc_xsqlserverlogin[:dsc_logintype]).to eq('windowsgroup')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlserverlogin[:dsc_logintype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logintype' do
    expect{dsc_xsqlserverlogin[:dsc_logintype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logintype' do
    expect{dsc_xsqlserverlogin[:dsc_logintype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logintype' do
    expect{dsc_xsqlserverlogin[:dsc_logintype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logintype' do
    expect{dsc_xsqlserverlogin[:dsc_logintype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xsqlserverlogin[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xsqlserverlogin[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xsqlserverlogin[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xsqlserverlogin[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstancename' do
    expect{dsc_xsqlserverlogin[:dsc_sqlinstancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstancename' do
    expect{dsc_xsqlserverlogin[:dsc_sqlinstancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstancename' do
    expect{dsc_xsqlserverlogin[:dsc_sqlinstancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstancename' do
    expect{dsc_xsqlserverlogin[:dsc_sqlinstancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserverlogin)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserverlogin)
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
        dsc_xsqlserverlogin.original_parameters[:dsc_ensure] = 'present'
        dsc_xsqlserverlogin[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xsqlserverlogin)
      end

      it "should update :ensure to :present" do
        expect(dsc_xsqlserverlogin[:ensure]).to eq(:present)
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
        dsc_xsqlserverlogin.original_parameters[:dsc_ensure] = 'absent'
        dsc_xsqlserverlogin[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xsqlserverlogin)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xsqlserverlogin[:ensure]).to eq(:absent)
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
