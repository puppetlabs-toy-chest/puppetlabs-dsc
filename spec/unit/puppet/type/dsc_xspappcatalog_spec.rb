#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspappcatalog) do

  let :dsc_xspappcatalog do
    Puppet::Type.type(:dsc_xspappcatalog).new(
      :name     => 'foo',
      :dsc_siteurl => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xspappcatalog).new(
      :name     => 'foo',
      :dsc_siteurl => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xspappcatalog.to_s).to eq("Dsc_xspappcatalog[foo]")
  end

  it 'should require that dsc_siteurl is specified' do
    #dsc_xspappcatalog[:dsc_siteurl]
    expect { Puppet::Type.type(:dsc_xspappcatalog).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_siteurl is a required attribute/)
  end

  it 'should not accept array for dsc_siteurl' do
    expect{dsc_xspappcatalog[:dsc_siteurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_siteurl' do
    expect{dsc_xspappcatalog[:dsc_siteurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_siteurl' do
    expect{dsc_xspappcatalog[:dsc_siteurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_siteurl' do
    expect{dsc_xspappcatalog[:dsc_siteurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspappcatalog[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspappcatalog[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspappcatalog[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspappcatalog[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspappcatalog[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspappcatalog)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspappcatalog)
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
