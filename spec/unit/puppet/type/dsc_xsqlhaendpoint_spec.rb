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

  it 'should accept uint for dsc_portnumber' do
    dsc_xsqlhaendpoint[:dsc_portnumber] = 32
    expect(dsc_xsqlhaendpoint[:dsc_portnumber]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_portnumber' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xsqlhaendpoint[:dsc_portnumber] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_portnumber' do
    dsc_xsqlhaendpoint[:dsc_portnumber] = '16'
    expect(dsc_xsqlhaendpoint[:dsc_portnumber]).to eq(16)
  end

  it 'should accept string-like uint for dsc_portnumber' do
    dsc_xsqlhaendpoint[:dsc_portnumber] = '32'
    expect(dsc_xsqlhaendpoint[:dsc_portnumber]).to eq(32)
  end

  it 'should accept string-like uint for dsc_portnumber' do
    dsc_xsqlhaendpoint[:dsc_portnumber] = '64'
    expect(dsc_xsqlhaendpoint[:dsc_portnumber]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlhaendpoint)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlhaendpoint)
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
