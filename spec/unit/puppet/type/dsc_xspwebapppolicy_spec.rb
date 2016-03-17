#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspwebapppolicy) do

  let :dsc_xspwebapppolicy do
    Puppet::Type.type(:dsc_xspwebapppolicy).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_username => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspwebapppolicy.to_s).to eq("Dsc_xspwebapppolicy[foo]")
  end

  it 'should require that dsc_webappurl is specified' do
    #dsc_xspwebapppolicy[:dsc_webappurl]
    expect { Puppet::Type.type(:dsc_xspwebapppolicy).new(
      :name     => 'foo',
      :dsc_username => 'foo',
      :dsc_permissionlevel => 'Deny All',
      :dsc_actassystemuser => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_webappurl is a required attribute/)
  end

  it 'should not accept array for dsc_webappurl' do
    expect{dsc_xspwebapppolicy[:dsc_webappurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webappurl' do
    expect{dsc_xspwebapppolicy[:dsc_webappurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webappurl' do
    expect{dsc_xspwebapppolicy[:dsc_webappurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webappurl' do
    expect{dsc_xspwebapppolicy[:dsc_webappurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_username is specified' do
    #dsc_xspwebapppolicy[:dsc_username]
    expect { Puppet::Type.type(:dsc_xspwebapppolicy).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_permissionlevel => 'Deny All',
      :dsc_actassystemuser => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_username is a required attribute/)
  end

  it 'should not accept array for dsc_username' do
    expect{dsc_xspwebapppolicy[:dsc_username] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_username' do
    expect{dsc_xspwebapppolicy[:dsc_username] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_username' do
    expect{dsc_xspwebapppolicy[:dsc_username] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_username' do
    expect{dsc_xspwebapppolicy[:dsc_username] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_permissionlevel predefined value Deny All' do
    dsc_xspwebapppolicy[:dsc_permissionlevel] = 'Deny All'
    expect(dsc_xspwebapppolicy[:dsc_permissionlevel]).to eq('Deny All')
  end

  it 'should accept dsc_permissionlevel predefined value deny all' do
    dsc_xspwebapppolicy[:dsc_permissionlevel] = 'deny all'
    expect(dsc_xspwebapppolicy[:dsc_permissionlevel]).to eq('deny all')
  end

  it 'should accept dsc_permissionlevel predefined value Deny Write' do
    dsc_xspwebapppolicy[:dsc_permissionlevel] = 'Deny Write'
    expect(dsc_xspwebapppolicy[:dsc_permissionlevel]).to eq('Deny Write')
  end

  it 'should accept dsc_permissionlevel predefined value deny write' do
    dsc_xspwebapppolicy[:dsc_permissionlevel] = 'deny write'
    expect(dsc_xspwebapppolicy[:dsc_permissionlevel]).to eq('deny write')
  end

  it 'should accept dsc_permissionlevel predefined value Full Read' do
    dsc_xspwebapppolicy[:dsc_permissionlevel] = 'Full Read'
    expect(dsc_xspwebapppolicy[:dsc_permissionlevel]).to eq('Full Read')
  end

  it 'should accept dsc_permissionlevel predefined value full read' do
    dsc_xspwebapppolicy[:dsc_permissionlevel] = 'full read'
    expect(dsc_xspwebapppolicy[:dsc_permissionlevel]).to eq('full read')
  end

  it 'should accept dsc_permissionlevel predefined value Full Control' do
    dsc_xspwebapppolicy[:dsc_permissionlevel] = 'Full Control'
    expect(dsc_xspwebapppolicy[:dsc_permissionlevel]).to eq('Full Control')
  end

  it 'should accept dsc_permissionlevel predefined value full control' do
    dsc_xspwebapppolicy[:dsc_permissionlevel] = 'full control'
    expect(dsc_xspwebapppolicy[:dsc_permissionlevel]).to eq('full control')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspwebapppolicy[:dsc_permissionlevel] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_permissionlevel' do
    expect{dsc_xspwebapppolicy[:dsc_permissionlevel] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_permissionlevel' do
    expect{dsc_xspwebapppolicy[:dsc_permissionlevel] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_permissionlevel' do
    expect{dsc_xspwebapppolicy[:dsc_permissionlevel] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_permissionlevel' do
    expect{dsc_xspwebapppolicy[:dsc_permissionlevel] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_actassystemuser' do
    expect{dsc_xspwebapppolicy[:dsc_actassystemuser] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_actassystemuser' do
    dsc_xspwebapppolicy[:dsc_actassystemuser] = true
    expect(dsc_xspwebapppolicy[:dsc_actassystemuser]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_actassystemuser" do
    dsc_xspwebapppolicy[:dsc_actassystemuser] = 'true'
    expect(dsc_xspwebapppolicy[:dsc_actassystemuser]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_actassystemuser" do
    dsc_xspwebapppolicy[:dsc_actassystemuser] = 'false'
    expect(dsc_xspwebapppolicy[:dsc_actassystemuser]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_actassystemuser" do
    dsc_xspwebapppolicy[:dsc_actassystemuser] = 'True'
    expect(dsc_xspwebapppolicy[:dsc_actassystemuser]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_actassystemuser" do
    dsc_xspwebapppolicy[:dsc_actassystemuser] = 'False'
    expect(dsc_xspwebapppolicy[:dsc_actassystemuser]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_actassystemuser" do
    dsc_xspwebapppolicy[:dsc_actassystemuser] = :true
    expect(dsc_xspwebapppolicy[:dsc_actassystemuser]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_actassystemuser" do
    dsc_xspwebapppolicy[:dsc_actassystemuser] = :false
    expect(dsc_xspwebapppolicy[:dsc_actassystemuser]).to eq(false)
  end

  it 'should not accept int for dsc_actassystemuser' do
    expect{dsc_xspwebapppolicy[:dsc_actassystemuser] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_actassystemuser' do
    expect{dsc_xspwebapppolicy[:dsc_actassystemuser] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspwebapppolicy[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspwebapppolicy[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspwebapppolicy[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspwebapppolicy[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspwebapppolicy[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspwebapppolicy)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspwebapppolicy)
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
