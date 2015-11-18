#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazurepackdatabasesetting) do

  let :dsc_xazurepackdatabasesetting do
    Puppet::Type.type(:dsc_xazurepackdatabasesetting).new(
      :name     => 'foo',
      :dsc_namespace => 'AdminSite',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazurepackdatabasesetting.to_s).to eq("Dsc_xazurepackdatabasesetting[foo]")
  end

  it 'should require that dsc_namespace is specified' do
    #dsc_xazurepackdatabasesetting[:dsc_namespace]
    expect { Puppet::Type.type(:dsc_xazurepackdatabasesetting).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_value => 'foo',
      :dsc_azurepackadmincredential => {"user"=>"user", "password"=>"password"},
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstance => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_namespace is a required attribute/)
  end

  it 'should accept dsc_namespace predefined value AdminSite' do
    dsc_xazurepackdatabasesetting[:dsc_namespace] = 'AdminSite'
    expect(dsc_xazurepackdatabasesetting[:dsc_namespace]).to eq('AdminSite')
  end

  it 'should accept dsc_namespace predefined value adminsite' do
    dsc_xazurepackdatabasesetting[:dsc_namespace] = 'adminsite'
    expect(dsc_xazurepackdatabasesetting[:dsc_namespace]).to eq('adminsite')
  end

  it 'should accept dsc_namespace predefined value TenantSite' do
    dsc_xazurepackdatabasesetting[:dsc_namespace] = 'TenantSite'
    expect(dsc_xazurepackdatabasesetting[:dsc_namespace]).to eq('TenantSite')
  end

  it 'should accept dsc_namespace predefined value tenantsite' do
    dsc_xazurepackdatabasesetting[:dsc_namespace] = 'tenantsite'
    expect(dsc_xazurepackdatabasesetting[:dsc_namespace]).to eq('tenantsite')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurepackdatabasesetting[:dsc_namespace] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_namespace' do
    expect{dsc_xazurepackdatabasesetting[:dsc_namespace] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_namespace' do
    expect{dsc_xazurepackdatabasesetting[:dsc_namespace] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_namespace' do
    expect{dsc_xazurepackdatabasesetting[:dsc_namespace] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_namespace' do
    expect{dsc_xazurepackdatabasesetting[:dsc_namespace] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_name is specified' do
    #dsc_xazurepackdatabasesetting[:dsc_name]
    expect { Puppet::Type.type(:dsc_xazurepackdatabasesetting).new(
      :name     => 'foo',
      :dsc_namespace => 'AdminSite',
      :dsc_value => 'foo',
      :dsc_azurepackadmincredential => {"user"=>"user", "password"=>"password"},
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstance => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xazurepackdatabasesetting[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xazurepackdatabasesetting[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xazurepackdatabasesetting[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xazurepackdatabasesetting[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_value' do
    expect{dsc_xazurepackdatabasesetting[:dsc_value] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_value' do
    expect{dsc_xazurepackdatabasesetting[:dsc_value] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_value' do
    expect{dsc_xazurepackdatabasesetting[:dsc_value] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_value' do
    expect{dsc_xazurepackdatabasesetting[:dsc_value] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_azurepackadmincredential" do
    expect{dsc_xazurepackdatabasesetting[:dsc_azurepackadmincredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackdatabasesetting[:dsc_azurepackadmincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackdatabasesetting[:dsc_azurepackadmincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackdatabasesetting[:dsc_azurepackadmincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackdatabasesetting[:dsc_azurepackadmincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xazurepackdatabasesetting[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xazurepackdatabasesetting[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xazurepackdatabasesetting[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xazurepackdatabasesetting[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstance' do
    expect{dsc_xazurepackdatabasesetting[:dsc_sqlinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstance' do
    expect{dsc_xazurepackdatabasesetting[:dsc_sqlinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstance' do
    expect{dsc_xazurepackdatabasesetting[:dsc_sqlinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstance' do
    expect{dsc_xazurepackdatabasesetting[:dsc_sqlinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xazurepackdatabasesetting)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xazurepackdatabasesetting)
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
