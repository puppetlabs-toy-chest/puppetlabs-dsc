#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xvmhyperv) do

  let :dsc_xvmhyperv do
    Puppet::Type.type(:dsc_xvmhyperv).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xvmhyperv.to_s).to eq("Dsc_xvmhyperv[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xvmhyperv[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xvmhyperv[:dsc_name]
    expect { Puppet::Type.type(:dsc_xvmhyperv).new(
      :name     => 'foo',
      :dsc_vhdpath => 'foo',
      :dsc_switchname => 'foo',
      :dsc_state => 'Running',
      :dsc_path => 'foo',
      :dsc_generation => 'Vhd',
      :dsc_startupmemory => 64,
      :dsc_minimummemory => 64,
      :dsc_maximummemory => 64,
      :dsc_macaddress => 'foo',
      :dsc_processorcount => 32,
      :dsc_waitforip => true,
      :dsc_restartifneeded => true,
      :dsc_ensure => 'Present',
      :dsc_id => 'foo',
      :dsc_status => 'foo',
      :dsc_cpuusage => 32,
      :dsc_memoryassigned => 64,
      :dsc_uptime => 'foo',
      :dsc_creationtime => '20140711',
      :dsc_hasdynamicmemory => true,
      :dsc_networkadapters => ["foo", "bar", "spec"],
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xvmhyperv[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xvmhyperv[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xvmhyperv[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xvmhyperv[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_vhdpath' do
    expect{dsc_xvmhyperv[:dsc_vhdpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_vhdpath' do
    expect{dsc_xvmhyperv[:dsc_vhdpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_vhdpath' do
    expect{dsc_xvmhyperv[:dsc_vhdpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_vhdpath' do
    expect{dsc_xvmhyperv[:dsc_vhdpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_switchname' do
    expect{dsc_xvmhyperv[:dsc_switchname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_switchname' do
    expect{dsc_xvmhyperv[:dsc_switchname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_switchname' do
    expect{dsc_xvmhyperv[:dsc_switchname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_switchname' do
    expect{dsc_xvmhyperv[:dsc_switchname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_state predefined value Running' do
    dsc_xvmhyperv[:dsc_state] = 'Running'
    expect(dsc_xvmhyperv[:dsc_state]).to eq('Running')
  end

  it 'should accept dsc_state predefined value running' do
    dsc_xvmhyperv[:dsc_state] = 'running'
    expect(dsc_xvmhyperv[:dsc_state]).to eq('running')
  end

  it 'should accept dsc_state predefined value Paused' do
    dsc_xvmhyperv[:dsc_state] = 'Paused'
    expect(dsc_xvmhyperv[:dsc_state]).to eq('Paused')
  end

  it 'should accept dsc_state predefined value paused' do
    dsc_xvmhyperv[:dsc_state] = 'paused'
    expect(dsc_xvmhyperv[:dsc_state]).to eq('paused')
  end

  it 'should accept dsc_state predefined value Off' do
    dsc_xvmhyperv[:dsc_state] = 'Off'
    expect(dsc_xvmhyperv[:dsc_state]).to eq('Off')
  end

  it 'should accept dsc_state predefined value off' do
    dsc_xvmhyperv[:dsc_state] = 'off'
    expect(dsc_xvmhyperv[:dsc_state]).to eq('off')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xvmhyperv[:dsc_state] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_state' do
    expect{dsc_xvmhyperv[:dsc_state] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_state' do
    expect{dsc_xvmhyperv[:dsc_state] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_state' do
    expect{dsc_xvmhyperv[:dsc_state] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_state' do
    expect{dsc_xvmhyperv[:dsc_state] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xvmhyperv[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xvmhyperv[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xvmhyperv[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xvmhyperv[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_generation predefined value Vhd' do
    dsc_xvmhyperv[:dsc_generation] = 'Vhd'
    expect(dsc_xvmhyperv[:dsc_generation]).to eq('Vhd')
  end

  it 'should accept dsc_generation predefined value vhd' do
    dsc_xvmhyperv[:dsc_generation] = 'vhd'
    expect(dsc_xvmhyperv[:dsc_generation]).to eq('vhd')
  end

  it 'should accept dsc_generation predefined value Vhdx' do
    dsc_xvmhyperv[:dsc_generation] = 'Vhdx'
    expect(dsc_xvmhyperv[:dsc_generation]).to eq('Vhdx')
  end

  it 'should accept dsc_generation predefined value vhdx' do
    dsc_xvmhyperv[:dsc_generation] = 'vhdx'
    expect(dsc_xvmhyperv[:dsc_generation]).to eq('vhdx')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xvmhyperv[:dsc_generation] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_generation' do
    expect{dsc_xvmhyperv[:dsc_generation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_generation' do
    expect{dsc_xvmhyperv[:dsc_generation] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_generation' do
    expect{dsc_xvmhyperv[:dsc_generation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_generation' do
    expect{dsc_xvmhyperv[:dsc_generation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_startupmemory' do
    expect{dsc_xvmhyperv[:dsc_startupmemory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_startupmemory' do
    expect{dsc_xvmhyperv[:dsc_startupmemory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_startupmemory' do
    expect{dsc_xvmhyperv[:dsc_startupmemory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_startupmemory' do
    dsc_xvmhyperv[:dsc_startupmemory] = 64
    expect(dsc_xvmhyperv[:dsc_startupmemory]).to eq(64)
  end


  it 'should accept string-like int for dsc_startupmemory' do
    dsc_xvmhyperv[:dsc_startupmemory] = '16'
    expect(dsc_xvmhyperv[:dsc_startupmemory]).to eq(16)
  end


  it 'should accept string-like int for dsc_startupmemory' do
    dsc_xvmhyperv[:dsc_startupmemory] = '32'
    expect(dsc_xvmhyperv[:dsc_startupmemory]).to eq(32)
  end


  it 'should accept string-like int for dsc_startupmemory' do
    dsc_xvmhyperv[:dsc_startupmemory] = '64'
    expect(dsc_xvmhyperv[:dsc_startupmemory]).to eq(64)
  end

  it 'should not accept array for dsc_minimummemory' do
    expect{dsc_xvmhyperv[:dsc_minimummemory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_minimummemory' do
    expect{dsc_xvmhyperv[:dsc_minimummemory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_minimummemory' do
    expect{dsc_xvmhyperv[:dsc_minimummemory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_minimummemory' do
    dsc_xvmhyperv[:dsc_minimummemory] = 64
    expect(dsc_xvmhyperv[:dsc_minimummemory]).to eq(64)
  end


  it 'should accept string-like int for dsc_minimummemory' do
    dsc_xvmhyperv[:dsc_minimummemory] = '16'
    expect(dsc_xvmhyperv[:dsc_minimummemory]).to eq(16)
  end


  it 'should accept string-like int for dsc_minimummemory' do
    dsc_xvmhyperv[:dsc_minimummemory] = '32'
    expect(dsc_xvmhyperv[:dsc_minimummemory]).to eq(32)
  end


  it 'should accept string-like int for dsc_minimummemory' do
    dsc_xvmhyperv[:dsc_minimummemory] = '64'
    expect(dsc_xvmhyperv[:dsc_minimummemory]).to eq(64)
  end

  it 'should not accept array for dsc_maximummemory' do
    expect{dsc_xvmhyperv[:dsc_maximummemory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maximummemory' do
    expect{dsc_xvmhyperv[:dsc_maximummemory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maximummemory' do
    expect{dsc_xvmhyperv[:dsc_maximummemory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maximummemory' do
    dsc_xvmhyperv[:dsc_maximummemory] = 64
    expect(dsc_xvmhyperv[:dsc_maximummemory]).to eq(64)
  end


  it 'should accept string-like int for dsc_maximummemory' do
    dsc_xvmhyperv[:dsc_maximummemory] = '16'
    expect(dsc_xvmhyperv[:dsc_maximummemory]).to eq(16)
  end


  it 'should accept string-like int for dsc_maximummemory' do
    dsc_xvmhyperv[:dsc_maximummemory] = '32'
    expect(dsc_xvmhyperv[:dsc_maximummemory]).to eq(32)
  end


  it 'should accept string-like int for dsc_maximummemory' do
    dsc_xvmhyperv[:dsc_maximummemory] = '64'
    expect(dsc_xvmhyperv[:dsc_maximummemory]).to eq(64)
  end

  it 'should not accept array for dsc_macaddress' do
    expect{dsc_xvmhyperv[:dsc_macaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_macaddress' do
    expect{dsc_xvmhyperv[:dsc_macaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_macaddress' do
    expect{dsc_xvmhyperv[:dsc_macaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_macaddress' do
    expect{dsc_xvmhyperv[:dsc_macaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_processorcount' do
    expect{dsc_xvmhyperv[:dsc_processorcount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_processorcount' do
    expect{dsc_xvmhyperv[:dsc_processorcount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_processorcount' do
    expect{dsc_xvmhyperv[:dsc_processorcount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_processorcount' do
    dsc_xvmhyperv[:dsc_processorcount] = 32
    expect(dsc_xvmhyperv[:dsc_processorcount]).to eq(32)
  end


  it 'should accept string-like int for dsc_processorcount' do
    dsc_xvmhyperv[:dsc_processorcount] = '16'
    expect(dsc_xvmhyperv[:dsc_processorcount]).to eq(16)
  end


  it 'should accept string-like int for dsc_processorcount' do
    dsc_xvmhyperv[:dsc_processorcount] = '32'
    expect(dsc_xvmhyperv[:dsc_processorcount]).to eq(32)
  end


  it 'should accept string-like int for dsc_processorcount' do
    dsc_xvmhyperv[:dsc_processorcount] = '64'
    expect(dsc_xvmhyperv[:dsc_processorcount]).to eq(64)
  end

  it 'should not accept array for dsc_waitforip' do
    expect{dsc_xvmhyperv[:dsc_waitforip] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_waitforip' do
    dsc_xvmhyperv[:dsc_waitforip] = true
    expect(dsc_xvmhyperv[:dsc_waitforip]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_waitforip" do
    dsc_xvmhyperv[:dsc_waitforip] = 'true'
    expect(dsc_xvmhyperv[:dsc_waitforip]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_waitforip" do
    dsc_xvmhyperv[:dsc_waitforip] = 'false'
    expect(dsc_xvmhyperv[:dsc_waitforip]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_waitforip" do
    dsc_xvmhyperv[:dsc_waitforip] = 'True'
    expect(dsc_xvmhyperv[:dsc_waitforip]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_waitforip" do
    dsc_xvmhyperv[:dsc_waitforip] = 'False'
    expect(dsc_xvmhyperv[:dsc_waitforip]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_waitforip" do
    dsc_xvmhyperv[:dsc_waitforip] = :true
    expect(dsc_xvmhyperv[:dsc_waitforip]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_waitforip" do
    dsc_xvmhyperv[:dsc_waitforip] = :false
    expect(dsc_xvmhyperv[:dsc_waitforip]).to eq(false)
  end

  it 'should not accept int for dsc_waitforip' do
    expect{dsc_xvmhyperv[:dsc_waitforip] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_waitforip' do
    expect{dsc_xvmhyperv[:dsc_waitforip] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_restartifneeded' do
    expect{dsc_xvmhyperv[:dsc_restartifneeded] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_restartifneeded' do
    dsc_xvmhyperv[:dsc_restartifneeded] = true
    expect(dsc_xvmhyperv[:dsc_restartifneeded]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_restartifneeded" do
    dsc_xvmhyperv[:dsc_restartifneeded] = 'true'
    expect(dsc_xvmhyperv[:dsc_restartifneeded]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_restartifneeded" do
    dsc_xvmhyperv[:dsc_restartifneeded] = 'false'
    expect(dsc_xvmhyperv[:dsc_restartifneeded]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_restartifneeded" do
    dsc_xvmhyperv[:dsc_restartifneeded] = 'True'
    expect(dsc_xvmhyperv[:dsc_restartifneeded]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_restartifneeded" do
    dsc_xvmhyperv[:dsc_restartifneeded] = 'False'
    expect(dsc_xvmhyperv[:dsc_restartifneeded]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_restartifneeded" do
    dsc_xvmhyperv[:dsc_restartifneeded] = :true
    expect(dsc_xvmhyperv[:dsc_restartifneeded]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_restartifneeded" do
    dsc_xvmhyperv[:dsc_restartifneeded] = :false
    expect(dsc_xvmhyperv[:dsc_restartifneeded]).to eq(false)
  end

  it 'should not accept int for dsc_restartifneeded' do
    expect{dsc_xvmhyperv[:dsc_restartifneeded] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_restartifneeded' do
    expect{dsc_xvmhyperv[:dsc_restartifneeded] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xvmhyperv[:dsc_ensure] = 'Present'
    expect(dsc_xvmhyperv[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xvmhyperv[:dsc_ensure] = 'present'
    expect(dsc_xvmhyperv[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xvmhyperv[:dsc_ensure] = 'present'
    expect(dsc_xvmhyperv[:ensure]).to eq(dsc_xvmhyperv[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xvmhyperv[:dsc_ensure] = 'Absent'
    expect(dsc_xvmhyperv[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xvmhyperv[:dsc_ensure] = 'absent'
    expect(dsc_xvmhyperv[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xvmhyperv[:dsc_ensure] = 'absent'
    expect(dsc_xvmhyperv[:ensure]).to eq(dsc_xvmhyperv[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xvmhyperv[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xvmhyperv[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xvmhyperv[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xvmhyperv[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xvmhyperv[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_id' do
    expect{dsc_xvmhyperv[:dsc_id] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_id' do
    expect{dsc_xvmhyperv[:dsc_id] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_id' do
    expect{dsc_xvmhyperv[:dsc_id] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_id' do
    expect{dsc_xvmhyperv[:dsc_id] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_status' do
    expect{dsc_xvmhyperv[:dsc_status] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_status' do
    expect{dsc_xvmhyperv[:dsc_status] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_status' do
    expect{dsc_xvmhyperv[:dsc_status] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_status' do
    expect{dsc_xvmhyperv[:dsc_status] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_cpuusage' do
    expect{dsc_xvmhyperv[:dsc_cpuusage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_cpuusage' do
    expect{dsc_xvmhyperv[:dsc_cpuusage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_cpuusage' do
    expect{dsc_xvmhyperv[:dsc_cpuusage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_cpuusage' do
    dsc_xvmhyperv[:dsc_cpuusage] = 32
    expect(dsc_xvmhyperv[:dsc_cpuusage]).to eq(32)
  end


  it 'should accept string-like int for dsc_cpuusage' do
    dsc_xvmhyperv[:dsc_cpuusage] = '16'
    expect(dsc_xvmhyperv[:dsc_cpuusage]).to eq(16)
  end


  it 'should accept string-like int for dsc_cpuusage' do
    dsc_xvmhyperv[:dsc_cpuusage] = '32'
    expect(dsc_xvmhyperv[:dsc_cpuusage]).to eq(32)
  end


  it 'should accept string-like int for dsc_cpuusage' do
    dsc_xvmhyperv[:dsc_cpuusage] = '64'
    expect(dsc_xvmhyperv[:dsc_cpuusage]).to eq(64)
  end

  it 'should not accept array for dsc_memoryassigned' do
    expect{dsc_xvmhyperv[:dsc_memoryassigned] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_memoryassigned' do
    expect{dsc_xvmhyperv[:dsc_memoryassigned] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memoryassigned' do
    expect{dsc_xvmhyperv[:dsc_memoryassigned] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_memoryassigned' do
    dsc_xvmhyperv[:dsc_memoryassigned] = 64
    expect(dsc_xvmhyperv[:dsc_memoryassigned]).to eq(64)
  end


  it 'should accept string-like int for dsc_memoryassigned' do
    dsc_xvmhyperv[:dsc_memoryassigned] = '16'
    expect(dsc_xvmhyperv[:dsc_memoryassigned]).to eq(16)
  end


  it 'should accept string-like int for dsc_memoryassigned' do
    dsc_xvmhyperv[:dsc_memoryassigned] = '32'
    expect(dsc_xvmhyperv[:dsc_memoryassigned]).to eq(32)
  end


  it 'should accept string-like int for dsc_memoryassigned' do
    dsc_xvmhyperv[:dsc_memoryassigned] = '64'
    expect(dsc_xvmhyperv[:dsc_memoryassigned]).to eq(64)
  end

  it 'should not accept array for dsc_uptime' do
    expect{dsc_xvmhyperv[:dsc_uptime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_uptime' do
    expect{dsc_xvmhyperv[:dsc_uptime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_uptime' do
    expect{dsc_xvmhyperv[:dsc_uptime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_uptime' do
    expect{dsc_xvmhyperv[:dsc_uptime] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_creationtime' do
    expect{dsc_xvmhyperv[:dsc_creationtime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_creationtime' do
    expect{dsc_xvmhyperv[:dsc_creationtime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_creationtime' do
    expect{dsc_xvmhyperv[:dsc_creationtime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_creationtime' do
    expect{dsc_xvmhyperv[:dsc_creationtime] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_hasdynamicmemory' do
    expect{dsc_xvmhyperv[:dsc_hasdynamicmemory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_hasdynamicmemory' do
    dsc_xvmhyperv[:dsc_hasdynamicmemory] = true
    expect(dsc_xvmhyperv[:dsc_hasdynamicmemory]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_hasdynamicmemory" do
    dsc_xvmhyperv[:dsc_hasdynamicmemory] = 'true'
    expect(dsc_xvmhyperv[:dsc_hasdynamicmemory]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_hasdynamicmemory" do
    dsc_xvmhyperv[:dsc_hasdynamicmemory] = 'false'
    expect(dsc_xvmhyperv[:dsc_hasdynamicmemory]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_hasdynamicmemory" do
    dsc_xvmhyperv[:dsc_hasdynamicmemory] = 'True'
    expect(dsc_xvmhyperv[:dsc_hasdynamicmemory]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_hasdynamicmemory" do
    dsc_xvmhyperv[:dsc_hasdynamicmemory] = 'False'
    expect(dsc_xvmhyperv[:dsc_hasdynamicmemory]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_hasdynamicmemory" do
    dsc_xvmhyperv[:dsc_hasdynamicmemory] = :true
    expect(dsc_xvmhyperv[:dsc_hasdynamicmemory]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_hasdynamicmemory" do
    dsc_xvmhyperv[:dsc_hasdynamicmemory] = :false
    expect(dsc_xvmhyperv[:dsc_hasdynamicmemory]).to eq(false)
  end

  it 'should not accept int for dsc_hasdynamicmemory' do
    expect{dsc_xvmhyperv[:dsc_hasdynamicmemory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_hasdynamicmemory' do
    expect{dsc_xvmhyperv[:dsc_hasdynamicmemory] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_networkadapters' do
    dsc_xvmhyperv[:dsc_networkadapters] = ["foo", "bar", "spec"]
    expect(dsc_xvmhyperv[:dsc_networkadapters]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_networkadapters' do
    expect{dsc_xvmhyperv[:dsc_networkadapters] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_networkadapters' do
    expect{dsc_xvmhyperv[:dsc_networkadapters] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_networkadapters' do
    expect{dsc_xvmhyperv[:dsc_networkadapters] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xvmhyperv)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xvmhyperv)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Import-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script with Import-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Import-DscResource/)
      end

    end

    describe "when dscmeta_import_resource is false" do

      it "should compute powershell dsc test script without Import-DscResource" do
        dsc_xvmhyperv[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xvmhyperv[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xvmhyperv.original_parameters[:dsc_ensure] = 'present'
        dsc_xvmhyperv[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xvmhyperv)
      end

      it "should update :ensure to :present" do
        expect(dsc_xvmhyperv[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xvmhyperv.original_parameters[:dsc_ensure] = 'absent'
        dsc_xvmhyperv[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xvmhyperv)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xvmhyperv[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xvmhyperv)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xvmhyperv)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xVMHyperV as $MSFT_xVMHyperV1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xVMHyperV/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xvmhyperv[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xvmhyperv)
      end

      it "should update :ensure to :present" do
        expect(dsc_xvmhyperv[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xvmhyperv[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xvmhyperv)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xvmhyperv[:ensure]).to eq(:absent)
      end

    end

  end
end
