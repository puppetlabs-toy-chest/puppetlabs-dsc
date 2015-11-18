#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xadrecyclebin) do

  let :dsc_xadrecyclebin do
    Puppet::Type.type(:dsc_xadrecyclebin).new(
      :name     => 'foo',
      :dsc_forestfqdn => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xadrecyclebin.to_s).to eq("Dsc_xadrecyclebin[foo]")
  end

  it 'should require that dsc_forestfqdn is specified' do
    #dsc_xadrecyclebin[:dsc_forestfqdn]
    expect { Puppet::Type.type(:dsc_xadrecyclebin).new(
      :name     => 'foo',
      :dsc_enterpriseadministratorcredential => {"user"=>"user", "password"=>"password"},
      :dsc_recyclebinenabled => 'foo',
      :dsc_forestmode => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_forestfqdn is a required attribute/)
  end

  it 'should not accept array for dsc_forestfqdn' do
    expect{dsc_xadrecyclebin[:dsc_forestfqdn] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_forestfqdn' do
    expect{dsc_xadrecyclebin[:dsc_forestfqdn] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_forestfqdn' do
    expect{dsc_xadrecyclebin[:dsc_forestfqdn] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_forestfqdn' do
    expect{dsc_xadrecyclebin[:dsc_forestfqdn] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_enterpriseadministratorcredential" do
    expect{dsc_xadrecyclebin[:dsc_enterpriseadministratorcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enterpriseadministratorcredential' do
    expect{dsc_xadrecyclebin[:dsc_enterpriseadministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_enterpriseadministratorcredential' do
    expect{dsc_xadrecyclebin[:dsc_enterpriseadministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_enterpriseadministratorcredential' do
    expect{dsc_xadrecyclebin[:dsc_enterpriseadministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enterpriseadministratorcredential' do
    expect{dsc_xadrecyclebin[:dsc_enterpriseadministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_recyclebinenabled' do
    expect{dsc_xadrecyclebin[:dsc_recyclebinenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_recyclebinenabled' do
    expect{dsc_xadrecyclebin[:dsc_recyclebinenabled] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_recyclebinenabled' do
    expect{dsc_xadrecyclebin[:dsc_recyclebinenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_recyclebinenabled' do
    expect{dsc_xadrecyclebin[:dsc_recyclebinenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_forestmode' do
    expect{dsc_xadrecyclebin[:dsc_forestmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_forestmode' do
    expect{dsc_xadrecyclebin[:dsc_forestmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_forestmode' do
    expect{dsc_xadrecyclebin[:dsc_forestmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_forestmode' do
    expect{dsc_xadrecyclebin[:dsc_forestmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xadrecyclebin)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xadrecyclebin)
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
