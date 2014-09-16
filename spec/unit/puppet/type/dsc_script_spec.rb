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

  it "should stringify normally" do
    expect(dsc_script.to_s).to eq("Dsc_script[foo]")
  end

  it 'should require that dsc_getscript is specified' do
    #dsc_script[:dsc_getscript]
    expect { Puppet::Type.type(:dsc_script).new(
      :name     => 'foo',
      :dsc_setscript => 'foo',
      :dsc_testscript => 'foo',
      :dsc_credential => 'foo',
      :dsc_result => 'foo',
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
      :dsc_credential => 'foo',
      :dsc_result => 'foo',
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
      :dsc_credential => 'foo',
      :dsc_result => 'foo',
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

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_script)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_script)
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
        dsc_script[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_script[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_script)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_script)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_ScriptResource as $MSFT_ScriptResource1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_ScriptResource/)
    end


  end
end
