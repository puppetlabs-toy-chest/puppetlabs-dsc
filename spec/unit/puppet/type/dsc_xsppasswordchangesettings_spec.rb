#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsppasswordchangesettings) do

  let :dsc_xsppasswordchangesettings do
    Puppet::Type.type(:dsc_xsppasswordchangesettings).new(
      :name     => 'foo',
      :dsc_mailaddress => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsppasswordchangesettings.to_s).to eq("Dsc_xsppasswordchangesettings[foo]")
  end

  it 'should require that dsc_mailaddress is specified' do
    #dsc_xsppasswordchangesettings[:dsc_mailaddress]
    expect { Puppet::Type.type(:dsc_xsppasswordchangesettings).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_mailaddress is a required attribute/)
  end

  it 'should not accept array for dsc_mailaddress' do
    expect{dsc_xsppasswordchangesettings[:dsc_mailaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mailaddress' do
    expect{dsc_xsppasswordchangesettings[:dsc_mailaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mailaddress' do
    expect{dsc_xsppasswordchangesettings[:dsc_mailaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mailaddress' do
    expect{dsc_xsppasswordchangesettings[:dsc_mailaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_daysbeforeexpiry' do
    expect{dsc_xsppasswordchangesettings[:dsc_daysbeforeexpiry] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_daysbeforeexpiry' do
    expect{dsc_xsppasswordchangesettings[:dsc_daysbeforeexpiry] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_daysbeforeexpiry' do
    dsc_xsppasswordchangesettings[:dsc_daysbeforeexpiry] = 32
    expect(dsc_xsppasswordchangesettings[:dsc_daysbeforeexpiry]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_daysbeforeexpiry' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xsppasswordchangesettings[:dsc_daysbeforeexpiry] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_daysbeforeexpiry' do
    dsc_xsppasswordchangesettings[:dsc_daysbeforeexpiry] = '16'
    expect(dsc_xsppasswordchangesettings[:dsc_daysbeforeexpiry]).to eq(16)
  end

  it 'should accept string-like uint for dsc_daysbeforeexpiry' do
    dsc_xsppasswordchangesettings[:dsc_daysbeforeexpiry] = '32'
    expect(dsc_xsppasswordchangesettings[:dsc_daysbeforeexpiry]).to eq(32)
  end

  it 'should accept string-like uint for dsc_daysbeforeexpiry' do
    dsc_xsppasswordchangesettings[:dsc_daysbeforeexpiry] = '64'
    expect(dsc_xsppasswordchangesettings[:dsc_daysbeforeexpiry]).to eq(64)
  end

  it 'should not accept array for dsc_passwordchangewaittimeseconds' do
    expect{dsc_xsppasswordchangesettings[:dsc_passwordchangewaittimeseconds] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_passwordchangewaittimeseconds' do
    expect{dsc_xsppasswordchangesettings[:dsc_passwordchangewaittimeseconds] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_passwordchangewaittimeseconds' do
    dsc_xsppasswordchangesettings[:dsc_passwordchangewaittimeseconds] = 32
    expect(dsc_xsppasswordchangesettings[:dsc_passwordchangewaittimeseconds]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_passwordchangewaittimeseconds' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xsppasswordchangesettings[:dsc_passwordchangewaittimeseconds] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_passwordchangewaittimeseconds' do
    dsc_xsppasswordchangesettings[:dsc_passwordchangewaittimeseconds] = '16'
    expect(dsc_xsppasswordchangesettings[:dsc_passwordchangewaittimeseconds]).to eq(16)
  end

  it 'should accept string-like uint for dsc_passwordchangewaittimeseconds' do
    dsc_xsppasswordchangesettings[:dsc_passwordchangewaittimeseconds] = '32'
    expect(dsc_xsppasswordchangesettings[:dsc_passwordchangewaittimeseconds]).to eq(32)
  end

  it 'should accept string-like uint for dsc_passwordchangewaittimeseconds' do
    dsc_xsppasswordchangesettings[:dsc_passwordchangewaittimeseconds] = '64'
    expect(dsc_xsppasswordchangesettings[:dsc_passwordchangewaittimeseconds]).to eq(64)
  end

  it 'should not accept array for dsc_numberofretries' do
    expect{dsc_xsppasswordchangesettings[:dsc_numberofretries] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_numberofretries' do
    expect{dsc_xsppasswordchangesettings[:dsc_numberofretries] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_numberofretries' do
    dsc_xsppasswordchangesettings[:dsc_numberofretries] = 32
    expect(dsc_xsppasswordchangesettings[:dsc_numberofretries]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_numberofretries' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xsppasswordchangesettings[:dsc_numberofretries] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_numberofretries' do
    dsc_xsppasswordchangesettings[:dsc_numberofretries] = '16'
    expect(dsc_xsppasswordchangesettings[:dsc_numberofretries]).to eq(16)
  end

  it 'should accept string-like uint for dsc_numberofretries' do
    dsc_xsppasswordchangesettings[:dsc_numberofretries] = '32'
    expect(dsc_xsppasswordchangesettings[:dsc_numberofretries]).to eq(32)
  end

  it 'should accept string-like uint for dsc_numberofretries' do
    dsc_xsppasswordchangesettings[:dsc_numberofretries] = '64'
    expect(dsc_xsppasswordchangesettings[:dsc_numberofretries]).to eq(64)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xsppasswordchangesettings[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xsppasswordchangesettings[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xsppasswordchangesettings[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xsppasswordchangesettings[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xsppasswordchangesettings[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsppasswordchangesettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsppasswordchangesettings)
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
