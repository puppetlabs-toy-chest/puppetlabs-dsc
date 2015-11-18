#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchmailboxserver) do

  let :dsc_xexchmailboxserver do
    Puppet::Type.type(:dsc_xexchmailboxserver).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchmailboxserver.to_s).to eq("Dsc_xexchmailboxserver[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchmailboxserver[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchmailboxserver).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_domaincontroller => 'foo',
      :dsc_databasecopyactivationdisabledandmovenow => true,
      :dsc_databasecopyautoactivationpolicy => 'Blocked',
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchmailboxserver[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchmailboxserver[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchmailboxserver[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchmailboxserver[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchmailboxserver[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchmailboxserver[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchmailboxserver[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchmailboxserver[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchmailboxserver[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchmailboxserver[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchmailboxserver[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchmailboxserver[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchmailboxserver[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasecopyactivationdisabledandmovenow' do
    expect{dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_databasecopyactivationdisabledandmovenow' do
    dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow] = true
    expect(dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_databasecopyactivationdisabledandmovenow" do
    dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow] = 'true'
    expect(dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_databasecopyactivationdisabledandmovenow" do
    dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow] = 'false'
    expect(dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_databasecopyactivationdisabledandmovenow" do
    dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow] = 'True'
    expect(dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_databasecopyactivationdisabledandmovenow" do
    dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow] = 'False'
    expect(dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_databasecopyactivationdisabledandmovenow" do
    dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow] = :true
    expect(dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_databasecopyactivationdisabledandmovenow" do
    dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow] = :false
    expect(dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow]).to eq(false)
  end

  it 'should not accept int for dsc_databasecopyactivationdisabledandmovenow' do
    expect{dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasecopyactivationdisabledandmovenow' do
    expect{dsc_xexchmailboxserver[:dsc_databasecopyactivationdisabledandmovenow] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_databasecopyautoactivationpolicy predefined value Blocked' do
    dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy] = 'Blocked'
    expect(dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy]).to eq('Blocked')
  end

  it 'should accept dsc_databasecopyautoactivationpolicy predefined value blocked' do
    dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy] = 'blocked'
    expect(dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy]).to eq('blocked')
  end

  it 'should accept dsc_databasecopyautoactivationpolicy predefined value IntrasiteOnly' do
    dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy] = 'IntrasiteOnly'
    expect(dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy]).to eq('IntrasiteOnly')
  end

  it 'should accept dsc_databasecopyautoactivationpolicy predefined value intrasiteonly' do
    dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy] = 'intrasiteonly'
    expect(dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy]).to eq('intrasiteonly')
  end

  it 'should accept dsc_databasecopyautoactivationpolicy predefined value Unrestricted' do
    dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy] = 'Unrestricted'
    expect(dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy]).to eq('Unrestricted')
  end

  it 'should accept dsc_databasecopyautoactivationpolicy predefined value unrestricted' do
    dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy] = 'unrestricted'
    expect(dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy]).to eq('unrestricted')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasecopyautoactivationpolicy' do
    expect{dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasecopyautoactivationpolicy' do
    expect{dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasecopyautoactivationpolicy' do
    expect{dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasecopyautoactivationpolicy' do
    expect{dsc_xexchmailboxserver[:dsc_databasecopyautoactivationpolicy] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchmailboxserver)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchmailboxserver)
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
