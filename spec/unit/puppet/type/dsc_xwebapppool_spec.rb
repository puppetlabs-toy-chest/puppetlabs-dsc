#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwebapppool) do

  let :dsc_xwebapppool do
    Puppet::Type.type(:dsc_xwebapppool).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwebapppool.to_s).to eq("Dsc_xwebapppool[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xwebapppool[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xwebapppool[:dsc_name]
    expect { Puppet::Type.type(:dsc_xwebapppool).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_state => 'Started',
      :dsc_autostart => 'true',
      :dsc_managedruntimeversion => 'v4.0',
      :dsc_managedpipelinemode => 'Integrated',
      :dsc_startmode => 'AlwaysRunning',
      :dsc_identitytype => 'ApplicationPoolIdentity',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_loaduserprofile => 'true',
      :dsc_queuelength => 'foo',
      :dsc_enable32bitapponwin64 => 'true',
      :dsc_managedruntimeloader => 'foo',
      :dsc_enableconfigurationoverride => 'true',
      :dsc_clrconfigfile => 'foo',
      :dsc_passanonymoustoken => 'true',
      :dsc_logontype => 'LogonBatch',
      :dsc_manualgroupmembership => 'true',
      :dsc_idletimeout => 'foo',
      :dsc_maxprocesses => 'foo',
      :dsc_shutdowntimelimit => 'foo',
      :dsc_startuptimelimit => 'foo',
      :dsc_pingingenabled => 'true',
      :dsc_pinginterval => 'foo',
      :dsc_pingresponsetime => 'foo',
      :dsc_disallowoverlappingrotation => 'true',
      :dsc_disallowrotationonconfigchange => 'true',
      :dsc_logeventonrecycle => 'foo',
      :dsc_restartmemorylimit => 'foo',
      :dsc_restartprivatememorylimit => 'foo',
      :dsc_restartrequestslimit => 'foo',
      :dsc_restarttimelimit => 'foo',
      :dsc_restartschedule => ["foo", "bar", "spec"],
      :dsc_loadbalancercapabilities => 'HttpLevel',
      :dsc_orphanworkerprocess => 'true',
      :dsc_orphanactionexe => 'foo',
      :dsc_orphanactionparams => 'foo',
      :dsc_rapidfailprotection => 'true',
      :dsc_rapidfailprotectioninterval => 'foo',
      :dsc_rapidfailprotectionmaxcrashes => 'foo',
      :dsc_autoshutdownexe => 'foo',
      :dsc_autoshutdownparams => 'foo',
      :dsc_cpulimit => 'foo',
      :dsc_cpuaction => 'NoAction',
      :dsc_cpuresetinterval => 'foo',
      :dsc_cpusmpaffinitized => 'true',
      :dsc_cpusmpprocessoraffinitymask => 'foo',
      :dsc_cpusmpprocessoraffinitymask2 => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xwebapppool[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xwebapppool[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xwebapppool[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xwebapppool[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xwebapppool[:dsc_ensure] = 'Present'
    expect(dsc_xwebapppool[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xwebapppool[:dsc_ensure] = 'present'
    expect(dsc_xwebapppool[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebapppool[:dsc_ensure] = 'present'
    expect(dsc_xwebapppool[:ensure]).to eq(dsc_xwebapppool[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xwebapppool[:dsc_ensure] = 'Absent'
    expect(dsc_xwebapppool[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xwebapppool[:dsc_ensure] = 'absent'
    expect(dsc_xwebapppool[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebapppool[:dsc_ensure] = 'absent'
    expect(dsc_xwebapppool[:ensure]).to eq(dsc_xwebapppool[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xwebapppool[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xwebapppool[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xwebapppool[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xwebapppool[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_state predefined value Started' do
    dsc_xwebapppool[:dsc_state] = 'Started'
    expect(dsc_xwebapppool[:dsc_state]).to eq('Started')
  end

  it 'should accept dsc_state predefined value started' do
    dsc_xwebapppool[:dsc_state] = 'started'
    expect(dsc_xwebapppool[:dsc_state]).to eq('started')
  end

  it 'should accept dsc_state predefined value Stopped' do
    dsc_xwebapppool[:dsc_state] = 'Stopped'
    expect(dsc_xwebapppool[:dsc_state]).to eq('Stopped')
  end

  it 'should accept dsc_state predefined value stopped' do
    dsc_xwebapppool[:dsc_state] = 'stopped'
    expect(dsc_xwebapppool[:dsc_state]).to eq('stopped')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_state] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_state' do
    expect{dsc_xwebapppool[:dsc_state] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_state' do
    expect{dsc_xwebapppool[:dsc_state] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_state' do
    expect{dsc_xwebapppool[:dsc_state] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_state' do
    expect{dsc_xwebapppool[:dsc_state] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_autostart predefined value true' do
    dsc_xwebapppool[:dsc_autostart] = 'true'
    expect(dsc_xwebapppool[:dsc_autostart]).to eq('true')
  end

  it 'should accept dsc_autostart predefined value true' do
    dsc_xwebapppool[:dsc_autostart] = 'true'
    expect(dsc_xwebapppool[:dsc_autostart]).to eq('true')
  end

  it 'should accept dsc_autostart predefined value false' do
    dsc_xwebapppool[:dsc_autostart] = 'false'
    expect(dsc_xwebapppool[:dsc_autostart]).to eq('false')
  end

  it 'should accept dsc_autostart predefined value false' do
    dsc_xwebapppool[:dsc_autostart] = 'false'
    expect(dsc_xwebapppool[:dsc_autostart]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_autostart] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autostart' do
    expect{dsc_xwebapppool[:dsc_autostart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autostart' do
    expect{dsc_xwebapppool[:dsc_autostart] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_autostart' do
    expect{dsc_xwebapppool[:dsc_autostart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autostart' do
    expect{dsc_xwebapppool[:dsc_autostart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_managedruntimeversion predefined value v4.0' do
    dsc_xwebapppool[:dsc_managedruntimeversion] = 'v4.0'
    expect(dsc_xwebapppool[:dsc_managedruntimeversion]).to eq('v4.0')
  end

  it 'should accept dsc_managedruntimeversion predefined value v4.0' do
    dsc_xwebapppool[:dsc_managedruntimeversion] = 'v4.0'
    expect(dsc_xwebapppool[:dsc_managedruntimeversion]).to eq('v4.0')
  end

  it 'should accept dsc_managedruntimeversion predefined value v2.0' do
    dsc_xwebapppool[:dsc_managedruntimeversion] = 'v2.0'
    expect(dsc_xwebapppool[:dsc_managedruntimeversion]).to eq('v2.0')
  end

  it 'should accept dsc_managedruntimeversion predefined value v2.0' do
    dsc_xwebapppool[:dsc_managedruntimeversion] = 'v2.0'
    expect(dsc_xwebapppool[:dsc_managedruntimeversion]).to eq('v2.0')
  end

  it 'should accept dsc_managedruntimeversion predefined value ' do
    dsc_xwebapppool[:dsc_managedruntimeversion] = ''
    expect(dsc_xwebapppool[:dsc_managedruntimeversion]).to eq('')
  end

  it 'should accept dsc_managedruntimeversion predefined value ' do
    dsc_xwebapppool[:dsc_managedruntimeversion] = ''
    expect(dsc_xwebapppool[:dsc_managedruntimeversion]).to eq('')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_managedruntimeversion] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_managedruntimeversion' do
    expect{dsc_xwebapppool[:dsc_managedruntimeversion] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_managedruntimeversion' do
    expect{dsc_xwebapppool[:dsc_managedruntimeversion] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_managedruntimeversion' do
    expect{dsc_xwebapppool[:dsc_managedruntimeversion] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_managedruntimeversion' do
    expect{dsc_xwebapppool[:dsc_managedruntimeversion] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_managedpipelinemode predefined value Integrated' do
    dsc_xwebapppool[:dsc_managedpipelinemode] = 'Integrated'
    expect(dsc_xwebapppool[:dsc_managedpipelinemode]).to eq('Integrated')
  end

  it 'should accept dsc_managedpipelinemode predefined value integrated' do
    dsc_xwebapppool[:dsc_managedpipelinemode] = 'integrated'
    expect(dsc_xwebapppool[:dsc_managedpipelinemode]).to eq('integrated')
  end

  it 'should accept dsc_managedpipelinemode predefined value Classic' do
    dsc_xwebapppool[:dsc_managedpipelinemode] = 'Classic'
    expect(dsc_xwebapppool[:dsc_managedpipelinemode]).to eq('Classic')
  end

  it 'should accept dsc_managedpipelinemode predefined value classic' do
    dsc_xwebapppool[:dsc_managedpipelinemode] = 'classic'
    expect(dsc_xwebapppool[:dsc_managedpipelinemode]).to eq('classic')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_managedpipelinemode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_managedpipelinemode' do
    expect{dsc_xwebapppool[:dsc_managedpipelinemode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_managedpipelinemode' do
    expect{dsc_xwebapppool[:dsc_managedpipelinemode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_managedpipelinemode' do
    expect{dsc_xwebapppool[:dsc_managedpipelinemode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_managedpipelinemode' do
    expect{dsc_xwebapppool[:dsc_managedpipelinemode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_startmode predefined value AlwaysRunning' do
    dsc_xwebapppool[:dsc_startmode] = 'AlwaysRunning'
    expect(dsc_xwebapppool[:dsc_startmode]).to eq('AlwaysRunning')
  end

  it 'should accept dsc_startmode predefined value alwaysrunning' do
    dsc_xwebapppool[:dsc_startmode] = 'alwaysrunning'
    expect(dsc_xwebapppool[:dsc_startmode]).to eq('alwaysrunning')
  end

  it 'should accept dsc_startmode predefined value OnDemand' do
    dsc_xwebapppool[:dsc_startmode] = 'OnDemand'
    expect(dsc_xwebapppool[:dsc_startmode]).to eq('OnDemand')
  end

  it 'should accept dsc_startmode predefined value ondemand' do
    dsc_xwebapppool[:dsc_startmode] = 'ondemand'
    expect(dsc_xwebapppool[:dsc_startmode]).to eq('ondemand')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_startmode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_startmode' do
    expect{dsc_xwebapppool[:dsc_startmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_startmode' do
    expect{dsc_xwebapppool[:dsc_startmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_startmode' do
    expect{dsc_xwebapppool[:dsc_startmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_startmode' do
    expect{dsc_xwebapppool[:dsc_startmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_identitytype predefined value ApplicationPoolIdentity' do
    dsc_xwebapppool[:dsc_identitytype] = 'ApplicationPoolIdentity'
    expect(dsc_xwebapppool[:dsc_identitytype]).to eq('ApplicationPoolIdentity')
  end

  it 'should accept dsc_identitytype predefined value applicationpoolidentity' do
    dsc_xwebapppool[:dsc_identitytype] = 'applicationpoolidentity'
    expect(dsc_xwebapppool[:dsc_identitytype]).to eq('applicationpoolidentity')
  end

  it 'should accept dsc_identitytype predefined value LocalSystem' do
    dsc_xwebapppool[:dsc_identitytype] = 'LocalSystem'
    expect(dsc_xwebapppool[:dsc_identitytype]).to eq('LocalSystem')
  end

  it 'should accept dsc_identitytype predefined value localsystem' do
    dsc_xwebapppool[:dsc_identitytype] = 'localsystem'
    expect(dsc_xwebapppool[:dsc_identitytype]).to eq('localsystem')
  end

  it 'should accept dsc_identitytype predefined value LocalService' do
    dsc_xwebapppool[:dsc_identitytype] = 'LocalService'
    expect(dsc_xwebapppool[:dsc_identitytype]).to eq('LocalService')
  end

  it 'should accept dsc_identitytype predefined value localservice' do
    dsc_xwebapppool[:dsc_identitytype] = 'localservice'
    expect(dsc_xwebapppool[:dsc_identitytype]).to eq('localservice')
  end

  it 'should accept dsc_identitytype predefined value NetworkService' do
    dsc_xwebapppool[:dsc_identitytype] = 'NetworkService'
    expect(dsc_xwebapppool[:dsc_identitytype]).to eq('NetworkService')
  end

  it 'should accept dsc_identitytype predefined value networkservice' do
    dsc_xwebapppool[:dsc_identitytype] = 'networkservice'
    expect(dsc_xwebapppool[:dsc_identitytype]).to eq('networkservice')
  end

  it 'should accept dsc_identitytype predefined value SpecificUser' do
    dsc_xwebapppool[:dsc_identitytype] = 'SpecificUser'
    expect(dsc_xwebapppool[:dsc_identitytype]).to eq('SpecificUser')
  end

  it 'should accept dsc_identitytype predefined value specificuser' do
    dsc_xwebapppool[:dsc_identitytype] = 'specificuser'
    expect(dsc_xwebapppool[:dsc_identitytype]).to eq('specificuser')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_identitytype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_identitytype' do
    expect{dsc_xwebapppool[:dsc_identitytype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identitytype' do
    expect{dsc_xwebapppool[:dsc_identitytype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identitytype' do
    expect{dsc_xwebapppool[:dsc_identitytype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identitytype' do
    expect{dsc_xwebapppool[:dsc_identitytype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xwebapppool[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xwebapppool[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xwebapppool[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xwebapppool[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xwebapppool[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_loaduserprofile predefined value true' do
    dsc_xwebapppool[:dsc_loaduserprofile] = 'true'
    expect(dsc_xwebapppool[:dsc_loaduserprofile]).to eq('true')
  end

  it 'should accept dsc_loaduserprofile predefined value true' do
    dsc_xwebapppool[:dsc_loaduserprofile] = 'true'
    expect(dsc_xwebapppool[:dsc_loaduserprofile]).to eq('true')
  end

  it 'should accept dsc_loaduserprofile predefined value false' do
    dsc_xwebapppool[:dsc_loaduserprofile] = 'false'
    expect(dsc_xwebapppool[:dsc_loaduserprofile]).to eq('false')
  end

  it 'should accept dsc_loaduserprofile predefined value false' do
    dsc_xwebapppool[:dsc_loaduserprofile] = 'false'
    expect(dsc_xwebapppool[:dsc_loaduserprofile]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_loaduserprofile] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_loaduserprofile' do
    expect{dsc_xwebapppool[:dsc_loaduserprofile] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_loaduserprofile' do
    expect{dsc_xwebapppool[:dsc_loaduserprofile] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_loaduserprofile' do
    expect{dsc_xwebapppool[:dsc_loaduserprofile] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_loaduserprofile' do
    expect{dsc_xwebapppool[:dsc_loaduserprofile] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_queuelength' do
    expect{dsc_xwebapppool[:dsc_queuelength] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_queuelength' do
    expect{dsc_xwebapppool[:dsc_queuelength] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_queuelength' do
    expect{dsc_xwebapppool[:dsc_queuelength] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_queuelength' do
    expect{dsc_xwebapppool[:dsc_queuelength] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_enable32bitapponwin64 predefined value true' do
    dsc_xwebapppool[:dsc_enable32bitapponwin64] = 'true'
    expect(dsc_xwebapppool[:dsc_enable32bitapponwin64]).to eq('true')
  end

  it 'should accept dsc_enable32bitapponwin64 predefined value true' do
    dsc_xwebapppool[:dsc_enable32bitapponwin64] = 'true'
    expect(dsc_xwebapppool[:dsc_enable32bitapponwin64]).to eq('true')
  end

  it 'should accept dsc_enable32bitapponwin64 predefined value false' do
    dsc_xwebapppool[:dsc_enable32bitapponwin64] = 'false'
    expect(dsc_xwebapppool[:dsc_enable32bitapponwin64]).to eq('false')
  end

  it 'should accept dsc_enable32bitapponwin64 predefined value false' do
    dsc_xwebapppool[:dsc_enable32bitapponwin64] = 'false'
    expect(dsc_xwebapppool[:dsc_enable32bitapponwin64]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_enable32bitapponwin64] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enable32bitapponwin64' do
    expect{dsc_xwebapppool[:dsc_enable32bitapponwin64] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_enable32bitapponwin64' do
    expect{dsc_xwebapppool[:dsc_enable32bitapponwin64] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_enable32bitapponwin64' do
    expect{dsc_xwebapppool[:dsc_enable32bitapponwin64] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enable32bitapponwin64' do
    expect{dsc_xwebapppool[:dsc_enable32bitapponwin64] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_managedruntimeloader' do
    expect{dsc_xwebapppool[:dsc_managedruntimeloader] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_managedruntimeloader' do
    expect{dsc_xwebapppool[:dsc_managedruntimeloader] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_managedruntimeloader' do
    expect{dsc_xwebapppool[:dsc_managedruntimeloader] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_managedruntimeloader' do
    expect{dsc_xwebapppool[:dsc_managedruntimeloader] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_enableconfigurationoverride predefined value true' do
    dsc_xwebapppool[:dsc_enableconfigurationoverride] = 'true'
    expect(dsc_xwebapppool[:dsc_enableconfigurationoverride]).to eq('true')
  end

  it 'should accept dsc_enableconfigurationoverride predefined value true' do
    dsc_xwebapppool[:dsc_enableconfigurationoverride] = 'true'
    expect(dsc_xwebapppool[:dsc_enableconfigurationoverride]).to eq('true')
  end

  it 'should accept dsc_enableconfigurationoverride predefined value false' do
    dsc_xwebapppool[:dsc_enableconfigurationoverride] = 'false'
    expect(dsc_xwebapppool[:dsc_enableconfigurationoverride]).to eq('false')
  end

  it 'should accept dsc_enableconfigurationoverride predefined value false' do
    dsc_xwebapppool[:dsc_enableconfigurationoverride] = 'false'
    expect(dsc_xwebapppool[:dsc_enableconfigurationoverride]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_enableconfigurationoverride] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enableconfigurationoverride' do
    expect{dsc_xwebapppool[:dsc_enableconfigurationoverride] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_enableconfigurationoverride' do
    expect{dsc_xwebapppool[:dsc_enableconfigurationoverride] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_enableconfigurationoverride' do
    expect{dsc_xwebapppool[:dsc_enableconfigurationoverride] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enableconfigurationoverride' do
    expect{dsc_xwebapppool[:dsc_enableconfigurationoverride] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_clrconfigfile' do
    expect{dsc_xwebapppool[:dsc_clrconfigfile] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_clrconfigfile' do
    expect{dsc_xwebapppool[:dsc_clrconfigfile] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_clrconfigfile' do
    expect{dsc_xwebapppool[:dsc_clrconfigfile] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_clrconfigfile' do
    expect{dsc_xwebapppool[:dsc_clrconfigfile] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_passanonymoustoken predefined value true' do
    dsc_xwebapppool[:dsc_passanonymoustoken] = 'true'
    expect(dsc_xwebapppool[:dsc_passanonymoustoken]).to eq('true')
  end

  it 'should accept dsc_passanonymoustoken predefined value true' do
    dsc_xwebapppool[:dsc_passanonymoustoken] = 'true'
    expect(dsc_xwebapppool[:dsc_passanonymoustoken]).to eq('true')
  end

  it 'should accept dsc_passanonymoustoken predefined value false' do
    dsc_xwebapppool[:dsc_passanonymoustoken] = 'false'
    expect(dsc_xwebapppool[:dsc_passanonymoustoken]).to eq('false')
  end

  it 'should accept dsc_passanonymoustoken predefined value false' do
    dsc_xwebapppool[:dsc_passanonymoustoken] = 'false'
    expect(dsc_xwebapppool[:dsc_passanonymoustoken]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_passanonymoustoken] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_passanonymoustoken' do
    expect{dsc_xwebapppool[:dsc_passanonymoustoken] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_passanonymoustoken' do
    expect{dsc_xwebapppool[:dsc_passanonymoustoken] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_passanonymoustoken' do
    expect{dsc_xwebapppool[:dsc_passanonymoustoken] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_passanonymoustoken' do
    expect{dsc_xwebapppool[:dsc_passanonymoustoken] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_logontype predefined value LogonBatch' do
    dsc_xwebapppool[:dsc_logontype] = 'LogonBatch'
    expect(dsc_xwebapppool[:dsc_logontype]).to eq('LogonBatch')
  end

  it 'should accept dsc_logontype predefined value logonbatch' do
    dsc_xwebapppool[:dsc_logontype] = 'logonbatch'
    expect(dsc_xwebapppool[:dsc_logontype]).to eq('logonbatch')
  end

  it 'should accept dsc_logontype predefined value LogonService' do
    dsc_xwebapppool[:dsc_logontype] = 'LogonService'
    expect(dsc_xwebapppool[:dsc_logontype]).to eq('LogonService')
  end

  it 'should accept dsc_logontype predefined value logonservice' do
    dsc_xwebapppool[:dsc_logontype] = 'logonservice'
    expect(dsc_xwebapppool[:dsc_logontype]).to eq('logonservice')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_logontype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logontype' do
    expect{dsc_xwebapppool[:dsc_logontype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logontype' do
    expect{dsc_xwebapppool[:dsc_logontype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logontype' do
    expect{dsc_xwebapppool[:dsc_logontype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logontype' do
    expect{dsc_xwebapppool[:dsc_logontype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_manualgroupmembership predefined value true' do
    dsc_xwebapppool[:dsc_manualgroupmembership] = 'true'
    expect(dsc_xwebapppool[:dsc_manualgroupmembership]).to eq('true')
  end

  it 'should accept dsc_manualgroupmembership predefined value true' do
    dsc_xwebapppool[:dsc_manualgroupmembership] = 'true'
    expect(dsc_xwebapppool[:dsc_manualgroupmembership]).to eq('true')
  end

  it 'should accept dsc_manualgroupmembership predefined value false' do
    dsc_xwebapppool[:dsc_manualgroupmembership] = 'false'
    expect(dsc_xwebapppool[:dsc_manualgroupmembership]).to eq('false')
  end

  it 'should accept dsc_manualgroupmembership predefined value false' do
    dsc_xwebapppool[:dsc_manualgroupmembership] = 'false'
    expect(dsc_xwebapppool[:dsc_manualgroupmembership]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_manualgroupmembership] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_manualgroupmembership' do
    expect{dsc_xwebapppool[:dsc_manualgroupmembership] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_manualgroupmembership' do
    expect{dsc_xwebapppool[:dsc_manualgroupmembership] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_manualgroupmembership' do
    expect{dsc_xwebapppool[:dsc_manualgroupmembership] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_manualgroupmembership' do
    expect{dsc_xwebapppool[:dsc_manualgroupmembership] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_idletimeout' do
    expect{dsc_xwebapppool[:dsc_idletimeout] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_idletimeout' do
    expect{dsc_xwebapppool[:dsc_idletimeout] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_idletimeout' do
    expect{dsc_xwebapppool[:dsc_idletimeout] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_idletimeout' do
    expect{dsc_xwebapppool[:dsc_idletimeout] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxprocesses' do
    expect{dsc_xwebapppool[:dsc_maxprocesses] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxprocesses' do
    expect{dsc_xwebapppool[:dsc_maxprocesses] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maxprocesses' do
    expect{dsc_xwebapppool[:dsc_maxprocesses] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_maxprocesses' do
    expect{dsc_xwebapppool[:dsc_maxprocesses] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_shutdowntimelimit' do
    expect{dsc_xwebapppool[:dsc_shutdowntimelimit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_shutdowntimelimit' do
    expect{dsc_xwebapppool[:dsc_shutdowntimelimit] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_shutdowntimelimit' do
    expect{dsc_xwebapppool[:dsc_shutdowntimelimit] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_shutdowntimelimit' do
    expect{dsc_xwebapppool[:dsc_shutdowntimelimit] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_startuptimelimit' do
    expect{dsc_xwebapppool[:dsc_startuptimelimit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_startuptimelimit' do
    expect{dsc_xwebapppool[:dsc_startuptimelimit] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_startuptimelimit' do
    expect{dsc_xwebapppool[:dsc_startuptimelimit] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_startuptimelimit' do
    expect{dsc_xwebapppool[:dsc_startuptimelimit] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_pingingenabled predefined value true' do
    dsc_xwebapppool[:dsc_pingingenabled] = 'true'
    expect(dsc_xwebapppool[:dsc_pingingenabled]).to eq('true')
  end

  it 'should accept dsc_pingingenabled predefined value true' do
    dsc_xwebapppool[:dsc_pingingenabled] = 'true'
    expect(dsc_xwebapppool[:dsc_pingingenabled]).to eq('true')
  end

  it 'should accept dsc_pingingenabled predefined value false' do
    dsc_xwebapppool[:dsc_pingingenabled] = 'false'
    expect(dsc_xwebapppool[:dsc_pingingenabled]).to eq('false')
  end

  it 'should accept dsc_pingingenabled predefined value false' do
    dsc_xwebapppool[:dsc_pingingenabled] = 'false'
    expect(dsc_xwebapppool[:dsc_pingingenabled]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_pingingenabled] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pingingenabled' do
    expect{dsc_xwebapppool[:dsc_pingingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pingingenabled' do
    expect{dsc_xwebapppool[:dsc_pingingenabled] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pingingenabled' do
    expect{dsc_xwebapppool[:dsc_pingingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pingingenabled' do
    expect{dsc_xwebapppool[:dsc_pingingenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pinginterval' do
    expect{dsc_xwebapppool[:dsc_pinginterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pinginterval' do
    expect{dsc_xwebapppool[:dsc_pinginterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pinginterval' do
    expect{dsc_xwebapppool[:dsc_pinginterval] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pinginterval' do
    expect{dsc_xwebapppool[:dsc_pinginterval] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pingresponsetime' do
    expect{dsc_xwebapppool[:dsc_pingresponsetime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pingresponsetime' do
    expect{dsc_xwebapppool[:dsc_pingresponsetime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pingresponsetime' do
    expect{dsc_xwebapppool[:dsc_pingresponsetime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pingresponsetime' do
    expect{dsc_xwebapppool[:dsc_pingresponsetime] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_disallowoverlappingrotation predefined value true' do
    dsc_xwebapppool[:dsc_disallowoverlappingrotation] = 'true'
    expect(dsc_xwebapppool[:dsc_disallowoverlappingrotation]).to eq('true')
  end

  it 'should accept dsc_disallowoverlappingrotation predefined value true' do
    dsc_xwebapppool[:dsc_disallowoverlappingrotation] = 'true'
    expect(dsc_xwebapppool[:dsc_disallowoverlappingrotation]).to eq('true')
  end

  it 'should accept dsc_disallowoverlappingrotation predefined value false' do
    dsc_xwebapppool[:dsc_disallowoverlappingrotation] = 'false'
    expect(dsc_xwebapppool[:dsc_disallowoverlappingrotation]).to eq('false')
  end

  it 'should accept dsc_disallowoverlappingrotation predefined value false' do
    dsc_xwebapppool[:dsc_disallowoverlappingrotation] = 'false'
    expect(dsc_xwebapppool[:dsc_disallowoverlappingrotation]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_disallowoverlappingrotation] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disallowoverlappingrotation' do
    expect{dsc_xwebapppool[:dsc_disallowoverlappingrotation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_disallowoverlappingrotation' do
    expect{dsc_xwebapppool[:dsc_disallowoverlappingrotation] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_disallowoverlappingrotation' do
    expect{dsc_xwebapppool[:dsc_disallowoverlappingrotation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disallowoverlappingrotation' do
    expect{dsc_xwebapppool[:dsc_disallowoverlappingrotation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_disallowrotationonconfigchange predefined value true' do
    dsc_xwebapppool[:dsc_disallowrotationonconfigchange] = 'true'
    expect(dsc_xwebapppool[:dsc_disallowrotationonconfigchange]).to eq('true')
  end

  it 'should accept dsc_disallowrotationonconfigchange predefined value true' do
    dsc_xwebapppool[:dsc_disallowrotationonconfigchange] = 'true'
    expect(dsc_xwebapppool[:dsc_disallowrotationonconfigchange]).to eq('true')
  end

  it 'should accept dsc_disallowrotationonconfigchange predefined value false' do
    dsc_xwebapppool[:dsc_disallowrotationonconfigchange] = 'false'
    expect(dsc_xwebapppool[:dsc_disallowrotationonconfigchange]).to eq('false')
  end

  it 'should accept dsc_disallowrotationonconfigchange predefined value false' do
    dsc_xwebapppool[:dsc_disallowrotationonconfigchange] = 'false'
    expect(dsc_xwebapppool[:dsc_disallowrotationonconfigchange]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_disallowrotationonconfigchange] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disallowrotationonconfigchange' do
    expect{dsc_xwebapppool[:dsc_disallowrotationonconfigchange] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_disallowrotationonconfigchange' do
    expect{dsc_xwebapppool[:dsc_disallowrotationonconfigchange] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_disallowrotationonconfigchange' do
    expect{dsc_xwebapppool[:dsc_disallowrotationonconfigchange] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disallowrotationonconfigchange' do
    expect{dsc_xwebapppool[:dsc_disallowrotationonconfigchange] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logeventonrecycle' do
    expect{dsc_xwebapppool[:dsc_logeventonrecycle] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logeventonrecycle' do
    expect{dsc_xwebapppool[:dsc_logeventonrecycle] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logeventonrecycle' do
    expect{dsc_xwebapppool[:dsc_logeventonrecycle] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logeventonrecycle' do
    expect{dsc_xwebapppool[:dsc_logeventonrecycle] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_restartmemorylimit' do
    expect{dsc_xwebapppool[:dsc_restartmemorylimit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_restartmemorylimit' do
    expect{dsc_xwebapppool[:dsc_restartmemorylimit] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_restartmemorylimit' do
    expect{dsc_xwebapppool[:dsc_restartmemorylimit] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_restartmemorylimit' do
    expect{dsc_xwebapppool[:dsc_restartmemorylimit] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_restartprivatememorylimit' do
    expect{dsc_xwebapppool[:dsc_restartprivatememorylimit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_restartprivatememorylimit' do
    expect{dsc_xwebapppool[:dsc_restartprivatememorylimit] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_restartprivatememorylimit' do
    expect{dsc_xwebapppool[:dsc_restartprivatememorylimit] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_restartprivatememorylimit' do
    expect{dsc_xwebapppool[:dsc_restartprivatememorylimit] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_restartrequestslimit' do
    expect{dsc_xwebapppool[:dsc_restartrequestslimit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_restartrequestslimit' do
    expect{dsc_xwebapppool[:dsc_restartrequestslimit] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_restartrequestslimit' do
    expect{dsc_xwebapppool[:dsc_restartrequestslimit] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_restartrequestslimit' do
    expect{dsc_xwebapppool[:dsc_restartrequestslimit] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_restarttimelimit' do
    expect{dsc_xwebapppool[:dsc_restarttimelimit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_restarttimelimit' do
    expect{dsc_xwebapppool[:dsc_restarttimelimit] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_restarttimelimit' do
    expect{dsc_xwebapppool[:dsc_restarttimelimit] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_restarttimelimit' do
    expect{dsc_xwebapppool[:dsc_restarttimelimit] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_restartschedule' do
    dsc_xwebapppool[:dsc_restartschedule] = ["foo", "bar", "spec"]
    expect(dsc_xwebapppool[:dsc_restartschedule]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_restartschedule' do
    expect{dsc_xwebapppool[:dsc_restartschedule] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_restartschedule' do
    expect{dsc_xwebapppool[:dsc_restartschedule] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_restartschedule' do
    expect{dsc_xwebapppool[:dsc_restartschedule] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_loadbalancercapabilities predefined value HttpLevel' do
    dsc_xwebapppool[:dsc_loadbalancercapabilities] = 'HttpLevel'
    expect(dsc_xwebapppool[:dsc_loadbalancercapabilities]).to eq('HttpLevel')
  end

  it 'should accept dsc_loadbalancercapabilities predefined value httplevel' do
    dsc_xwebapppool[:dsc_loadbalancercapabilities] = 'httplevel'
    expect(dsc_xwebapppool[:dsc_loadbalancercapabilities]).to eq('httplevel')
  end

  it 'should accept dsc_loadbalancercapabilities predefined value TcpLevel' do
    dsc_xwebapppool[:dsc_loadbalancercapabilities] = 'TcpLevel'
    expect(dsc_xwebapppool[:dsc_loadbalancercapabilities]).to eq('TcpLevel')
  end

  it 'should accept dsc_loadbalancercapabilities predefined value tcplevel' do
    dsc_xwebapppool[:dsc_loadbalancercapabilities] = 'tcplevel'
    expect(dsc_xwebapppool[:dsc_loadbalancercapabilities]).to eq('tcplevel')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_loadbalancercapabilities] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_loadbalancercapabilities' do
    expect{dsc_xwebapppool[:dsc_loadbalancercapabilities] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_loadbalancercapabilities' do
    expect{dsc_xwebapppool[:dsc_loadbalancercapabilities] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_loadbalancercapabilities' do
    expect{dsc_xwebapppool[:dsc_loadbalancercapabilities] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_loadbalancercapabilities' do
    expect{dsc_xwebapppool[:dsc_loadbalancercapabilities] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_orphanworkerprocess predefined value true' do
    dsc_xwebapppool[:dsc_orphanworkerprocess] = 'true'
    expect(dsc_xwebapppool[:dsc_orphanworkerprocess]).to eq('true')
  end

  it 'should accept dsc_orphanworkerprocess predefined value true' do
    dsc_xwebapppool[:dsc_orphanworkerprocess] = 'true'
    expect(dsc_xwebapppool[:dsc_orphanworkerprocess]).to eq('true')
  end

  it 'should accept dsc_orphanworkerprocess predefined value false' do
    dsc_xwebapppool[:dsc_orphanworkerprocess] = 'false'
    expect(dsc_xwebapppool[:dsc_orphanworkerprocess]).to eq('false')
  end

  it 'should accept dsc_orphanworkerprocess predefined value false' do
    dsc_xwebapppool[:dsc_orphanworkerprocess] = 'false'
    expect(dsc_xwebapppool[:dsc_orphanworkerprocess]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_orphanworkerprocess] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_orphanworkerprocess' do
    expect{dsc_xwebapppool[:dsc_orphanworkerprocess] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_orphanworkerprocess' do
    expect{dsc_xwebapppool[:dsc_orphanworkerprocess] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_orphanworkerprocess' do
    expect{dsc_xwebapppool[:dsc_orphanworkerprocess] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_orphanworkerprocess' do
    expect{dsc_xwebapppool[:dsc_orphanworkerprocess] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_orphanactionexe' do
    expect{dsc_xwebapppool[:dsc_orphanactionexe] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_orphanactionexe' do
    expect{dsc_xwebapppool[:dsc_orphanactionexe] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_orphanactionexe' do
    expect{dsc_xwebapppool[:dsc_orphanactionexe] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_orphanactionexe' do
    expect{dsc_xwebapppool[:dsc_orphanactionexe] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_orphanactionparams' do
    expect{dsc_xwebapppool[:dsc_orphanactionparams] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_orphanactionparams' do
    expect{dsc_xwebapppool[:dsc_orphanactionparams] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_orphanactionparams' do
    expect{dsc_xwebapppool[:dsc_orphanactionparams] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_orphanactionparams' do
    expect{dsc_xwebapppool[:dsc_orphanactionparams] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_rapidfailprotection predefined value true' do
    dsc_xwebapppool[:dsc_rapidfailprotection] = 'true'
    expect(dsc_xwebapppool[:dsc_rapidfailprotection]).to eq('true')
  end

  it 'should accept dsc_rapidfailprotection predefined value true' do
    dsc_xwebapppool[:dsc_rapidfailprotection] = 'true'
    expect(dsc_xwebapppool[:dsc_rapidfailprotection]).to eq('true')
  end

  it 'should accept dsc_rapidfailprotection predefined value false' do
    dsc_xwebapppool[:dsc_rapidfailprotection] = 'false'
    expect(dsc_xwebapppool[:dsc_rapidfailprotection]).to eq('false')
  end

  it 'should accept dsc_rapidfailprotection predefined value false' do
    dsc_xwebapppool[:dsc_rapidfailprotection] = 'false'
    expect(dsc_xwebapppool[:dsc_rapidfailprotection]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_rapidfailprotection] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_rapidfailprotection' do
    expect{dsc_xwebapppool[:dsc_rapidfailprotection] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_rapidfailprotection' do
    expect{dsc_xwebapppool[:dsc_rapidfailprotection] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_rapidfailprotection' do
    expect{dsc_xwebapppool[:dsc_rapidfailprotection] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rapidfailprotection' do
    expect{dsc_xwebapppool[:dsc_rapidfailprotection] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_rapidfailprotectioninterval' do
    expect{dsc_xwebapppool[:dsc_rapidfailprotectioninterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_rapidfailprotectioninterval' do
    expect{dsc_xwebapppool[:dsc_rapidfailprotectioninterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_rapidfailprotectioninterval' do
    expect{dsc_xwebapppool[:dsc_rapidfailprotectioninterval] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rapidfailprotectioninterval' do
    expect{dsc_xwebapppool[:dsc_rapidfailprotectioninterval] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_rapidfailprotectionmaxcrashes' do
    expect{dsc_xwebapppool[:dsc_rapidfailprotectionmaxcrashes] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_rapidfailprotectionmaxcrashes' do
    expect{dsc_xwebapppool[:dsc_rapidfailprotectionmaxcrashes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_rapidfailprotectionmaxcrashes' do
    expect{dsc_xwebapppool[:dsc_rapidfailprotectionmaxcrashes] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rapidfailprotectionmaxcrashes' do
    expect{dsc_xwebapppool[:dsc_rapidfailprotectionmaxcrashes] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autoshutdownexe' do
    expect{dsc_xwebapppool[:dsc_autoshutdownexe] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autoshutdownexe' do
    expect{dsc_xwebapppool[:dsc_autoshutdownexe] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_autoshutdownexe' do
    expect{dsc_xwebapppool[:dsc_autoshutdownexe] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autoshutdownexe' do
    expect{dsc_xwebapppool[:dsc_autoshutdownexe] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autoshutdownparams' do
    expect{dsc_xwebapppool[:dsc_autoshutdownparams] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autoshutdownparams' do
    expect{dsc_xwebapppool[:dsc_autoshutdownparams] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_autoshutdownparams' do
    expect{dsc_xwebapppool[:dsc_autoshutdownparams] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autoshutdownparams' do
    expect{dsc_xwebapppool[:dsc_autoshutdownparams] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_cpulimit' do
    expect{dsc_xwebapppool[:dsc_cpulimit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_cpulimit' do
    expect{dsc_xwebapppool[:dsc_cpulimit] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_cpulimit' do
    expect{dsc_xwebapppool[:dsc_cpulimit] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_cpulimit' do
    expect{dsc_xwebapppool[:dsc_cpulimit] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_cpuaction predefined value NoAction' do
    dsc_xwebapppool[:dsc_cpuaction] = 'NoAction'
    expect(dsc_xwebapppool[:dsc_cpuaction]).to eq('NoAction')
  end

  it 'should accept dsc_cpuaction predefined value noaction' do
    dsc_xwebapppool[:dsc_cpuaction] = 'noaction'
    expect(dsc_xwebapppool[:dsc_cpuaction]).to eq('noaction')
  end

  it 'should accept dsc_cpuaction predefined value KillW3wp' do
    dsc_xwebapppool[:dsc_cpuaction] = 'KillW3wp'
    expect(dsc_xwebapppool[:dsc_cpuaction]).to eq('KillW3wp')
  end

  it 'should accept dsc_cpuaction predefined value killw3wp' do
    dsc_xwebapppool[:dsc_cpuaction] = 'killw3wp'
    expect(dsc_xwebapppool[:dsc_cpuaction]).to eq('killw3wp')
  end

  it 'should accept dsc_cpuaction predefined value Throttle' do
    dsc_xwebapppool[:dsc_cpuaction] = 'Throttle'
    expect(dsc_xwebapppool[:dsc_cpuaction]).to eq('Throttle')
  end

  it 'should accept dsc_cpuaction predefined value throttle' do
    dsc_xwebapppool[:dsc_cpuaction] = 'throttle'
    expect(dsc_xwebapppool[:dsc_cpuaction]).to eq('throttle')
  end

  it 'should accept dsc_cpuaction predefined value ThrottleUnderLoad' do
    dsc_xwebapppool[:dsc_cpuaction] = 'ThrottleUnderLoad'
    expect(dsc_xwebapppool[:dsc_cpuaction]).to eq('ThrottleUnderLoad')
  end

  it 'should accept dsc_cpuaction predefined value throttleunderload' do
    dsc_xwebapppool[:dsc_cpuaction] = 'throttleunderload'
    expect(dsc_xwebapppool[:dsc_cpuaction]).to eq('throttleunderload')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_cpuaction] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_cpuaction' do
    expect{dsc_xwebapppool[:dsc_cpuaction] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_cpuaction' do
    expect{dsc_xwebapppool[:dsc_cpuaction] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_cpuaction' do
    expect{dsc_xwebapppool[:dsc_cpuaction] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_cpuaction' do
    expect{dsc_xwebapppool[:dsc_cpuaction] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_cpuresetinterval' do
    expect{dsc_xwebapppool[:dsc_cpuresetinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_cpuresetinterval' do
    expect{dsc_xwebapppool[:dsc_cpuresetinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_cpuresetinterval' do
    expect{dsc_xwebapppool[:dsc_cpuresetinterval] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_cpuresetinterval' do
    expect{dsc_xwebapppool[:dsc_cpuresetinterval] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_cpusmpaffinitized predefined value true' do
    dsc_xwebapppool[:dsc_cpusmpaffinitized] = 'true'
    expect(dsc_xwebapppool[:dsc_cpusmpaffinitized]).to eq('true')
  end

  it 'should accept dsc_cpusmpaffinitized predefined value true' do
    dsc_xwebapppool[:dsc_cpusmpaffinitized] = 'true'
    expect(dsc_xwebapppool[:dsc_cpusmpaffinitized]).to eq('true')
  end

  it 'should accept dsc_cpusmpaffinitized predefined value false' do
    dsc_xwebapppool[:dsc_cpusmpaffinitized] = 'false'
    expect(dsc_xwebapppool[:dsc_cpusmpaffinitized]).to eq('false')
  end

  it 'should accept dsc_cpusmpaffinitized predefined value false' do
    dsc_xwebapppool[:dsc_cpusmpaffinitized] = 'false'
    expect(dsc_xwebapppool[:dsc_cpusmpaffinitized]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppool[:dsc_cpusmpaffinitized] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_cpusmpaffinitized' do
    expect{dsc_xwebapppool[:dsc_cpusmpaffinitized] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_cpusmpaffinitized' do
    expect{dsc_xwebapppool[:dsc_cpusmpaffinitized] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_cpusmpaffinitized' do
    expect{dsc_xwebapppool[:dsc_cpusmpaffinitized] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_cpusmpaffinitized' do
    expect{dsc_xwebapppool[:dsc_cpusmpaffinitized] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_cpusmpprocessoraffinitymask' do
    expect{dsc_xwebapppool[:dsc_cpusmpprocessoraffinitymask] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_cpusmpprocessoraffinitymask' do
    expect{dsc_xwebapppool[:dsc_cpusmpprocessoraffinitymask] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_cpusmpprocessoraffinitymask' do
    expect{dsc_xwebapppool[:dsc_cpusmpprocessoraffinitymask] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_cpusmpprocessoraffinitymask' do
    expect{dsc_xwebapppool[:dsc_cpusmpprocessoraffinitymask] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_cpusmpprocessoraffinitymask2' do
    expect{dsc_xwebapppool[:dsc_cpusmpprocessoraffinitymask2] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_cpusmpprocessoraffinitymask2' do
    expect{dsc_xwebapppool[:dsc_cpusmpprocessoraffinitymask2] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_cpusmpprocessoraffinitymask2' do
    expect{dsc_xwebapppool[:dsc_cpusmpprocessoraffinitymask2] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_cpusmpprocessoraffinitymask2' do
    expect{dsc_xwebapppool[:dsc_cpusmpprocessoraffinitymask2] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwebapppool)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwebapppool)
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
        dsc_xwebapppool.original_parameters[:dsc_ensure] = 'present'
        dsc_xwebapppool[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xwebapppool)
      end

      it "should update :ensure to :present" do
        expect(dsc_xwebapppool[:ensure]).to eq(:present)
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
        dsc_xwebapppool.original_parameters[:dsc_ensure] = 'absent'
        dsc_xwebapppool[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xwebapppool)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xwebapppool[:ensure]).to eq(:absent)
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
