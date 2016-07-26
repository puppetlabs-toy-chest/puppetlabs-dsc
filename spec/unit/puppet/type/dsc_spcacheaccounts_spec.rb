#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spcacheaccounts) do

  let :dsc_spcacheaccounts do
    Puppet::Type.type(:dsc_spcacheaccounts).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spcacheaccounts).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_superuseralias => 'foo',
      :dsc_superreaderalias => 'foo',
      :dsc_setwebapppolicy => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spcacheaccounts.to_s).to eq("Dsc_spcacheaccounts[foo]")
  end

  it 'should require that dsc_webappurl is specified' do
    #dsc_spcacheaccounts[:dsc_webappurl]
    expect { Puppet::Type.type(:dsc_spcacheaccounts).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_webappurl is a required attribute/)
  end

  it 'should not accept array for dsc_webappurl' do
    expect{dsc_spcacheaccounts[:dsc_webappurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webappurl' do
    expect{dsc_spcacheaccounts[:dsc_webappurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webappurl' do
    expect{dsc_spcacheaccounts[:dsc_webappurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webappurl' do
    expect{dsc_spcacheaccounts[:dsc_webappurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_superuseralias' do
    expect{dsc_spcacheaccounts[:dsc_superuseralias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_superuseralias' do
    expect{dsc_spcacheaccounts[:dsc_superuseralias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_superuseralias' do
    expect{dsc_spcacheaccounts[:dsc_superuseralias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_superuseralias' do
    expect{dsc_spcacheaccounts[:dsc_superuseralias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_superreaderalias' do
    expect{dsc_spcacheaccounts[:dsc_superreaderalias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_superreaderalias' do
    expect{dsc_spcacheaccounts[:dsc_superreaderalias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_superreaderalias' do
    expect{dsc_spcacheaccounts[:dsc_superreaderalias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_superreaderalias' do
    expect{dsc_spcacheaccounts[:dsc_superreaderalias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setwebapppolicy' do
    expect{dsc_spcacheaccounts[:dsc_setwebapppolicy] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_setwebapppolicy' do
    dsc_spcacheaccounts[:dsc_setwebapppolicy] = true
    expect(dsc_spcacheaccounts[:dsc_setwebapppolicy]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_setwebapppolicy" do
    dsc_spcacheaccounts[:dsc_setwebapppolicy] = 'true'
    expect(dsc_spcacheaccounts[:dsc_setwebapppolicy]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_setwebapppolicy" do
    dsc_spcacheaccounts[:dsc_setwebapppolicy] = 'false'
    expect(dsc_spcacheaccounts[:dsc_setwebapppolicy]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_setwebapppolicy" do
    dsc_spcacheaccounts[:dsc_setwebapppolicy] = 'True'
    expect(dsc_spcacheaccounts[:dsc_setwebapppolicy]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_setwebapppolicy" do
    dsc_spcacheaccounts[:dsc_setwebapppolicy] = 'False'
    expect(dsc_spcacheaccounts[:dsc_setwebapppolicy]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_setwebapppolicy" do
    dsc_spcacheaccounts[:dsc_setwebapppolicy] = :true
    expect(dsc_spcacheaccounts[:dsc_setwebapppolicy]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_setwebapppolicy" do
    dsc_spcacheaccounts[:dsc_setwebapppolicy] = :false
    expect(dsc_spcacheaccounts[:dsc_setwebapppolicy]).to eq(false)
  end

  it 'should not accept int for dsc_setwebapppolicy' do
    expect{dsc_spcacheaccounts[:dsc_setwebapppolicy] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setwebapppolicy' do
    expect{dsc_spcacheaccounts[:dsc_setwebapppolicy] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spcacheaccounts[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spcacheaccounts[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spcacheaccounts[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spcacheaccounts[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spcacheaccounts[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spcacheaccounts)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spcacheaccounts)
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
