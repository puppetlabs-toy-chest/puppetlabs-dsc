#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlaogroupensure) do

  let :dsc_xsqlaogroupensure do
    Puppet::Type.type(:dsc_xsqlaogroupensure).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_availabilitygroupname => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsqlaogroupensure).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_availabilitygroupname => 'foo',
      :dsc_availabilitygroupnamelistener => 'foo',
      :dsc_availabilitygroupnameip => ["foo", "bar", "spec"],
      :dsc_availabilitygroupsubmask => ["foo", "bar", "spec"],
      :dsc_availabilitygroupport => 32,
      :dsc_readablesecondary => 'None',
      :dsc_autobackupprefernce => 'Primary',
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstancename => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsqlaogroupensure.to_s).to eq("Dsc_xsqlaogroupensure[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xsqlaogroupensure[:ensure]).to eq :present
  end

  it 'should require that dsc_ensure is specified' do
    #dsc_xsqlaogroupensure[:dsc_ensure]
    expect { Puppet::Type.type(:dsc_xsqlaogroupensure).new(
      :name     => 'foo',
      :dsc_availabilitygroupname => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_ensure is a required attribute/)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xsqlaogroupensure[:dsc_ensure] = 'Present'
    expect(dsc_xsqlaogroupensure[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xsqlaogroupensure[:dsc_ensure] = 'present'
    expect(dsc_xsqlaogroupensure[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlaogroupensure[:dsc_ensure] = 'present'
    expect(dsc_xsqlaogroupensure[:ensure]).to eq(dsc_xsqlaogroupensure[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xsqlaogroupensure[:dsc_ensure] = 'Absent'
    expect(dsc_xsqlaogroupensure[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xsqlaogroupensure[:dsc_ensure] = 'absent'
    expect(dsc_xsqlaogroupensure[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlaogroupensure[:dsc_ensure] = 'absent'
    expect(dsc_xsqlaogroupensure[:ensure]).to eq(dsc_xsqlaogroupensure[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlaogroupensure[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xsqlaogroupensure[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xsqlaogroupensure[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xsqlaogroupensure[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xsqlaogroupensure[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_availabilitygroupname is specified' do
    #dsc_xsqlaogroupensure[:dsc_availabilitygroupname]
    expect { Puppet::Type.type(:dsc_xsqlaogroupensure).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_availabilitygroupname is a required attribute/)
  end

  it 'should not accept array for dsc_availabilitygroupname' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_availabilitygroupname' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_availabilitygroupname' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_availabilitygroupname' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_availabilitygroupnamelistener' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupnamelistener] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_availabilitygroupnamelistener' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupnamelistener] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_availabilitygroupnamelistener' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupnamelistener] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_availabilitygroupnamelistener' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupnamelistener] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_availabilitygroupnameip' do
    dsc_xsqlaogroupensure[:dsc_availabilitygroupnameip] = ["foo", "bar", "spec"]
    expect(dsc_xsqlaogroupensure[:dsc_availabilitygroupnameip]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_availabilitygroupnameip' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupnameip] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_availabilitygroupnameip' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupnameip] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_availabilitygroupnameip' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupnameip] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_availabilitygroupsubmask' do
    dsc_xsqlaogroupensure[:dsc_availabilitygroupsubmask] = ["foo", "bar", "spec"]
    expect(dsc_xsqlaogroupensure[:dsc_availabilitygroupsubmask]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_availabilitygroupsubmask' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupsubmask] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_availabilitygroupsubmask' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupsubmask] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_availabilitygroupsubmask' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupsubmask] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_availabilitygroupport' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_availabilitygroupport' do
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_availabilitygroupport' do
    dsc_xsqlaogroupensure[:dsc_availabilitygroupport] = 32
    expect(dsc_xsqlaogroupensure[:dsc_availabilitygroupport]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_availabilitygroupport' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xsqlaogroupensure[:dsc_availabilitygroupport] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_availabilitygroupport' do
    dsc_xsqlaogroupensure[:dsc_availabilitygroupport] = '16'
    expect(dsc_xsqlaogroupensure[:dsc_availabilitygroupport]).to eq(16)
  end

  it 'should accept string-like uint for dsc_availabilitygroupport' do
    dsc_xsqlaogroupensure[:dsc_availabilitygroupport] = '32'
    expect(dsc_xsqlaogroupensure[:dsc_availabilitygroupport]).to eq(32)
  end

  it 'should accept string-like uint for dsc_availabilitygroupport' do
    dsc_xsqlaogroupensure[:dsc_availabilitygroupport] = '64'
    expect(dsc_xsqlaogroupensure[:dsc_availabilitygroupport]).to eq(64)
  end

  it 'should accept dsc_readablesecondary predefined value None' do
    dsc_xsqlaogroupensure[:dsc_readablesecondary] = 'None'
    expect(dsc_xsqlaogroupensure[:dsc_readablesecondary]).to eq('None')
  end

  it 'should accept dsc_readablesecondary predefined value none' do
    dsc_xsqlaogroupensure[:dsc_readablesecondary] = 'none'
    expect(dsc_xsqlaogroupensure[:dsc_readablesecondary]).to eq('none')
  end

  it 'should accept dsc_readablesecondary predefined value ReadOnly' do
    dsc_xsqlaogroupensure[:dsc_readablesecondary] = 'ReadOnly'
    expect(dsc_xsqlaogroupensure[:dsc_readablesecondary]).to eq('ReadOnly')
  end

  it 'should accept dsc_readablesecondary predefined value readonly' do
    dsc_xsqlaogroupensure[:dsc_readablesecondary] = 'readonly'
    expect(dsc_xsqlaogroupensure[:dsc_readablesecondary]).to eq('readonly')
  end

  it 'should accept dsc_readablesecondary predefined value ReadIntent' do
    dsc_xsqlaogroupensure[:dsc_readablesecondary] = 'ReadIntent'
    expect(dsc_xsqlaogroupensure[:dsc_readablesecondary]).to eq('ReadIntent')
  end

  it 'should accept dsc_readablesecondary predefined value readintent' do
    dsc_xsqlaogroupensure[:dsc_readablesecondary] = 'readintent'
    expect(dsc_xsqlaogroupensure[:dsc_readablesecondary]).to eq('readintent')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlaogroupensure[:dsc_readablesecondary] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_readablesecondary' do
    expect{dsc_xsqlaogroupensure[:dsc_readablesecondary] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_readablesecondary' do
    expect{dsc_xsqlaogroupensure[:dsc_readablesecondary] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_readablesecondary' do
    expect{dsc_xsqlaogroupensure[:dsc_readablesecondary] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_readablesecondary' do
    expect{dsc_xsqlaogroupensure[:dsc_readablesecondary] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_autobackupprefernce predefined value Primary' do
    dsc_xsqlaogroupensure[:dsc_autobackupprefernce] = 'Primary'
    expect(dsc_xsqlaogroupensure[:dsc_autobackupprefernce]).to eq('Primary')
  end

  it 'should accept dsc_autobackupprefernce predefined value primary' do
    dsc_xsqlaogroupensure[:dsc_autobackupprefernce] = 'primary'
    expect(dsc_xsqlaogroupensure[:dsc_autobackupprefernce]).to eq('primary')
  end

  it 'should accept dsc_autobackupprefernce predefined value Secondary' do
    dsc_xsqlaogroupensure[:dsc_autobackupprefernce] = 'Secondary'
    expect(dsc_xsqlaogroupensure[:dsc_autobackupprefernce]).to eq('Secondary')
  end

  it 'should accept dsc_autobackupprefernce predefined value secondary' do
    dsc_xsqlaogroupensure[:dsc_autobackupprefernce] = 'secondary'
    expect(dsc_xsqlaogroupensure[:dsc_autobackupprefernce]).to eq('secondary')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlaogroupensure[:dsc_autobackupprefernce] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autobackupprefernce' do
    expect{dsc_xsqlaogroupensure[:dsc_autobackupprefernce] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autobackupprefernce' do
    expect{dsc_xsqlaogroupensure[:dsc_autobackupprefernce] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_autobackupprefernce' do
    expect{dsc_xsqlaogroupensure[:dsc_autobackupprefernce] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autobackupprefernce' do
    expect{dsc_xsqlaogroupensure[:dsc_autobackupprefernce] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xsqlaogroupensure[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xsqlaogroupensure[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xsqlaogroupensure[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xsqlaogroupensure[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstancename' do
    expect{dsc_xsqlaogroupensure[:dsc_sqlinstancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstancename' do
    expect{dsc_xsqlaogroupensure[:dsc_sqlinstancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstancename' do
    expect{dsc_xsqlaogroupensure[:dsc_sqlinstancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstancename' do
    expect{dsc_xsqlaogroupensure[:dsc_sqlinstancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_setupcredential" do
    expect{dsc_xsqlaogroupensure[:dsc_setupcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setupcredential' do
    expect{dsc_xsqlaogroupensure[:dsc_setupcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setupcredential' do
    expect{dsc_xsqlaogroupensure[:dsc_setupcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setupcredential' do
    expect{dsc_xsqlaogroupensure[:dsc_setupcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setupcredential' do
    expect{dsc_xsqlaogroupensure[:dsc_setupcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlaogroupensure)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlaogroupensure)
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
        dsc_xsqlaogroupensure.original_parameters[:dsc_ensure] = 'present'
        dsc_xsqlaogroupensure[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xsqlaogroupensure)
      end

      it "should update :ensure to :present" do
        expect(dsc_xsqlaogroupensure[:ensure]).to eq(:present)
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
        dsc_xsqlaogroupensure.original_parameters[:dsc_ensure] = 'absent'
        dsc_xsqlaogroupensure[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xsqlaogroupensure)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xsqlaogroupensure[:ensure]).to eq(:absent)
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
