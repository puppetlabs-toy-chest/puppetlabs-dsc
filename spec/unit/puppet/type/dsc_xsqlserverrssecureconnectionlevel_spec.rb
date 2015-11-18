#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverrssecureconnectionlevel) do

  let :dsc_xsqlserverrssecureconnectionlevel do
    Puppet::Type.type(:dsc_xsqlserverrssecureconnectionlevel).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
      :dsc_secureconnectionlevel => 16,
    )
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverrssecureconnectionlevel.to_s).to eq("Dsc_xsqlserverrssecureconnectionlevel[foo]")
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlserverrssecureconnectionlevel[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlserverrssecureconnectionlevel).new(
      :name     => 'foo',
      :dsc_secureconnectionlevel => 16,
      :dsc_sqladmincredential => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_instancename is a required attribute/)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlserverrssecureconnectionlevel[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlserverrssecureconnectionlevel[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlserverrssecureconnectionlevel[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlserverrssecureconnectionlevel[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_secureconnectionlevel is specified' do
    #dsc_xsqlserverrssecureconnectionlevel[:dsc_secureconnectionlevel]
    expect { Puppet::Type.type(:dsc_xsqlserverrssecureconnectionlevel).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
      :dsc_sqladmincredential => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_secureconnectionlevel is a required attribute/)
  end

  it 'should not accept array for dsc_secureconnectionlevel' do
    expect{dsc_xsqlserverrssecureconnectionlevel[:dsc_secureconnectionlevel] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_secureconnectionlevel' do
    expect{dsc_xsqlserverrssecureconnectionlevel[:dsc_secureconnectionlevel] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_secureconnectionlevel' do
    dsc_xsqlserverrssecureconnectionlevel[:dsc_secureconnectionlevel] = 16
    expect(dsc_xsqlserverrssecureconnectionlevel[:dsc_secureconnectionlevel]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_secureconnectionlevel' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xsqlserverrssecureconnectionlevel[:dsc_secureconnectionlevel] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_secureconnectionlevel' do
    dsc_xsqlserverrssecureconnectionlevel[:dsc_secureconnectionlevel] = '16'
    expect(dsc_xsqlserverrssecureconnectionlevel[:dsc_secureconnectionlevel]).to eq(16)
  end

  it 'should accept string-like uint for dsc_secureconnectionlevel' do
    dsc_xsqlserverrssecureconnectionlevel[:dsc_secureconnectionlevel] = '32'
    expect(dsc_xsqlserverrssecureconnectionlevel[:dsc_secureconnectionlevel]).to eq(32)
  end

  it 'should accept string-like uint for dsc_secureconnectionlevel' do
    dsc_xsqlserverrssecureconnectionlevel[:dsc_secureconnectionlevel] = '64'
    expect(dsc_xsqlserverrssecureconnectionlevel[:dsc_secureconnectionlevel]).to eq(64)
  end

  it "should not accept empty password for dsc_sqladmincredential" do
    expect{dsc_xsqlserverrssecureconnectionlevel[:dsc_sqladmincredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqladmincredential' do
    expect{dsc_xsqlserverrssecureconnectionlevel[:dsc_sqladmincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqladmincredential' do
    expect{dsc_xsqlserverrssecureconnectionlevel[:dsc_sqladmincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqladmincredential' do
    expect{dsc_xsqlserverrssecureconnectionlevel[:dsc_sqladmincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqladmincredential' do
    expect{dsc_xsqlserverrssecureconnectionlevel[:dsc_sqladmincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserverrssecureconnectionlevel)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserverrssecureconnectionlevel)
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
