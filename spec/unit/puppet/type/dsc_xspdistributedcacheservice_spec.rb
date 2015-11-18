#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspdistributedcacheservice) do

  let :dsc_xspdistributedcacheservice do
    Puppet::Type.type(:dsc_xspdistributedcacheservice).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspdistributedcacheservice.to_s).to eq("Dsc_xspdistributedcacheservice[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xspdistributedcacheservice[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspdistributedcacheservice[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspdistributedcacheservice).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_cachesizeinmb => 32,
      :dsc_serviceaccount => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
      :dsc_createfirewallrules => true,
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspdistributedcacheservice[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspdistributedcacheservice[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspdistributedcacheservice[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspdistributedcacheservice[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xspdistributedcacheservice[:dsc_ensure] = 'Present'
    expect(dsc_xspdistributedcacheservice[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xspdistributedcacheservice[:dsc_ensure] = 'present'
    expect(dsc_xspdistributedcacheservice[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xspdistributedcacheservice[:dsc_ensure] = 'present'
    expect(dsc_xspdistributedcacheservice[:ensure]).to eq(dsc_xspdistributedcacheservice[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xspdistributedcacheservice[:dsc_ensure] = 'Absent'
    expect(dsc_xspdistributedcacheservice[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xspdistributedcacheservice[:dsc_ensure] = 'absent'
    expect(dsc_xspdistributedcacheservice[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xspdistributedcacheservice[:dsc_ensure] = 'absent'
    expect(dsc_xspdistributedcacheservice[:ensure]).to eq(dsc_xspdistributedcacheservice[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspdistributedcacheservice[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xspdistributedcacheservice[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xspdistributedcacheservice[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xspdistributedcacheservice[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xspdistributedcacheservice[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_cachesizeinmb' do
    expect{dsc_xspdistributedcacheservice[:dsc_cachesizeinmb] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_cachesizeinmb' do
    expect{dsc_xspdistributedcacheservice[:dsc_cachesizeinmb] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_cachesizeinmb' do
    dsc_xspdistributedcacheservice[:dsc_cachesizeinmb] = 32
    expect(dsc_xspdistributedcacheservice[:dsc_cachesizeinmb]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_cachesizeinmb' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspdistributedcacheservice[:dsc_cachesizeinmb] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_cachesizeinmb' do
    dsc_xspdistributedcacheservice[:dsc_cachesizeinmb] = '16'
    expect(dsc_xspdistributedcacheservice[:dsc_cachesizeinmb]).to eq(16)
  end

  it 'should accept string-like uint for dsc_cachesizeinmb' do
    dsc_xspdistributedcacheservice[:dsc_cachesizeinmb] = '32'
    expect(dsc_xspdistributedcacheservice[:dsc_cachesizeinmb]).to eq(32)
  end

  it 'should accept string-like uint for dsc_cachesizeinmb' do
    dsc_xspdistributedcacheservice[:dsc_cachesizeinmb] = '64'
    expect(dsc_xspdistributedcacheservice[:dsc_cachesizeinmb]).to eq(64)
  end

  it 'should not accept array for dsc_serviceaccount' do
    expect{dsc_xspdistributedcacheservice[:dsc_serviceaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serviceaccount' do
    expect{dsc_xspdistributedcacheservice[:dsc_serviceaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serviceaccount' do
    expect{dsc_xspdistributedcacheservice[:dsc_serviceaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serviceaccount' do
    expect{dsc_xspdistributedcacheservice[:dsc_serviceaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspdistributedcacheservice[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspdistributedcacheservice[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspdistributedcacheservice[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspdistributedcacheservice[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspdistributedcacheservice[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_createfirewallrules' do
    expect{dsc_xspdistributedcacheservice[:dsc_createfirewallrules] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_createfirewallrules' do
    dsc_xspdistributedcacheservice[:dsc_createfirewallrules] = true
    expect(dsc_xspdistributedcacheservice[:dsc_createfirewallrules]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_createfirewallrules" do
    dsc_xspdistributedcacheservice[:dsc_createfirewallrules] = 'true'
    expect(dsc_xspdistributedcacheservice[:dsc_createfirewallrules]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_createfirewallrules" do
    dsc_xspdistributedcacheservice[:dsc_createfirewallrules] = 'false'
    expect(dsc_xspdistributedcacheservice[:dsc_createfirewallrules]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_createfirewallrules" do
    dsc_xspdistributedcacheservice[:dsc_createfirewallrules] = 'True'
    expect(dsc_xspdistributedcacheservice[:dsc_createfirewallrules]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_createfirewallrules" do
    dsc_xspdistributedcacheservice[:dsc_createfirewallrules] = 'False'
    expect(dsc_xspdistributedcacheservice[:dsc_createfirewallrules]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_createfirewallrules" do
    dsc_xspdistributedcacheservice[:dsc_createfirewallrules] = :true
    expect(dsc_xspdistributedcacheservice[:dsc_createfirewallrules]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_createfirewallrules" do
    dsc_xspdistributedcacheservice[:dsc_createfirewallrules] = :false
    expect(dsc_xspdistributedcacheservice[:dsc_createfirewallrules]).to eq(false)
  end

  it 'should not accept int for dsc_createfirewallrules' do
    expect{dsc_xspdistributedcacheservice[:dsc_createfirewallrules] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_createfirewallrules' do
    expect{dsc_xspdistributedcacheservice[:dsc_createfirewallrules] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspdistributedcacheservice)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspdistributedcacheservice)
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

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xspdistributedcacheservice.original_parameters[:dsc_ensure] = 'present'
        dsc_xspdistributedcacheservice[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xspdistributedcacheservice)
      end

      it "should update :ensure to :present" do
        expect(dsc_xspdistributedcacheservice[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xspdistributedcacheservice.original_parameters[:dsc_ensure] = 'absent'
        dsc_xspdistributedcacheservice[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xspdistributedcacheservice)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xspdistributedcacheservice[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
