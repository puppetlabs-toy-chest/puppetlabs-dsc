#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazurevmdscextension) do

  let :dsc_xazurevmdscextension do
    Puppet::Type.type(:dsc_xazurevmdscextension).new(
      :name     => 'foo',
      :dsc_vmname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazurevmdscextension.to_s).to eq("Dsc_xazurevmdscextension[foo]")
  end

  it 'should require that dsc_vmname is specified' do
    #dsc_xazurevmdscextension[:dsc_vmname]
    expect { Puppet::Type.type(:dsc_xazurevmdscextension).new(
      :name     => 'foo',
      :dsc_servicename => 'foo',
      :dsc_configurationarchive => 'foo',
      :dsc_storageaccountname => 'foo',
      :dsc_configurationargument => {"somekey"=>"somevalue"},
      :dsc_configurationdatapath => 'foo',
      :dsc_configuration => 'foo',
      :dsc_containername => 'foo',
      :dsc_force => true,
      :dsc_referencename => 'foo',
      :dsc_storageendpointsuffix => 'foo',
      :dsc_version => 'foo',
      :dsc_timestamp => 'foo',
      :dsc_code => 'foo',
      :dsc_message => 'foo',
      :dsc_status => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_vmname is a required attribute/)
  end

  it 'should not accept array for dsc_vmname' do
    expect{dsc_xazurevmdscextension[:dsc_vmname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_vmname' do
    expect{dsc_xazurevmdscextension[:dsc_vmname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_vmname' do
    expect{dsc_xazurevmdscextension[:dsc_vmname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_vmname' do
    expect{dsc_xazurevmdscextension[:dsc_vmname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_servicename' do
    expect{dsc_xazurevmdscextension[:dsc_servicename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servicename' do
    expect{dsc_xazurevmdscextension[:dsc_servicename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servicename' do
    expect{dsc_xazurevmdscextension[:dsc_servicename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servicename' do
    expect{dsc_xazurevmdscextension[:dsc_servicename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_configurationarchive' do
    expect{dsc_xazurevmdscextension[:dsc_configurationarchive] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_configurationarchive' do
    expect{dsc_xazurevmdscextension[:dsc_configurationarchive] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_configurationarchive' do
    expect{dsc_xazurevmdscextension[:dsc_configurationarchive] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_configurationarchive' do
    expect{dsc_xazurevmdscextension[:dsc_configurationarchive] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_storageaccountname' do
    expect{dsc_xazurevmdscextension[:dsc_storageaccountname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_storageaccountname' do
    expect{dsc_xazurevmdscextension[:dsc_storageaccountname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_storageaccountname' do
    expect{dsc_xazurevmdscextension[:dsc_storageaccountname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_storageaccountname' do
    expect{dsc_xazurevmdscextension[:dsc_storageaccountname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_configurationargument' do
    expect{dsc_xazurevmdscextension[:dsc_configurationargument] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_configurationargument' do
    expect{dsc_xazurevmdscextension[:dsc_configurationargument] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_configurationargument' do
    expect{dsc_xazurevmdscextension[:dsc_configurationargument] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_configurationargument' do
    expect{dsc_xazurevmdscextension[:dsc_configurationargument] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_configurationdatapath' do
    expect{dsc_xazurevmdscextension[:dsc_configurationdatapath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_configurationdatapath' do
    expect{dsc_xazurevmdscextension[:dsc_configurationdatapath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_configurationdatapath' do
    expect{dsc_xazurevmdscextension[:dsc_configurationdatapath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_configurationdatapath' do
    expect{dsc_xazurevmdscextension[:dsc_configurationdatapath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_configuration' do
    expect{dsc_xazurevmdscextension[:dsc_configuration] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_configuration' do
    expect{dsc_xazurevmdscextension[:dsc_configuration] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_configuration' do
    expect{dsc_xazurevmdscextension[:dsc_configuration] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_configuration' do
    expect{dsc_xazurevmdscextension[:dsc_configuration] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_containername' do
    expect{dsc_xazurevmdscextension[:dsc_containername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_containername' do
    expect{dsc_xazurevmdscextension[:dsc_containername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_containername' do
    expect{dsc_xazurevmdscextension[:dsc_containername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_containername' do
    expect{dsc_xazurevmdscextension[:dsc_containername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_force' do
    expect{dsc_xazurevmdscextension[:dsc_force] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_force' do
    dsc_xazurevmdscextension[:dsc_force] = true
    expect(dsc_xazurevmdscextension[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_force" do
    dsc_xazurevmdscextension[:dsc_force] = 'true'
    expect(dsc_xazurevmdscextension[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_force" do
    dsc_xazurevmdscextension[:dsc_force] = 'false'
    expect(dsc_xazurevmdscextension[:dsc_force]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_force" do
    dsc_xazurevmdscextension[:dsc_force] = 'True'
    expect(dsc_xazurevmdscextension[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_force" do
    dsc_xazurevmdscextension[:dsc_force] = 'False'
    expect(dsc_xazurevmdscextension[:dsc_force]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_force" do
    dsc_xazurevmdscextension[:dsc_force] = :true
    expect(dsc_xazurevmdscextension[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_force" do
    dsc_xazurevmdscextension[:dsc_force] = :false
    expect(dsc_xazurevmdscextension[:dsc_force]).to eq(false)
  end

  it 'should not accept int for dsc_force' do
    expect{dsc_xazurevmdscextension[:dsc_force] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_force' do
    expect{dsc_xazurevmdscextension[:dsc_force] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_referencename' do
    expect{dsc_xazurevmdscextension[:dsc_referencename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_referencename' do
    expect{dsc_xazurevmdscextension[:dsc_referencename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_referencename' do
    expect{dsc_xazurevmdscextension[:dsc_referencename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_referencename' do
    expect{dsc_xazurevmdscextension[:dsc_referencename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_storageendpointsuffix' do
    expect{dsc_xazurevmdscextension[:dsc_storageendpointsuffix] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_storageendpointsuffix' do
    expect{dsc_xazurevmdscextension[:dsc_storageendpointsuffix] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_storageendpointsuffix' do
    expect{dsc_xazurevmdscextension[:dsc_storageendpointsuffix] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_storageendpointsuffix' do
    expect{dsc_xazurevmdscextension[:dsc_storageendpointsuffix] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_version' do
    expect{dsc_xazurevmdscextension[:dsc_version] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_version' do
    expect{dsc_xazurevmdscextension[:dsc_version] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_version' do
    expect{dsc_xazurevmdscextension[:dsc_version] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_version' do
    expect{dsc_xazurevmdscextension[:dsc_version] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_timestamp' do
    expect{dsc_xazurevmdscextension[:dsc_timestamp] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_timestamp' do
    expect{dsc_xazurevmdscextension[:dsc_timestamp] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_timestamp' do
    expect{dsc_xazurevmdscextension[:dsc_timestamp] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_timestamp' do
    expect{dsc_xazurevmdscextension[:dsc_timestamp] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_code' do
    expect{dsc_xazurevmdscextension[:dsc_code] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_code' do
    expect{dsc_xazurevmdscextension[:dsc_code] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_code' do
    expect{dsc_xazurevmdscextension[:dsc_code] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_code' do
    expect{dsc_xazurevmdscextension[:dsc_code] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_message' do
    expect{dsc_xazurevmdscextension[:dsc_message] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_message' do
    expect{dsc_xazurevmdscextension[:dsc_message] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_message' do
    expect{dsc_xazurevmdscextension[:dsc_message] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_message' do
    expect{dsc_xazurevmdscextension[:dsc_message] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_status' do
    expect{dsc_xazurevmdscextension[:dsc_status] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_status' do
    expect{dsc_xazurevmdscextension[:dsc_status] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_status' do
    expect{dsc_xazurevmdscextension[:dsc_status] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_status' do
    expect{dsc_xazurevmdscextension[:dsc_status] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xazurevmdscextension)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xazurevmdscextension)
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
