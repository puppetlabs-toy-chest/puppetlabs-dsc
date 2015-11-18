#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchumservice) do

  let :dsc_xexchumservice do
    Puppet::Type.type(:dsc_xexchumservice).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchumservice.to_s).to eq("Dsc_xexchumservice[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchumservice[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchumservice).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_umstartupmode => 'TCP',
      :dsc_domaincontroller => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchumservice[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchumservice[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchumservice[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchumservice[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchumservice[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchumservice[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchumservice[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchumservice[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchumservice[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_umstartupmode predefined value TCP' do
    dsc_xexchumservice[:dsc_umstartupmode] = 'TCP'
    expect(dsc_xexchumservice[:dsc_umstartupmode]).to eq('TCP')
  end

  it 'should accept dsc_umstartupmode predefined value tcp' do
    dsc_xexchumservice[:dsc_umstartupmode] = 'tcp'
    expect(dsc_xexchumservice[:dsc_umstartupmode]).to eq('tcp')
  end

  it 'should accept dsc_umstartupmode predefined value TLS' do
    dsc_xexchumservice[:dsc_umstartupmode] = 'TLS'
    expect(dsc_xexchumservice[:dsc_umstartupmode]).to eq('TLS')
  end

  it 'should accept dsc_umstartupmode predefined value tls' do
    dsc_xexchumservice[:dsc_umstartupmode] = 'tls'
    expect(dsc_xexchumservice[:dsc_umstartupmode]).to eq('tls')
  end

  it 'should accept dsc_umstartupmode predefined value Dual' do
    dsc_xexchumservice[:dsc_umstartupmode] = 'Dual'
    expect(dsc_xexchumservice[:dsc_umstartupmode]).to eq('Dual')
  end

  it 'should accept dsc_umstartupmode predefined value dual' do
    dsc_xexchumservice[:dsc_umstartupmode] = 'dual'
    expect(dsc_xexchumservice[:dsc_umstartupmode]).to eq('dual')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchumservice[:dsc_umstartupmode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_umstartupmode' do
    expect{dsc_xexchumservice[:dsc_umstartupmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_umstartupmode' do
    expect{dsc_xexchumservice[:dsc_umstartupmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_umstartupmode' do
    expect{dsc_xexchumservice[:dsc_umstartupmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_umstartupmode' do
    expect{dsc_xexchumservice[:dsc_umstartupmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchumservice[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchumservice[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchumservice[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchumservice[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchumservice)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchumservice)
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
