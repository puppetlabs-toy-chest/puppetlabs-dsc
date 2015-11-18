#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspserviceapppool) do

  let :dsc_xspserviceapppool do
    Puppet::Type.type(:dsc_xspserviceapppool).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspserviceapppool.to_s).to eq("Dsc_xspserviceapppool[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspserviceapppool[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspserviceapppool).new(
      :name     => 'foo',
      :dsc_serviceaccount => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspserviceapppool[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspserviceapppool[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspserviceapppool[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspserviceapppool[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_serviceaccount' do
    expect{dsc_xspserviceapppool[:dsc_serviceaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serviceaccount' do
    expect{dsc_xspserviceapppool[:dsc_serviceaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serviceaccount' do
    expect{dsc_xspserviceapppool[:dsc_serviceaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serviceaccount' do
    expect{dsc_xspserviceapppool[:dsc_serviceaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspserviceapppool[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspserviceapppool[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspserviceapppool[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspserviceapppool[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspserviceapppool[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspserviceapppool)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspserviceapppool)
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
