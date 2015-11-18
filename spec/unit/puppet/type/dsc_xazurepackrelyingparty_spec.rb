#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazurepackrelyingparty) do

  let :dsc_xazurepackrelyingparty do
    Puppet::Type.type(:dsc_xazurepackrelyingparty).new(
      :name     => 'foo',
      :dsc_target => 'Admin',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazurepackrelyingparty.to_s).to eq("Dsc_xazurepackrelyingparty[foo]")
  end

  it 'should require that dsc_target is specified' do
    #dsc_xazurepackrelyingparty[:dsc_target]
    expect { Puppet::Type.type(:dsc_xazurepackrelyingparty).new(
      :name     => 'foo',
      :dsc_fullyqualifieddomainname => 'foo',
      :dsc_port => 16,
      :dsc_azurepackadmincredential => {"user"=>"user", "password"=>"password"},
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstance => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_target is a required attribute/)
  end

  it 'should accept dsc_target predefined value Admin' do
    dsc_xazurepackrelyingparty[:dsc_target] = 'Admin'
    expect(dsc_xazurepackrelyingparty[:dsc_target]).to eq('Admin')
  end

  it 'should accept dsc_target predefined value admin' do
    dsc_xazurepackrelyingparty[:dsc_target] = 'admin'
    expect(dsc_xazurepackrelyingparty[:dsc_target]).to eq('admin')
  end

  it 'should accept dsc_target predefined value Tenant' do
    dsc_xazurepackrelyingparty[:dsc_target] = 'Tenant'
    expect(dsc_xazurepackrelyingparty[:dsc_target]).to eq('Tenant')
  end

  it 'should accept dsc_target predefined value tenant' do
    dsc_xazurepackrelyingparty[:dsc_target] = 'tenant'
    expect(dsc_xazurepackrelyingparty[:dsc_target]).to eq('tenant')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurepackrelyingparty[:dsc_target] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_target' do
    expect{dsc_xazurepackrelyingparty[:dsc_target] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_target' do
    expect{dsc_xazurepackrelyingparty[:dsc_target] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_target' do
    expect{dsc_xazurepackrelyingparty[:dsc_target] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_target' do
    expect{dsc_xazurepackrelyingparty[:dsc_target] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_fullyqualifieddomainname' do
    expect{dsc_xazurepackrelyingparty[:dsc_fullyqualifieddomainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_fullyqualifieddomainname' do
    expect{dsc_xazurepackrelyingparty[:dsc_fullyqualifieddomainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_fullyqualifieddomainname' do
    expect{dsc_xazurepackrelyingparty[:dsc_fullyqualifieddomainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_fullyqualifieddomainname' do
    expect{dsc_xazurepackrelyingparty[:dsc_fullyqualifieddomainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_port' do
    expect{dsc_xazurepackrelyingparty[:dsc_port] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_port' do
    expect{dsc_xazurepackrelyingparty[:dsc_port] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_port' do
    dsc_xazurepackrelyingparty[:dsc_port] = 16
    expect(dsc_xazurepackrelyingparty[:dsc_port]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_port' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xazurepackrelyingparty[:dsc_port] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_xazurepackrelyingparty[:dsc_port] = '16'
    expect(dsc_xazurepackrelyingparty[:dsc_port]).to eq(16)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_xazurepackrelyingparty[:dsc_port] = '32'
    expect(dsc_xazurepackrelyingparty[:dsc_port]).to eq(32)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_xazurepackrelyingparty[:dsc_port] = '64'
    expect(dsc_xazurepackrelyingparty[:dsc_port]).to eq(64)
  end

  it "should not accept empty password for dsc_azurepackadmincredential" do
    expect{dsc_xazurepackrelyingparty[:dsc_azurepackadmincredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackrelyingparty[:dsc_azurepackadmincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackrelyingparty[:dsc_azurepackadmincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackrelyingparty[:dsc_azurepackadmincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackrelyingparty[:dsc_azurepackadmincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xazurepackrelyingparty[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xazurepackrelyingparty[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xazurepackrelyingparty[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xazurepackrelyingparty[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstance' do
    expect{dsc_xazurepackrelyingparty[:dsc_sqlinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstance' do
    expect{dsc_xazurepackrelyingparty[:dsc_sqlinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstance' do
    expect{dsc_xazurepackrelyingparty[:dsc_sqlinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstance' do
    expect{dsc_xazurepackrelyingparty[:dsc_sqlinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xazurepackrelyingparty)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xazurepackrelyingparty)
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
