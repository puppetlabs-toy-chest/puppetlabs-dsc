#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlhaendpoint) do

  let :dsc_xsqlhaendpoint do
    Puppet::Type.type(:dsc_xsqlhaendpoint).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsqlhaendpoint.to_s).to eq("Dsc_xsqlhaendpoint[foo]")
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlhaendpoint[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlhaendpoint).new(
      :name     => 'foo',
      :dsc_alloweduser => 'foo',
      :dsc_name => 'foo',
      :dsc_portnumber => 32,
    )}.to raise_error(Puppet::Error, /dsc_instancename is a required attribute/)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlhaendpoint[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlhaendpoint[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlhaendpoint[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlhaendpoint[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_alloweduser' do
    expect{dsc_xsqlhaendpoint[:dsc_alloweduser] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_alloweduser' do
    expect{dsc_xsqlhaendpoint[:dsc_alloweduser] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_alloweduser' do
    expect{dsc_xsqlhaendpoint[:dsc_alloweduser] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_alloweduser' do
    expect{dsc_xsqlhaendpoint[:dsc_alloweduser] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_name is specified' do
    #dsc_xsqlhaendpoint[:dsc_name]
    expect { Puppet::Type.type(:dsc_xsqlhaendpoint).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
      :dsc_alloweduser => 'foo',
      :dsc_portnumber => 32,
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xsqlhaendpoint[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xsqlhaendpoint[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xsqlhaendpoint[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xsqlhaendpoint[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_portnumber' do
    expect{dsc_xsqlhaendpoint[:dsc_portnumber] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_portnumber' do
    expect{dsc_xsqlhaendpoint[:dsc_portnumber] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_portnumber' do
    expect{dsc_xsqlhaendpoint[:dsc_portnumber] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_portnumber' do
    dsc_xsqlhaendpoint[:dsc_portnumber] = 32
    expect(dsc_xsqlhaendpoint[:dsc_portnumber]).to eq(32)
  end


  it 'should accept string-like int for dsc_portnumber' do
    dsc_xsqlhaendpoint[:dsc_portnumber] = '16'
    expect(dsc_xsqlhaendpoint[:dsc_portnumber]).to eq(16)
  end


  it 'should accept string-like int for dsc_portnumber' do
    dsc_xsqlhaendpoint[:dsc_portnumber] = '32'
    expect(dsc_xsqlhaendpoint[:dsc_portnumber]).to eq(32)
  end


  it 'should accept string-like int for dsc_portnumber' do
    dsc_xsqlhaendpoint[:dsc_portnumber] = '64'
    expect(dsc_xsqlhaendpoint[:dsc_portnumber]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xsqlhaendpoint)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xsqlhaendpoint)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Import-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script with Import-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Import-DscResource/)
      end

    end

    describe "when dscmeta_import_resource is false" do

      it "should compute powershell dsc test script without Import-DscResource" do
        dsc_xsqlhaendpoint[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xsqlhaendpoint[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xsqlhaendpoint)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xsqlhaendpoint)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xSqlHAEndPoint as $MSFT_xSqlHAEndPoint1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xSqlHAEndPoint/)
    end


  end
end
