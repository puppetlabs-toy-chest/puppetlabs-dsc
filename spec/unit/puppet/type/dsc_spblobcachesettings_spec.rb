#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spblobcachesettings) do

  let :dsc_spblobcachesettings do
    Puppet::Type.type(:dsc_spblobcachesettings).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spblobcachesettings).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_zone => 'Default',
      :dsc_enablecache => true,
      :dsc_location => 'foo',
      :dsc_maxsizeingb => 16,
      :dsc_maxageinseconds => 32,
      :dsc_filetypes => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spblobcachesettings.to_s).to eq("Dsc_spblobcachesettings[foo]")
  end

  it 'should require that dsc_webappurl is specified' do
    #dsc_spblobcachesettings[:dsc_webappurl]
    expect { Puppet::Type.type(:dsc_spblobcachesettings).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_webappurl is a required attribute/)
  end

  it 'should not accept array for dsc_webappurl' do
    expect{dsc_spblobcachesettings[:dsc_webappurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webappurl' do
    expect{dsc_spblobcachesettings[:dsc_webappurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webappurl' do
    expect{dsc_spblobcachesettings[:dsc_webappurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webappurl' do
    expect{dsc_spblobcachesettings[:dsc_webappurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_zone predefined value Default' do
    dsc_spblobcachesettings[:dsc_zone] = 'Default'
    expect(dsc_spblobcachesettings[:dsc_zone]).to eq('Default')
  end

  it 'should accept dsc_zone predefined value default' do
    dsc_spblobcachesettings[:dsc_zone] = 'default'
    expect(dsc_spblobcachesettings[:dsc_zone]).to eq('default')
  end

  it 'should accept dsc_zone predefined value Intranet' do
    dsc_spblobcachesettings[:dsc_zone] = 'Intranet'
    expect(dsc_spblobcachesettings[:dsc_zone]).to eq('Intranet')
  end

  it 'should accept dsc_zone predefined value intranet' do
    dsc_spblobcachesettings[:dsc_zone] = 'intranet'
    expect(dsc_spblobcachesettings[:dsc_zone]).to eq('intranet')
  end

  it 'should accept dsc_zone predefined value Internet' do
    dsc_spblobcachesettings[:dsc_zone] = 'Internet'
    expect(dsc_spblobcachesettings[:dsc_zone]).to eq('Internet')
  end

  it 'should accept dsc_zone predefined value internet' do
    dsc_spblobcachesettings[:dsc_zone] = 'internet'
    expect(dsc_spblobcachesettings[:dsc_zone]).to eq('internet')
  end

  it 'should accept dsc_zone predefined value Custom' do
    dsc_spblobcachesettings[:dsc_zone] = 'Custom'
    expect(dsc_spblobcachesettings[:dsc_zone]).to eq('Custom')
  end

  it 'should accept dsc_zone predefined value custom' do
    dsc_spblobcachesettings[:dsc_zone] = 'custom'
    expect(dsc_spblobcachesettings[:dsc_zone]).to eq('custom')
  end

  it 'should accept dsc_zone predefined value Extranet' do
    dsc_spblobcachesettings[:dsc_zone] = 'Extranet'
    expect(dsc_spblobcachesettings[:dsc_zone]).to eq('Extranet')
  end

  it 'should accept dsc_zone predefined value extranet' do
    dsc_spblobcachesettings[:dsc_zone] = 'extranet'
    expect(dsc_spblobcachesettings[:dsc_zone]).to eq('extranet')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spblobcachesettings[:dsc_zone] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_zone' do
    expect{dsc_spblobcachesettings[:dsc_zone] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_zone' do
    expect{dsc_spblobcachesettings[:dsc_zone] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_zone' do
    expect{dsc_spblobcachesettings[:dsc_zone] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_zone' do
    expect{dsc_spblobcachesettings[:dsc_zone] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enablecache' do
    expect{dsc_spblobcachesettings[:dsc_enablecache] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enablecache' do
    dsc_spblobcachesettings[:dsc_enablecache] = true
    expect(dsc_spblobcachesettings[:dsc_enablecache]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enablecache" do
    dsc_spblobcachesettings[:dsc_enablecache] = 'true'
    expect(dsc_spblobcachesettings[:dsc_enablecache]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enablecache" do
    dsc_spblobcachesettings[:dsc_enablecache] = 'false'
    expect(dsc_spblobcachesettings[:dsc_enablecache]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enablecache" do
    dsc_spblobcachesettings[:dsc_enablecache] = 'True'
    expect(dsc_spblobcachesettings[:dsc_enablecache]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enablecache" do
    dsc_spblobcachesettings[:dsc_enablecache] = 'False'
    expect(dsc_spblobcachesettings[:dsc_enablecache]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enablecache" do
    dsc_spblobcachesettings[:dsc_enablecache] = :true
    expect(dsc_spblobcachesettings[:dsc_enablecache]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enablecache" do
    dsc_spblobcachesettings[:dsc_enablecache] = :false
    expect(dsc_spblobcachesettings[:dsc_enablecache]).to eq(false)
  end

  it 'should not accept int for dsc_enablecache' do
    expect{dsc_spblobcachesettings[:dsc_enablecache] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enablecache' do
    expect{dsc_spblobcachesettings[:dsc_enablecache] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_location' do
    expect{dsc_spblobcachesettings[:dsc_location] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_location' do
    expect{dsc_spblobcachesettings[:dsc_location] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_location' do
    expect{dsc_spblobcachesettings[:dsc_location] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_location' do
    expect{dsc_spblobcachesettings[:dsc_location] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxsizeingb' do
    expect{dsc_spblobcachesettings[:dsc_maxsizeingb] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxsizeingb' do
    expect{dsc_spblobcachesettings[:dsc_maxsizeingb] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maxsizeingb' do
    dsc_spblobcachesettings[:dsc_maxsizeingb] = 16
    expect(dsc_spblobcachesettings[:dsc_maxsizeingb]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_maxsizeingb' do
    value = -16
    expect(value).to be < 0
    expect{dsc_spblobcachesettings[:dsc_maxsizeingb] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_maxsizeingb' do
    dsc_spblobcachesettings[:dsc_maxsizeingb] = '16'
    expect(dsc_spblobcachesettings[:dsc_maxsizeingb]).to eq(16)
  end

  it 'should accept string-like uint for dsc_maxsizeingb' do
    dsc_spblobcachesettings[:dsc_maxsizeingb] = '32'
    expect(dsc_spblobcachesettings[:dsc_maxsizeingb]).to eq(32)
  end

  it 'should accept string-like uint for dsc_maxsizeingb' do
    dsc_spblobcachesettings[:dsc_maxsizeingb] = '64'
    expect(dsc_spblobcachesettings[:dsc_maxsizeingb]).to eq(64)
  end

  it 'should not accept array for dsc_maxageinseconds' do
    expect{dsc_spblobcachesettings[:dsc_maxageinseconds] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxageinseconds' do
    expect{dsc_spblobcachesettings[:dsc_maxageinseconds] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maxageinseconds' do
    dsc_spblobcachesettings[:dsc_maxageinseconds] = 32
    expect(dsc_spblobcachesettings[:dsc_maxageinseconds]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_maxageinseconds' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spblobcachesettings[:dsc_maxageinseconds] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_maxageinseconds' do
    dsc_spblobcachesettings[:dsc_maxageinseconds] = '16'
    expect(dsc_spblobcachesettings[:dsc_maxageinseconds]).to eq(16)
  end

  it 'should accept string-like uint for dsc_maxageinseconds' do
    dsc_spblobcachesettings[:dsc_maxageinseconds] = '32'
    expect(dsc_spblobcachesettings[:dsc_maxageinseconds]).to eq(32)
  end

  it 'should accept string-like uint for dsc_maxageinseconds' do
    dsc_spblobcachesettings[:dsc_maxageinseconds] = '64'
    expect(dsc_spblobcachesettings[:dsc_maxageinseconds]).to eq(64)
  end

  it 'should not accept array for dsc_filetypes' do
    expect{dsc_spblobcachesettings[:dsc_filetypes] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_filetypes' do
    expect{dsc_spblobcachesettings[:dsc_filetypes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_filetypes' do
    expect{dsc_spblobcachesettings[:dsc_filetypes] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_filetypes' do
    expect{dsc_spblobcachesettings[:dsc_filetypes] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spblobcachesettings[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spblobcachesettings[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spblobcachesettings[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spblobcachesettings[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spblobcachesettings[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spblobcachesettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spblobcachesettings)
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
