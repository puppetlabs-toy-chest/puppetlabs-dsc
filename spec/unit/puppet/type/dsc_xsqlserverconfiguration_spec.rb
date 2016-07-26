#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverconfiguration) do

  let :dsc_xsqlserverconfiguration do
    Puppet::Type.type(:dsc_xsqlserverconfiguration).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
      :dsc_optionname => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsqlserverconfiguration).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
      :dsc_optionname => 'foo',
      :dsc_optionvalue => -32,
      :dsc_restartservice => true,
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverconfiguration.to_s).to eq("Dsc_xsqlserverconfiguration[foo]")
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlserverconfiguration[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlserverconfiguration).new(
      :name     => 'foo',
      :dsc_optionname => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_instancename is a required attribute/)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlserverconfiguration[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlserverconfiguration[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlserverconfiguration[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlserverconfiguration[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_optionname is specified' do
    #dsc_xsqlserverconfiguration[:dsc_optionname]
    expect { Puppet::Type.type(:dsc_xsqlserverconfiguration).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_optionname is a required attribute/)
  end

  it 'should not accept array for dsc_optionname' do
    expect{dsc_xsqlserverconfiguration[:dsc_optionname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_optionname' do
    expect{dsc_xsqlserverconfiguration[:dsc_optionname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_optionname' do
    expect{dsc_xsqlserverconfiguration[:dsc_optionname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_optionname' do
    expect{dsc_xsqlserverconfiguration[:dsc_optionname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_optionvalue' do
    expect{dsc_xsqlserverconfiguration[:dsc_optionvalue] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_optionvalue' do
    expect{dsc_xsqlserverconfiguration[:dsc_optionvalue] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_optionvalue' do
    dsc_xsqlserverconfiguration[:dsc_optionvalue] = -32
    expect(dsc_xsqlserverconfiguration[:dsc_optionvalue]).to eq(-32)
  end

  it 'should accept string-like int for dsc_optionvalue' do
    dsc_xsqlserverconfiguration[:dsc_optionvalue] = '16'
    expect(dsc_xsqlserverconfiguration[:dsc_optionvalue]).to eq(16)
  end

  it 'should accept string-like int for dsc_optionvalue' do
    dsc_xsqlserverconfiguration[:dsc_optionvalue] = '-16'
    expect(dsc_xsqlserverconfiguration[:dsc_optionvalue]).to eq(-16)
  end

  it 'should accept string-like int for dsc_optionvalue' do
    dsc_xsqlserverconfiguration[:dsc_optionvalue] = '32'
    expect(dsc_xsqlserverconfiguration[:dsc_optionvalue]).to eq(32)
  end

  it 'should accept string-like int for dsc_optionvalue' do
    dsc_xsqlserverconfiguration[:dsc_optionvalue] = '-32'
    expect(dsc_xsqlserverconfiguration[:dsc_optionvalue]).to eq(-32)
  end


  it 'should not accept array for dsc_restartservice' do
    expect{dsc_xsqlserverconfiguration[:dsc_restartservice] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_restartservice' do
    dsc_xsqlserverconfiguration[:dsc_restartservice] = true
    expect(dsc_xsqlserverconfiguration[:dsc_restartservice]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_restartservice" do
    dsc_xsqlserverconfiguration[:dsc_restartservice] = 'true'
    expect(dsc_xsqlserverconfiguration[:dsc_restartservice]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_restartservice" do
    dsc_xsqlserverconfiguration[:dsc_restartservice] = 'false'
    expect(dsc_xsqlserverconfiguration[:dsc_restartservice]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_restartservice" do
    dsc_xsqlserverconfiguration[:dsc_restartservice] = 'True'
    expect(dsc_xsqlserverconfiguration[:dsc_restartservice]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_restartservice" do
    dsc_xsqlserverconfiguration[:dsc_restartservice] = 'False'
    expect(dsc_xsqlserverconfiguration[:dsc_restartservice]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_restartservice" do
    dsc_xsqlserverconfiguration[:dsc_restartservice] = :true
    expect(dsc_xsqlserverconfiguration[:dsc_restartservice]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_restartservice" do
    dsc_xsqlserverconfiguration[:dsc_restartservice] = :false
    expect(dsc_xsqlserverconfiguration[:dsc_restartservice]).to eq(false)
  end

  it 'should not accept int for dsc_restartservice' do
    expect{dsc_xsqlserverconfiguration[:dsc_restartservice] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_restartservice' do
    expect{dsc_xsqlserverconfiguration[:dsc_restartservice] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserverconfiguration)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserverconfiguration)
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
