#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverdatabasepermissions) do

  let :dsc_xsqlserverdatabasepermissions do
    Puppet::Type.type(:dsc_xsqlserverdatabasepermissions).new(
      :name     => 'foo',
      :dsc_database => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverdatabasepermissions.to_s).to eq("Dsc_xsqlserverdatabasepermissions[foo]")
  end

  it 'should require that dsc_database is specified' do
    #dsc_xsqlserverdatabasepermissions[:dsc_database]
    expect { Puppet::Type.type(:dsc_xsqlserverdatabasepermissions).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_permissions => ["foo", "bar", "spec"],
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstancename => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_database is a required attribute/)
  end

  it 'should not accept array for dsc_database' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_database] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_database' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_database] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_database' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_database] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_database' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_database] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_permissions' do
    dsc_xsqlserverdatabasepermissions[:dsc_permissions] = ["foo", "bar", "spec"]
    expect(dsc_xsqlserverdatabasepermissions[:dsc_permissions]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_permissions' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_permissions] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_permissions' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_permissions] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_permissions' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_permissions] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstancename' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_sqlinstancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstancename' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_sqlinstancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstancename' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_sqlinstancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstancename' do
    expect{dsc_xsqlserverdatabasepermissions[:dsc_sqlinstancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserverdatabasepermissions)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserverdatabasepermissions)
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

  end
end
