#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazurepackfqdn) do

  let :dsc_xazurepackfqdn do
    Puppet::Type.type(:dsc_xazurepackfqdn).new(
      :name     => 'foo',
      :dsc_namespace => 'AdminSite',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazurepackfqdn.to_s).to eq("Dsc_xazurepackfqdn[foo]")
  end

  it 'should require that dsc_namespace is specified' do
    #dsc_xazurepackfqdn[:dsc_namespace]
    expect { Puppet::Type.type(:dsc_xazurepackfqdn).new(
      :name     => 'foo',
      :dsc_fullyqualifieddomainname => 'foo',
      :dsc_port => 16,
      :dsc_azurepackadmincredential => {"user"=>"user", "password"=>"password"},
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstance => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_namespace is a required attribute/)
  end

  it 'should accept dsc_namespace predefined value AdminSite' do
    dsc_xazurepackfqdn[:dsc_namespace] = 'AdminSite'
    expect(dsc_xazurepackfqdn[:dsc_namespace]).to eq('AdminSite')
  end

  it 'should accept dsc_namespace predefined value adminsite' do
    dsc_xazurepackfqdn[:dsc_namespace] = 'adminsite'
    expect(dsc_xazurepackfqdn[:dsc_namespace]).to eq('adminsite')
  end

  it 'should accept dsc_namespace predefined value AuthSite' do
    dsc_xazurepackfqdn[:dsc_namespace] = 'AuthSite'
    expect(dsc_xazurepackfqdn[:dsc_namespace]).to eq('AuthSite')
  end

  it 'should accept dsc_namespace predefined value authsite' do
    dsc_xazurepackfqdn[:dsc_namespace] = 'authsite'
    expect(dsc_xazurepackfqdn[:dsc_namespace]).to eq('authsite')
  end

  it 'should accept dsc_namespace predefined value TenantSite' do
    dsc_xazurepackfqdn[:dsc_namespace] = 'TenantSite'
    expect(dsc_xazurepackfqdn[:dsc_namespace]).to eq('TenantSite')
  end

  it 'should accept dsc_namespace predefined value tenantsite' do
    dsc_xazurepackfqdn[:dsc_namespace] = 'tenantsite'
    expect(dsc_xazurepackfqdn[:dsc_namespace]).to eq('tenantsite')
  end

  it 'should accept dsc_namespace predefined value WindowsAuthSite' do
    dsc_xazurepackfqdn[:dsc_namespace] = 'WindowsAuthSite'
    expect(dsc_xazurepackfqdn[:dsc_namespace]).to eq('WindowsAuthSite')
  end

  it 'should accept dsc_namespace predefined value windowsauthsite' do
    dsc_xazurepackfqdn[:dsc_namespace] = 'windowsauthsite'
    expect(dsc_xazurepackfqdn[:dsc_namespace]).to eq('windowsauthsite')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurepackfqdn[:dsc_namespace] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_namespace' do
    expect{dsc_xazurepackfqdn[:dsc_namespace] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_namespace' do
    expect{dsc_xazurepackfqdn[:dsc_namespace] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_namespace' do
    expect{dsc_xazurepackfqdn[:dsc_namespace] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_namespace' do
    expect{dsc_xazurepackfqdn[:dsc_namespace] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_fullyqualifieddomainname' do
    expect{dsc_xazurepackfqdn[:dsc_fullyqualifieddomainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_fullyqualifieddomainname' do
    expect{dsc_xazurepackfqdn[:dsc_fullyqualifieddomainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_fullyqualifieddomainname' do
    expect{dsc_xazurepackfqdn[:dsc_fullyqualifieddomainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_fullyqualifieddomainname' do
    expect{dsc_xazurepackfqdn[:dsc_fullyqualifieddomainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_port' do
    expect{dsc_xazurepackfqdn[:dsc_port] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_port' do
    expect{dsc_xazurepackfqdn[:dsc_port] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_port' do
    dsc_xazurepackfqdn[:dsc_port] = 16
    expect(dsc_xazurepackfqdn[:dsc_port]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_port' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xazurepackfqdn[:dsc_port] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_xazurepackfqdn[:dsc_port] = '16'
    expect(dsc_xazurepackfqdn[:dsc_port]).to eq(16)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_xazurepackfqdn[:dsc_port] = '32'
    expect(dsc_xazurepackfqdn[:dsc_port]).to eq(32)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_xazurepackfqdn[:dsc_port] = '64'
    expect(dsc_xazurepackfqdn[:dsc_port]).to eq(64)
  end

  it "should not accept empty password for dsc_azurepackadmincredential" do
    expect{dsc_xazurepackfqdn[:dsc_azurepackadmincredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackfqdn[:dsc_azurepackadmincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackfqdn[:dsc_azurepackadmincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackfqdn[:dsc_azurepackadmincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackfqdn[:dsc_azurepackadmincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xazurepackfqdn[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xazurepackfqdn[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xazurepackfqdn[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xazurepackfqdn[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstance' do
    expect{dsc_xazurepackfqdn[:dsc_sqlinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstance' do
    expect{dsc_xazurepackfqdn[:dsc_sqlinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstance' do
    expect{dsc_xazurepackfqdn[:dsc_sqlinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstance' do
    expect{dsc_xazurepackfqdn[:dsc_sqlinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xazurepackfqdn)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xazurepackfqdn)
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
