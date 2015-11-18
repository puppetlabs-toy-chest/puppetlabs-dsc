#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspsite) do

  let :dsc_xspsite do
    Puppet::Type.type(:dsc_xspsite).new(
      :name     => 'foo',
      :dsc_url => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspsite.to_s).to eq("Dsc_xspsite[foo]")
  end

  it 'should require that dsc_url is specified' do
    #dsc_xspsite[:dsc_url]
    expect { Puppet::Type.type(:dsc_xspsite).new(
      :name     => 'foo',
      :dsc_owneralias => 'foo',
      :dsc_compatibilitylevel => 32,
      :dsc_contentdatabase => 'foo',
      :dsc_description => 'foo',
      :dsc_hostheaderwebapplication => 'foo',
      :dsc_language => 32,
      :dsc_name => 'foo',
      :dsc_owneremail => 'foo',
      :dsc_quotatemplate => 'foo',
      :dsc_secondaryemail => 'foo',
      :dsc_secondaryowneralias => 'foo',
      :dsc_template => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_url is a required attribute/)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_xspsite[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_xspsite[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_xspsite[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_url' do
    expect{dsc_xspsite[:dsc_url] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_owneralias' do
    expect{dsc_xspsite[:dsc_owneralias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_owneralias' do
    expect{dsc_xspsite[:dsc_owneralias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_owneralias' do
    expect{dsc_xspsite[:dsc_owneralias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_owneralias' do
    expect{dsc_xspsite[:dsc_owneralias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_compatibilitylevel' do
    expect{dsc_xspsite[:dsc_compatibilitylevel] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_compatibilitylevel' do
    expect{dsc_xspsite[:dsc_compatibilitylevel] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_compatibilitylevel' do
    dsc_xspsite[:dsc_compatibilitylevel] = 32
    expect(dsc_xspsite[:dsc_compatibilitylevel]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_compatibilitylevel' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspsite[:dsc_compatibilitylevel] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_compatibilitylevel' do
    dsc_xspsite[:dsc_compatibilitylevel] = '16'
    expect(dsc_xspsite[:dsc_compatibilitylevel]).to eq(16)
  end

  it 'should accept string-like uint for dsc_compatibilitylevel' do
    dsc_xspsite[:dsc_compatibilitylevel] = '32'
    expect(dsc_xspsite[:dsc_compatibilitylevel]).to eq(32)
  end

  it 'should accept string-like uint for dsc_compatibilitylevel' do
    dsc_xspsite[:dsc_compatibilitylevel] = '64'
    expect(dsc_xspsite[:dsc_compatibilitylevel]).to eq(64)
  end

  it 'should not accept array for dsc_contentdatabase' do
    expect{dsc_xspsite[:dsc_contentdatabase] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_contentdatabase' do
    expect{dsc_xspsite[:dsc_contentdatabase] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_contentdatabase' do
    expect{dsc_xspsite[:dsc_contentdatabase] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_contentdatabase' do
    expect{dsc_xspsite[:dsc_contentdatabase] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xspsite[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xspsite[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xspsite[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xspsite[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_hostheaderwebapplication' do
    expect{dsc_xspsite[:dsc_hostheaderwebapplication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_hostheaderwebapplication' do
    expect{dsc_xspsite[:dsc_hostheaderwebapplication] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_hostheaderwebapplication' do
    expect{dsc_xspsite[:dsc_hostheaderwebapplication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_hostheaderwebapplication' do
    expect{dsc_xspsite[:dsc_hostheaderwebapplication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_language' do
    expect{dsc_xspsite[:dsc_language] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_language' do
    expect{dsc_xspsite[:dsc_language] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_language' do
    dsc_xspsite[:dsc_language] = 32
    expect(dsc_xspsite[:dsc_language]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_language' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspsite[:dsc_language] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_language' do
    dsc_xspsite[:dsc_language] = '16'
    expect(dsc_xspsite[:dsc_language]).to eq(16)
  end

  it 'should accept string-like uint for dsc_language' do
    dsc_xspsite[:dsc_language] = '32'
    expect(dsc_xspsite[:dsc_language]).to eq(32)
  end

  it 'should accept string-like uint for dsc_language' do
    dsc_xspsite[:dsc_language] = '64'
    expect(dsc_xspsite[:dsc_language]).to eq(64)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspsite[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspsite[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspsite[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspsite[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_owneremail' do
    expect{dsc_xspsite[:dsc_owneremail] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_owneremail' do
    expect{dsc_xspsite[:dsc_owneremail] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_owneremail' do
    expect{dsc_xspsite[:dsc_owneremail] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_owneremail' do
    expect{dsc_xspsite[:dsc_owneremail] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_quotatemplate' do
    expect{dsc_xspsite[:dsc_quotatemplate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_quotatemplate' do
    expect{dsc_xspsite[:dsc_quotatemplate] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_quotatemplate' do
    expect{dsc_xspsite[:dsc_quotatemplate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_quotatemplate' do
    expect{dsc_xspsite[:dsc_quotatemplate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_secondaryemail' do
    expect{dsc_xspsite[:dsc_secondaryemail] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_secondaryemail' do
    expect{dsc_xspsite[:dsc_secondaryemail] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_secondaryemail' do
    expect{dsc_xspsite[:dsc_secondaryemail] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_secondaryemail' do
    expect{dsc_xspsite[:dsc_secondaryemail] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_secondaryowneralias' do
    expect{dsc_xspsite[:dsc_secondaryowneralias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_secondaryowneralias' do
    expect{dsc_xspsite[:dsc_secondaryowneralias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_secondaryowneralias' do
    expect{dsc_xspsite[:dsc_secondaryowneralias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_secondaryowneralias' do
    expect{dsc_xspsite[:dsc_secondaryowneralias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_template' do
    expect{dsc_xspsite[:dsc_template] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_template' do
    expect{dsc_xspsite[:dsc_template] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_template' do
    expect{dsc_xspsite[:dsc_template] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_template' do
    expect{dsc_xspsite[:dsc_template] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspsite[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspsite[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspsite[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspsite[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspsite[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspsite)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspsite)
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
