#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xscsmarunbookworkerserversetup) do

  let :dsc_xscsmarunbookworkerserversetup do
    Puppet::Type.type(:dsc_xscsmarunbookworkerserversetup).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
    )
  end

  it "should stringify normally" do
    expect(dsc_xscsmarunbookworkerserversetup.to_s).to eq("Dsc_xscsmarunbookworkerserversetup[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xscsmarunbookworkerserversetup[:ensure]).to eq :present
  end

  it 'should require that dsc_ensure is specified' do
    #dsc_xscsmarunbookworkerserversetup[:dsc_ensure]
    expect { Puppet::Type.type(:dsc_xscsmarunbookworkerserversetup).new(
      :name     => 'foo',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
      :dsc_service => {"user"=>"user", "password"=>"password"},
      :dsc_serviceusername => 'foo',
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstance => 'foo',
      :dsc_sqldatabase => 'foo',
      :dsc_installfolder => 'foo',
      :dsc_etwmanifest => 'foo',
      :dsc_sendceipreports => 'foo',
      :dsc_msupdate => 'foo',
      :dsc_productkey => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_ensure is a required attribute/)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xscsmarunbookworkerserversetup[:dsc_ensure] = 'Present'
    expect(dsc_xscsmarunbookworkerserversetup[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xscsmarunbookworkerserversetup[:dsc_ensure] = 'present'
    expect(dsc_xscsmarunbookworkerserversetup[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscsmarunbookworkerserversetup[:dsc_ensure] = 'present'
    expect(dsc_xscsmarunbookworkerserversetup[:ensure]).to eq(dsc_xscsmarunbookworkerserversetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xscsmarunbookworkerserversetup[:dsc_ensure] = 'Absent'
    expect(dsc_xscsmarunbookworkerserversetup[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xscsmarunbookworkerserversetup[:dsc_ensure] = 'absent'
    expect(dsc_xscsmarunbookworkerserversetup[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscsmarunbookworkerserversetup[:dsc_ensure] = 'absent'
    expect(dsc_xscsmarunbookworkerserversetup[:ensure]).to eq(dsc_xscsmarunbookworkerserversetup[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefolder' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sourcefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefolder' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sourcefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefolder' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sourcefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefolder' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sourcefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_setupcredential" do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_setupcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setupcredential' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_setupcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setupcredential' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_setupcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setupcredential' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_setupcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setupcredential' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_setupcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_service" do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_service] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_service' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_service] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_service' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_service] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_service' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_service] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_service' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_service] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_serviceusername' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_serviceusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serviceusername' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_serviceusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serviceusername' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_serviceusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serviceusername' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_serviceusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstance' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sqlinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstance' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sqlinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstance' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sqlinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstance' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sqlinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqldatabase' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sqldatabase] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqldatabase' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sqldatabase] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqldatabase' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sqldatabase] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqldatabase' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sqldatabase] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installfolder' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_installfolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installfolder' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_installfolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installfolder' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_installfolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installfolder' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_installfolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_etwmanifest' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_etwmanifest] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_etwmanifest' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_etwmanifest] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_etwmanifest' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_etwmanifest] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_etwmanifest' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_etwmanifest] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendceipreports' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sendceipreports] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendceipreports' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sendceipreports] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sendceipreports' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sendceipreports] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sendceipreports' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_sendceipreports] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_msupdate' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_msupdate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_msupdate' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_msupdate] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_msupdate' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_msupdate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_msupdate' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_msupdate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_productkey' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_productkey] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_productkey' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_productkey] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_productkey' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_productkey] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_productkey' do
    expect{dsc_xscsmarunbookworkerserversetup[:dsc_productkey] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xscsmarunbookworkerserversetup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xscsmarunbookworkerserversetup)
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
        dsc_xscsmarunbookworkerserversetup.original_parameters[:dsc_ensure] = 'present'
        dsc_xscsmarunbookworkerserversetup[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xscsmarunbookworkerserversetup)
      end

      it "should update :ensure to :present" do
        expect(dsc_xscsmarunbookworkerserversetup[:ensure]).to eq(:present)
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
        dsc_xscsmarunbookworkerserversetup.original_parameters[:dsc_ensure] = 'absent'
        dsc_xscsmarunbookworkerserversetup[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xscsmarunbookworkerserversetup)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xscsmarunbookworkerserversetup[:ensure]).to eq(:absent)
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
