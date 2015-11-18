#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverfirewall) do

  let :dsc_xsqlserverfirewall do
    Puppet::Type.type(:dsc_xsqlserverfirewall).new(
      :name     => 'foo',
      :dsc_features => 'foo',
      :dsc_instancename => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverfirewall.to_s).to eq("Dsc_xsqlserverfirewall[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xsqlserverfirewall[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xsqlserverfirewall[:dsc_ensure] = 'Present'
    expect(dsc_xsqlserverfirewall[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xsqlserverfirewall[:dsc_ensure] = 'present'
    expect(dsc_xsqlserverfirewall[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlserverfirewall[:dsc_ensure] = 'present'
    expect(dsc_xsqlserverfirewall[:ensure]).to eq(dsc_xsqlserverfirewall[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xsqlserverfirewall[:dsc_ensure] = 'Absent'
    expect(dsc_xsqlserverfirewall[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xsqlserverfirewall[:dsc_ensure] = 'absent'
    expect(dsc_xsqlserverfirewall[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlserverfirewall[:dsc_ensure] = 'absent'
    expect(dsc_xsqlserverfirewall[:ensure]).to eq(dsc_xsqlserverfirewall[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlserverfirewall[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xsqlserverfirewall[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xsqlserverfirewall[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xsqlserverfirewall[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xsqlserverfirewall[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xsqlserverfirewall[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xsqlserverfirewall[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xsqlserverfirewall[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xsqlserverfirewall[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefolder' do
    expect{dsc_xsqlserverfirewall[:dsc_sourcefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefolder' do
    expect{dsc_xsqlserverfirewall[:dsc_sourcefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefolder' do
    expect{dsc_xsqlserverfirewall[:dsc_sourcefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefolder' do
    expect{dsc_xsqlserverfirewall[:dsc_sourcefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_features is specified' do
    #dsc_xsqlserverfirewall[:dsc_features]
    expect { Puppet::Type.type(:dsc_xsqlserverfirewall).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_instancename => 'foo',
      :dsc_databaseenginefirewall => true,
      :dsc_browserfirewall => true,
      :dsc_reportingservicesfirewall => true,
      :dsc_analysisservicesfirewall => true,
      :dsc_integrationservicesfirewall => true,
    )}.to raise_error(Puppet::Error, /dsc_features is a required attribute/)
  end

  it 'should not accept array for dsc_features' do
    expect{dsc_xsqlserverfirewall[:dsc_features] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_features' do
    expect{dsc_xsqlserverfirewall[:dsc_features] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_features' do
    expect{dsc_xsqlserverfirewall[:dsc_features] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_features' do
    expect{dsc_xsqlserverfirewall[:dsc_features] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlserverfirewall[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlserverfirewall).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_features => 'foo',
      :dsc_databaseenginefirewall => true,
      :dsc_browserfirewall => true,
      :dsc_reportingservicesfirewall => true,
      :dsc_analysisservicesfirewall => true,
      :dsc_integrationservicesfirewall => true,
    )}.to raise_error(Puppet::Error, /dsc_instancename is a required attribute/)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlserverfirewall[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlserverfirewall[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlserverfirewall[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlserverfirewall[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseenginefirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_databaseenginefirewall] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_databaseenginefirewall' do
    dsc_xsqlserverfirewall[:dsc_databaseenginefirewall] = true
    expect(dsc_xsqlserverfirewall[:dsc_databaseenginefirewall]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_databaseenginefirewall" do
    dsc_xsqlserverfirewall[:dsc_databaseenginefirewall] = 'true'
    expect(dsc_xsqlserverfirewall[:dsc_databaseenginefirewall]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_databaseenginefirewall" do
    dsc_xsqlserverfirewall[:dsc_databaseenginefirewall] = 'false'
    expect(dsc_xsqlserverfirewall[:dsc_databaseenginefirewall]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_databaseenginefirewall" do
    dsc_xsqlserverfirewall[:dsc_databaseenginefirewall] = 'True'
    expect(dsc_xsqlserverfirewall[:dsc_databaseenginefirewall]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_databaseenginefirewall" do
    dsc_xsqlserverfirewall[:dsc_databaseenginefirewall] = 'False'
    expect(dsc_xsqlserverfirewall[:dsc_databaseenginefirewall]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_databaseenginefirewall" do
    dsc_xsqlserverfirewall[:dsc_databaseenginefirewall] = :true
    expect(dsc_xsqlserverfirewall[:dsc_databaseenginefirewall]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_databaseenginefirewall" do
    dsc_xsqlserverfirewall[:dsc_databaseenginefirewall] = :false
    expect(dsc_xsqlserverfirewall[:dsc_databaseenginefirewall]).to eq(false)
  end

  it 'should not accept int for dsc_databaseenginefirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_databaseenginefirewall] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseenginefirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_databaseenginefirewall] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_browserfirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_browserfirewall] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_browserfirewall' do
    dsc_xsqlserverfirewall[:dsc_browserfirewall] = true
    expect(dsc_xsqlserverfirewall[:dsc_browserfirewall]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_browserfirewall" do
    dsc_xsqlserverfirewall[:dsc_browserfirewall] = 'true'
    expect(dsc_xsqlserverfirewall[:dsc_browserfirewall]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_browserfirewall" do
    dsc_xsqlserverfirewall[:dsc_browserfirewall] = 'false'
    expect(dsc_xsqlserverfirewall[:dsc_browserfirewall]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_browserfirewall" do
    dsc_xsqlserverfirewall[:dsc_browserfirewall] = 'True'
    expect(dsc_xsqlserverfirewall[:dsc_browserfirewall]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_browserfirewall" do
    dsc_xsqlserverfirewall[:dsc_browserfirewall] = 'False'
    expect(dsc_xsqlserverfirewall[:dsc_browserfirewall]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_browserfirewall" do
    dsc_xsqlserverfirewall[:dsc_browserfirewall] = :true
    expect(dsc_xsqlserverfirewall[:dsc_browserfirewall]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_browserfirewall" do
    dsc_xsqlserverfirewall[:dsc_browserfirewall] = :false
    expect(dsc_xsqlserverfirewall[:dsc_browserfirewall]).to eq(false)
  end

  it 'should not accept int for dsc_browserfirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_browserfirewall] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_browserfirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_browserfirewall] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_reportingservicesfirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_reportingservicesfirewall' do
    dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall] = true
    expect(dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_reportingservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall] = 'true'
    expect(dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_reportingservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall] = 'false'
    expect(dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_reportingservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall] = 'True'
    expect(dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_reportingservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall] = 'False'
    expect(dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_reportingservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall] = :true
    expect(dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_reportingservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall] = :false
    expect(dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall]).to eq(false)
  end

  it 'should not accept int for dsc_reportingservicesfirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_reportingservicesfirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_reportingservicesfirewall] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_analysisservicesfirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_analysisservicesfirewall' do
    dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall] = true
    expect(dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_analysisservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall] = 'true'
    expect(dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_analysisservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall] = 'false'
    expect(dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_analysisservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall] = 'True'
    expect(dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_analysisservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall] = 'False'
    expect(dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_analysisservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall] = :true
    expect(dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_analysisservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall] = :false
    expect(dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall]).to eq(false)
  end

  it 'should not accept int for dsc_analysisservicesfirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_analysisservicesfirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_analysisservicesfirewall] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_integrationservicesfirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_integrationservicesfirewall' do
    dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall] = true
    expect(dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_integrationservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall] = 'true'
    expect(dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_integrationservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall] = 'false'
    expect(dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_integrationservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall] = 'True'
    expect(dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_integrationservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall] = 'False'
    expect(dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_integrationservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall] = :true
    expect(dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_integrationservicesfirewall" do
    dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall] = :false
    expect(dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall]).to eq(false)
  end

  it 'should not accept int for dsc_integrationservicesfirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_integrationservicesfirewall' do
    expect{dsc_xsqlserverfirewall[:dsc_integrationservicesfirewall] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserverfirewall)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserverfirewall)
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
        dsc_xsqlserverfirewall.original_parameters[:dsc_ensure] = 'present'
        dsc_xsqlserverfirewall[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xsqlserverfirewall)
      end

      it "should update :ensure to :present" do
        expect(dsc_xsqlserverfirewall[:ensure]).to eq(:present)
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
        dsc_xsqlserverfirewall.original_parameters[:dsc_ensure] = 'absent'
        dsc_xsqlserverfirewall[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xsqlserverfirewall)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xsqlserverfirewall[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
