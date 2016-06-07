#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdfsnamespacefolder) do

  let :dsc_xdfsnamespacefolder do
    Puppet::Type.type(:dsc_xdfsnamespacefolder).new(
      :name     => 'foo',
      :dsc_path => 'foo',
      :dsc_targetpath => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xdfsnamespacefolder).new(
      :name     => 'foo',
      :dsc_path => 'foo',
      :dsc_targetpath => 'foo',
      :dsc_ensure => 'Present',
      :dsc_description => 'foo',
      :dsc_enableinsitereferrals => true,
      :dsc_enabletargetfailback => true,
      :dsc_referralpriorityclass => 'Global-High',
      :dsc_referralpriorityrank => 32,
      :dsc_timetolivesec => 32,
      :dsc_state => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xdfsnamespacefolder.to_s).to eq("Dsc_xdfsnamespacefolder[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xdfsnamespacefolder[:ensure]).to eq :present
  end

  it 'should require that dsc_path is specified' do
    #dsc_xdfsnamespacefolder[:dsc_path]
    expect { Puppet::Type.type(:dsc_xdfsnamespacefolder).new(
      :name     => 'foo',
      :dsc_targetpath => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_path is a required attribute/)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xdfsnamespacefolder[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xdfsnamespacefolder[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xdfsnamespacefolder[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xdfsnamespacefolder[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_targetpath is specified' do
    #dsc_xdfsnamespacefolder[:dsc_targetpath]
    expect { Puppet::Type.type(:dsc_xdfsnamespacefolder).new(
      :name     => 'foo',
      :dsc_path => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_targetpath is a required attribute/)
  end

  it 'should not accept array for dsc_targetpath' do
    expect{dsc_xdfsnamespacefolder[:dsc_targetpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_targetpath' do
    expect{dsc_xdfsnamespacefolder[:dsc_targetpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_targetpath' do
    expect{dsc_xdfsnamespacefolder[:dsc_targetpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_targetpath' do
    expect{dsc_xdfsnamespacefolder[:dsc_targetpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xdfsnamespacefolder[:dsc_ensure] = 'Present'
    expect(dsc_xdfsnamespacefolder[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xdfsnamespacefolder[:dsc_ensure] = 'present'
    expect(dsc_xdfsnamespacefolder[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdfsnamespacefolder[:dsc_ensure] = 'present'
    expect(dsc_xdfsnamespacefolder[:ensure]).to eq(dsc_xdfsnamespacefolder[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xdfsnamespacefolder[:dsc_ensure] = 'Absent'
    expect(dsc_xdfsnamespacefolder[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xdfsnamespacefolder[:dsc_ensure] = 'absent'
    expect(dsc_xdfsnamespacefolder[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdfsnamespacefolder[:dsc_ensure] = 'absent'
    expect(dsc_xdfsnamespacefolder[:ensure]).to eq(dsc_xdfsnamespacefolder[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdfsnamespacefolder[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xdfsnamespacefolder[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xdfsnamespacefolder[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xdfsnamespacefolder[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xdfsnamespacefolder[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xdfsnamespacefolder[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xdfsnamespacefolder[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xdfsnamespacefolder[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xdfsnamespacefolder[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enableinsitereferrals' do
    expect{dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enableinsitereferrals' do
    dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals] = true
    expect(dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enableinsitereferrals" do
    dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals] = 'true'
    expect(dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enableinsitereferrals" do
    dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals] = 'false'
    expect(dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enableinsitereferrals" do
    dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals] = 'True'
    expect(dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enableinsitereferrals" do
    dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals] = 'False'
    expect(dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enableinsitereferrals" do
    dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals] = :true
    expect(dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enableinsitereferrals" do
    dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals] = :false
    expect(dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals]).to eq(false)
  end

  it 'should not accept int for dsc_enableinsitereferrals' do
    expect{dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enableinsitereferrals' do
    expect{dsc_xdfsnamespacefolder[:dsc_enableinsitereferrals] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enabletargetfailback' do
    expect{dsc_xdfsnamespacefolder[:dsc_enabletargetfailback] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enabletargetfailback' do
    dsc_xdfsnamespacefolder[:dsc_enabletargetfailback] = true
    expect(dsc_xdfsnamespacefolder[:dsc_enabletargetfailback]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enabletargetfailback" do
    dsc_xdfsnamespacefolder[:dsc_enabletargetfailback] = 'true'
    expect(dsc_xdfsnamespacefolder[:dsc_enabletargetfailback]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enabletargetfailback" do
    dsc_xdfsnamespacefolder[:dsc_enabletargetfailback] = 'false'
    expect(dsc_xdfsnamespacefolder[:dsc_enabletargetfailback]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enabletargetfailback" do
    dsc_xdfsnamespacefolder[:dsc_enabletargetfailback] = 'True'
    expect(dsc_xdfsnamespacefolder[:dsc_enabletargetfailback]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enabletargetfailback" do
    dsc_xdfsnamespacefolder[:dsc_enabletargetfailback] = 'False'
    expect(dsc_xdfsnamespacefolder[:dsc_enabletargetfailback]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enabletargetfailback" do
    dsc_xdfsnamespacefolder[:dsc_enabletargetfailback] = :true
    expect(dsc_xdfsnamespacefolder[:dsc_enabletargetfailback]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enabletargetfailback" do
    dsc_xdfsnamespacefolder[:dsc_enabletargetfailback] = :false
    expect(dsc_xdfsnamespacefolder[:dsc_enabletargetfailback]).to eq(false)
  end

  it 'should not accept int for dsc_enabletargetfailback' do
    expect{dsc_xdfsnamespacefolder[:dsc_enabletargetfailback] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabletargetfailback' do
    expect{dsc_xdfsnamespacefolder[:dsc_enabletargetfailback] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_referralpriorityclass predefined value Global-High' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = 'Global-High'
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityclass]).to eq('Global-High')
  end

  it 'should accept dsc_referralpriorityclass predefined value global-high' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = 'global-high'
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityclass]).to eq('global-high')
  end

  it 'should accept dsc_referralpriorityclass predefined value SiteCost-High' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = 'SiteCost-High'
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityclass]).to eq('SiteCost-High')
  end

  it 'should accept dsc_referralpriorityclass predefined value sitecost-high' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = 'sitecost-high'
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityclass]).to eq('sitecost-high')
  end

  it 'should accept dsc_referralpriorityclass predefined value SiteCost-Normal' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = 'SiteCost-Normal'
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityclass]).to eq('SiteCost-Normal')
  end

  it 'should accept dsc_referralpriorityclass predefined value sitecost-normal' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = 'sitecost-normal'
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityclass]).to eq('sitecost-normal')
  end

  it 'should accept dsc_referralpriorityclass predefined value SiteCost-Low' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = 'SiteCost-Low'
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityclass]).to eq('SiteCost-Low')
  end

  it 'should accept dsc_referralpriorityclass predefined value sitecost-low' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = 'sitecost-low'
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityclass]).to eq('sitecost-low')
  end

  it 'should accept dsc_referralpriorityclass predefined value Global-Low' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = 'Global-Low'
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityclass]).to eq('Global-Low')
  end

  it 'should accept dsc_referralpriorityclass predefined value global-low' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = 'global-low'
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityclass]).to eq('global-low')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_referralpriorityclass' do
    expect{dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_referralpriorityclass' do
    expect{dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_referralpriorityclass' do
    expect{dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_referralpriorityclass' do
    expect{dsc_xdfsnamespacefolder[:dsc_referralpriorityclass] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_referralpriorityrank' do
    expect{dsc_xdfsnamespacefolder[:dsc_referralpriorityrank] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_referralpriorityrank' do
    expect{dsc_xdfsnamespacefolder[:dsc_referralpriorityrank] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_referralpriorityrank' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityrank] = 32
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityrank]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_referralpriorityrank' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xdfsnamespacefolder[:dsc_referralpriorityrank] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_referralpriorityrank' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityrank] = '16'
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityrank]).to eq(16)
  end

  it 'should accept string-like uint for dsc_referralpriorityrank' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityrank] = '32'
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityrank]).to eq(32)
  end

  it 'should accept string-like uint for dsc_referralpriorityrank' do
    dsc_xdfsnamespacefolder[:dsc_referralpriorityrank] = '64'
    expect(dsc_xdfsnamespacefolder[:dsc_referralpriorityrank]).to eq(64)
  end

  it 'should not accept array for dsc_timetolivesec' do
    expect{dsc_xdfsnamespacefolder[:dsc_timetolivesec] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_timetolivesec' do
    expect{dsc_xdfsnamespacefolder[:dsc_timetolivesec] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_timetolivesec' do
    dsc_xdfsnamespacefolder[:dsc_timetolivesec] = 32
    expect(dsc_xdfsnamespacefolder[:dsc_timetolivesec]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_timetolivesec' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xdfsnamespacefolder[:dsc_timetolivesec] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_timetolivesec' do
    dsc_xdfsnamespacefolder[:dsc_timetolivesec] = '16'
    expect(dsc_xdfsnamespacefolder[:dsc_timetolivesec]).to eq(16)
  end

  it 'should accept string-like uint for dsc_timetolivesec' do
    dsc_xdfsnamespacefolder[:dsc_timetolivesec] = '32'
    expect(dsc_xdfsnamespacefolder[:dsc_timetolivesec]).to eq(32)
  end

  it 'should accept string-like uint for dsc_timetolivesec' do
    dsc_xdfsnamespacefolder[:dsc_timetolivesec] = '64'
    expect(dsc_xdfsnamespacefolder[:dsc_timetolivesec]).to eq(64)
  end

  it 'should not accept array for dsc_state' do
    expect{dsc_xdfsnamespacefolder[:dsc_state] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_state' do
    expect{dsc_xdfsnamespacefolder[:dsc_state] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_state' do
    expect{dsc_xdfsnamespacefolder[:dsc_state] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_state' do
    expect{dsc_xdfsnamespacefolder[:dsc_state] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdfsnamespacefolder)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdfsnamespacefolder)
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
        dsc_xdfsnamespacefolder.original_parameters[:dsc_ensure] = 'present'
        dsc_xdfsnamespacefolder[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xdfsnamespacefolder)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdfsnamespacefolder[:ensure]).to eq(:present)
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
        dsc_xdfsnamespacefolder.original_parameters[:dsc_ensure] = 'absent'
        dsc_xdfsnamespacefolder[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xdfsnamespacefolder)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdfsnamespacefolder[:ensure]).to eq(:absent)
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
