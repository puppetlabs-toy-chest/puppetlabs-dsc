#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xscsrserversetup) do

  let :dsc_xscsrserversetup do
    Puppet::Type.type(:dsc_xscsrserversetup).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
    )
  end

  it "should stringify normally" do
    expect(dsc_xscsrserversetup.to_s).to eq("Dsc_xscsrserversetup[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xscsrserversetup[:ensure]).to eq :present
  end

  it 'should require that dsc_ensure is specified' do
    #dsc_xscsrserversetup[:dsc_ensure]
    expect { Puppet::Type.type(:dsc_xscsrserversetup).new(
      :name     => 'foo',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
      :dsc_sendceipreports => 'Yes',
      :dsc_usemicrosoftupdate => 'Yes',
      :dsc_installfolder => 'foo',
      :dsc_databaseserver => 'foo',
      :dsc_databaseserverinstance => 'foo',
      :dsc_repositorydatabasename => 'foo',
      :dsc_stagingdatabasename => 'foo',
      :dsc_dwdatabasename => 'foo',
      :dsc_analysisdatabaseserver => 'foo',
      :dsc_analysisdatabaseserverinstance => 'foo',
      :dsc_analysisdatabasename => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_ensure is a required attribute/)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xscsrserversetup[:dsc_ensure] = 'Present'
    expect(dsc_xscsrserversetup[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xscsrserversetup[:dsc_ensure] = 'present'
    expect(dsc_xscsrserversetup[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscsrserversetup[:dsc_ensure] = 'present'
    expect(dsc_xscsrserversetup[:ensure]).to eq(dsc_xscsrserversetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xscsrserversetup[:dsc_ensure] = 'Absent'
    expect(dsc_xscsrserversetup[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xscsrserversetup[:dsc_ensure] = 'absent'
    expect(dsc_xscsrserversetup[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscsrserversetup[:dsc_ensure] = 'absent'
    expect(dsc_xscsrserversetup[:ensure]).to eq(dsc_xscsrserversetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscsrserversetup[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xscsrserversetup[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xscsrserversetup[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xscsrserversetup[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xscsrserversetup[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xscsrserversetup[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xscsrserversetup[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xscsrserversetup[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xscsrserversetup[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefolder' do
    expect{dsc_xscsrserversetup[:dsc_sourcefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefolder' do
    expect{dsc_xscsrserversetup[:dsc_sourcefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefolder' do
    expect{dsc_xscsrserversetup[:dsc_sourcefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefolder' do
    expect{dsc_xscsrserversetup[:dsc_sourcefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_setupcredential" do
    expect{dsc_xscsrserversetup[:dsc_setupcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setupcredential' do
    expect{dsc_xscsrserversetup[:dsc_setupcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setupcredential' do
    expect{dsc_xscsrserversetup[:dsc_setupcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setupcredential' do
    expect{dsc_xscsrserversetup[:dsc_setupcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setupcredential' do
    expect{dsc_xscsrserversetup[:dsc_setupcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_sendceipreports predefined value Yes' do
    dsc_xscsrserversetup[:dsc_sendceipreports] = 'Yes'
    expect(dsc_xscsrserversetup[:dsc_sendceipreports]).to eq('Yes')
  end

  it 'should accept dsc_sendceipreports predefined value yes' do
    dsc_xscsrserversetup[:dsc_sendceipreports] = 'yes'
    expect(dsc_xscsrserversetup[:dsc_sendceipreports]).to eq('yes')
  end

  it 'should accept dsc_sendceipreports predefined value No' do
    dsc_xscsrserversetup[:dsc_sendceipreports] = 'No'
    expect(dsc_xscsrserversetup[:dsc_sendceipreports]).to eq('No')
  end

  it 'should accept dsc_sendceipreports predefined value no' do
    dsc_xscsrserversetup[:dsc_sendceipreports] = 'no'
    expect(dsc_xscsrserversetup[:dsc_sendceipreports]).to eq('no')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscsrserversetup[:dsc_sendceipreports] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendceipreports' do
    expect{dsc_xscsrserversetup[:dsc_sendceipreports] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendceipreports' do
    expect{dsc_xscsrserversetup[:dsc_sendceipreports] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sendceipreports' do
    expect{dsc_xscsrserversetup[:dsc_sendceipreports] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sendceipreports' do
    expect{dsc_xscsrserversetup[:dsc_sendceipreports] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_usemicrosoftupdate predefined value Yes' do
    dsc_xscsrserversetup[:dsc_usemicrosoftupdate] = 'Yes'
    expect(dsc_xscsrserversetup[:dsc_usemicrosoftupdate]).to eq('Yes')
  end

  it 'should accept dsc_usemicrosoftupdate predefined value yes' do
    dsc_xscsrserversetup[:dsc_usemicrosoftupdate] = 'yes'
    expect(dsc_xscsrserversetup[:dsc_usemicrosoftupdate]).to eq('yes')
  end

  it 'should accept dsc_usemicrosoftupdate predefined value No' do
    dsc_xscsrserversetup[:dsc_usemicrosoftupdate] = 'No'
    expect(dsc_xscsrserversetup[:dsc_usemicrosoftupdate]).to eq('No')
  end

  it 'should accept dsc_usemicrosoftupdate predefined value no' do
    dsc_xscsrserversetup[:dsc_usemicrosoftupdate] = 'no'
    expect(dsc_xscsrserversetup[:dsc_usemicrosoftupdate]).to eq('no')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscsrserversetup[:dsc_usemicrosoftupdate] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usemicrosoftupdate' do
    expect{dsc_xscsrserversetup[:dsc_usemicrosoftupdate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usemicrosoftupdate' do
    expect{dsc_xscsrserversetup[:dsc_usemicrosoftupdate] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usemicrosoftupdate' do
    expect{dsc_xscsrserversetup[:dsc_usemicrosoftupdate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usemicrosoftupdate' do
    expect{dsc_xscsrserversetup[:dsc_usemicrosoftupdate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installfolder' do
    expect{dsc_xscsrserversetup[:dsc_installfolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installfolder' do
    expect{dsc_xscsrserversetup[:dsc_installfolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installfolder' do
    expect{dsc_xscsrserversetup[:dsc_installfolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installfolder' do
    expect{dsc_xscsrserversetup[:dsc_installfolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_xscsrserversetup[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_xscsrserversetup[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_xscsrserversetup[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_xscsrserversetup[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseserverinstance' do
    expect{dsc_xscsrserversetup[:dsc_databaseserverinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserverinstance' do
    expect{dsc_xscsrserversetup[:dsc_databaseserverinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserverinstance' do
    expect{dsc_xscsrserversetup[:dsc_databaseserverinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserverinstance' do
    expect{dsc_xscsrserversetup[:dsc_databaseserverinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_repositorydatabasename' do
    expect{dsc_xscsrserversetup[:dsc_repositorydatabasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_repositorydatabasename' do
    expect{dsc_xscsrserversetup[:dsc_repositorydatabasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_repositorydatabasename' do
    expect{dsc_xscsrserversetup[:dsc_repositorydatabasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_repositorydatabasename' do
    expect{dsc_xscsrserversetup[:dsc_repositorydatabasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_stagingdatabasename' do
    expect{dsc_xscsrserversetup[:dsc_stagingdatabasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_stagingdatabasename' do
    expect{dsc_xscsrserversetup[:dsc_stagingdatabasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_stagingdatabasename' do
    expect{dsc_xscsrserversetup[:dsc_stagingdatabasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_stagingdatabasename' do
    expect{dsc_xscsrserversetup[:dsc_stagingdatabasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dwdatabasename' do
    expect{dsc_xscsrserversetup[:dsc_dwdatabasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dwdatabasename' do
    expect{dsc_xscsrserversetup[:dsc_dwdatabasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dwdatabasename' do
    expect{dsc_xscsrserversetup[:dsc_dwdatabasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dwdatabasename' do
    expect{dsc_xscsrserversetup[:dsc_dwdatabasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_analysisdatabaseserver' do
    expect{dsc_xscsrserversetup[:dsc_analysisdatabaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_analysisdatabaseserver' do
    expect{dsc_xscsrserversetup[:dsc_analysisdatabaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_analysisdatabaseserver' do
    expect{dsc_xscsrserversetup[:dsc_analysisdatabaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_analysisdatabaseserver' do
    expect{dsc_xscsrserversetup[:dsc_analysisdatabaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_analysisdatabaseserverinstance' do
    expect{dsc_xscsrserversetup[:dsc_analysisdatabaseserverinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_analysisdatabaseserverinstance' do
    expect{dsc_xscsrserversetup[:dsc_analysisdatabaseserverinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_analysisdatabaseserverinstance' do
    expect{dsc_xscsrserversetup[:dsc_analysisdatabaseserverinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_analysisdatabaseserverinstance' do
    expect{dsc_xscsrserversetup[:dsc_analysisdatabaseserverinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_analysisdatabasename' do
    expect{dsc_xscsrserversetup[:dsc_analysisdatabasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_analysisdatabasename' do
    expect{dsc_xscsrserversetup[:dsc_analysisdatabasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_analysisdatabasename' do
    expect{dsc_xscsrserversetup[:dsc_analysisdatabasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_analysisdatabasename' do
    expect{dsc_xscsrserversetup[:dsc_analysisdatabasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xscsrserversetup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xscsrserversetup)
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
        dsc_xscsrserversetup.original_parameters[:dsc_ensure] = 'present'
        dsc_xscsrserversetup[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xscsrserversetup)
      end

      it "should update :ensure to :present" do
        expect(dsc_xscsrserversetup[:ensure]).to eq(:present)
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
        dsc_xscsrserversetup.original_parameters[:dsc_ensure] = 'absent'
        dsc_xscsrserversetup[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xscsrserversetup)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xscsrserversetup[:ensure]).to eq(:absent)
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
