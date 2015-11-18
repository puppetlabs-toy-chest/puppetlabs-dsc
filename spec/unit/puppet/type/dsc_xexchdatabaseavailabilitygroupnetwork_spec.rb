#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchdatabaseavailabilitygroupnetwork) do

  let :dsc_xexchdatabaseavailabilitygroupnetwork do
    Puppet::Type.type(:dsc_xexchdatabaseavailabilitygroupnetwork).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchdatabaseavailabilitygroupnetwork.to_s).to eq("Dsc_xexchdatabaseavailabilitygroupnetwork[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_name]
    expect { Puppet::Type.type(:dsc_xexchdatabaseavailabilitygroupnetwork).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_databaseavailabilitygroup => 'foo',
      :dsc_ensure => 'Present',
      :dsc_domaincontroller => 'foo',
      :dsc_ignorenetwork => true,
      :dsc_replicationenabled => true,
      :dsc_subnets => ["foo", "bar", "spec"],
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseavailabilitygroup' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_databaseavailabilitygroup] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseavailabilitygroup' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_databaseavailabilitygroup] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseavailabilitygroup' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_databaseavailabilitygroup] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseavailabilitygroup' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_databaseavailabilitygroup] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure] = 'Present'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure] = 'present'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure] = 'present'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:ensure]).to eq(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure] = 'Absent'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure] = 'absent'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure] = 'absent'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:ensure]).to eq(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ignorenetwork' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_ignorenetwork' do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork] = true
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_ignorenetwork" do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork] = 'true'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_ignorenetwork" do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork] = 'false'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_ignorenetwork" do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork] = 'True'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_ignorenetwork" do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork] = 'False'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_ignorenetwork" do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork] = :true
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_ignorenetwork" do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork] = :false
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork]).to eq(false)
  end

  it 'should not accept int for dsc_ignorenetwork' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ignorenetwork' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ignorenetwork] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_replicationenabled' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_replicationenabled' do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled] = true
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_replicationenabled" do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled] = 'true'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_replicationenabled" do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled] = 'false'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_replicationenabled" do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled] = 'True'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_replicationenabled" do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled] = 'False'
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_replicationenabled" do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled] = :true
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_replicationenabled" do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled] = :false
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled]).to eq(false)
  end

  it 'should not accept int for dsc_replicationenabled' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_replicationenabled' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_replicationenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_subnets' do
    dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_subnets] = ["foo", "bar", "spec"]
    expect(dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_subnets]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_subnets' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_subnets] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_subnets' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_subnets] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_subnets' do
    expect{dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_subnets] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchdatabaseavailabilitygroupnetwork)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchdatabaseavailabilitygroupnetwork)
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
        dsc_xexchdatabaseavailabilitygroupnetwork.original_parameters[:dsc_ensure] = 'present'
        dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xexchdatabaseavailabilitygroupnetwork)
      end

      it "should update :ensure to :present" do
        expect(dsc_xexchdatabaseavailabilitygroupnetwork[:ensure]).to eq(:present)
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
        dsc_xexchdatabaseavailabilitygroupnetwork.original_parameters[:dsc_ensure] = 'absent'
        dsc_xexchdatabaseavailabilitygroupnetwork[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xexchdatabaseavailabilitygroupnetwork)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xexchdatabaseavailabilitygroupnetwork[:ensure]).to eq(:absent)
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
