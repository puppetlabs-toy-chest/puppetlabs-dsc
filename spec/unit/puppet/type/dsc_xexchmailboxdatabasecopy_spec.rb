#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchmailboxdatabasecopy) do

  let :dsc_xexchmailboxdatabasecopy do
    Puppet::Type.type(:dsc_xexchmailboxdatabasecopy).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchmailboxdatabasecopy.to_s).to eq("Dsc_xexchmailboxdatabasecopy[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchmailboxdatabasecopy[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchmailboxdatabasecopy).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_mailboxserver => 'foo',
      :dsc_adserversettingspreferredserver => 'foo',
      :dsc_allowservicerestart => true,
      :dsc_activationpreference => 32,
      :dsc_domaincontroller => 'foo',
      :dsc_replaylagtime => 'foo',
      :dsc_seedingpostponed => true,
      :dsc_truncationlagtime => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_mailboxserver' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_mailboxserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mailboxserver' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_mailboxserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mailboxserver' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_mailboxserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mailboxserver' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_mailboxserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adserversettingspreferredserver' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_adserversettingspreferredserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_adserversettingspreferredserver' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_adserversettingspreferredserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_adserversettingspreferredserver' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_adserversettingspreferredserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adserversettingspreferredserver' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_adserversettingspreferredserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart] = true
    expect(dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart] = :true
    expect(dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart] = :false
    expect(dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_activationpreference' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_activationpreference] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_activationpreference' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_activationpreference] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_activationpreference' do
    dsc_xexchmailboxdatabasecopy[:dsc_activationpreference] = 32
    expect(dsc_xexchmailboxdatabasecopy[:dsc_activationpreference]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_activationpreference' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xexchmailboxdatabasecopy[:dsc_activationpreference] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_activationpreference' do
    dsc_xexchmailboxdatabasecopy[:dsc_activationpreference] = '16'
    expect(dsc_xexchmailboxdatabasecopy[:dsc_activationpreference]).to eq(16)
  end

  it 'should accept string-like uint for dsc_activationpreference' do
    dsc_xexchmailboxdatabasecopy[:dsc_activationpreference] = '32'
    expect(dsc_xexchmailboxdatabasecopy[:dsc_activationpreference]).to eq(32)
  end

  it 'should accept string-like uint for dsc_activationpreference' do
    dsc_xexchmailboxdatabasecopy[:dsc_activationpreference] = '64'
    expect(dsc_xexchmailboxdatabasecopy[:dsc_activationpreference]).to eq(64)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_replaylagtime' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_replaylagtime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_replaylagtime' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_replaylagtime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_replaylagtime' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_replaylagtime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_replaylagtime' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_replaylagtime] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_seedingpostponed' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_seedingpostponed' do
    dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed] = true
    expect(dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_seedingpostponed" do
    dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed] = 'true'
    expect(dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_seedingpostponed" do
    dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed] = 'false'
    expect(dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_seedingpostponed" do
    dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed] = 'True'
    expect(dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_seedingpostponed" do
    dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed] = 'False'
    expect(dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_seedingpostponed" do
    dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed] = :true
    expect(dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_seedingpostponed" do
    dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed] = :false
    expect(dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed]).to eq(false)
  end

  it 'should not accept int for dsc_seedingpostponed' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_seedingpostponed' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_seedingpostponed] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_truncationlagtime' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_truncationlagtime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_truncationlagtime' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_truncationlagtime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_truncationlagtime' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_truncationlagtime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_truncationlagtime' do
    expect{dsc_xexchmailboxdatabasecopy[:dsc_truncationlagtime] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchmailboxdatabasecopy)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchmailboxdatabasecopy)
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
