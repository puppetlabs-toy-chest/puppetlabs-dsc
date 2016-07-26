#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xscheduledtask) do

  let :dsc_xscheduledtask do
    Puppet::Type.type(:dsc_xscheduledtask).new(
      :name     => 'foo',
      :dsc_taskname => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xscheduledtask).new(
      :name     => 'foo',
      :dsc_taskname => 'foo',
      :dsc_taskpath => 'foo',
      :dsc_actionexecutable => 'foo',
      :dsc_actionarguments => 'foo',
      :dsc_actionworkingpath => 'foo',
      :dsc_scheduletype => 'Minutes',
      :dsc_repeatinterval => 32,
      :dsc_starttime => 'foo',
      :dsc_ensure => 'Present',
      :dsc_enable => true,
      :dsc_executeascredential => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xscheduledtask.to_s).to eq("Dsc_xscheduledtask[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xscheduledtask[:ensure]).to eq :present
  end

  it 'should require that dsc_taskname is specified' do
    #dsc_xscheduledtask[:dsc_taskname]
    expect { Puppet::Type.type(:dsc_xscheduledtask).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_taskname is a required attribute/)
  end

  it 'should not accept array for dsc_taskname' do
    expect{dsc_xscheduledtask[:dsc_taskname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_taskname' do
    expect{dsc_xscheduledtask[:dsc_taskname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_taskname' do
    expect{dsc_xscheduledtask[:dsc_taskname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_taskname' do
    expect{dsc_xscheduledtask[:dsc_taskname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_taskpath' do
    expect{dsc_xscheduledtask[:dsc_taskpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_taskpath' do
    expect{dsc_xscheduledtask[:dsc_taskpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_taskpath' do
    expect{dsc_xscheduledtask[:dsc_taskpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_taskpath' do
    expect{dsc_xscheduledtask[:dsc_taskpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_actionexecutable' do
    expect{dsc_xscheduledtask[:dsc_actionexecutable] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_actionexecutable' do
    expect{dsc_xscheduledtask[:dsc_actionexecutable] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_actionexecutable' do
    expect{dsc_xscheduledtask[:dsc_actionexecutable] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_actionexecutable' do
    expect{dsc_xscheduledtask[:dsc_actionexecutable] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_actionarguments' do
    expect{dsc_xscheduledtask[:dsc_actionarguments] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_actionarguments' do
    expect{dsc_xscheduledtask[:dsc_actionarguments] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_actionarguments' do
    expect{dsc_xscheduledtask[:dsc_actionarguments] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_actionarguments' do
    expect{dsc_xscheduledtask[:dsc_actionarguments] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_actionworkingpath' do
    expect{dsc_xscheduledtask[:dsc_actionworkingpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_actionworkingpath' do
    expect{dsc_xscheduledtask[:dsc_actionworkingpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_actionworkingpath' do
    expect{dsc_xscheduledtask[:dsc_actionworkingpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_actionworkingpath' do
    expect{dsc_xscheduledtask[:dsc_actionworkingpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_scheduletype predefined value Minutes' do
    dsc_xscheduledtask[:dsc_scheduletype] = 'Minutes'
    expect(dsc_xscheduledtask[:dsc_scheduletype]).to eq('Minutes')
  end

  it 'should accept dsc_scheduletype predefined value minutes' do
    dsc_xscheduledtask[:dsc_scheduletype] = 'minutes'
    expect(dsc_xscheduledtask[:dsc_scheduletype]).to eq('minutes')
  end

  it 'should accept dsc_scheduletype predefined value Hourly' do
    dsc_xscheduledtask[:dsc_scheduletype] = 'Hourly'
    expect(dsc_xscheduledtask[:dsc_scheduletype]).to eq('Hourly')
  end

  it 'should accept dsc_scheduletype predefined value hourly' do
    dsc_xscheduledtask[:dsc_scheduletype] = 'hourly'
    expect(dsc_xscheduledtask[:dsc_scheduletype]).to eq('hourly')
  end

  it 'should accept dsc_scheduletype predefined value Daily' do
    dsc_xscheduledtask[:dsc_scheduletype] = 'Daily'
    expect(dsc_xscheduledtask[:dsc_scheduletype]).to eq('Daily')
  end

  it 'should accept dsc_scheduletype predefined value daily' do
    dsc_xscheduledtask[:dsc_scheduletype] = 'daily'
    expect(dsc_xscheduledtask[:dsc_scheduletype]).to eq('daily')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscheduledtask[:dsc_scheduletype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scheduletype' do
    expect{dsc_xscheduledtask[:dsc_scheduletype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scheduletype' do
    expect{dsc_xscheduledtask[:dsc_scheduletype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scheduletype' do
    expect{dsc_xscheduledtask[:dsc_scheduletype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scheduletype' do
    expect{dsc_xscheduledtask[:dsc_scheduletype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_repeatinterval' do
    expect{dsc_xscheduledtask[:dsc_repeatinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_repeatinterval' do
    expect{dsc_xscheduledtask[:dsc_repeatinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_repeatinterval' do
    dsc_xscheduledtask[:dsc_repeatinterval] = 32
    expect(dsc_xscheduledtask[:dsc_repeatinterval]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_repeatinterval' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xscheduledtask[:dsc_repeatinterval] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_repeatinterval' do
    dsc_xscheduledtask[:dsc_repeatinterval] = '16'
    expect(dsc_xscheduledtask[:dsc_repeatinterval]).to eq(16)
  end

  it 'should accept string-like uint for dsc_repeatinterval' do
    dsc_xscheduledtask[:dsc_repeatinterval] = '32'
    expect(dsc_xscheduledtask[:dsc_repeatinterval]).to eq(32)
  end

  it 'should accept string-like uint for dsc_repeatinterval' do
    dsc_xscheduledtask[:dsc_repeatinterval] = '64'
    expect(dsc_xscheduledtask[:dsc_repeatinterval]).to eq(64)
  end

  it 'should not accept array for dsc_starttime' do
    expect{dsc_xscheduledtask[:dsc_starttime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_starttime' do
    expect{dsc_xscheduledtask[:dsc_starttime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_starttime' do
    expect{dsc_xscheduledtask[:dsc_starttime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_starttime' do
    expect{dsc_xscheduledtask[:dsc_starttime] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xscheduledtask[:dsc_ensure] = 'Present'
    expect(dsc_xscheduledtask[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xscheduledtask[:dsc_ensure] = 'present'
    expect(dsc_xscheduledtask[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscheduledtask[:dsc_ensure] = 'present'
    expect(dsc_xscheduledtask[:ensure]).to eq(dsc_xscheduledtask[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xscheduledtask[:dsc_ensure] = 'Absent'
    expect(dsc_xscheduledtask[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xscheduledtask[:dsc_ensure] = 'absent'
    expect(dsc_xscheduledtask[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscheduledtask[:dsc_ensure] = 'absent'
    expect(dsc_xscheduledtask[:ensure]).to eq(dsc_xscheduledtask[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscheduledtask[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xscheduledtask[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xscheduledtask[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xscheduledtask[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xscheduledtask[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enable' do
    expect{dsc_xscheduledtask[:dsc_enable] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enable' do
    dsc_xscheduledtask[:dsc_enable] = true
    expect(dsc_xscheduledtask[:dsc_enable]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enable" do
    dsc_xscheduledtask[:dsc_enable] = 'true'
    expect(dsc_xscheduledtask[:dsc_enable]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enable" do
    dsc_xscheduledtask[:dsc_enable] = 'false'
    expect(dsc_xscheduledtask[:dsc_enable]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enable" do
    dsc_xscheduledtask[:dsc_enable] = 'True'
    expect(dsc_xscheduledtask[:dsc_enable]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enable" do
    dsc_xscheduledtask[:dsc_enable] = 'False'
    expect(dsc_xscheduledtask[:dsc_enable]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enable" do
    dsc_xscheduledtask[:dsc_enable] = :true
    expect(dsc_xscheduledtask[:dsc_enable]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enable" do
    dsc_xscheduledtask[:dsc_enable] = :false
    expect(dsc_xscheduledtask[:dsc_enable]).to eq(false)
  end

  it 'should not accept int for dsc_enable' do
    expect{dsc_xscheduledtask[:dsc_enable] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enable' do
    expect{dsc_xscheduledtask[:dsc_enable] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_executeascredential" do
    expect{dsc_xscheduledtask[:dsc_executeascredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_executeascredential' do
    expect{dsc_xscheduledtask[:dsc_executeascredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_executeascredential' do
    expect{dsc_xscheduledtask[:dsc_executeascredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_executeascredential' do
    expect{dsc_xscheduledtask[:dsc_executeascredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_executeascredential' do
    expect{dsc_xscheduledtask[:dsc_executeascredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xscheduledtask)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xscheduledtask)
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
        dsc_xscheduledtask.original_parameters[:dsc_ensure] = 'present'
        dsc_xscheduledtask[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xscheduledtask)
      end

      it "should update :ensure to :present" do
        expect(dsc_xscheduledtask[:ensure]).to eq(:present)
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
        dsc_xscheduledtask.original_parameters[:dsc_ensure] = 'absent'
        dsc_xscheduledtask[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xscheduledtask)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xscheduledtask[:ensure]).to eq(:absent)
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
