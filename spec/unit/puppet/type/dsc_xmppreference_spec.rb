#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xmppreference) do

  let :dsc_xmppreference do
    Puppet::Type.type(:dsc_xmppreference).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xmppreference.to_s).to eq("Dsc_xmppreference[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xmppreference[:dsc_name]
    expect { Puppet::Type.type(:dsc_xmppreference).new(
      :name     => 'foo',
      :dsc_exclusionpath => ["foo", "bar", "spec"],
      :dsc_exclusionextension => ["foo", "bar", "spec"],
      :dsc_exclusionprocess => ["foo", "bar", "spec"],
      :dsc_realtimescandirection => 'Both',
      :dsc_quarantinepurgeitemsafterdelay => 32,
      :dsc_remediationscheduleday => 'Everyday',
      :dsc_remediationscheduletime => '20140711',
      :dsc_reportingadditionalactiontimeout => 32,
      :dsc_reportingnoncriticaltimeout => 32,
      :dsc_reportingcriticalfailuretimeout => 32,
      :dsc_scanavgcpuloadfactor => 32,
      :dsc_checkforsignaturesbeforerunningscan => true,
      :dsc_scanpurgeitemsafterdelay => 32,
      :dsc_scanonlyifidleenabled => true,
      :dsc_scanparameters => 'FullSCan',
      :dsc_scanscheduleday => 'Everyday',
      :dsc_scanschedulequickscantime => '20140711',
      :dsc_scanscheduletime => '20140711',
      :dsc_signaturefirstaugraceperiod => 32,
      :dsc_signatureaugraceperiod => 32,
      :dsc_signaturedefinitionupdatefilesharessources => 'foo',
      :dsc_signaturedisableupdateonstartupwithoutengine => true,
      :dsc_signaturefallbackorder => 'foo',
      :dsc_signaturescheduleday => 'Everyday',
      :dsc_signaturescheduletime => '20140711',
      :dsc_signatureupdatecatchupinterval => 32,
      :dsc_signatureupdateinterval => 32,
      :dsc_mapsreporting => 'Advanced',
      :dsc_disableprivacymode => true,
      :dsc_randomizescheduletasktimes => true,
      :dsc_disablebehaviormonitoring => true,
      :dsc_disableintrusionpreventionsystem => true,
      :dsc_disableioavprotection => true,
      :dsc_disablerealtimemonitoring => true,
      :dsc_disablescriptscanning => true,
      :dsc_disablearchivescanning => true,
      :dsc_disableautoexclusions => true,
      :dsc_disablecatchupfullscan => true,
      :dsc_disablecatchupquickscan => true,
      :dsc_disableemailscanning => true,
      :dsc_disableremovabledrivescanning => true,
      :dsc_disablerestorepoint => true,
      :dsc_disablescanningmappednetworkdrivesforfullscan => true,
      :dsc_disablescanningnetworkfiles => true,
      :dsc_uilockdown => true,
      :dsc_threatiddefaultaction_ids => 64,
      :dsc_threatiddefaultaction_actions => 'Allow',
      :dsc_unknownthreatdefaultaction => 'Allow',
      :dsc_lowthreatdefaultaction => 'Allow',
      :dsc_moderatethreatdefaultaction => 'Allow',
      :dsc_highthreatdefaultaction => 'Allow',
      :dsc_severethreatdefaultaction => 'Allow',
      :dsc_submitsamplesconsent => 'Allways Prompt',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xmppreference[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xmppreference[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xmppreference[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xmppreference[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_exclusionpath' do
    dsc_xmppreference[:dsc_exclusionpath] = ["foo", "bar", "spec"]
    expect(dsc_xmppreference[:dsc_exclusionpath]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_exclusionpath' do
    expect{dsc_xmppreference[:dsc_exclusionpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_exclusionpath' do
    expect{dsc_xmppreference[:dsc_exclusionpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_exclusionpath' do
    expect{dsc_xmppreference[:dsc_exclusionpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_exclusionextension' do
    dsc_xmppreference[:dsc_exclusionextension] = ["foo", "bar", "spec"]
    expect(dsc_xmppreference[:dsc_exclusionextension]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_exclusionextension' do
    expect{dsc_xmppreference[:dsc_exclusionextension] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_exclusionextension' do
    expect{dsc_xmppreference[:dsc_exclusionextension] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_exclusionextension' do
    expect{dsc_xmppreference[:dsc_exclusionextension] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_exclusionprocess' do
    dsc_xmppreference[:dsc_exclusionprocess] = ["foo", "bar", "spec"]
    expect(dsc_xmppreference[:dsc_exclusionprocess]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_exclusionprocess' do
    expect{dsc_xmppreference[:dsc_exclusionprocess] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_exclusionprocess' do
    expect{dsc_xmppreference[:dsc_exclusionprocess] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_exclusionprocess' do
    expect{dsc_xmppreference[:dsc_exclusionprocess] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_realtimescandirection predefined value Both' do
    dsc_xmppreference[:dsc_realtimescandirection] = 'Both'
    expect(dsc_xmppreference[:dsc_realtimescandirection]).to eq('Both')
  end

  it 'should accept dsc_realtimescandirection predefined value both' do
    dsc_xmppreference[:dsc_realtimescandirection] = 'both'
    expect(dsc_xmppreference[:dsc_realtimescandirection]).to eq('both')
  end

  it 'should accept dsc_realtimescandirection predefined value Incoming' do
    dsc_xmppreference[:dsc_realtimescandirection] = 'Incoming'
    expect(dsc_xmppreference[:dsc_realtimescandirection]).to eq('Incoming')
  end

  it 'should accept dsc_realtimescandirection predefined value incoming' do
    dsc_xmppreference[:dsc_realtimescandirection] = 'incoming'
    expect(dsc_xmppreference[:dsc_realtimescandirection]).to eq('incoming')
  end

  it 'should accept dsc_realtimescandirection predefined value Outgoing' do
    dsc_xmppreference[:dsc_realtimescandirection] = 'Outgoing'
    expect(dsc_xmppreference[:dsc_realtimescandirection]).to eq('Outgoing')
  end

  it 'should accept dsc_realtimescandirection predefined value outgoing' do
    dsc_xmppreference[:dsc_realtimescandirection] = 'outgoing'
    expect(dsc_xmppreference[:dsc_realtimescandirection]).to eq('outgoing')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmppreference[:dsc_realtimescandirection] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_realtimescandirection' do
    expect{dsc_xmppreference[:dsc_realtimescandirection] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_realtimescandirection' do
    expect{dsc_xmppreference[:dsc_realtimescandirection] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_realtimescandirection' do
    expect{dsc_xmppreference[:dsc_realtimescandirection] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_realtimescandirection' do
    expect{dsc_xmppreference[:dsc_realtimescandirection] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_quarantinepurgeitemsafterdelay' do
    expect{dsc_xmppreference[:dsc_quarantinepurgeitemsafterdelay] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_quarantinepurgeitemsafterdelay' do
    expect{dsc_xmppreference[:dsc_quarantinepurgeitemsafterdelay] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_quarantinepurgeitemsafterdelay' do
    dsc_xmppreference[:dsc_quarantinepurgeitemsafterdelay] = 32
    expect(dsc_xmppreference[:dsc_quarantinepurgeitemsafterdelay]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_quarantinepurgeitemsafterdelay' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xmppreference[:dsc_quarantinepurgeitemsafterdelay] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_quarantinepurgeitemsafterdelay' do
    dsc_xmppreference[:dsc_quarantinepurgeitemsafterdelay] = '16'
    expect(dsc_xmppreference[:dsc_quarantinepurgeitemsafterdelay]).to eq(16)
  end

  it 'should accept string-like uint for dsc_quarantinepurgeitemsafterdelay' do
    dsc_xmppreference[:dsc_quarantinepurgeitemsafterdelay] = '32'
    expect(dsc_xmppreference[:dsc_quarantinepurgeitemsafterdelay]).to eq(32)
  end

  it 'should accept string-like uint for dsc_quarantinepurgeitemsafterdelay' do
    dsc_xmppreference[:dsc_quarantinepurgeitemsafterdelay] = '64'
    expect(dsc_xmppreference[:dsc_quarantinepurgeitemsafterdelay]).to eq(64)
  end

  it 'should accept dsc_remediationscheduleday predefined value Everyday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'Everyday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('Everyday')
  end

  it 'should accept dsc_remediationscheduleday predefined value everyday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'everyday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('everyday')
  end

  it 'should accept dsc_remediationscheduleday predefined value Never' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'Never'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('Never')
  end

  it 'should accept dsc_remediationscheduleday predefined value never' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'never'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('never')
  end

  it 'should accept dsc_remediationscheduleday predefined value Monday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'Monday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('Monday')
  end

  it 'should accept dsc_remediationscheduleday predefined value monday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'monday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('monday')
  end

  it 'should accept dsc_remediationscheduleday predefined value Tuesday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'Tuesday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('Tuesday')
  end

  it 'should accept dsc_remediationscheduleday predefined value tuesday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'tuesday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('tuesday')
  end

  it 'should accept dsc_remediationscheduleday predefined value Wednesday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'Wednesday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('Wednesday')
  end

  it 'should accept dsc_remediationscheduleday predefined value wednesday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'wednesday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('wednesday')
  end

  it 'should accept dsc_remediationscheduleday predefined value Thursday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'Thursday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('Thursday')
  end

  it 'should accept dsc_remediationscheduleday predefined value thursday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'thursday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('thursday')
  end

  it 'should accept dsc_remediationscheduleday predefined value Friday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'Friday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('Friday')
  end

  it 'should accept dsc_remediationscheduleday predefined value friday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'friday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('friday')
  end

  it 'should accept dsc_remediationscheduleday predefined value Saturday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'Saturday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('Saturday')
  end

  it 'should accept dsc_remediationscheduleday predefined value saturday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'saturday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('saturday')
  end

  it 'should accept dsc_remediationscheduleday predefined value Sunday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'Sunday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('Sunday')
  end

  it 'should accept dsc_remediationscheduleday predefined value sunday' do
    dsc_xmppreference[:dsc_remediationscheduleday] = 'sunday'
    expect(dsc_xmppreference[:dsc_remediationscheduleday]).to eq('sunday')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmppreference[:dsc_remediationscheduleday] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_remediationscheduleday' do
    expect{dsc_xmppreference[:dsc_remediationscheduleday] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_remediationscheduleday' do
    expect{dsc_xmppreference[:dsc_remediationscheduleday] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_remediationscheduleday' do
    expect{dsc_xmppreference[:dsc_remediationscheduleday] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_remediationscheduleday' do
    expect{dsc_xmppreference[:dsc_remediationscheduleday] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_remediationscheduletime' do
    expect{dsc_xmppreference[:dsc_remediationscheduletime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_remediationscheduletime' do
    expect{dsc_xmppreference[:dsc_remediationscheduletime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_remediationscheduletime' do
    expect{dsc_xmppreference[:dsc_remediationscheduletime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_remediationscheduletime' do
    expect{dsc_xmppreference[:dsc_remediationscheduletime] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_reportingadditionalactiontimeout' do
    expect{dsc_xmppreference[:dsc_reportingadditionalactiontimeout] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_reportingadditionalactiontimeout' do
    expect{dsc_xmppreference[:dsc_reportingadditionalactiontimeout] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_reportingadditionalactiontimeout' do
    dsc_xmppreference[:dsc_reportingadditionalactiontimeout] = 32
    expect(dsc_xmppreference[:dsc_reportingadditionalactiontimeout]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_reportingadditionalactiontimeout' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xmppreference[:dsc_reportingadditionalactiontimeout] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_reportingadditionalactiontimeout' do
    dsc_xmppreference[:dsc_reportingadditionalactiontimeout] = '16'
    expect(dsc_xmppreference[:dsc_reportingadditionalactiontimeout]).to eq(16)
  end

  it 'should accept string-like uint for dsc_reportingadditionalactiontimeout' do
    dsc_xmppreference[:dsc_reportingadditionalactiontimeout] = '32'
    expect(dsc_xmppreference[:dsc_reportingadditionalactiontimeout]).to eq(32)
  end

  it 'should accept string-like uint for dsc_reportingadditionalactiontimeout' do
    dsc_xmppreference[:dsc_reportingadditionalactiontimeout] = '64'
    expect(dsc_xmppreference[:dsc_reportingadditionalactiontimeout]).to eq(64)
  end

  it 'should not accept array for dsc_reportingnoncriticaltimeout' do
    expect{dsc_xmppreference[:dsc_reportingnoncriticaltimeout] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_reportingnoncriticaltimeout' do
    expect{dsc_xmppreference[:dsc_reportingnoncriticaltimeout] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_reportingnoncriticaltimeout' do
    dsc_xmppreference[:dsc_reportingnoncriticaltimeout] = 32
    expect(dsc_xmppreference[:dsc_reportingnoncriticaltimeout]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_reportingnoncriticaltimeout' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xmppreference[:dsc_reportingnoncriticaltimeout] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_reportingnoncriticaltimeout' do
    dsc_xmppreference[:dsc_reportingnoncriticaltimeout] = '16'
    expect(dsc_xmppreference[:dsc_reportingnoncriticaltimeout]).to eq(16)
  end

  it 'should accept string-like uint for dsc_reportingnoncriticaltimeout' do
    dsc_xmppreference[:dsc_reportingnoncriticaltimeout] = '32'
    expect(dsc_xmppreference[:dsc_reportingnoncriticaltimeout]).to eq(32)
  end

  it 'should accept string-like uint for dsc_reportingnoncriticaltimeout' do
    dsc_xmppreference[:dsc_reportingnoncriticaltimeout] = '64'
    expect(dsc_xmppreference[:dsc_reportingnoncriticaltimeout]).to eq(64)
  end

  it 'should not accept array for dsc_reportingcriticalfailuretimeout' do
    expect{dsc_xmppreference[:dsc_reportingcriticalfailuretimeout] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_reportingcriticalfailuretimeout' do
    expect{dsc_xmppreference[:dsc_reportingcriticalfailuretimeout] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_reportingcriticalfailuretimeout' do
    dsc_xmppreference[:dsc_reportingcriticalfailuretimeout] = 32
    expect(dsc_xmppreference[:dsc_reportingcriticalfailuretimeout]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_reportingcriticalfailuretimeout' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xmppreference[:dsc_reportingcriticalfailuretimeout] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_reportingcriticalfailuretimeout' do
    dsc_xmppreference[:dsc_reportingcriticalfailuretimeout] = '16'
    expect(dsc_xmppreference[:dsc_reportingcriticalfailuretimeout]).to eq(16)
  end

  it 'should accept string-like uint for dsc_reportingcriticalfailuretimeout' do
    dsc_xmppreference[:dsc_reportingcriticalfailuretimeout] = '32'
    expect(dsc_xmppreference[:dsc_reportingcriticalfailuretimeout]).to eq(32)
  end

  it 'should accept string-like uint for dsc_reportingcriticalfailuretimeout' do
    dsc_xmppreference[:dsc_reportingcriticalfailuretimeout] = '64'
    expect(dsc_xmppreference[:dsc_reportingcriticalfailuretimeout]).to eq(64)
  end

  it 'should not accept array for dsc_scanavgcpuloadfactor' do
    expect{dsc_xmppreference[:dsc_scanavgcpuloadfactor] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scanavgcpuloadfactor' do
    expect{dsc_xmppreference[:dsc_scanavgcpuloadfactor] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_scanavgcpuloadfactor' do
    dsc_xmppreference[:dsc_scanavgcpuloadfactor] = 32
    expect(dsc_xmppreference[:dsc_scanavgcpuloadfactor]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_scanavgcpuloadfactor' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xmppreference[:dsc_scanavgcpuloadfactor] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_scanavgcpuloadfactor' do
    dsc_xmppreference[:dsc_scanavgcpuloadfactor] = '16'
    expect(dsc_xmppreference[:dsc_scanavgcpuloadfactor]).to eq(16)
  end

  it 'should accept string-like uint for dsc_scanavgcpuloadfactor' do
    dsc_xmppreference[:dsc_scanavgcpuloadfactor] = '32'
    expect(dsc_xmppreference[:dsc_scanavgcpuloadfactor]).to eq(32)
  end

  it 'should accept string-like uint for dsc_scanavgcpuloadfactor' do
    dsc_xmppreference[:dsc_scanavgcpuloadfactor] = '64'
    expect(dsc_xmppreference[:dsc_scanavgcpuloadfactor]).to eq(64)
  end

  it 'should not accept array for dsc_checkforsignaturesbeforerunningscan' do
    expect{dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_checkforsignaturesbeforerunningscan' do
    dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan] = true
    expect(dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_checkforsignaturesbeforerunningscan" do
    dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan] = 'true'
    expect(dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_checkforsignaturesbeforerunningscan" do
    dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan] = 'false'
    expect(dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_checkforsignaturesbeforerunningscan" do
    dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan] = 'True'
    expect(dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_checkforsignaturesbeforerunningscan" do
    dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan] = 'False'
    expect(dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_checkforsignaturesbeforerunningscan" do
    dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan] = :true
    expect(dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_checkforsignaturesbeforerunningscan" do
    dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan] = :false
    expect(dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan]).to eq(false)
  end

  it 'should not accept int for dsc_checkforsignaturesbeforerunningscan' do
    expect{dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_checkforsignaturesbeforerunningscan' do
    expect{dsc_xmppreference[:dsc_checkforsignaturesbeforerunningscan] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scanpurgeitemsafterdelay' do
    expect{dsc_xmppreference[:dsc_scanpurgeitemsafterdelay] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scanpurgeitemsafterdelay' do
    expect{dsc_xmppreference[:dsc_scanpurgeitemsafterdelay] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_scanpurgeitemsafterdelay' do
    dsc_xmppreference[:dsc_scanpurgeitemsafterdelay] = 32
    expect(dsc_xmppreference[:dsc_scanpurgeitemsafterdelay]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_scanpurgeitemsafterdelay' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xmppreference[:dsc_scanpurgeitemsafterdelay] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_scanpurgeitemsafterdelay' do
    dsc_xmppreference[:dsc_scanpurgeitemsafterdelay] = '16'
    expect(dsc_xmppreference[:dsc_scanpurgeitemsafterdelay]).to eq(16)
  end

  it 'should accept string-like uint for dsc_scanpurgeitemsafterdelay' do
    dsc_xmppreference[:dsc_scanpurgeitemsafterdelay] = '32'
    expect(dsc_xmppreference[:dsc_scanpurgeitemsafterdelay]).to eq(32)
  end

  it 'should accept string-like uint for dsc_scanpurgeitemsafterdelay' do
    dsc_xmppreference[:dsc_scanpurgeitemsafterdelay] = '64'
    expect(dsc_xmppreference[:dsc_scanpurgeitemsafterdelay]).to eq(64)
  end

  it 'should not accept array for dsc_scanonlyifidleenabled' do
    expect{dsc_xmppreference[:dsc_scanonlyifidleenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_scanonlyifidleenabled' do
    dsc_xmppreference[:dsc_scanonlyifidleenabled] = true
    expect(dsc_xmppreference[:dsc_scanonlyifidleenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_scanonlyifidleenabled" do
    dsc_xmppreference[:dsc_scanonlyifidleenabled] = 'true'
    expect(dsc_xmppreference[:dsc_scanonlyifidleenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_scanonlyifidleenabled" do
    dsc_xmppreference[:dsc_scanonlyifidleenabled] = 'false'
    expect(dsc_xmppreference[:dsc_scanonlyifidleenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_scanonlyifidleenabled" do
    dsc_xmppreference[:dsc_scanonlyifidleenabled] = 'True'
    expect(dsc_xmppreference[:dsc_scanonlyifidleenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_scanonlyifidleenabled" do
    dsc_xmppreference[:dsc_scanonlyifidleenabled] = 'False'
    expect(dsc_xmppreference[:dsc_scanonlyifidleenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_scanonlyifidleenabled" do
    dsc_xmppreference[:dsc_scanonlyifidleenabled] = :true
    expect(dsc_xmppreference[:dsc_scanonlyifidleenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_scanonlyifidleenabled" do
    dsc_xmppreference[:dsc_scanonlyifidleenabled] = :false
    expect(dsc_xmppreference[:dsc_scanonlyifidleenabled]).to eq(false)
  end

  it 'should not accept int for dsc_scanonlyifidleenabled' do
    expect{dsc_xmppreference[:dsc_scanonlyifidleenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scanonlyifidleenabled' do
    expect{dsc_xmppreference[:dsc_scanonlyifidleenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_scanparameters predefined value FullSCan' do
    dsc_xmppreference[:dsc_scanparameters] = 'FullSCan'
    expect(dsc_xmppreference[:dsc_scanparameters]).to eq('FullSCan')
  end

  it 'should accept dsc_scanparameters predefined value fullscan' do
    dsc_xmppreference[:dsc_scanparameters] = 'fullscan'
    expect(dsc_xmppreference[:dsc_scanparameters]).to eq('fullscan')
  end

  it 'should accept dsc_scanparameters predefined value QuickScan' do
    dsc_xmppreference[:dsc_scanparameters] = 'QuickScan'
    expect(dsc_xmppreference[:dsc_scanparameters]).to eq('QuickScan')
  end

  it 'should accept dsc_scanparameters predefined value quickscan' do
    dsc_xmppreference[:dsc_scanparameters] = 'quickscan'
    expect(dsc_xmppreference[:dsc_scanparameters]).to eq('quickscan')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmppreference[:dsc_scanparameters] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scanparameters' do
    expect{dsc_xmppreference[:dsc_scanparameters] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scanparameters' do
    expect{dsc_xmppreference[:dsc_scanparameters] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scanparameters' do
    expect{dsc_xmppreference[:dsc_scanparameters] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scanparameters' do
    expect{dsc_xmppreference[:dsc_scanparameters] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_scanscheduleday predefined value Everyday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'Everyday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('Everyday')
  end

  it 'should accept dsc_scanscheduleday predefined value everyday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'everyday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('everyday')
  end

  it 'should accept dsc_scanscheduleday predefined value Never' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'Never'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('Never')
  end

  it 'should accept dsc_scanscheduleday predefined value never' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'never'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('never')
  end

  it 'should accept dsc_scanscheduleday predefined value Monday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'Monday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('Monday')
  end

  it 'should accept dsc_scanscheduleday predefined value monday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'monday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('monday')
  end

  it 'should accept dsc_scanscheduleday predefined value Tuesday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'Tuesday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('Tuesday')
  end

  it 'should accept dsc_scanscheduleday predefined value tuesday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'tuesday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('tuesday')
  end

  it 'should accept dsc_scanscheduleday predefined value Wednesday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'Wednesday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('Wednesday')
  end

  it 'should accept dsc_scanscheduleday predefined value wednesday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'wednesday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('wednesday')
  end

  it 'should accept dsc_scanscheduleday predefined value Thursday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'Thursday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('Thursday')
  end

  it 'should accept dsc_scanscheduleday predefined value thursday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'thursday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('thursday')
  end

  it 'should accept dsc_scanscheduleday predefined value Friday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'Friday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('Friday')
  end

  it 'should accept dsc_scanscheduleday predefined value friday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'friday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('friday')
  end

  it 'should accept dsc_scanscheduleday predefined value Saturday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'Saturday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('Saturday')
  end

  it 'should accept dsc_scanscheduleday predefined value saturday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'saturday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('saturday')
  end

  it 'should accept dsc_scanscheduleday predefined value Sunday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'Sunday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('Sunday')
  end

  it 'should accept dsc_scanscheduleday predefined value sunday' do
    dsc_xmppreference[:dsc_scanscheduleday] = 'sunday'
    expect(dsc_xmppreference[:dsc_scanscheduleday]).to eq('sunday')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmppreference[:dsc_scanscheduleday] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scanscheduleday' do
    expect{dsc_xmppreference[:dsc_scanscheduleday] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scanscheduleday' do
    expect{dsc_xmppreference[:dsc_scanscheduleday] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scanscheduleday' do
    expect{dsc_xmppreference[:dsc_scanscheduleday] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scanscheduleday' do
    expect{dsc_xmppreference[:dsc_scanscheduleday] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scanschedulequickscantime' do
    expect{dsc_xmppreference[:dsc_scanschedulequickscantime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scanschedulequickscantime' do
    expect{dsc_xmppreference[:dsc_scanschedulequickscantime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scanschedulequickscantime' do
    expect{dsc_xmppreference[:dsc_scanschedulequickscantime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scanschedulequickscantime' do
    expect{dsc_xmppreference[:dsc_scanschedulequickscantime] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scanscheduletime' do
    expect{dsc_xmppreference[:dsc_scanscheduletime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scanscheduletime' do
    expect{dsc_xmppreference[:dsc_scanscheduletime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scanscheduletime' do
    expect{dsc_xmppreference[:dsc_scanscheduletime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scanscheduletime' do
    expect{dsc_xmppreference[:dsc_scanscheduletime] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_signaturefirstaugraceperiod' do
    expect{dsc_xmppreference[:dsc_signaturefirstaugraceperiod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_signaturefirstaugraceperiod' do
    expect{dsc_xmppreference[:dsc_signaturefirstaugraceperiod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_signaturefirstaugraceperiod' do
    dsc_xmppreference[:dsc_signaturefirstaugraceperiod] = 32
    expect(dsc_xmppreference[:dsc_signaturefirstaugraceperiod]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_signaturefirstaugraceperiod' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xmppreference[:dsc_signaturefirstaugraceperiod] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_signaturefirstaugraceperiod' do
    dsc_xmppreference[:dsc_signaturefirstaugraceperiod] = '16'
    expect(dsc_xmppreference[:dsc_signaturefirstaugraceperiod]).to eq(16)
  end

  it 'should accept string-like uint for dsc_signaturefirstaugraceperiod' do
    dsc_xmppreference[:dsc_signaturefirstaugraceperiod] = '32'
    expect(dsc_xmppreference[:dsc_signaturefirstaugraceperiod]).to eq(32)
  end

  it 'should accept string-like uint for dsc_signaturefirstaugraceperiod' do
    dsc_xmppreference[:dsc_signaturefirstaugraceperiod] = '64'
    expect(dsc_xmppreference[:dsc_signaturefirstaugraceperiod]).to eq(64)
  end

  it 'should not accept array for dsc_signatureaugraceperiod' do
    expect{dsc_xmppreference[:dsc_signatureaugraceperiod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_signatureaugraceperiod' do
    expect{dsc_xmppreference[:dsc_signatureaugraceperiod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_signatureaugraceperiod' do
    dsc_xmppreference[:dsc_signatureaugraceperiod] = 32
    expect(dsc_xmppreference[:dsc_signatureaugraceperiod]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_signatureaugraceperiod' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xmppreference[:dsc_signatureaugraceperiod] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_signatureaugraceperiod' do
    dsc_xmppreference[:dsc_signatureaugraceperiod] = '16'
    expect(dsc_xmppreference[:dsc_signatureaugraceperiod]).to eq(16)
  end

  it 'should accept string-like uint for dsc_signatureaugraceperiod' do
    dsc_xmppreference[:dsc_signatureaugraceperiod] = '32'
    expect(dsc_xmppreference[:dsc_signatureaugraceperiod]).to eq(32)
  end

  it 'should accept string-like uint for dsc_signatureaugraceperiod' do
    dsc_xmppreference[:dsc_signatureaugraceperiod] = '64'
    expect(dsc_xmppreference[:dsc_signatureaugraceperiod]).to eq(64)
  end

  it 'should not accept array for dsc_signaturedefinitionupdatefilesharessources' do
    expect{dsc_xmppreference[:dsc_signaturedefinitionupdatefilesharessources] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_signaturedefinitionupdatefilesharessources' do
    expect{dsc_xmppreference[:dsc_signaturedefinitionupdatefilesharessources] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_signaturedefinitionupdatefilesharessources' do
    expect{dsc_xmppreference[:dsc_signaturedefinitionupdatefilesharessources] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_signaturedefinitionupdatefilesharessources' do
    expect{dsc_xmppreference[:dsc_signaturedefinitionupdatefilesharessources] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_signaturedisableupdateonstartupwithoutengine' do
    expect{dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_signaturedisableupdateonstartupwithoutengine' do
    dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine] = true
    expect(dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_signaturedisableupdateonstartupwithoutengine" do
    dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine] = 'true'
    expect(dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_signaturedisableupdateonstartupwithoutengine" do
    dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine] = 'false'
    expect(dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_signaturedisableupdateonstartupwithoutengine" do
    dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine] = 'True'
    expect(dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_signaturedisableupdateonstartupwithoutengine" do
    dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine] = 'False'
    expect(dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_signaturedisableupdateonstartupwithoutengine" do
    dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine] = :true
    expect(dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_signaturedisableupdateonstartupwithoutengine" do
    dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine] = :false
    expect(dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine]).to eq(false)
  end

  it 'should not accept int for dsc_signaturedisableupdateonstartupwithoutengine' do
    expect{dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_signaturedisableupdateonstartupwithoutengine' do
    expect{dsc_xmppreference[:dsc_signaturedisableupdateonstartupwithoutengine] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_signaturefallbackorder' do
    expect{dsc_xmppreference[:dsc_signaturefallbackorder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_signaturefallbackorder' do
    expect{dsc_xmppreference[:dsc_signaturefallbackorder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_signaturefallbackorder' do
    expect{dsc_xmppreference[:dsc_signaturefallbackorder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_signaturefallbackorder' do
    expect{dsc_xmppreference[:dsc_signaturefallbackorder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_signaturescheduleday predefined value Everyday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'Everyday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('Everyday')
  end

  it 'should accept dsc_signaturescheduleday predefined value everyday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'everyday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('everyday')
  end

  it 'should accept dsc_signaturescheduleday predefined value Never' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'Never'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('Never')
  end

  it 'should accept dsc_signaturescheduleday predefined value never' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'never'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('never')
  end

  it 'should accept dsc_signaturescheduleday predefined value Monday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'Monday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('Monday')
  end

  it 'should accept dsc_signaturescheduleday predefined value monday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'monday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('monday')
  end

  it 'should accept dsc_signaturescheduleday predefined value Tuesday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'Tuesday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('Tuesday')
  end

  it 'should accept dsc_signaturescheduleday predefined value tuesday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'tuesday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('tuesday')
  end

  it 'should accept dsc_signaturescheduleday predefined value Wednesday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'Wednesday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('Wednesday')
  end

  it 'should accept dsc_signaturescheduleday predefined value wednesday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'wednesday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('wednesday')
  end

  it 'should accept dsc_signaturescheduleday predefined value Thursday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'Thursday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('Thursday')
  end

  it 'should accept dsc_signaturescheduleday predefined value thursday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'thursday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('thursday')
  end

  it 'should accept dsc_signaturescheduleday predefined value Friday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'Friday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('Friday')
  end

  it 'should accept dsc_signaturescheduleday predefined value friday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'friday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('friday')
  end

  it 'should accept dsc_signaturescheduleday predefined value Saturday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'Saturday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('Saturday')
  end

  it 'should accept dsc_signaturescheduleday predefined value saturday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'saturday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('saturday')
  end

  it 'should accept dsc_signaturescheduleday predefined value Sunday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'Sunday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('Sunday')
  end

  it 'should accept dsc_signaturescheduleday predefined value sunday' do
    dsc_xmppreference[:dsc_signaturescheduleday] = 'sunday'
    expect(dsc_xmppreference[:dsc_signaturescheduleday]).to eq('sunday')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmppreference[:dsc_signaturescheduleday] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_signaturescheduleday' do
    expect{dsc_xmppreference[:dsc_signaturescheduleday] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_signaturescheduleday' do
    expect{dsc_xmppreference[:dsc_signaturescheduleday] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_signaturescheduleday' do
    expect{dsc_xmppreference[:dsc_signaturescheduleday] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_signaturescheduleday' do
    expect{dsc_xmppreference[:dsc_signaturescheduleday] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_signaturescheduletime' do
    expect{dsc_xmppreference[:dsc_signaturescheduletime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_signaturescheduletime' do
    expect{dsc_xmppreference[:dsc_signaturescheduletime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_signaturescheduletime' do
    expect{dsc_xmppreference[:dsc_signaturescheduletime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_signaturescheduletime' do
    expect{dsc_xmppreference[:dsc_signaturescheduletime] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_signatureupdatecatchupinterval' do
    expect{dsc_xmppreference[:dsc_signatureupdatecatchupinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_signatureupdatecatchupinterval' do
    expect{dsc_xmppreference[:dsc_signatureupdatecatchupinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_signatureupdatecatchupinterval' do
    dsc_xmppreference[:dsc_signatureupdatecatchupinterval] = 32
    expect(dsc_xmppreference[:dsc_signatureupdatecatchupinterval]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_signatureupdatecatchupinterval' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xmppreference[:dsc_signatureupdatecatchupinterval] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_signatureupdatecatchupinterval' do
    dsc_xmppreference[:dsc_signatureupdatecatchupinterval] = '16'
    expect(dsc_xmppreference[:dsc_signatureupdatecatchupinterval]).to eq(16)
  end

  it 'should accept string-like uint for dsc_signatureupdatecatchupinterval' do
    dsc_xmppreference[:dsc_signatureupdatecatchupinterval] = '32'
    expect(dsc_xmppreference[:dsc_signatureupdatecatchupinterval]).to eq(32)
  end

  it 'should accept string-like uint for dsc_signatureupdatecatchupinterval' do
    dsc_xmppreference[:dsc_signatureupdatecatchupinterval] = '64'
    expect(dsc_xmppreference[:dsc_signatureupdatecatchupinterval]).to eq(64)
  end

  it 'should not accept array for dsc_signatureupdateinterval' do
    expect{dsc_xmppreference[:dsc_signatureupdateinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_signatureupdateinterval' do
    expect{dsc_xmppreference[:dsc_signatureupdateinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_signatureupdateinterval' do
    dsc_xmppreference[:dsc_signatureupdateinterval] = 32
    expect(dsc_xmppreference[:dsc_signatureupdateinterval]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_signatureupdateinterval' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xmppreference[:dsc_signatureupdateinterval] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_signatureupdateinterval' do
    dsc_xmppreference[:dsc_signatureupdateinterval] = '16'
    expect(dsc_xmppreference[:dsc_signatureupdateinterval]).to eq(16)
  end

  it 'should accept string-like uint for dsc_signatureupdateinterval' do
    dsc_xmppreference[:dsc_signatureupdateinterval] = '32'
    expect(dsc_xmppreference[:dsc_signatureupdateinterval]).to eq(32)
  end

  it 'should accept string-like uint for dsc_signatureupdateinterval' do
    dsc_xmppreference[:dsc_signatureupdateinterval] = '64'
    expect(dsc_xmppreference[:dsc_signatureupdateinterval]).to eq(64)
  end

  it 'should accept dsc_mapsreporting predefined value Advanced' do
    dsc_xmppreference[:dsc_mapsreporting] = 'Advanced'
    expect(dsc_xmppreference[:dsc_mapsreporting]).to eq('Advanced')
  end

  it 'should accept dsc_mapsreporting predefined value advanced' do
    dsc_xmppreference[:dsc_mapsreporting] = 'advanced'
    expect(dsc_xmppreference[:dsc_mapsreporting]).to eq('advanced')
  end

  it 'should accept dsc_mapsreporting predefined value Basic' do
    dsc_xmppreference[:dsc_mapsreporting] = 'Basic'
    expect(dsc_xmppreference[:dsc_mapsreporting]).to eq('Basic')
  end

  it 'should accept dsc_mapsreporting predefined value basic' do
    dsc_xmppreference[:dsc_mapsreporting] = 'basic'
    expect(dsc_xmppreference[:dsc_mapsreporting]).to eq('basic')
  end

  it 'should accept dsc_mapsreporting predefined value Disabled' do
    dsc_xmppreference[:dsc_mapsreporting] = 'Disabled'
    expect(dsc_xmppreference[:dsc_mapsreporting]).to eq('Disabled')
  end

  it 'should accept dsc_mapsreporting predefined value disabled' do
    dsc_xmppreference[:dsc_mapsreporting] = 'disabled'
    expect(dsc_xmppreference[:dsc_mapsreporting]).to eq('disabled')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmppreference[:dsc_mapsreporting] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_mapsreporting' do
    expect{dsc_xmppreference[:dsc_mapsreporting] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mapsreporting' do
    expect{dsc_xmppreference[:dsc_mapsreporting] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mapsreporting' do
    expect{dsc_xmppreference[:dsc_mapsreporting] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mapsreporting' do
    expect{dsc_xmppreference[:dsc_mapsreporting] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disableprivacymode' do
    expect{dsc_xmppreference[:dsc_disableprivacymode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disableprivacymode' do
    dsc_xmppreference[:dsc_disableprivacymode] = true
    expect(dsc_xmppreference[:dsc_disableprivacymode]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disableprivacymode" do
    dsc_xmppreference[:dsc_disableprivacymode] = 'true'
    expect(dsc_xmppreference[:dsc_disableprivacymode]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disableprivacymode" do
    dsc_xmppreference[:dsc_disableprivacymode] = 'false'
    expect(dsc_xmppreference[:dsc_disableprivacymode]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disableprivacymode" do
    dsc_xmppreference[:dsc_disableprivacymode] = 'True'
    expect(dsc_xmppreference[:dsc_disableprivacymode]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disableprivacymode" do
    dsc_xmppreference[:dsc_disableprivacymode] = 'False'
    expect(dsc_xmppreference[:dsc_disableprivacymode]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disableprivacymode" do
    dsc_xmppreference[:dsc_disableprivacymode] = :true
    expect(dsc_xmppreference[:dsc_disableprivacymode]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disableprivacymode" do
    dsc_xmppreference[:dsc_disableprivacymode] = :false
    expect(dsc_xmppreference[:dsc_disableprivacymode]).to eq(false)
  end

  it 'should not accept int for dsc_disableprivacymode' do
    expect{dsc_xmppreference[:dsc_disableprivacymode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disableprivacymode' do
    expect{dsc_xmppreference[:dsc_disableprivacymode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_randomizescheduletasktimes' do
    expect{dsc_xmppreference[:dsc_randomizescheduletasktimes] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_randomizescheduletasktimes' do
    dsc_xmppreference[:dsc_randomizescheduletasktimes] = true
    expect(dsc_xmppreference[:dsc_randomizescheduletasktimes]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_randomizescheduletasktimes" do
    dsc_xmppreference[:dsc_randomizescheduletasktimes] = 'true'
    expect(dsc_xmppreference[:dsc_randomizescheduletasktimes]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_randomizescheduletasktimes" do
    dsc_xmppreference[:dsc_randomizescheduletasktimes] = 'false'
    expect(dsc_xmppreference[:dsc_randomizescheduletasktimes]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_randomizescheduletasktimes" do
    dsc_xmppreference[:dsc_randomizescheduletasktimes] = 'True'
    expect(dsc_xmppreference[:dsc_randomizescheduletasktimes]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_randomizescheduletasktimes" do
    dsc_xmppreference[:dsc_randomizescheduletasktimes] = 'False'
    expect(dsc_xmppreference[:dsc_randomizescheduletasktimes]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_randomizescheduletasktimes" do
    dsc_xmppreference[:dsc_randomizescheduletasktimes] = :true
    expect(dsc_xmppreference[:dsc_randomizescheduletasktimes]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_randomizescheduletasktimes" do
    dsc_xmppreference[:dsc_randomizescheduletasktimes] = :false
    expect(dsc_xmppreference[:dsc_randomizescheduletasktimes]).to eq(false)
  end

  it 'should not accept int for dsc_randomizescheduletasktimes' do
    expect{dsc_xmppreference[:dsc_randomizescheduletasktimes] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_randomizescheduletasktimes' do
    expect{dsc_xmppreference[:dsc_randomizescheduletasktimes] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disablebehaviormonitoring' do
    expect{dsc_xmppreference[:dsc_disablebehaviormonitoring] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disablebehaviormonitoring' do
    dsc_xmppreference[:dsc_disablebehaviormonitoring] = true
    expect(dsc_xmppreference[:dsc_disablebehaviormonitoring]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disablebehaviormonitoring" do
    dsc_xmppreference[:dsc_disablebehaviormonitoring] = 'true'
    expect(dsc_xmppreference[:dsc_disablebehaviormonitoring]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disablebehaviormonitoring" do
    dsc_xmppreference[:dsc_disablebehaviormonitoring] = 'false'
    expect(dsc_xmppreference[:dsc_disablebehaviormonitoring]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disablebehaviormonitoring" do
    dsc_xmppreference[:dsc_disablebehaviormonitoring] = 'True'
    expect(dsc_xmppreference[:dsc_disablebehaviormonitoring]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disablebehaviormonitoring" do
    dsc_xmppreference[:dsc_disablebehaviormonitoring] = 'False'
    expect(dsc_xmppreference[:dsc_disablebehaviormonitoring]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disablebehaviormonitoring" do
    dsc_xmppreference[:dsc_disablebehaviormonitoring] = :true
    expect(dsc_xmppreference[:dsc_disablebehaviormonitoring]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disablebehaviormonitoring" do
    dsc_xmppreference[:dsc_disablebehaviormonitoring] = :false
    expect(dsc_xmppreference[:dsc_disablebehaviormonitoring]).to eq(false)
  end

  it 'should not accept int for dsc_disablebehaviormonitoring' do
    expect{dsc_xmppreference[:dsc_disablebehaviormonitoring] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disablebehaviormonitoring' do
    expect{dsc_xmppreference[:dsc_disablebehaviormonitoring] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disableintrusionpreventionsystem' do
    expect{dsc_xmppreference[:dsc_disableintrusionpreventionsystem] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disableintrusionpreventionsystem' do
    dsc_xmppreference[:dsc_disableintrusionpreventionsystem] = true
    expect(dsc_xmppreference[:dsc_disableintrusionpreventionsystem]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disableintrusionpreventionsystem" do
    dsc_xmppreference[:dsc_disableintrusionpreventionsystem] = 'true'
    expect(dsc_xmppreference[:dsc_disableintrusionpreventionsystem]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disableintrusionpreventionsystem" do
    dsc_xmppreference[:dsc_disableintrusionpreventionsystem] = 'false'
    expect(dsc_xmppreference[:dsc_disableintrusionpreventionsystem]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disableintrusionpreventionsystem" do
    dsc_xmppreference[:dsc_disableintrusionpreventionsystem] = 'True'
    expect(dsc_xmppreference[:dsc_disableintrusionpreventionsystem]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disableintrusionpreventionsystem" do
    dsc_xmppreference[:dsc_disableintrusionpreventionsystem] = 'False'
    expect(dsc_xmppreference[:dsc_disableintrusionpreventionsystem]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disableintrusionpreventionsystem" do
    dsc_xmppreference[:dsc_disableintrusionpreventionsystem] = :true
    expect(dsc_xmppreference[:dsc_disableintrusionpreventionsystem]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disableintrusionpreventionsystem" do
    dsc_xmppreference[:dsc_disableintrusionpreventionsystem] = :false
    expect(dsc_xmppreference[:dsc_disableintrusionpreventionsystem]).to eq(false)
  end

  it 'should not accept int for dsc_disableintrusionpreventionsystem' do
    expect{dsc_xmppreference[:dsc_disableintrusionpreventionsystem] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disableintrusionpreventionsystem' do
    expect{dsc_xmppreference[:dsc_disableintrusionpreventionsystem] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disableioavprotection' do
    expect{dsc_xmppreference[:dsc_disableioavprotection] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disableioavprotection' do
    dsc_xmppreference[:dsc_disableioavprotection] = true
    expect(dsc_xmppreference[:dsc_disableioavprotection]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disableioavprotection" do
    dsc_xmppreference[:dsc_disableioavprotection] = 'true'
    expect(dsc_xmppreference[:dsc_disableioavprotection]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disableioavprotection" do
    dsc_xmppreference[:dsc_disableioavprotection] = 'false'
    expect(dsc_xmppreference[:dsc_disableioavprotection]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disableioavprotection" do
    dsc_xmppreference[:dsc_disableioavprotection] = 'True'
    expect(dsc_xmppreference[:dsc_disableioavprotection]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disableioavprotection" do
    dsc_xmppreference[:dsc_disableioavprotection] = 'False'
    expect(dsc_xmppreference[:dsc_disableioavprotection]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disableioavprotection" do
    dsc_xmppreference[:dsc_disableioavprotection] = :true
    expect(dsc_xmppreference[:dsc_disableioavprotection]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disableioavprotection" do
    dsc_xmppreference[:dsc_disableioavprotection] = :false
    expect(dsc_xmppreference[:dsc_disableioavprotection]).to eq(false)
  end

  it 'should not accept int for dsc_disableioavprotection' do
    expect{dsc_xmppreference[:dsc_disableioavprotection] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disableioavprotection' do
    expect{dsc_xmppreference[:dsc_disableioavprotection] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disablerealtimemonitoring' do
    expect{dsc_xmppreference[:dsc_disablerealtimemonitoring] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disablerealtimemonitoring' do
    dsc_xmppreference[:dsc_disablerealtimemonitoring] = true
    expect(dsc_xmppreference[:dsc_disablerealtimemonitoring]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disablerealtimemonitoring" do
    dsc_xmppreference[:dsc_disablerealtimemonitoring] = 'true'
    expect(dsc_xmppreference[:dsc_disablerealtimemonitoring]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disablerealtimemonitoring" do
    dsc_xmppreference[:dsc_disablerealtimemonitoring] = 'false'
    expect(dsc_xmppreference[:dsc_disablerealtimemonitoring]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disablerealtimemonitoring" do
    dsc_xmppreference[:dsc_disablerealtimemonitoring] = 'True'
    expect(dsc_xmppreference[:dsc_disablerealtimemonitoring]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disablerealtimemonitoring" do
    dsc_xmppreference[:dsc_disablerealtimemonitoring] = 'False'
    expect(dsc_xmppreference[:dsc_disablerealtimemonitoring]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disablerealtimemonitoring" do
    dsc_xmppreference[:dsc_disablerealtimemonitoring] = :true
    expect(dsc_xmppreference[:dsc_disablerealtimemonitoring]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disablerealtimemonitoring" do
    dsc_xmppreference[:dsc_disablerealtimemonitoring] = :false
    expect(dsc_xmppreference[:dsc_disablerealtimemonitoring]).to eq(false)
  end

  it 'should not accept int for dsc_disablerealtimemonitoring' do
    expect{dsc_xmppreference[:dsc_disablerealtimemonitoring] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disablerealtimemonitoring' do
    expect{dsc_xmppreference[:dsc_disablerealtimemonitoring] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disablescriptscanning' do
    expect{dsc_xmppreference[:dsc_disablescriptscanning] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disablescriptscanning' do
    dsc_xmppreference[:dsc_disablescriptscanning] = true
    expect(dsc_xmppreference[:dsc_disablescriptscanning]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disablescriptscanning" do
    dsc_xmppreference[:dsc_disablescriptscanning] = 'true'
    expect(dsc_xmppreference[:dsc_disablescriptscanning]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disablescriptscanning" do
    dsc_xmppreference[:dsc_disablescriptscanning] = 'false'
    expect(dsc_xmppreference[:dsc_disablescriptscanning]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disablescriptscanning" do
    dsc_xmppreference[:dsc_disablescriptscanning] = 'True'
    expect(dsc_xmppreference[:dsc_disablescriptscanning]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disablescriptscanning" do
    dsc_xmppreference[:dsc_disablescriptscanning] = 'False'
    expect(dsc_xmppreference[:dsc_disablescriptscanning]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disablescriptscanning" do
    dsc_xmppreference[:dsc_disablescriptscanning] = :true
    expect(dsc_xmppreference[:dsc_disablescriptscanning]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disablescriptscanning" do
    dsc_xmppreference[:dsc_disablescriptscanning] = :false
    expect(dsc_xmppreference[:dsc_disablescriptscanning]).to eq(false)
  end

  it 'should not accept int for dsc_disablescriptscanning' do
    expect{dsc_xmppreference[:dsc_disablescriptscanning] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disablescriptscanning' do
    expect{dsc_xmppreference[:dsc_disablescriptscanning] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disablearchivescanning' do
    expect{dsc_xmppreference[:dsc_disablearchivescanning] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disablearchivescanning' do
    dsc_xmppreference[:dsc_disablearchivescanning] = true
    expect(dsc_xmppreference[:dsc_disablearchivescanning]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disablearchivescanning" do
    dsc_xmppreference[:dsc_disablearchivescanning] = 'true'
    expect(dsc_xmppreference[:dsc_disablearchivescanning]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disablearchivescanning" do
    dsc_xmppreference[:dsc_disablearchivescanning] = 'false'
    expect(dsc_xmppreference[:dsc_disablearchivescanning]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disablearchivescanning" do
    dsc_xmppreference[:dsc_disablearchivescanning] = 'True'
    expect(dsc_xmppreference[:dsc_disablearchivescanning]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disablearchivescanning" do
    dsc_xmppreference[:dsc_disablearchivescanning] = 'False'
    expect(dsc_xmppreference[:dsc_disablearchivescanning]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disablearchivescanning" do
    dsc_xmppreference[:dsc_disablearchivescanning] = :true
    expect(dsc_xmppreference[:dsc_disablearchivescanning]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disablearchivescanning" do
    dsc_xmppreference[:dsc_disablearchivescanning] = :false
    expect(dsc_xmppreference[:dsc_disablearchivescanning]).to eq(false)
  end

  it 'should not accept int for dsc_disablearchivescanning' do
    expect{dsc_xmppreference[:dsc_disablearchivescanning] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disablearchivescanning' do
    expect{dsc_xmppreference[:dsc_disablearchivescanning] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disableautoexclusions' do
    expect{dsc_xmppreference[:dsc_disableautoexclusions] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disableautoexclusions' do
    dsc_xmppreference[:dsc_disableautoexclusions] = true
    expect(dsc_xmppreference[:dsc_disableautoexclusions]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disableautoexclusions" do
    dsc_xmppreference[:dsc_disableautoexclusions] = 'true'
    expect(dsc_xmppreference[:dsc_disableautoexclusions]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disableautoexclusions" do
    dsc_xmppreference[:dsc_disableautoexclusions] = 'false'
    expect(dsc_xmppreference[:dsc_disableautoexclusions]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disableautoexclusions" do
    dsc_xmppreference[:dsc_disableautoexclusions] = 'True'
    expect(dsc_xmppreference[:dsc_disableautoexclusions]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disableautoexclusions" do
    dsc_xmppreference[:dsc_disableautoexclusions] = 'False'
    expect(dsc_xmppreference[:dsc_disableautoexclusions]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disableautoexclusions" do
    dsc_xmppreference[:dsc_disableautoexclusions] = :true
    expect(dsc_xmppreference[:dsc_disableautoexclusions]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disableautoexclusions" do
    dsc_xmppreference[:dsc_disableautoexclusions] = :false
    expect(dsc_xmppreference[:dsc_disableautoexclusions]).to eq(false)
  end

  it 'should not accept int for dsc_disableautoexclusions' do
    expect{dsc_xmppreference[:dsc_disableautoexclusions] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disableautoexclusions' do
    expect{dsc_xmppreference[:dsc_disableautoexclusions] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disablecatchupfullscan' do
    expect{dsc_xmppreference[:dsc_disablecatchupfullscan] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disablecatchupfullscan' do
    dsc_xmppreference[:dsc_disablecatchupfullscan] = true
    expect(dsc_xmppreference[:dsc_disablecatchupfullscan]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disablecatchupfullscan" do
    dsc_xmppreference[:dsc_disablecatchupfullscan] = 'true'
    expect(dsc_xmppreference[:dsc_disablecatchupfullscan]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disablecatchupfullscan" do
    dsc_xmppreference[:dsc_disablecatchupfullscan] = 'false'
    expect(dsc_xmppreference[:dsc_disablecatchupfullscan]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disablecatchupfullscan" do
    dsc_xmppreference[:dsc_disablecatchupfullscan] = 'True'
    expect(dsc_xmppreference[:dsc_disablecatchupfullscan]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disablecatchupfullscan" do
    dsc_xmppreference[:dsc_disablecatchupfullscan] = 'False'
    expect(dsc_xmppreference[:dsc_disablecatchupfullscan]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disablecatchupfullscan" do
    dsc_xmppreference[:dsc_disablecatchupfullscan] = :true
    expect(dsc_xmppreference[:dsc_disablecatchupfullscan]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disablecatchupfullscan" do
    dsc_xmppreference[:dsc_disablecatchupfullscan] = :false
    expect(dsc_xmppreference[:dsc_disablecatchupfullscan]).to eq(false)
  end

  it 'should not accept int for dsc_disablecatchupfullscan' do
    expect{dsc_xmppreference[:dsc_disablecatchupfullscan] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disablecatchupfullscan' do
    expect{dsc_xmppreference[:dsc_disablecatchupfullscan] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disablecatchupquickscan' do
    expect{dsc_xmppreference[:dsc_disablecatchupquickscan] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disablecatchupquickscan' do
    dsc_xmppreference[:dsc_disablecatchupquickscan] = true
    expect(dsc_xmppreference[:dsc_disablecatchupquickscan]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disablecatchupquickscan" do
    dsc_xmppreference[:dsc_disablecatchupquickscan] = 'true'
    expect(dsc_xmppreference[:dsc_disablecatchupquickscan]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disablecatchupquickscan" do
    dsc_xmppreference[:dsc_disablecatchupquickscan] = 'false'
    expect(dsc_xmppreference[:dsc_disablecatchupquickscan]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disablecatchupquickscan" do
    dsc_xmppreference[:dsc_disablecatchupquickscan] = 'True'
    expect(dsc_xmppreference[:dsc_disablecatchupquickscan]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disablecatchupquickscan" do
    dsc_xmppreference[:dsc_disablecatchupquickscan] = 'False'
    expect(dsc_xmppreference[:dsc_disablecatchupquickscan]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disablecatchupquickscan" do
    dsc_xmppreference[:dsc_disablecatchupquickscan] = :true
    expect(dsc_xmppreference[:dsc_disablecatchupquickscan]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disablecatchupquickscan" do
    dsc_xmppreference[:dsc_disablecatchupquickscan] = :false
    expect(dsc_xmppreference[:dsc_disablecatchupquickscan]).to eq(false)
  end

  it 'should not accept int for dsc_disablecatchupquickscan' do
    expect{dsc_xmppreference[:dsc_disablecatchupquickscan] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disablecatchupquickscan' do
    expect{dsc_xmppreference[:dsc_disablecatchupquickscan] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disableemailscanning' do
    expect{dsc_xmppreference[:dsc_disableemailscanning] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disableemailscanning' do
    dsc_xmppreference[:dsc_disableemailscanning] = true
    expect(dsc_xmppreference[:dsc_disableemailscanning]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disableemailscanning" do
    dsc_xmppreference[:dsc_disableemailscanning] = 'true'
    expect(dsc_xmppreference[:dsc_disableemailscanning]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disableemailscanning" do
    dsc_xmppreference[:dsc_disableemailscanning] = 'false'
    expect(dsc_xmppreference[:dsc_disableemailscanning]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disableemailscanning" do
    dsc_xmppreference[:dsc_disableemailscanning] = 'True'
    expect(dsc_xmppreference[:dsc_disableemailscanning]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disableemailscanning" do
    dsc_xmppreference[:dsc_disableemailscanning] = 'False'
    expect(dsc_xmppreference[:dsc_disableemailscanning]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disableemailscanning" do
    dsc_xmppreference[:dsc_disableemailscanning] = :true
    expect(dsc_xmppreference[:dsc_disableemailscanning]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disableemailscanning" do
    dsc_xmppreference[:dsc_disableemailscanning] = :false
    expect(dsc_xmppreference[:dsc_disableemailscanning]).to eq(false)
  end

  it 'should not accept int for dsc_disableemailscanning' do
    expect{dsc_xmppreference[:dsc_disableemailscanning] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disableemailscanning' do
    expect{dsc_xmppreference[:dsc_disableemailscanning] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disableremovabledrivescanning' do
    expect{dsc_xmppreference[:dsc_disableremovabledrivescanning] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disableremovabledrivescanning' do
    dsc_xmppreference[:dsc_disableremovabledrivescanning] = true
    expect(dsc_xmppreference[:dsc_disableremovabledrivescanning]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disableremovabledrivescanning" do
    dsc_xmppreference[:dsc_disableremovabledrivescanning] = 'true'
    expect(dsc_xmppreference[:dsc_disableremovabledrivescanning]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disableremovabledrivescanning" do
    dsc_xmppreference[:dsc_disableremovabledrivescanning] = 'false'
    expect(dsc_xmppreference[:dsc_disableremovabledrivescanning]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disableremovabledrivescanning" do
    dsc_xmppreference[:dsc_disableremovabledrivescanning] = 'True'
    expect(dsc_xmppreference[:dsc_disableremovabledrivescanning]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disableremovabledrivescanning" do
    dsc_xmppreference[:dsc_disableremovabledrivescanning] = 'False'
    expect(dsc_xmppreference[:dsc_disableremovabledrivescanning]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disableremovabledrivescanning" do
    dsc_xmppreference[:dsc_disableremovabledrivescanning] = :true
    expect(dsc_xmppreference[:dsc_disableremovabledrivescanning]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disableremovabledrivescanning" do
    dsc_xmppreference[:dsc_disableremovabledrivescanning] = :false
    expect(dsc_xmppreference[:dsc_disableremovabledrivescanning]).to eq(false)
  end

  it 'should not accept int for dsc_disableremovabledrivescanning' do
    expect{dsc_xmppreference[:dsc_disableremovabledrivescanning] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disableremovabledrivescanning' do
    expect{dsc_xmppreference[:dsc_disableremovabledrivescanning] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disablerestorepoint' do
    expect{dsc_xmppreference[:dsc_disablerestorepoint] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disablerestorepoint' do
    dsc_xmppreference[:dsc_disablerestorepoint] = true
    expect(dsc_xmppreference[:dsc_disablerestorepoint]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disablerestorepoint" do
    dsc_xmppreference[:dsc_disablerestorepoint] = 'true'
    expect(dsc_xmppreference[:dsc_disablerestorepoint]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disablerestorepoint" do
    dsc_xmppreference[:dsc_disablerestorepoint] = 'false'
    expect(dsc_xmppreference[:dsc_disablerestorepoint]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disablerestorepoint" do
    dsc_xmppreference[:dsc_disablerestorepoint] = 'True'
    expect(dsc_xmppreference[:dsc_disablerestorepoint]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disablerestorepoint" do
    dsc_xmppreference[:dsc_disablerestorepoint] = 'False'
    expect(dsc_xmppreference[:dsc_disablerestorepoint]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disablerestorepoint" do
    dsc_xmppreference[:dsc_disablerestorepoint] = :true
    expect(dsc_xmppreference[:dsc_disablerestorepoint]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disablerestorepoint" do
    dsc_xmppreference[:dsc_disablerestorepoint] = :false
    expect(dsc_xmppreference[:dsc_disablerestorepoint]).to eq(false)
  end

  it 'should not accept int for dsc_disablerestorepoint' do
    expect{dsc_xmppreference[:dsc_disablerestorepoint] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disablerestorepoint' do
    expect{dsc_xmppreference[:dsc_disablerestorepoint] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disablescanningmappednetworkdrivesforfullscan' do
    expect{dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disablescanningmappednetworkdrivesforfullscan' do
    dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan] = true
    expect(dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disablescanningmappednetworkdrivesforfullscan" do
    dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan] = 'true'
    expect(dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disablescanningmappednetworkdrivesforfullscan" do
    dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan] = 'false'
    expect(dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disablescanningmappednetworkdrivesforfullscan" do
    dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan] = 'True'
    expect(dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disablescanningmappednetworkdrivesforfullscan" do
    dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan] = 'False'
    expect(dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disablescanningmappednetworkdrivesforfullscan" do
    dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan] = :true
    expect(dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disablescanningmappednetworkdrivesforfullscan" do
    dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan] = :false
    expect(dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan]).to eq(false)
  end

  it 'should not accept int for dsc_disablescanningmappednetworkdrivesforfullscan' do
    expect{dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disablescanningmappednetworkdrivesforfullscan' do
    expect{dsc_xmppreference[:dsc_disablescanningmappednetworkdrivesforfullscan] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disablescanningnetworkfiles' do
    expect{dsc_xmppreference[:dsc_disablescanningnetworkfiles] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disablescanningnetworkfiles' do
    dsc_xmppreference[:dsc_disablescanningnetworkfiles] = true
    expect(dsc_xmppreference[:dsc_disablescanningnetworkfiles]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disablescanningnetworkfiles" do
    dsc_xmppreference[:dsc_disablescanningnetworkfiles] = 'true'
    expect(dsc_xmppreference[:dsc_disablescanningnetworkfiles]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disablescanningnetworkfiles" do
    dsc_xmppreference[:dsc_disablescanningnetworkfiles] = 'false'
    expect(dsc_xmppreference[:dsc_disablescanningnetworkfiles]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disablescanningnetworkfiles" do
    dsc_xmppreference[:dsc_disablescanningnetworkfiles] = 'True'
    expect(dsc_xmppreference[:dsc_disablescanningnetworkfiles]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disablescanningnetworkfiles" do
    dsc_xmppreference[:dsc_disablescanningnetworkfiles] = 'False'
    expect(dsc_xmppreference[:dsc_disablescanningnetworkfiles]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disablescanningnetworkfiles" do
    dsc_xmppreference[:dsc_disablescanningnetworkfiles] = :true
    expect(dsc_xmppreference[:dsc_disablescanningnetworkfiles]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disablescanningnetworkfiles" do
    dsc_xmppreference[:dsc_disablescanningnetworkfiles] = :false
    expect(dsc_xmppreference[:dsc_disablescanningnetworkfiles]).to eq(false)
  end

  it 'should not accept int for dsc_disablescanningnetworkfiles' do
    expect{dsc_xmppreference[:dsc_disablescanningnetworkfiles] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disablescanningnetworkfiles' do
    expect{dsc_xmppreference[:dsc_disablescanningnetworkfiles] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_uilockdown' do
    expect{dsc_xmppreference[:dsc_uilockdown] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_uilockdown' do
    dsc_xmppreference[:dsc_uilockdown] = true
    expect(dsc_xmppreference[:dsc_uilockdown]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_uilockdown" do
    dsc_xmppreference[:dsc_uilockdown] = 'true'
    expect(dsc_xmppreference[:dsc_uilockdown]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_uilockdown" do
    dsc_xmppreference[:dsc_uilockdown] = 'false'
    expect(dsc_xmppreference[:dsc_uilockdown]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_uilockdown" do
    dsc_xmppreference[:dsc_uilockdown] = 'True'
    expect(dsc_xmppreference[:dsc_uilockdown]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_uilockdown" do
    dsc_xmppreference[:dsc_uilockdown] = 'False'
    expect(dsc_xmppreference[:dsc_uilockdown]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_uilockdown" do
    dsc_xmppreference[:dsc_uilockdown] = :true
    expect(dsc_xmppreference[:dsc_uilockdown]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_uilockdown" do
    dsc_xmppreference[:dsc_uilockdown] = :false
    expect(dsc_xmppreference[:dsc_uilockdown]).to eq(false)
  end

  it 'should not accept int for dsc_uilockdown' do
    expect{dsc_xmppreference[:dsc_uilockdown] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_uilockdown' do
    expect{dsc_xmppreference[:dsc_uilockdown] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_threatiddefaultaction_ids' do
    expect{dsc_xmppreference[:dsc_threatiddefaultaction_ids] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_threatiddefaultaction_ids' do
    expect{dsc_xmppreference[:dsc_threatiddefaultaction_ids] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_threatiddefaultaction_ids' do
    dsc_xmppreference[:dsc_threatiddefaultaction_ids] = 64
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_ids]).to eq(64)
  end

  it 'should not accept signed (negative) value for dsc_threatiddefaultaction_ids' do
    value = -64
    expect(value).to be < 0
    expect{dsc_xmppreference[:dsc_threatiddefaultaction_ids] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_threatiddefaultaction_ids' do
    dsc_xmppreference[:dsc_threatiddefaultaction_ids] = '16'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_ids]).to eq(16)
  end

  it 'should accept string-like uint for dsc_threatiddefaultaction_ids' do
    dsc_xmppreference[:dsc_threatiddefaultaction_ids] = '32'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_ids]).to eq(32)
  end

  it 'should accept string-like uint for dsc_threatiddefaultaction_ids' do
    dsc_xmppreference[:dsc_threatiddefaultaction_ids] = '64'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_ids]).to eq(64)
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value Allow' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'Allow'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('Allow')
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value allow' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'allow'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('allow')
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value Block' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'Block'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('Block')
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value block' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'block'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('block')
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value Clean' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'Clean'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('Clean')
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value clean' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'clean'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('clean')
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value NoAction' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'NoAction'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('NoAction')
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value noaction' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'noaction'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('noaction')
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value Quarantine' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'Quarantine'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('Quarantine')
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value quarantine' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'quarantine'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('quarantine')
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value Remove' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'Remove'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('Remove')
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value remove' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'remove'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('remove')
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value UserDefined' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'UserDefined'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('UserDefined')
  end

  it 'should accept dsc_threatiddefaultaction_actions predefined value userdefined' do
    dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'userdefined'
    expect(dsc_xmppreference[:dsc_threatiddefaultaction_actions]).to eq('userdefined')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_threatiddefaultaction_actions' do
    expect{dsc_xmppreference[:dsc_threatiddefaultaction_actions] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_threatiddefaultaction_actions' do
    expect{dsc_xmppreference[:dsc_threatiddefaultaction_actions] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_threatiddefaultaction_actions' do
    expect{dsc_xmppreference[:dsc_threatiddefaultaction_actions] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_threatiddefaultaction_actions' do
    expect{dsc_xmppreference[:dsc_threatiddefaultaction_actions] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value Allow' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'Allow'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('Allow')
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value allow' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'allow'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('allow')
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value Block' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'Block'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('Block')
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value block' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'block'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('block')
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value Clean' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'Clean'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('Clean')
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value clean' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'clean'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('clean')
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value NoAction' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'NoAction'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('NoAction')
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value noaction' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'noaction'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('noaction')
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value Quarantine' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'Quarantine'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('Quarantine')
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value quarantine' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'quarantine'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('quarantine')
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value Remove' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'Remove'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('Remove')
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value remove' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'remove'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('remove')
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value UserDefined' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'UserDefined'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('UserDefined')
  end

  it 'should accept dsc_unknownthreatdefaultaction predefined value userdefined' do
    dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'userdefined'
    expect(dsc_xmppreference[:dsc_unknownthreatdefaultaction]).to eq('userdefined')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_unknownthreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_unknownthreatdefaultaction] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_unknownthreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_unknownthreatdefaultaction] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_unknownthreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_unknownthreatdefaultaction] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_unknownthreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_unknownthreatdefaultaction] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value Allow' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'Allow'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('Allow')
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value allow' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'allow'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('allow')
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value Block' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'Block'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('Block')
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value block' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'block'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('block')
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value Clean' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'Clean'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('Clean')
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value clean' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'clean'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('clean')
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value NoAction' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'NoAction'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('NoAction')
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value noaction' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'noaction'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('noaction')
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value Quarantine' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'Quarantine'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('Quarantine')
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value quarantine' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'quarantine'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('quarantine')
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value Remove' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'Remove'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('Remove')
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value remove' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'remove'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('remove')
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value UserDefined' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'UserDefined'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('UserDefined')
  end

  it 'should accept dsc_lowthreatdefaultaction predefined value userdefined' do
    dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'userdefined'
    expect(dsc_xmppreference[:dsc_lowthreatdefaultaction]).to eq('userdefined')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmppreference[:dsc_lowthreatdefaultaction] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_lowthreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_lowthreatdefaultaction] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_lowthreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_lowthreatdefaultaction] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_lowthreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_lowthreatdefaultaction] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_lowthreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_lowthreatdefaultaction] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value Allow' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'Allow'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('Allow')
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value allow' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'allow'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('allow')
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value Block' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'Block'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('Block')
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value block' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'block'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('block')
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value Clean' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'Clean'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('Clean')
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value clean' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'clean'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('clean')
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value NoAction' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'NoAction'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('NoAction')
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value noaction' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'noaction'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('noaction')
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value Quarantine' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'Quarantine'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('Quarantine')
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value quarantine' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'quarantine'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('quarantine')
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value Remove' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'Remove'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('Remove')
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value remove' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'remove'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('remove')
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value UserDefined' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'UserDefined'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('UserDefined')
  end

  it 'should accept dsc_moderatethreatdefaultaction predefined value userdefined' do
    dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'userdefined'
    expect(dsc_xmppreference[:dsc_moderatethreatdefaultaction]).to eq('userdefined')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_moderatethreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_moderatethreatdefaultaction] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_moderatethreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_moderatethreatdefaultaction] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_moderatethreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_moderatethreatdefaultaction] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_moderatethreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_moderatethreatdefaultaction] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_highthreatdefaultaction predefined value Allow' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'Allow'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('Allow')
  end

  it 'should accept dsc_highthreatdefaultaction predefined value allow' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'allow'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('allow')
  end

  it 'should accept dsc_highthreatdefaultaction predefined value Block' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'Block'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('Block')
  end

  it 'should accept dsc_highthreatdefaultaction predefined value block' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'block'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('block')
  end

  it 'should accept dsc_highthreatdefaultaction predefined value Clean' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'Clean'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('Clean')
  end

  it 'should accept dsc_highthreatdefaultaction predefined value clean' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'clean'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('clean')
  end

  it 'should accept dsc_highthreatdefaultaction predefined value NoAction' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'NoAction'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('NoAction')
  end

  it 'should accept dsc_highthreatdefaultaction predefined value noaction' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'noaction'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('noaction')
  end

  it 'should accept dsc_highthreatdefaultaction predefined value Quarantine' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'Quarantine'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('Quarantine')
  end

  it 'should accept dsc_highthreatdefaultaction predefined value quarantine' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'quarantine'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('quarantine')
  end

  it 'should accept dsc_highthreatdefaultaction predefined value Remove' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'Remove'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('Remove')
  end

  it 'should accept dsc_highthreatdefaultaction predefined value remove' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'remove'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('remove')
  end

  it 'should accept dsc_highthreatdefaultaction predefined value UserDefined' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'UserDefined'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('UserDefined')
  end

  it 'should accept dsc_highthreatdefaultaction predefined value userdefined' do
    dsc_xmppreference[:dsc_highthreatdefaultaction] = 'userdefined'
    expect(dsc_xmppreference[:dsc_highthreatdefaultaction]).to eq('userdefined')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmppreference[:dsc_highthreatdefaultaction] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_highthreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_highthreatdefaultaction] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_highthreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_highthreatdefaultaction] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_highthreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_highthreatdefaultaction] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_highthreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_highthreatdefaultaction] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_severethreatdefaultaction predefined value Allow' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'Allow'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('Allow')
  end

  it 'should accept dsc_severethreatdefaultaction predefined value allow' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'allow'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('allow')
  end

  it 'should accept dsc_severethreatdefaultaction predefined value Block' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'Block'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('Block')
  end

  it 'should accept dsc_severethreatdefaultaction predefined value block' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'block'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('block')
  end

  it 'should accept dsc_severethreatdefaultaction predefined value Clean' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'Clean'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('Clean')
  end

  it 'should accept dsc_severethreatdefaultaction predefined value clean' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'clean'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('clean')
  end

  it 'should accept dsc_severethreatdefaultaction predefined value NoAction' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'NoAction'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('NoAction')
  end

  it 'should accept dsc_severethreatdefaultaction predefined value noaction' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'noaction'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('noaction')
  end

  it 'should accept dsc_severethreatdefaultaction predefined value Quarantine' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'Quarantine'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('Quarantine')
  end

  it 'should accept dsc_severethreatdefaultaction predefined value quarantine' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'quarantine'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('quarantine')
  end

  it 'should accept dsc_severethreatdefaultaction predefined value Remove' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'Remove'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('Remove')
  end

  it 'should accept dsc_severethreatdefaultaction predefined value remove' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'remove'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('remove')
  end

  it 'should accept dsc_severethreatdefaultaction predefined value UserDefined' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'UserDefined'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('UserDefined')
  end

  it 'should accept dsc_severethreatdefaultaction predefined value userdefined' do
    dsc_xmppreference[:dsc_severethreatdefaultaction] = 'userdefined'
    expect(dsc_xmppreference[:dsc_severethreatdefaultaction]).to eq('userdefined')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmppreference[:dsc_severethreatdefaultaction] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_severethreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_severethreatdefaultaction] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_severethreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_severethreatdefaultaction] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_severethreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_severethreatdefaultaction] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_severethreatdefaultaction' do
    expect{dsc_xmppreference[:dsc_severethreatdefaultaction] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_submitsamplesconsent predefined value Allways Prompt' do
    dsc_xmppreference[:dsc_submitsamplesconsent] = 'Allways Prompt'
    expect(dsc_xmppreference[:dsc_submitsamplesconsent]).to eq('Allways Prompt')
  end

  it 'should accept dsc_submitsamplesconsent predefined value allways prompt' do
    dsc_xmppreference[:dsc_submitsamplesconsent] = 'allways prompt'
    expect(dsc_xmppreference[:dsc_submitsamplesconsent]).to eq('allways prompt')
  end

  it 'should accept dsc_submitsamplesconsent predefined value Send safe samples automatically' do
    dsc_xmppreference[:dsc_submitsamplesconsent] = 'Send safe samples automatically'
    expect(dsc_xmppreference[:dsc_submitsamplesconsent]).to eq('Send safe samples automatically')
  end

  it 'should accept dsc_submitsamplesconsent predefined value send safe samples automatically' do
    dsc_xmppreference[:dsc_submitsamplesconsent] = 'send safe samples automatically'
    expect(dsc_xmppreference[:dsc_submitsamplesconsent]).to eq('send safe samples automatically')
  end

  it 'should accept dsc_submitsamplesconsent predefined value Never send' do
    dsc_xmppreference[:dsc_submitsamplesconsent] = 'Never send'
    expect(dsc_xmppreference[:dsc_submitsamplesconsent]).to eq('Never send')
  end

  it 'should accept dsc_submitsamplesconsent predefined value never send' do
    dsc_xmppreference[:dsc_submitsamplesconsent] = 'never send'
    expect(dsc_xmppreference[:dsc_submitsamplesconsent]).to eq('never send')
  end

  it 'should accept dsc_submitsamplesconsent predefined value Send all samples automatically' do
    dsc_xmppreference[:dsc_submitsamplesconsent] = 'Send all samples automatically'
    expect(dsc_xmppreference[:dsc_submitsamplesconsent]).to eq('Send all samples automatically')
  end

  it 'should accept dsc_submitsamplesconsent predefined value send all samples automatically' do
    dsc_xmppreference[:dsc_submitsamplesconsent] = 'send all samples automatically'
    expect(dsc_xmppreference[:dsc_submitsamplesconsent]).to eq('send all samples automatically')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmppreference[:dsc_submitsamplesconsent] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_submitsamplesconsent' do
    expect{dsc_xmppreference[:dsc_submitsamplesconsent] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_submitsamplesconsent' do
    expect{dsc_xmppreference[:dsc_submitsamplesconsent] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_submitsamplesconsent' do
    expect{dsc_xmppreference[:dsc_submitsamplesconsent] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_submitsamplesconsent' do
    expect{dsc_xmppreference[:dsc_submitsamplesconsent] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xmppreference)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xmppreference)
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

  end
end
