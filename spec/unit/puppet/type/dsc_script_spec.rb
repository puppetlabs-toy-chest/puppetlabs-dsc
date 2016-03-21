#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_script) do

  let :dsc_script do
    Puppet::Type.type(:dsc_script).new(
      :name     => 'foo',
      :dsc_getscript => 'foo',
      :dsc_setscript => 'foo',
      :dsc_testscript => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_script).new(
      :name     => 'foo',
      :dsc_getscript => 'foo',
      :dsc_setscript => 'foo',
      :dsc_testscript => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_result => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_script.to_s).to eq("Dsc_script[foo]")
  end

  it 'should require that dsc_getscript is specified' do
    #dsc_script[:dsc_getscript]
    expect { Puppet::Type.type(:dsc_script).new(
      :name     => 'foo',
      :dsc_setscript => 'foo',
      :dsc_testscript => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_getscript is a required attribute/)
  end

  it 'should not accept array for dsc_getscript' do
    expect{dsc_script[:dsc_getscript] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_getscript' do
    expect{dsc_script[:dsc_getscript] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_getscript' do
    expect{dsc_script[:dsc_getscript] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_getscript' do
    expect{dsc_script[:dsc_getscript] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_setscript is specified' do
    #dsc_script[:dsc_setscript]
    expect { Puppet::Type.type(:dsc_script).new(
      :name     => 'foo',
      :dsc_getscript => 'foo',
      :dsc_testscript => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_setscript is a required attribute/)
  end

  it 'should not accept array for dsc_setscript' do
    expect{dsc_script[:dsc_setscript] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setscript' do
    expect{dsc_script[:dsc_setscript] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setscript' do
    expect{dsc_script[:dsc_setscript] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setscript' do
    expect{dsc_script[:dsc_setscript] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_testscript is specified' do
    #dsc_script[:dsc_testscript]
    expect { Puppet::Type.type(:dsc_script).new(
      :name     => 'foo',
      :dsc_getscript => 'foo',
      :dsc_setscript => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_testscript is a required attribute/)
  end

  it 'should not accept array for dsc_testscript' do
    expect{dsc_script[:dsc_testscript] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_testscript' do
    expect{dsc_script[:dsc_testscript] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_testscript' do
    expect{dsc_script[:dsc_testscript] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_testscript' do
    expect{dsc_script[:dsc_testscript] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_script[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_script[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_script[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_script[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_script[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_result' do
    expect{dsc_script[:dsc_result] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_result' do
    expect{dsc_script[:dsc_result] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_result' do
    expect{dsc_script[:dsc_result] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_result' do
    expect{dsc_script[:dsc_result] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_script)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_script)
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
