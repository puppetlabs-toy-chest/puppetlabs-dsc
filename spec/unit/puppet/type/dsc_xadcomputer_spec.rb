#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xadcomputer) do

  let :dsc_xadcomputer do
    Puppet::Type.type(:dsc_xadcomputer).new(
      :name     => 'foo',
      :dsc_computername => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xadcomputer).new(
      :name     => 'foo',
      :dsc_computername => 'foo',
      :dsc_location => 'foo',
      :dsc_dnshostname => 'foo',
      :dsc_serviceprincipalnames => ["foo", "bar", "spec"],
      :dsc_userprincipalname => 'foo',
      :dsc_displayname => 'foo',
      :dsc_path => 'foo',
      :dsc_description => 'foo',
      :dsc_enabled => true,
      :dsc_manager => 'foo',
      :dsc_domaincontroller => 'foo',
      :dsc_domainadministratorcredential => {"user"=>"user", "password"=>"password"},
      :dsc_ensure => 'Present',
      :dsc_distinguishedname => 'foo',
      :dsc_sid => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xadcomputer.to_s).to eq("Dsc_xadcomputer[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xadcomputer[:ensure]).to eq :present
  end

  it 'should require that dsc_computername is specified' do
    #dsc_xadcomputer[:dsc_computername]
    expect { Puppet::Type.type(:dsc_xadcomputer).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_computername is a required attribute/)
  end

  it 'should not accept array for dsc_computername' do
    expect{dsc_xadcomputer[:dsc_computername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_computername' do
    expect{dsc_xadcomputer[:dsc_computername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_computername' do
    expect{dsc_xadcomputer[:dsc_computername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_computername' do
    expect{dsc_xadcomputer[:dsc_computername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_location' do
    expect{dsc_xadcomputer[:dsc_location] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_location' do
    expect{dsc_xadcomputer[:dsc_location] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_location' do
    expect{dsc_xadcomputer[:dsc_location] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_location' do
    expect{dsc_xadcomputer[:dsc_location] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dnshostname' do
    expect{dsc_xadcomputer[:dsc_dnshostname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dnshostname' do
    expect{dsc_xadcomputer[:dsc_dnshostname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dnshostname' do
    expect{dsc_xadcomputer[:dsc_dnshostname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dnshostname' do
    expect{dsc_xadcomputer[:dsc_dnshostname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_serviceprincipalnames' do
    dsc_xadcomputer[:dsc_serviceprincipalnames] = ["foo", "bar", "spec"]
    expect(dsc_xadcomputer[:dsc_serviceprincipalnames]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_serviceprincipalnames' do
    expect{dsc_xadcomputer[:dsc_serviceprincipalnames] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serviceprincipalnames' do
    expect{dsc_xadcomputer[:dsc_serviceprincipalnames] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serviceprincipalnames' do
    expect{dsc_xadcomputer[:dsc_serviceprincipalnames] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_userprincipalname' do
    expect{dsc_xadcomputer[:dsc_userprincipalname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_userprincipalname' do
    expect{dsc_xadcomputer[:dsc_userprincipalname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_userprincipalname' do
    expect{dsc_xadcomputer[:dsc_userprincipalname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_userprincipalname' do
    expect{dsc_xadcomputer[:dsc_userprincipalname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displayname' do
    expect{dsc_xadcomputer[:dsc_displayname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayname' do
    expect{dsc_xadcomputer[:dsc_displayname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displayname' do
    expect{dsc_xadcomputer[:dsc_displayname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displayname' do
    expect{dsc_xadcomputer[:dsc_displayname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xadcomputer[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xadcomputer[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xadcomputer[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xadcomputer[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xadcomputer[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xadcomputer[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xadcomputer[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xadcomputer[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enabled' do
    expect{dsc_xadcomputer[:dsc_enabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enabled' do
    dsc_xadcomputer[:dsc_enabled] = true
    expect(dsc_xadcomputer[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enabled" do
    dsc_xadcomputer[:dsc_enabled] = 'true'
    expect(dsc_xadcomputer[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enabled" do
    dsc_xadcomputer[:dsc_enabled] = 'false'
    expect(dsc_xadcomputer[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enabled" do
    dsc_xadcomputer[:dsc_enabled] = 'True'
    expect(dsc_xadcomputer[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enabled" do
    dsc_xadcomputer[:dsc_enabled] = 'False'
    expect(dsc_xadcomputer[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enabled" do
    dsc_xadcomputer[:dsc_enabled] = :true
    expect(dsc_xadcomputer[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enabled" do
    dsc_xadcomputer[:dsc_enabled] = :false
    expect(dsc_xadcomputer[:dsc_enabled]).to eq(false)
  end

  it 'should not accept int for dsc_enabled' do
    expect{dsc_xadcomputer[:dsc_enabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabled' do
    expect{dsc_xadcomputer[:dsc_enabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_manager' do
    expect{dsc_xadcomputer[:dsc_manager] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_manager' do
    expect{dsc_xadcomputer[:dsc_manager] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_manager' do
    expect{dsc_xadcomputer[:dsc_manager] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_manager' do
    expect{dsc_xadcomputer[:dsc_manager] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xadcomputer[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xadcomputer[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xadcomputer[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xadcomputer[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_domainadministratorcredential" do
    expect{dsc_xadcomputer[:dsc_domainadministratorcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainadministratorcredential' do
    expect{dsc_xadcomputer[:dsc_domainadministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainadministratorcredential' do
    expect{dsc_xadcomputer[:dsc_domainadministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainadministratorcredential' do
    expect{dsc_xadcomputer[:dsc_domainadministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainadministratorcredential' do
    expect{dsc_xadcomputer[:dsc_domainadministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xadcomputer[:dsc_ensure] = 'Present'
    expect(dsc_xadcomputer[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xadcomputer[:dsc_ensure] = 'present'
    expect(dsc_xadcomputer[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xadcomputer[:dsc_ensure] = 'present'
    expect(dsc_xadcomputer[:ensure]).to eq(dsc_xadcomputer[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xadcomputer[:dsc_ensure] = 'Absent'
    expect(dsc_xadcomputer[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xadcomputer[:dsc_ensure] = 'absent'
    expect(dsc_xadcomputer[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xadcomputer[:dsc_ensure] = 'absent'
    expect(dsc_xadcomputer[:ensure]).to eq(dsc_xadcomputer[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xadcomputer[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xadcomputer[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xadcomputer[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xadcomputer[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xadcomputer[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_distinguishedname' do
    expect{dsc_xadcomputer[:dsc_distinguishedname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_distinguishedname' do
    expect{dsc_xadcomputer[:dsc_distinguishedname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_distinguishedname' do
    expect{dsc_xadcomputer[:dsc_distinguishedname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_distinguishedname' do
    expect{dsc_xadcomputer[:dsc_distinguishedname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sid' do
    expect{dsc_xadcomputer[:dsc_sid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sid' do
    expect{dsc_xadcomputer[:dsc_sid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sid' do
    expect{dsc_xadcomputer[:dsc_sid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sid' do
    expect{dsc_xadcomputer[:dsc_sid] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xadcomputer)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xadcomputer)
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
        dsc_xadcomputer.original_parameters[:dsc_ensure] = 'present'
        dsc_xadcomputer[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xadcomputer)
      end

      it "should update :ensure to :present" do
        expect(dsc_xadcomputer[:ensure]).to eq(:present)
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
        dsc_xadcomputer.original_parameters[:dsc_ensure] = 'absent'
        dsc_xadcomputer[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xadcomputer)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xadcomputer[:ensure]).to eq(:absent)
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
