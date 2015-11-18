#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlhaservice) do

  let :dsc_xsqlhaservice do
    Puppet::Type.type(:dsc_xsqlhaservice).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsqlhaservice.to_s).to eq("Dsc_xsqlhaservice[foo]")
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlhaservice[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlhaservice).new(
      :name     => 'foo',
      :dsc_sqladministratorcredential => {"user"=>"user", "password"=>"password"},
      :dsc_servicecredential => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_instancename is a required attribute/)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlhaservice[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlhaservice[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlhaservice[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlhaservice[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_sqladministratorcredential" do
    expect{dsc_xsqlhaservice[:dsc_sqladministratorcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqladministratorcredential' do
    expect{dsc_xsqlhaservice[:dsc_sqladministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqladministratorcredential' do
    expect{dsc_xsqlhaservice[:dsc_sqladministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqladministratorcredential' do
    expect{dsc_xsqlhaservice[:dsc_sqladministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqladministratorcredential' do
    expect{dsc_xsqlhaservice[:dsc_sqladministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_servicecredential" do
    expect{dsc_xsqlhaservice[:dsc_servicecredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_servicecredential' do
    expect{dsc_xsqlhaservice[:dsc_servicecredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servicecredential' do
    expect{dsc_xsqlhaservice[:dsc_servicecredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servicecredential' do
    expect{dsc_xsqlhaservice[:dsc_servicecredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servicecredential' do
    expect{dsc_xsqlhaservice[:dsc_servicecredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlhaservice)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlhaservice)
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
