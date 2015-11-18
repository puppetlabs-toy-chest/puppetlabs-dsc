#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspcacheaccounts) do

  let :dsc_xspcacheaccounts do
    Puppet::Type.type(:dsc_xspcacheaccounts).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspcacheaccounts.to_s).to eq("Dsc_xspcacheaccounts[foo]")
  end

  it 'should require that dsc_webappurl is specified' do
    #dsc_xspcacheaccounts[:dsc_webappurl]
    expect { Puppet::Type.type(:dsc_xspcacheaccounts).new(
      :name     => 'foo',
      :dsc_superuseralias => 'foo',
      :dsc_superreaderalias => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_webappurl is a required attribute/)
  end

  it 'should not accept array for dsc_webappurl' do
    expect{dsc_xspcacheaccounts[:dsc_webappurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webappurl' do
    expect{dsc_xspcacheaccounts[:dsc_webappurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webappurl' do
    expect{dsc_xspcacheaccounts[:dsc_webappurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webappurl' do
    expect{dsc_xspcacheaccounts[:dsc_webappurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_superuseralias' do
    expect{dsc_xspcacheaccounts[:dsc_superuseralias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_superuseralias' do
    expect{dsc_xspcacheaccounts[:dsc_superuseralias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_superuseralias' do
    expect{dsc_xspcacheaccounts[:dsc_superuseralias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_superuseralias' do
    expect{dsc_xspcacheaccounts[:dsc_superuseralias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_superreaderalias' do
    expect{dsc_xspcacheaccounts[:dsc_superreaderalias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_superreaderalias' do
    expect{dsc_xspcacheaccounts[:dsc_superreaderalias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_superreaderalias' do
    expect{dsc_xspcacheaccounts[:dsc_superreaderalias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_superreaderalias' do
    expect{dsc_xspcacheaccounts[:dsc_superreaderalias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspcacheaccounts[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspcacheaccounts[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspcacheaccounts[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspcacheaccounts[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspcacheaccounts[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspcacheaccounts)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspcacheaccounts)
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
