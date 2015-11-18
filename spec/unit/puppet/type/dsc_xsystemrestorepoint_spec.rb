#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsystemrestorepoint) do

  let :dsc_xsystemrestorepoint do
    Puppet::Type.type(:dsc_xsystemrestorepoint).new(
      :name     => 'foo',
      :dsc_description => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsystemrestorepoint.to_s).to eq("Dsc_xsystemrestorepoint[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xsystemrestorepoint[:ensure]).to eq :present
  end

  it 'should require that dsc_description is specified' do
    #dsc_xsystemrestorepoint[:dsc_description]
    expect { Puppet::Type.type(:dsc_xsystemrestorepoint).new(
      :name     => 'foo',
      :dsc_restorepointtype => 'APPLICATION_INSTALL',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_description is a required attribute/)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xsystemrestorepoint[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xsystemrestorepoint[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xsystemrestorepoint[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xsystemrestorepoint[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_restorepointtype predefined value APPLICATION_INSTALL' do
    dsc_xsystemrestorepoint[:dsc_restorepointtype] = 'APPLICATION_INSTALL'
    expect(dsc_xsystemrestorepoint[:dsc_restorepointtype]).to eq('APPLICATION_INSTALL')
  end

  it 'should accept dsc_restorepointtype predefined value application_install' do
    dsc_xsystemrestorepoint[:dsc_restorepointtype] = 'application_install'
    expect(dsc_xsystemrestorepoint[:dsc_restorepointtype]).to eq('application_install')
  end

  it 'should accept dsc_restorepointtype predefined value APPLICATION_UNINSTALL' do
    dsc_xsystemrestorepoint[:dsc_restorepointtype] = 'APPLICATION_UNINSTALL'
    expect(dsc_xsystemrestorepoint[:dsc_restorepointtype]).to eq('APPLICATION_UNINSTALL')
  end

  it 'should accept dsc_restorepointtype predefined value application_uninstall' do
    dsc_xsystemrestorepoint[:dsc_restorepointtype] = 'application_uninstall'
    expect(dsc_xsystemrestorepoint[:dsc_restorepointtype]).to eq('application_uninstall')
  end

  it 'should accept dsc_restorepointtype predefined value DEVICE_DRIVER_INSTALL' do
    dsc_xsystemrestorepoint[:dsc_restorepointtype] = 'DEVICE_DRIVER_INSTALL'
    expect(dsc_xsystemrestorepoint[:dsc_restorepointtype]).to eq('DEVICE_DRIVER_INSTALL')
  end

  it 'should accept dsc_restorepointtype predefined value device_driver_install' do
    dsc_xsystemrestorepoint[:dsc_restorepointtype] = 'device_driver_install'
    expect(dsc_xsystemrestorepoint[:dsc_restorepointtype]).to eq('device_driver_install')
  end

  it 'should accept dsc_restorepointtype predefined value MODIFY_SETTINGS' do
    dsc_xsystemrestorepoint[:dsc_restorepointtype] = 'MODIFY_SETTINGS'
    expect(dsc_xsystemrestorepoint[:dsc_restorepointtype]).to eq('MODIFY_SETTINGS')
  end

  it 'should accept dsc_restorepointtype predefined value modify_settings' do
    dsc_xsystemrestorepoint[:dsc_restorepointtype] = 'modify_settings'
    expect(dsc_xsystemrestorepoint[:dsc_restorepointtype]).to eq('modify_settings')
  end

  it 'should accept dsc_restorepointtype predefined value CANCELLED_OPERATION' do
    dsc_xsystemrestorepoint[:dsc_restorepointtype] = 'CANCELLED_OPERATION'
    expect(dsc_xsystemrestorepoint[:dsc_restorepointtype]).to eq('CANCELLED_OPERATION')
  end

  it 'should accept dsc_restorepointtype predefined value cancelled_operation' do
    dsc_xsystemrestorepoint[:dsc_restorepointtype] = 'cancelled_operation'
    expect(dsc_xsystemrestorepoint[:dsc_restorepointtype]).to eq('cancelled_operation')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsystemrestorepoint[:dsc_restorepointtype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_restorepointtype' do
    expect{dsc_xsystemrestorepoint[:dsc_restorepointtype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_restorepointtype' do
    expect{dsc_xsystemrestorepoint[:dsc_restorepointtype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_restorepointtype' do
    expect{dsc_xsystemrestorepoint[:dsc_restorepointtype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_restorepointtype' do
    expect{dsc_xsystemrestorepoint[:dsc_restorepointtype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xsystemrestorepoint[:dsc_ensure] = 'Present'
    expect(dsc_xsystemrestorepoint[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xsystemrestorepoint[:dsc_ensure] = 'present'
    expect(dsc_xsystemrestorepoint[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsystemrestorepoint[:dsc_ensure] = 'present'
    expect(dsc_xsystemrestorepoint[:ensure]).to eq(dsc_xsystemrestorepoint[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xsystemrestorepoint[:dsc_ensure] = 'Absent'
    expect(dsc_xsystemrestorepoint[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xsystemrestorepoint[:dsc_ensure] = 'absent'
    expect(dsc_xsystemrestorepoint[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsystemrestorepoint[:dsc_ensure] = 'absent'
    expect(dsc_xsystemrestorepoint[:ensure]).to eq(dsc_xsystemrestorepoint[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsystemrestorepoint[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xsystemrestorepoint[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xsystemrestorepoint[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xsystemrestorepoint[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xsystemrestorepoint[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsystemrestorepoint)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsystemrestorepoint)
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
        dsc_xsystemrestorepoint.original_parameters[:dsc_ensure] = 'present'
        dsc_xsystemrestorepoint[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xsystemrestorepoint)
      end

      it "should update :ensure to :present" do
        expect(dsc_xsystemrestorepoint[:ensure]).to eq(:present)
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
        dsc_xsystemrestorepoint.original_parameters[:dsc_ensure] = 'absent'
        dsc_xsystemrestorepoint[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xsystemrestorepoint)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xsystemrestorepoint[:ensure]).to eq(:absent)
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
