#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xrdsessiondeployment) do

  let :dsc_xrdsessiondeployment do
    Puppet::Type.type(:dsc_xrdsessiondeployment).new(
      :name     => 'foo',
      :dsc_sessionhost => 'foo',
      :dsc_connectionbroker => 'foo',
      :dsc_webaccessserver => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xrdsessiondeployment.to_s).to eq("Dsc_xrdsessiondeployment[foo]")
  end

  it 'should require that dsc_sessionhost is specified' do
    #dsc_xrdsessiondeployment[:dsc_sessionhost]
    expect { Puppet::Type.type(:dsc_xrdsessiondeployment).new(
      :name     => 'foo',
      :dsc_connectionbroker => 'foo',
      :dsc_webaccessserver => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_sessionhost is a required attribute/)
  end

  it 'should not accept array for dsc_sessionhost' do
    expect{dsc_xrdsessiondeployment[:dsc_sessionhost] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sessionhost' do
    expect{dsc_xrdsessiondeployment[:dsc_sessionhost] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sessionhost' do
    expect{dsc_xrdsessiondeployment[:dsc_sessionhost] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sessionhost' do
    expect{dsc_xrdsessiondeployment[:dsc_sessionhost] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_connectionbroker is specified' do
    #dsc_xrdsessiondeployment[:dsc_connectionbroker]
    expect { Puppet::Type.type(:dsc_xrdsessiondeployment).new(
      :name     => 'foo',
      :dsc_sessionhost => 'foo',
      :dsc_webaccessserver => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_connectionbroker is a required attribute/)
  end

  it 'should not accept array for dsc_connectionbroker' do
    expect{dsc_xrdsessiondeployment[:dsc_connectionbroker] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectionbroker' do
    expect{dsc_xrdsessiondeployment[:dsc_connectionbroker] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectionbroker' do
    expect{dsc_xrdsessiondeployment[:dsc_connectionbroker] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectionbroker' do
    expect{dsc_xrdsessiondeployment[:dsc_connectionbroker] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_webaccessserver is specified' do
    #dsc_xrdsessiondeployment[:dsc_webaccessserver]
    expect { Puppet::Type.type(:dsc_xrdsessiondeployment).new(
      :name     => 'foo',
      :dsc_sessionhost => 'foo',
      :dsc_connectionbroker => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_webaccessserver is a required attribute/)
  end

  it 'should not accept array for dsc_webaccessserver' do
    expect{dsc_xrdsessiondeployment[:dsc_webaccessserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webaccessserver' do
    expect{dsc_xrdsessiondeployment[:dsc_webaccessserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webaccessserver' do
    expect{dsc_xrdsessiondeployment[:dsc_webaccessserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webaccessserver' do
    expect{dsc_xrdsessiondeployment[:dsc_webaccessserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xrdsessiondeployment)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xrdsessiondeployment)
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
        dsc_xrdsessiondeployment[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xrdsessiondeployment[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xrdsessiondeployment)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xrdsessiondeployment)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xRDSessionDeployment as $MSFT_xRDSessionDeployment1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xRDSessionDeployment/)
    end


  end
end
