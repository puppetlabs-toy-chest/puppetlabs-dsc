#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlservernetwork) do

  let :dsc_xsqlservernetwork do
    Puppet::Type.type(:dsc_xsqlservernetwork).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsqlservernetwork.to_s).to eq("Dsc_xsqlservernetwork[foo]")
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlservernetwork[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlservernetwork).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_instancename is a required attribute/)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlservernetwork[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlservernetwork[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlservernetwork[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlservernetwork[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_protocolname predefined value tcp' do
    dsc_xsqlservernetwork[:dsc_protocolname] = 'tcp'
    expect(dsc_xsqlservernetwork[:dsc_protocolname]).to eq('tcp')
  end

  it 'should accept dsc_protocolname predefined value tcp' do
    dsc_xsqlservernetwork[:dsc_protocolname] = 'tcp'
    expect(dsc_xsqlservernetwork[:dsc_protocolname]).to eq('tcp')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlservernetwork[:dsc_protocolname] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_protocolname' do
    expect{dsc_xsqlservernetwork[:dsc_protocolname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_protocolname' do
    expect{dsc_xsqlservernetwork[:dsc_protocolname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_protocolname' do
    expect{dsc_xsqlservernetwork[:dsc_protocolname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_protocolname' do
    expect{dsc_xsqlservernetwork[:dsc_protocolname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_isenabled' do
    expect{dsc_xsqlservernetwork[:dsc_isenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_isenabled' do
    dsc_xsqlservernetwork[:dsc_isenabled] = true
    expect(dsc_xsqlservernetwork[:dsc_isenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_isenabled" do
    dsc_xsqlservernetwork[:dsc_isenabled] = 'true'
    expect(dsc_xsqlservernetwork[:dsc_isenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_isenabled" do
    dsc_xsqlservernetwork[:dsc_isenabled] = 'false'
    expect(dsc_xsqlservernetwork[:dsc_isenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_isenabled" do
    dsc_xsqlservernetwork[:dsc_isenabled] = 'True'
    expect(dsc_xsqlservernetwork[:dsc_isenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_isenabled" do
    dsc_xsqlservernetwork[:dsc_isenabled] = 'False'
    expect(dsc_xsqlservernetwork[:dsc_isenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_isenabled" do
    dsc_xsqlservernetwork[:dsc_isenabled] = :true
    expect(dsc_xsqlservernetwork[:dsc_isenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_isenabled" do
    dsc_xsqlservernetwork[:dsc_isenabled] = :false
    expect(dsc_xsqlservernetwork[:dsc_isenabled]).to eq(false)
  end

  it 'should not accept int for dsc_isenabled' do
    expect{dsc_xsqlservernetwork[:dsc_isenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_isenabled' do
    expect{dsc_xsqlservernetwork[:dsc_isenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_tcpdynamicports predefined value 0' do
    dsc_xsqlservernetwork[:dsc_tcpdynamicports] = '0'
    expect(dsc_xsqlservernetwork[:dsc_tcpdynamicports]).to eq('0')
  end

  it 'should accept dsc_tcpdynamicports predefined value 0' do
    dsc_xsqlservernetwork[:dsc_tcpdynamicports] = '0'
    expect(dsc_xsqlservernetwork[:dsc_tcpdynamicports]).to eq('0')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlservernetwork[:dsc_tcpdynamicports] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_tcpdynamicports' do
    expect{dsc_xsqlservernetwork[:dsc_tcpdynamicports] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_tcpdynamicports' do
    expect{dsc_xsqlservernetwork[:dsc_tcpdynamicports] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_tcpdynamicports' do
    expect{dsc_xsqlservernetwork[:dsc_tcpdynamicports] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_tcpdynamicports' do
    expect{dsc_xsqlservernetwork[:dsc_tcpdynamicports] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_tcpport' do
    expect{dsc_xsqlservernetwork[:dsc_tcpport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_tcpport' do
    expect{dsc_xsqlservernetwork[:dsc_tcpport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_tcpport' do
    expect{dsc_xsqlservernetwork[:dsc_tcpport] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_tcpport' do
    expect{dsc_xsqlservernetwork[:dsc_tcpport] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_restartservice' do
    expect{dsc_xsqlservernetwork[:dsc_restartservice] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_restartservice' do
    dsc_xsqlservernetwork[:dsc_restartservice] = true
    expect(dsc_xsqlservernetwork[:dsc_restartservice]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_restartservice" do
    dsc_xsqlservernetwork[:dsc_restartservice] = 'true'
    expect(dsc_xsqlservernetwork[:dsc_restartservice]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_restartservice" do
    dsc_xsqlservernetwork[:dsc_restartservice] = 'false'
    expect(dsc_xsqlservernetwork[:dsc_restartservice]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_restartservice" do
    dsc_xsqlservernetwork[:dsc_restartservice] = 'True'
    expect(dsc_xsqlservernetwork[:dsc_restartservice]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_restartservice" do
    dsc_xsqlservernetwork[:dsc_restartservice] = 'False'
    expect(dsc_xsqlservernetwork[:dsc_restartservice]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_restartservice" do
    dsc_xsqlservernetwork[:dsc_restartservice] = :true
    expect(dsc_xsqlservernetwork[:dsc_restartservice]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_restartservice" do
    dsc_xsqlservernetwork[:dsc_restartservice] = :false
    expect(dsc_xsqlservernetwork[:dsc_restartservice]).to eq(false)
  end

  it 'should not accept int for dsc_restartservice' do
    expect{dsc_xsqlservernetwork[:dsc_restartservice] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_restartservice' do
    expect{dsc_xsqlservernetwork[:dsc_restartservice] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlservernetwork)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlservernetwork)
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
