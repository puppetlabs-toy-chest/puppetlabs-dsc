#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverdatabaseowner) do

  let :dsc_xsqlserverdatabaseowner do
    Puppet::Type.type(:dsc_xsqlserverdatabaseowner).new(
      :name     => 'foo',
      :dsc_database => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsqlserverdatabaseowner).new(
      :name     => 'foo',
      :dsc_database => 'foo',
      :dsc_name => 'foo',
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstancename => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverdatabaseowner.to_s).to eq("Dsc_xsqlserverdatabaseowner[foo]")
  end

  it 'should require that dsc_database is specified' do
    #dsc_xsqlserverdatabaseowner[:dsc_database]
    expect { Puppet::Type.type(:dsc_xsqlserverdatabaseowner).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_database is a required attribute/)
  end

  it 'should not accept array for dsc_database' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_database] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_database' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_database] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_database' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_database] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_database' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_database] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstancename' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_sqlinstancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstancename' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_sqlinstancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstancename' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_sqlinstancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstancename' do
    expect{dsc_xsqlserverdatabaseowner[:dsc_sqlinstancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserverdatabaseowner)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserverdatabaseowner)
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
