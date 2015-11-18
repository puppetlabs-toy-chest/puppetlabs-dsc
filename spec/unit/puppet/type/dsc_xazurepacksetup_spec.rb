#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazurepacksetup) do

  let :dsc_xazurepacksetup do
    Puppet::Type.type(:dsc_xazurepacksetup).new(
      :name     => 'foo',
      :dsc_role => 'Admin API',
      :dsc_action => 'Install',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazurepacksetup.to_s).to eq("Dsc_xazurepacksetup[foo]")
  end

  it 'should require that dsc_role is specified' do
    #dsc_xazurepacksetup[:dsc_role]
    expect { Puppet::Type.type(:dsc_xazurepacksetup).new(
      :name     => 'foo',
      :dsc_action => 'Install',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
      :dsc_passphrase => {"user"=>"user", "password"=>"password"},
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstance => 'foo',
      :dsc_dbuser => {"user"=>"user", "password"=>"password"},
      :dsc_enableceip => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_role is a required attribute/)
  end

  it 'should accept dsc_role predefined value Admin API' do
    dsc_xazurepacksetup[:dsc_role] = 'Admin API'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('Admin API')
  end

  it 'should accept dsc_role predefined value admin api' do
    dsc_xazurepacksetup[:dsc_role] = 'admin api'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('admin api')
  end

  it 'should accept dsc_role predefined value Tenant API' do
    dsc_xazurepacksetup[:dsc_role] = 'Tenant API'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('Tenant API')
  end

  it 'should accept dsc_role predefined value tenant api' do
    dsc_xazurepacksetup[:dsc_role] = 'tenant api'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('tenant api')
  end

  it 'should accept dsc_role predefined value Tenant Public API' do
    dsc_xazurepacksetup[:dsc_role] = 'Tenant Public API'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('Tenant Public API')
  end

  it 'should accept dsc_role predefined value tenant public api' do
    dsc_xazurepacksetup[:dsc_role] = 'tenant public api'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('tenant public api')
  end

  it 'should accept dsc_role predefined value SQL Server Extension' do
    dsc_xazurepacksetup[:dsc_role] = 'SQL Server Extension'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('SQL Server Extension')
  end

  it 'should accept dsc_role predefined value sql server extension' do
    dsc_xazurepacksetup[:dsc_role] = 'sql server extension'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('sql server extension')
  end

  it 'should accept dsc_role predefined value MySQL Extension' do
    dsc_xazurepacksetup[:dsc_role] = 'MySQL Extension'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('MySQL Extension')
  end

  it 'should accept dsc_role predefined value mysql extension' do
    dsc_xazurepacksetup[:dsc_role] = 'mysql extension'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('mysql extension')
  end

  it 'should accept dsc_role predefined value Admin Site' do
    dsc_xazurepacksetup[:dsc_role] = 'Admin Site'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('Admin Site')
  end

  it 'should accept dsc_role predefined value admin site' do
    dsc_xazurepacksetup[:dsc_role] = 'admin site'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('admin site')
  end

  it 'should accept dsc_role predefined value Admin Authentication Site' do
    dsc_xazurepacksetup[:dsc_role] = 'Admin Authentication Site'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('Admin Authentication Site')
  end

  it 'should accept dsc_role predefined value admin authentication site' do
    dsc_xazurepacksetup[:dsc_role] = 'admin authentication site'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('admin authentication site')
  end

  it 'should accept dsc_role predefined value Tenant Site' do
    dsc_xazurepacksetup[:dsc_role] = 'Tenant Site'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('Tenant Site')
  end

  it 'should accept dsc_role predefined value tenant site' do
    dsc_xazurepacksetup[:dsc_role] = 'tenant site'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('tenant site')
  end

  it 'should accept dsc_role predefined value Tenant Authentication Site' do
    dsc_xazurepacksetup[:dsc_role] = 'Tenant Authentication Site'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('Tenant Authentication Site')
  end

  it 'should accept dsc_role predefined value tenant authentication site' do
    dsc_xazurepacksetup[:dsc_role] = 'tenant authentication site'
    expect(dsc_xazurepacksetup[:dsc_role]).to eq('tenant authentication site')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurepacksetup[:dsc_role] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_role' do
    expect{dsc_xazurepacksetup[:dsc_role] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_role' do
    expect{dsc_xazurepacksetup[:dsc_role] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_role' do
    expect{dsc_xazurepacksetup[:dsc_role] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_role' do
    expect{dsc_xazurepacksetup[:dsc_role] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_action is specified' do
    #dsc_xazurepacksetup[:dsc_action]
    expect { Puppet::Type.type(:dsc_xazurepacksetup).new(
      :name     => 'foo',
      :dsc_role => 'Admin API',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
      :dsc_passphrase => {"user"=>"user", "password"=>"password"},
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstance => 'foo',
      :dsc_dbuser => {"user"=>"user", "password"=>"password"},
      :dsc_enableceip => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_action is a required attribute/)
  end

  it 'should accept dsc_action predefined value Install' do
    dsc_xazurepacksetup[:dsc_action] = 'Install'
    expect(dsc_xazurepacksetup[:dsc_action]).to eq('Install')
  end

  it 'should accept dsc_action predefined value install' do
    dsc_xazurepacksetup[:dsc_action] = 'install'
    expect(dsc_xazurepacksetup[:dsc_action]).to eq('install')
  end

  it 'should accept dsc_action predefined value Initialize' do
    dsc_xazurepacksetup[:dsc_action] = 'Initialize'
    expect(dsc_xazurepacksetup[:dsc_action]).to eq('Initialize')
  end

  it 'should accept dsc_action predefined value initialize' do
    dsc_xazurepacksetup[:dsc_action] = 'initialize'
    expect(dsc_xazurepacksetup[:dsc_action]).to eq('initialize')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurepacksetup[:dsc_action] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_action' do
    expect{dsc_xazurepacksetup[:dsc_action] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_action' do
    expect{dsc_xazurepacksetup[:dsc_action] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_action' do
    expect{dsc_xazurepacksetup[:dsc_action] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_action' do
    expect{dsc_xazurepacksetup[:dsc_action] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xazurepacksetup[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xazurepacksetup[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xazurepacksetup[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xazurepacksetup[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefolder' do
    expect{dsc_xazurepacksetup[:dsc_sourcefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefolder' do
    expect{dsc_xazurepacksetup[:dsc_sourcefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefolder' do
    expect{dsc_xazurepacksetup[:dsc_sourcefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefolder' do
    expect{dsc_xazurepacksetup[:dsc_sourcefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_setupcredential" do
    expect{dsc_xazurepacksetup[:dsc_setupcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setupcredential' do
    expect{dsc_xazurepacksetup[:dsc_setupcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setupcredential' do
    expect{dsc_xazurepacksetup[:dsc_setupcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setupcredential' do
    expect{dsc_xazurepacksetup[:dsc_setupcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setupcredential' do
    expect{dsc_xazurepacksetup[:dsc_setupcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_passphrase" do
    expect{dsc_xazurepacksetup[:dsc_passphrase] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_passphrase' do
    expect{dsc_xazurepacksetup[:dsc_passphrase] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_passphrase' do
    expect{dsc_xazurepacksetup[:dsc_passphrase] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_passphrase' do
    expect{dsc_xazurepacksetup[:dsc_passphrase] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_passphrase' do
    expect{dsc_xazurepacksetup[:dsc_passphrase] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xazurepacksetup[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xazurepacksetup[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xazurepacksetup[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xazurepacksetup[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstance' do
    expect{dsc_xazurepacksetup[:dsc_sqlinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstance' do
    expect{dsc_xazurepacksetup[:dsc_sqlinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstance' do
    expect{dsc_xazurepacksetup[:dsc_sqlinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstance' do
    expect{dsc_xazurepacksetup[:dsc_sqlinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_dbuser" do
    expect{dsc_xazurepacksetup[:dsc_dbuser] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dbuser' do
    expect{dsc_xazurepacksetup[:dsc_dbuser] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dbuser' do
    expect{dsc_xazurepacksetup[:dsc_dbuser] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dbuser' do
    expect{dsc_xazurepacksetup[:dsc_dbuser] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dbuser' do
    expect{dsc_xazurepacksetup[:dsc_dbuser] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enableceip' do
    expect{dsc_xazurepacksetup[:dsc_enableceip] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_enableceip' do
    expect{dsc_xazurepacksetup[:dsc_enableceip] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_enableceip' do
    expect{dsc_xazurepacksetup[:dsc_enableceip] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enableceip' do
    expect{dsc_xazurepacksetup[:dsc_enableceip] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xazurepacksetup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xazurepacksetup)
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
