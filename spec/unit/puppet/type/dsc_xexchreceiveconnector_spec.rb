#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchreceiveconnector) do

  let :dsc_xexchreceiveconnector do
    Puppet::Type.type(:dsc_xexchreceiveconnector).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchreceiveconnector.to_s).to eq("Dsc_xexchreceiveconnector[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xexchreceiveconnector[:ensure]).to eq :present
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchreceiveconnector[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchreceiveconnector).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_ensure => 'Present',
      :dsc_advertiseclientsettings => true,
      :dsc_authmechanism => ["foo", "bar", "spec"],
      :dsc_banner => 'foo',
      :dsc_barelinefeedrejectionenabled => true,
      :dsc_binarymimeenabled => true,
      :dsc_bindings => ["foo", "bar", "spec"],
      :dsc_chunkingenabled => true,
      :dsc_comment => 'foo',
      :dsc_connectioninactivitytimeout => 'foo',
      :dsc_connectiontimeout => 'foo',
      :dsc_defaultdomain => 'foo',
      :dsc_deliverystatusnotificationenabled => true,
      :dsc_domaincontroller => 'foo',
      :dsc_domainsecureenabled => true,
      :dsc_eightbitmimeenabled => true,
      :dsc_enableauthgssapi => true,
      :dsc_enabled => true,
      :dsc_enhancedstatuscodesenabled => true,
      :dsc_extendedprotectionpolicy => 'None',
      :dsc_fqdn => 'foo',
      :dsc_longaddressesenabled => true,
      :dsc_maxacknowledgementdelay => 'foo',
      :dsc_maxheadersize => 'foo',
      :dsc_maxhopcount => -32,
      :dsc_maxinboundconnection => 'foo',
      :dsc_maxinboundconnectionpercentagepersource => -32,
      :dsc_maxinboundconnectionpersource => 'foo',
      :dsc_maxlocalhopcount => -32,
      :dsc_maxlogonfailures => -32,
      :dsc_maxmessagesize => 'foo',
      :dsc_maxprotocolerrors => 'foo',
      :dsc_maxrecipientspermessage => -32,
      :dsc_messageratelimit => 'foo',
      :dsc_messageratesource => 'None',
      :dsc_orarenabled => true,
      :dsc_permissiongroups => ["foo", "bar", "spec"],
      :dsc_pipeliningenabled => true,
      :dsc_protocollogginglevel => 'None',
      :dsc_remoteipranges => ["foo", "bar", "spec"],
      :dsc_requireehlodomain => true,
      :dsc_requiretls => true,
      :dsc_servicediscoveryfqdn => 'foo',
      :dsc_sizeenabled => 'Enabled',
      :dsc_suppressxanonymoustls => true,
      :dsc_tarpitinterval => 'foo',
      :dsc_tlscertificatename => 'foo',
      :dsc_tlsdomaincapabilities => ["foo", "bar", "spec"],
      :dsc_transportrole => 'FrontendTransport',
      :dsc_usage => 'Client',
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchreceiveconnector[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchreceiveconnector[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchreceiveconnector[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchreceiveconnector[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchreceiveconnector[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchreceiveconnector[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchreceiveconnector[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchreceiveconnector[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchreceiveconnector[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xexchreceiveconnector[:dsc_ensure] = 'Present'
    expect(dsc_xexchreceiveconnector[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xexchreceiveconnector[:dsc_ensure] = 'present'
    expect(dsc_xexchreceiveconnector[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xexchreceiveconnector[:dsc_ensure] = 'present'
    expect(dsc_xexchreceiveconnector[:ensure]).to eq(dsc_xexchreceiveconnector[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xexchreceiveconnector[:dsc_ensure] = 'Absent'
    expect(dsc_xexchreceiveconnector[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xexchreceiveconnector[:dsc_ensure] = 'absent'
    expect(dsc_xexchreceiveconnector[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xexchreceiveconnector[:dsc_ensure] = 'absent'
    expect(dsc_xexchreceiveconnector[:ensure]).to eq(dsc_xexchreceiveconnector[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchreceiveconnector[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xexchreceiveconnector[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xexchreceiveconnector[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xexchreceiveconnector[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xexchreceiveconnector[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_advertiseclientsettings' do
    expect{dsc_xexchreceiveconnector[:dsc_advertiseclientsettings] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_advertiseclientsettings' do
    dsc_xexchreceiveconnector[:dsc_advertiseclientsettings] = true
    expect(dsc_xexchreceiveconnector[:dsc_advertiseclientsettings]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_advertiseclientsettings" do
    dsc_xexchreceiveconnector[:dsc_advertiseclientsettings] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_advertiseclientsettings]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_advertiseclientsettings" do
    dsc_xexchreceiveconnector[:dsc_advertiseclientsettings] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_advertiseclientsettings]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_advertiseclientsettings" do
    dsc_xexchreceiveconnector[:dsc_advertiseclientsettings] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_advertiseclientsettings]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_advertiseclientsettings" do
    dsc_xexchreceiveconnector[:dsc_advertiseclientsettings] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_advertiseclientsettings]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_advertiseclientsettings" do
    dsc_xexchreceiveconnector[:dsc_advertiseclientsettings] = :true
    expect(dsc_xexchreceiveconnector[:dsc_advertiseclientsettings]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_advertiseclientsettings" do
    dsc_xexchreceiveconnector[:dsc_advertiseclientsettings] = :false
    expect(dsc_xexchreceiveconnector[:dsc_advertiseclientsettings]).to eq(false)
  end

  it 'should not accept int for dsc_advertiseclientsettings' do
    expect{dsc_xexchreceiveconnector[:dsc_advertiseclientsettings] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_advertiseclientsettings' do
    expect{dsc_xexchreceiveconnector[:dsc_advertiseclientsettings] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_authmechanism' do
    dsc_xexchreceiveconnector[:dsc_authmechanism] = ["foo", "bar", "spec"]
    expect(dsc_xexchreceiveconnector[:dsc_authmechanism]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_authmechanism' do
    expect{dsc_xexchreceiveconnector[:dsc_authmechanism] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_authmechanism' do
    expect{dsc_xexchreceiveconnector[:dsc_authmechanism] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_authmechanism' do
    expect{dsc_xexchreceiveconnector[:dsc_authmechanism] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_banner' do
    expect{dsc_xexchreceiveconnector[:dsc_banner] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_banner' do
    expect{dsc_xexchreceiveconnector[:dsc_banner] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_banner' do
    expect{dsc_xexchreceiveconnector[:dsc_banner] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_banner' do
    expect{dsc_xexchreceiveconnector[:dsc_banner] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_barelinefeedrejectionenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_barelinefeedrejectionenabled' do
    dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled] = true
    expect(dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_barelinefeedrejectionenabled" do
    dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_barelinefeedrejectionenabled" do
    dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_barelinefeedrejectionenabled" do
    dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_barelinefeedrejectionenabled" do
    dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_barelinefeedrejectionenabled" do
    dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled] = :true
    expect(dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_barelinefeedrejectionenabled" do
    dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled] = :false
    expect(dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled]).to eq(false)
  end

  it 'should not accept int for dsc_barelinefeedrejectionenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_barelinefeedrejectionenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_barelinefeedrejectionenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_binarymimeenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_binarymimeenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_binarymimeenabled' do
    dsc_xexchreceiveconnector[:dsc_binarymimeenabled] = true
    expect(dsc_xexchreceiveconnector[:dsc_binarymimeenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_binarymimeenabled" do
    dsc_xexchreceiveconnector[:dsc_binarymimeenabled] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_binarymimeenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_binarymimeenabled" do
    dsc_xexchreceiveconnector[:dsc_binarymimeenabled] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_binarymimeenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_binarymimeenabled" do
    dsc_xexchreceiveconnector[:dsc_binarymimeenabled] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_binarymimeenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_binarymimeenabled" do
    dsc_xexchreceiveconnector[:dsc_binarymimeenabled] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_binarymimeenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_binarymimeenabled" do
    dsc_xexchreceiveconnector[:dsc_binarymimeenabled] = :true
    expect(dsc_xexchreceiveconnector[:dsc_binarymimeenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_binarymimeenabled" do
    dsc_xexchreceiveconnector[:dsc_binarymimeenabled] = :false
    expect(dsc_xexchreceiveconnector[:dsc_binarymimeenabled]).to eq(false)
  end

  it 'should not accept int for dsc_binarymimeenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_binarymimeenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_binarymimeenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_binarymimeenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_bindings' do
    dsc_xexchreceiveconnector[:dsc_bindings] = ["foo", "bar", "spec"]
    expect(dsc_xexchreceiveconnector[:dsc_bindings]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_bindings' do
    expect{dsc_xexchreceiveconnector[:dsc_bindings] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_bindings' do
    expect{dsc_xexchreceiveconnector[:dsc_bindings] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_bindings' do
    expect{dsc_xexchreceiveconnector[:dsc_bindings] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_chunkingenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_chunkingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_chunkingenabled' do
    dsc_xexchreceiveconnector[:dsc_chunkingenabled] = true
    expect(dsc_xexchreceiveconnector[:dsc_chunkingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_chunkingenabled" do
    dsc_xexchreceiveconnector[:dsc_chunkingenabled] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_chunkingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_chunkingenabled" do
    dsc_xexchreceiveconnector[:dsc_chunkingenabled] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_chunkingenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_chunkingenabled" do
    dsc_xexchreceiveconnector[:dsc_chunkingenabled] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_chunkingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_chunkingenabled" do
    dsc_xexchreceiveconnector[:dsc_chunkingenabled] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_chunkingenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_chunkingenabled" do
    dsc_xexchreceiveconnector[:dsc_chunkingenabled] = :true
    expect(dsc_xexchreceiveconnector[:dsc_chunkingenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_chunkingenabled" do
    dsc_xexchreceiveconnector[:dsc_chunkingenabled] = :false
    expect(dsc_xexchreceiveconnector[:dsc_chunkingenabled]).to eq(false)
  end

  it 'should not accept int for dsc_chunkingenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_chunkingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_chunkingenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_chunkingenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_comment' do
    expect{dsc_xexchreceiveconnector[:dsc_comment] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_comment' do
    expect{dsc_xexchreceiveconnector[:dsc_comment] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_comment' do
    expect{dsc_xexchreceiveconnector[:dsc_comment] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_comment' do
    expect{dsc_xexchreceiveconnector[:dsc_comment] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectioninactivitytimeout' do
    expect{dsc_xexchreceiveconnector[:dsc_connectioninactivitytimeout] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectioninactivitytimeout' do
    expect{dsc_xexchreceiveconnector[:dsc_connectioninactivitytimeout] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectioninactivitytimeout' do
    expect{dsc_xexchreceiveconnector[:dsc_connectioninactivitytimeout] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectioninactivitytimeout' do
    expect{dsc_xexchreceiveconnector[:dsc_connectioninactivitytimeout] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectiontimeout' do
    expect{dsc_xexchreceiveconnector[:dsc_connectiontimeout] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectiontimeout' do
    expect{dsc_xexchreceiveconnector[:dsc_connectiontimeout] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectiontimeout' do
    expect{dsc_xexchreceiveconnector[:dsc_connectiontimeout] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectiontimeout' do
    expect{dsc_xexchreceiveconnector[:dsc_connectiontimeout] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_defaultdomain' do
    expect{dsc_xexchreceiveconnector[:dsc_defaultdomain] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_defaultdomain' do
    expect{dsc_xexchreceiveconnector[:dsc_defaultdomain] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_defaultdomain' do
    expect{dsc_xexchreceiveconnector[:dsc_defaultdomain] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_defaultdomain' do
    expect{dsc_xexchreceiveconnector[:dsc_defaultdomain] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_deliverystatusnotificationenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_deliverystatusnotificationenabled' do
    dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled] = true
    expect(dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_deliverystatusnotificationenabled" do
    dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_deliverystatusnotificationenabled" do
    dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_deliverystatusnotificationenabled" do
    dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_deliverystatusnotificationenabled" do
    dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_deliverystatusnotificationenabled" do
    dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled] = :true
    expect(dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_deliverystatusnotificationenabled" do
    dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled] = :false
    expect(dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled]).to eq(false)
  end

  it 'should not accept int for dsc_deliverystatusnotificationenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_deliverystatusnotificationenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_deliverystatusnotificationenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchreceiveconnector[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchreceiveconnector[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchreceiveconnector[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchreceiveconnector[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainsecureenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_domainsecureenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_domainsecureenabled' do
    dsc_xexchreceiveconnector[:dsc_domainsecureenabled] = true
    expect(dsc_xexchreceiveconnector[:dsc_domainsecureenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_domainsecureenabled" do
    dsc_xexchreceiveconnector[:dsc_domainsecureenabled] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_domainsecureenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_domainsecureenabled" do
    dsc_xexchreceiveconnector[:dsc_domainsecureenabled] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_domainsecureenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_domainsecureenabled" do
    dsc_xexchreceiveconnector[:dsc_domainsecureenabled] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_domainsecureenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_domainsecureenabled" do
    dsc_xexchreceiveconnector[:dsc_domainsecureenabled] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_domainsecureenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_domainsecureenabled" do
    dsc_xexchreceiveconnector[:dsc_domainsecureenabled] = :true
    expect(dsc_xexchreceiveconnector[:dsc_domainsecureenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_domainsecureenabled" do
    dsc_xexchreceiveconnector[:dsc_domainsecureenabled] = :false
    expect(dsc_xexchreceiveconnector[:dsc_domainsecureenabled]).to eq(false)
  end

  it 'should not accept int for dsc_domainsecureenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_domainsecureenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainsecureenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_domainsecureenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_eightbitmimeenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_eightbitmimeenabled' do
    dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled] = true
    expect(dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_eightbitmimeenabled" do
    dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_eightbitmimeenabled" do
    dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_eightbitmimeenabled" do
    dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_eightbitmimeenabled" do
    dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_eightbitmimeenabled" do
    dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled] = :true
    expect(dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_eightbitmimeenabled" do
    dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled] = :false
    expect(dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled]).to eq(false)
  end

  it 'should not accept int for dsc_eightbitmimeenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_eightbitmimeenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_eightbitmimeenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enableauthgssapi' do
    expect{dsc_xexchreceiveconnector[:dsc_enableauthgssapi] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enableauthgssapi' do
    dsc_xexchreceiveconnector[:dsc_enableauthgssapi] = true
    expect(dsc_xexchreceiveconnector[:dsc_enableauthgssapi]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enableauthgssapi" do
    dsc_xexchreceiveconnector[:dsc_enableauthgssapi] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_enableauthgssapi]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enableauthgssapi" do
    dsc_xexchreceiveconnector[:dsc_enableauthgssapi] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_enableauthgssapi]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enableauthgssapi" do
    dsc_xexchreceiveconnector[:dsc_enableauthgssapi] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_enableauthgssapi]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enableauthgssapi" do
    dsc_xexchreceiveconnector[:dsc_enableauthgssapi] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_enableauthgssapi]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enableauthgssapi" do
    dsc_xexchreceiveconnector[:dsc_enableauthgssapi] = :true
    expect(dsc_xexchreceiveconnector[:dsc_enableauthgssapi]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enableauthgssapi" do
    dsc_xexchreceiveconnector[:dsc_enableauthgssapi] = :false
    expect(dsc_xexchreceiveconnector[:dsc_enableauthgssapi]).to eq(false)
  end

  it 'should not accept int for dsc_enableauthgssapi' do
    expect{dsc_xexchreceiveconnector[:dsc_enableauthgssapi] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enableauthgssapi' do
    expect{dsc_xexchreceiveconnector[:dsc_enableauthgssapi] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enabled' do
    expect{dsc_xexchreceiveconnector[:dsc_enabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enabled' do
    dsc_xexchreceiveconnector[:dsc_enabled] = true
    expect(dsc_xexchreceiveconnector[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enabled" do
    dsc_xexchreceiveconnector[:dsc_enabled] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enabled" do
    dsc_xexchreceiveconnector[:dsc_enabled] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enabled" do
    dsc_xexchreceiveconnector[:dsc_enabled] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enabled" do
    dsc_xexchreceiveconnector[:dsc_enabled] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enabled" do
    dsc_xexchreceiveconnector[:dsc_enabled] = :true
    expect(dsc_xexchreceiveconnector[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enabled" do
    dsc_xexchreceiveconnector[:dsc_enabled] = :false
    expect(dsc_xexchreceiveconnector[:dsc_enabled]).to eq(false)
  end

  it 'should not accept int for dsc_enabled' do
    expect{dsc_xexchreceiveconnector[:dsc_enabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabled' do
    expect{dsc_xexchreceiveconnector[:dsc_enabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enhancedstatuscodesenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enhancedstatuscodesenabled' do
    dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled] = true
    expect(dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enhancedstatuscodesenabled" do
    dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enhancedstatuscodesenabled" do
    dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enhancedstatuscodesenabled" do
    dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enhancedstatuscodesenabled" do
    dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enhancedstatuscodesenabled" do
    dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled] = :true
    expect(dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enhancedstatuscodesenabled" do
    dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled] = :false
    expect(dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled]).to eq(false)
  end

  it 'should not accept int for dsc_enhancedstatuscodesenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enhancedstatuscodesenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_enhancedstatuscodesenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_extendedprotectionpolicy predefined value None' do
    dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy] = 'None'
    expect(dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy]).to eq('None')
  end

  it 'should accept dsc_extendedprotectionpolicy predefined value none' do
    dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy] = 'none'
    expect(dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy]).to eq('none')
  end

  it 'should accept dsc_extendedprotectionpolicy predefined value Allow' do
    dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy] = 'Allow'
    expect(dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy]).to eq('Allow')
  end

  it 'should accept dsc_extendedprotectionpolicy predefined value allow' do
    dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy] = 'allow'
    expect(dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy]).to eq('allow')
  end

  it 'should accept dsc_extendedprotectionpolicy predefined value Require' do
    dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy] = 'Require'
    expect(dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy]).to eq('Require')
  end

  it 'should accept dsc_extendedprotectionpolicy predefined value require' do
    dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy] = 'require'
    expect(dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy]).to eq('require')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_extendedprotectionpolicy' do
    expect{dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_extendedprotectionpolicy' do
    expect{dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_extendedprotectionpolicy' do
    expect{dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_extendedprotectionpolicy' do
    expect{dsc_xexchreceiveconnector[:dsc_extendedprotectionpolicy] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_fqdn' do
    expect{dsc_xexchreceiveconnector[:dsc_fqdn] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_fqdn' do
    expect{dsc_xexchreceiveconnector[:dsc_fqdn] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_fqdn' do
    expect{dsc_xexchreceiveconnector[:dsc_fqdn] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_fqdn' do
    expect{dsc_xexchreceiveconnector[:dsc_fqdn] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_longaddressesenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_longaddressesenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_longaddressesenabled' do
    dsc_xexchreceiveconnector[:dsc_longaddressesenabled] = true
    expect(dsc_xexchreceiveconnector[:dsc_longaddressesenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_longaddressesenabled" do
    dsc_xexchreceiveconnector[:dsc_longaddressesenabled] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_longaddressesenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_longaddressesenabled" do
    dsc_xexchreceiveconnector[:dsc_longaddressesenabled] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_longaddressesenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_longaddressesenabled" do
    dsc_xexchreceiveconnector[:dsc_longaddressesenabled] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_longaddressesenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_longaddressesenabled" do
    dsc_xexchreceiveconnector[:dsc_longaddressesenabled] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_longaddressesenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_longaddressesenabled" do
    dsc_xexchreceiveconnector[:dsc_longaddressesenabled] = :true
    expect(dsc_xexchreceiveconnector[:dsc_longaddressesenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_longaddressesenabled" do
    dsc_xexchreceiveconnector[:dsc_longaddressesenabled] = :false
    expect(dsc_xexchreceiveconnector[:dsc_longaddressesenabled]).to eq(false)
  end

  it 'should not accept int for dsc_longaddressesenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_longaddressesenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_longaddressesenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_longaddressesenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxacknowledgementdelay' do
    expect{dsc_xexchreceiveconnector[:dsc_maxacknowledgementdelay] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxacknowledgementdelay' do
    expect{dsc_xexchreceiveconnector[:dsc_maxacknowledgementdelay] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maxacknowledgementdelay' do
    expect{dsc_xexchreceiveconnector[:dsc_maxacknowledgementdelay] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_maxacknowledgementdelay' do
    expect{dsc_xexchreceiveconnector[:dsc_maxacknowledgementdelay] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxheadersize' do
    expect{dsc_xexchreceiveconnector[:dsc_maxheadersize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxheadersize' do
    expect{dsc_xexchreceiveconnector[:dsc_maxheadersize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maxheadersize' do
    expect{dsc_xexchreceiveconnector[:dsc_maxheadersize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_maxheadersize' do
    expect{dsc_xexchreceiveconnector[:dsc_maxheadersize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxhopcount' do
    expect{dsc_xexchreceiveconnector[:dsc_maxhopcount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxhopcount' do
    expect{dsc_xexchreceiveconnector[:dsc_maxhopcount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_maxhopcount' do
    dsc_xexchreceiveconnector[:dsc_maxhopcount] = -32
    expect(dsc_xexchreceiveconnector[:dsc_maxhopcount]).to eq(-32)
  end

  it 'should accept string-like int for dsc_maxhopcount' do
    dsc_xexchreceiveconnector[:dsc_maxhopcount] = '16'
    expect(dsc_xexchreceiveconnector[:dsc_maxhopcount]).to eq(16)
  end

  it 'should accept string-like int for dsc_maxhopcount' do
    dsc_xexchreceiveconnector[:dsc_maxhopcount] = '-16'
    expect(dsc_xexchreceiveconnector[:dsc_maxhopcount]).to eq(-16)
  end

  it 'should accept string-like int for dsc_maxhopcount' do
    dsc_xexchreceiveconnector[:dsc_maxhopcount] = '32'
    expect(dsc_xexchreceiveconnector[:dsc_maxhopcount]).to eq(32)
  end

  it 'should accept string-like int for dsc_maxhopcount' do
    dsc_xexchreceiveconnector[:dsc_maxhopcount] = '-32'
    expect(dsc_xexchreceiveconnector[:dsc_maxhopcount]).to eq(-32)
  end


  it 'should not accept array for dsc_maxinboundconnection' do
    expect{dsc_xexchreceiveconnector[:dsc_maxinboundconnection] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxinboundconnection' do
    expect{dsc_xexchreceiveconnector[:dsc_maxinboundconnection] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maxinboundconnection' do
    expect{dsc_xexchreceiveconnector[:dsc_maxinboundconnection] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_maxinboundconnection' do
    expect{dsc_xexchreceiveconnector[:dsc_maxinboundconnection] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxinboundconnectionpercentagepersource' do
    expect{dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpercentagepersource] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxinboundconnectionpercentagepersource' do
    expect{dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpercentagepersource] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_maxinboundconnectionpercentagepersource' do
    dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpercentagepersource] = -32
    expect(dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpercentagepersource]).to eq(-32)
  end

  it 'should accept string-like int for dsc_maxinboundconnectionpercentagepersource' do
    dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpercentagepersource] = '16'
    expect(dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpercentagepersource]).to eq(16)
  end

  it 'should accept string-like int for dsc_maxinboundconnectionpercentagepersource' do
    dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpercentagepersource] = '-16'
    expect(dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpercentagepersource]).to eq(-16)
  end

  it 'should accept string-like int for dsc_maxinboundconnectionpercentagepersource' do
    dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpercentagepersource] = '32'
    expect(dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpercentagepersource]).to eq(32)
  end

  it 'should accept string-like int for dsc_maxinboundconnectionpercentagepersource' do
    dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpercentagepersource] = '-32'
    expect(dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpercentagepersource]).to eq(-32)
  end


  it 'should not accept array for dsc_maxinboundconnectionpersource' do
    expect{dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpersource] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxinboundconnectionpersource' do
    expect{dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpersource] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maxinboundconnectionpersource' do
    expect{dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpersource] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_maxinboundconnectionpersource' do
    expect{dsc_xexchreceiveconnector[:dsc_maxinboundconnectionpersource] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxlocalhopcount' do
    expect{dsc_xexchreceiveconnector[:dsc_maxlocalhopcount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxlocalhopcount' do
    expect{dsc_xexchreceiveconnector[:dsc_maxlocalhopcount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_maxlocalhopcount' do
    dsc_xexchreceiveconnector[:dsc_maxlocalhopcount] = -32
    expect(dsc_xexchreceiveconnector[:dsc_maxlocalhopcount]).to eq(-32)
  end

  it 'should accept string-like int for dsc_maxlocalhopcount' do
    dsc_xexchreceiveconnector[:dsc_maxlocalhopcount] = '16'
    expect(dsc_xexchreceiveconnector[:dsc_maxlocalhopcount]).to eq(16)
  end

  it 'should accept string-like int for dsc_maxlocalhopcount' do
    dsc_xexchreceiveconnector[:dsc_maxlocalhopcount] = '-16'
    expect(dsc_xexchreceiveconnector[:dsc_maxlocalhopcount]).to eq(-16)
  end

  it 'should accept string-like int for dsc_maxlocalhopcount' do
    dsc_xexchreceiveconnector[:dsc_maxlocalhopcount] = '32'
    expect(dsc_xexchreceiveconnector[:dsc_maxlocalhopcount]).to eq(32)
  end

  it 'should accept string-like int for dsc_maxlocalhopcount' do
    dsc_xexchreceiveconnector[:dsc_maxlocalhopcount] = '-32'
    expect(dsc_xexchreceiveconnector[:dsc_maxlocalhopcount]).to eq(-32)
  end


  it 'should not accept array for dsc_maxlogonfailures' do
    expect{dsc_xexchreceiveconnector[:dsc_maxlogonfailures] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxlogonfailures' do
    expect{dsc_xexchreceiveconnector[:dsc_maxlogonfailures] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_maxlogonfailures' do
    dsc_xexchreceiveconnector[:dsc_maxlogonfailures] = -32
    expect(dsc_xexchreceiveconnector[:dsc_maxlogonfailures]).to eq(-32)
  end

  it 'should accept string-like int for dsc_maxlogonfailures' do
    dsc_xexchreceiveconnector[:dsc_maxlogonfailures] = '16'
    expect(dsc_xexchreceiveconnector[:dsc_maxlogonfailures]).to eq(16)
  end

  it 'should accept string-like int for dsc_maxlogonfailures' do
    dsc_xexchreceiveconnector[:dsc_maxlogonfailures] = '-16'
    expect(dsc_xexchreceiveconnector[:dsc_maxlogonfailures]).to eq(-16)
  end

  it 'should accept string-like int for dsc_maxlogonfailures' do
    dsc_xexchreceiveconnector[:dsc_maxlogonfailures] = '32'
    expect(dsc_xexchreceiveconnector[:dsc_maxlogonfailures]).to eq(32)
  end

  it 'should accept string-like int for dsc_maxlogonfailures' do
    dsc_xexchreceiveconnector[:dsc_maxlogonfailures] = '-32'
    expect(dsc_xexchreceiveconnector[:dsc_maxlogonfailures]).to eq(-32)
  end


  it 'should not accept array for dsc_maxmessagesize' do
    expect{dsc_xexchreceiveconnector[:dsc_maxmessagesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxmessagesize' do
    expect{dsc_xexchreceiveconnector[:dsc_maxmessagesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maxmessagesize' do
    expect{dsc_xexchreceiveconnector[:dsc_maxmessagesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_maxmessagesize' do
    expect{dsc_xexchreceiveconnector[:dsc_maxmessagesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxprotocolerrors' do
    expect{dsc_xexchreceiveconnector[:dsc_maxprotocolerrors] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxprotocolerrors' do
    expect{dsc_xexchreceiveconnector[:dsc_maxprotocolerrors] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maxprotocolerrors' do
    expect{dsc_xexchreceiveconnector[:dsc_maxprotocolerrors] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_maxprotocolerrors' do
    expect{dsc_xexchreceiveconnector[:dsc_maxprotocolerrors] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxrecipientspermessage' do
    expect{dsc_xexchreceiveconnector[:dsc_maxrecipientspermessage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxrecipientspermessage' do
    expect{dsc_xexchreceiveconnector[:dsc_maxrecipientspermessage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_maxrecipientspermessage' do
    dsc_xexchreceiveconnector[:dsc_maxrecipientspermessage] = -32
    expect(dsc_xexchreceiveconnector[:dsc_maxrecipientspermessage]).to eq(-32)
  end

  it 'should accept string-like int for dsc_maxrecipientspermessage' do
    dsc_xexchreceiveconnector[:dsc_maxrecipientspermessage] = '16'
    expect(dsc_xexchreceiveconnector[:dsc_maxrecipientspermessage]).to eq(16)
  end

  it 'should accept string-like int for dsc_maxrecipientspermessage' do
    dsc_xexchreceiveconnector[:dsc_maxrecipientspermessage] = '-16'
    expect(dsc_xexchreceiveconnector[:dsc_maxrecipientspermessage]).to eq(-16)
  end

  it 'should accept string-like int for dsc_maxrecipientspermessage' do
    dsc_xexchreceiveconnector[:dsc_maxrecipientspermessage] = '32'
    expect(dsc_xexchreceiveconnector[:dsc_maxrecipientspermessage]).to eq(32)
  end

  it 'should accept string-like int for dsc_maxrecipientspermessage' do
    dsc_xexchreceiveconnector[:dsc_maxrecipientspermessage] = '-32'
    expect(dsc_xexchreceiveconnector[:dsc_maxrecipientspermessage]).to eq(-32)
  end


  it 'should not accept array for dsc_messageratelimit' do
    expect{dsc_xexchreceiveconnector[:dsc_messageratelimit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_messageratelimit' do
    expect{dsc_xexchreceiveconnector[:dsc_messageratelimit] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_messageratelimit' do
    expect{dsc_xexchreceiveconnector[:dsc_messageratelimit] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_messageratelimit' do
    expect{dsc_xexchreceiveconnector[:dsc_messageratelimit] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_messageratesource predefined value None' do
    dsc_xexchreceiveconnector[:dsc_messageratesource] = 'None'
    expect(dsc_xexchreceiveconnector[:dsc_messageratesource]).to eq('None')
  end

  it 'should accept dsc_messageratesource predefined value none' do
    dsc_xexchreceiveconnector[:dsc_messageratesource] = 'none'
    expect(dsc_xexchreceiveconnector[:dsc_messageratesource]).to eq('none')
  end

  it 'should accept dsc_messageratesource predefined value IPAddress' do
    dsc_xexchreceiveconnector[:dsc_messageratesource] = 'IPAddress'
    expect(dsc_xexchreceiveconnector[:dsc_messageratesource]).to eq('IPAddress')
  end

  it 'should accept dsc_messageratesource predefined value ipaddress' do
    dsc_xexchreceiveconnector[:dsc_messageratesource] = 'ipaddress'
    expect(dsc_xexchreceiveconnector[:dsc_messageratesource]).to eq('ipaddress')
  end

  it 'should accept dsc_messageratesource predefined value User' do
    dsc_xexchreceiveconnector[:dsc_messageratesource] = 'User'
    expect(dsc_xexchreceiveconnector[:dsc_messageratesource]).to eq('User')
  end

  it 'should accept dsc_messageratesource predefined value user' do
    dsc_xexchreceiveconnector[:dsc_messageratesource] = 'user'
    expect(dsc_xexchreceiveconnector[:dsc_messageratesource]).to eq('user')
  end

  it 'should accept dsc_messageratesource predefined value All' do
    dsc_xexchreceiveconnector[:dsc_messageratesource] = 'All'
    expect(dsc_xexchreceiveconnector[:dsc_messageratesource]).to eq('All')
  end

  it 'should accept dsc_messageratesource predefined value all' do
    dsc_xexchreceiveconnector[:dsc_messageratesource] = 'all'
    expect(dsc_xexchreceiveconnector[:dsc_messageratesource]).to eq('all')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchreceiveconnector[:dsc_messageratesource] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_messageratesource' do
    expect{dsc_xexchreceiveconnector[:dsc_messageratesource] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_messageratesource' do
    expect{dsc_xexchreceiveconnector[:dsc_messageratesource] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_messageratesource' do
    expect{dsc_xexchreceiveconnector[:dsc_messageratesource] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_messageratesource' do
    expect{dsc_xexchreceiveconnector[:dsc_messageratesource] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_orarenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_orarenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_orarenabled' do
    dsc_xexchreceiveconnector[:dsc_orarenabled] = true
    expect(dsc_xexchreceiveconnector[:dsc_orarenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_orarenabled" do
    dsc_xexchreceiveconnector[:dsc_orarenabled] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_orarenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_orarenabled" do
    dsc_xexchreceiveconnector[:dsc_orarenabled] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_orarenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_orarenabled" do
    dsc_xexchreceiveconnector[:dsc_orarenabled] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_orarenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_orarenabled" do
    dsc_xexchreceiveconnector[:dsc_orarenabled] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_orarenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_orarenabled" do
    dsc_xexchreceiveconnector[:dsc_orarenabled] = :true
    expect(dsc_xexchreceiveconnector[:dsc_orarenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_orarenabled" do
    dsc_xexchreceiveconnector[:dsc_orarenabled] = :false
    expect(dsc_xexchreceiveconnector[:dsc_orarenabled]).to eq(false)
  end

  it 'should not accept int for dsc_orarenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_orarenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_orarenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_orarenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_permissiongroups' do
    dsc_xexchreceiveconnector[:dsc_permissiongroups] = ["foo", "bar", "spec"]
    expect(dsc_xexchreceiveconnector[:dsc_permissiongroups]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_permissiongroups' do
    expect{dsc_xexchreceiveconnector[:dsc_permissiongroups] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_permissiongroups' do
    expect{dsc_xexchreceiveconnector[:dsc_permissiongroups] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_permissiongroups' do
    expect{dsc_xexchreceiveconnector[:dsc_permissiongroups] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pipeliningenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_pipeliningenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_pipeliningenabled' do
    dsc_xexchreceiveconnector[:dsc_pipeliningenabled] = true
    expect(dsc_xexchreceiveconnector[:dsc_pipeliningenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_pipeliningenabled" do
    dsc_xexchreceiveconnector[:dsc_pipeliningenabled] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_pipeliningenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_pipeliningenabled" do
    dsc_xexchreceiveconnector[:dsc_pipeliningenabled] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_pipeliningenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_pipeliningenabled" do
    dsc_xexchreceiveconnector[:dsc_pipeliningenabled] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_pipeliningenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_pipeliningenabled" do
    dsc_xexchreceiveconnector[:dsc_pipeliningenabled] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_pipeliningenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_pipeliningenabled" do
    dsc_xexchreceiveconnector[:dsc_pipeliningenabled] = :true
    expect(dsc_xexchreceiveconnector[:dsc_pipeliningenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_pipeliningenabled" do
    dsc_xexchreceiveconnector[:dsc_pipeliningenabled] = :false
    expect(dsc_xexchreceiveconnector[:dsc_pipeliningenabled]).to eq(false)
  end

  it 'should not accept int for dsc_pipeliningenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_pipeliningenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pipeliningenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_pipeliningenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_protocollogginglevel predefined value None' do
    dsc_xexchreceiveconnector[:dsc_protocollogginglevel] = 'None'
    expect(dsc_xexchreceiveconnector[:dsc_protocollogginglevel]).to eq('None')
  end

  it 'should accept dsc_protocollogginglevel predefined value none' do
    dsc_xexchreceiveconnector[:dsc_protocollogginglevel] = 'none'
    expect(dsc_xexchreceiveconnector[:dsc_protocollogginglevel]).to eq('none')
  end

  it 'should accept dsc_protocollogginglevel predefined value Verbose' do
    dsc_xexchreceiveconnector[:dsc_protocollogginglevel] = 'Verbose'
    expect(dsc_xexchreceiveconnector[:dsc_protocollogginglevel]).to eq('Verbose')
  end

  it 'should accept dsc_protocollogginglevel predefined value verbose' do
    dsc_xexchreceiveconnector[:dsc_protocollogginglevel] = 'verbose'
    expect(dsc_xexchreceiveconnector[:dsc_protocollogginglevel]).to eq('verbose')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchreceiveconnector[:dsc_protocollogginglevel] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_protocollogginglevel' do
    expect{dsc_xexchreceiveconnector[:dsc_protocollogginglevel] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_protocollogginglevel' do
    expect{dsc_xexchreceiveconnector[:dsc_protocollogginglevel] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_protocollogginglevel' do
    expect{dsc_xexchreceiveconnector[:dsc_protocollogginglevel] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_protocollogginglevel' do
    expect{dsc_xexchreceiveconnector[:dsc_protocollogginglevel] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_remoteipranges' do
    dsc_xexchreceiveconnector[:dsc_remoteipranges] = ["foo", "bar", "spec"]
    expect(dsc_xexchreceiveconnector[:dsc_remoteipranges]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_remoteipranges' do
    expect{dsc_xexchreceiveconnector[:dsc_remoteipranges] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_remoteipranges' do
    expect{dsc_xexchreceiveconnector[:dsc_remoteipranges] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_remoteipranges' do
    expect{dsc_xexchreceiveconnector[:dsc_remoteipranges] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_requireehlodomain' do
    expect{dsc_xexchreceiveconnector[:dsc_requireehlodomain] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_requireehlodomain' do
    dsc_xexchreceiveconnector[:dsc_requireehlodomain] = true
    expect(dsc_xexchreceiveconnector[:dsc_requireehlodomain]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_requireehlodomain" do
    dsc_xexchreceiveconnector[:dsc_requireehlodomain] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_requireehlodomain]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_requireehlodomain" do
    dsc_xexchreceiveconnector[:dsc_requireehlodomain] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_requireehlodomain]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_requireehlodomain" do
    dsc_xexchreceiveconnector[:dsc_requireehlodomain] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_requireehlodomain]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_requireehlodomain" do
    dsc_xexchreceiveconnector[:dsc_requireehlodomain] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_requireehlodomain]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_requireehlodomain" do
    dsc_xexchreceiveconnector[:dsc_requireehlodomain] = :true
    expect(dsc_xexchreceiveconnector[:dsc_requireehlodomain]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_requireehlodomain" do
    dsc_xexchreceiveconnector[:dsc_requireehlodomain] = :false
    expect(dsc_xexchreceiveconnector[:dsc_requireehlodomain]).to eq(false)
  end

  it 'should not accept int for dsc_requireehlodomain' do
    expect{dsc_xexchreceiveconnector[:dsc_requireehlodomain] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_requireehlodomain' do
    expect{dsc_xexchreceiveconnector[:dsc_requireehlodomain] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_requiretls' do
    expect{dsc_xexchreceiveconnector[:dsc_requiretls] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_requiretls' do
    dsc_xexchreceiveconnector[:dsc_requiretls] = true
    expect(dsc_xexchreceiveconnector[:dsc_requiretls]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_requiretls" do
    dsc_xexchreceiveconnector[:dsc_requiretls] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_requiretls]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_requiretls" do
    dsc_xexchreceiveconnector[:dsc_requiretls] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_requiretls]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_requiretls" do
    dsc_xexchreceiveconnector[:dsc_requiretls] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_requiretls]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_requiretls" do
    dsc_xexchreceiveconnector[:dsc_requiretls] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_requiretls]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_requiretls" do
    dsc_xexchreceiveconnector[:dsc_requiretls] = :true
    expect(dsc_xexchreceiveconnector[:dsc_requiretls]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_requiretls" do
    dsc_xexchreceiveconnector[:dsc_requiretls] = :false
    expect(dsc_xexchreceiveconnector[:dsc_requiretls]).to eq(false)
  end

  it 'should not accept int for dsc_requiretls' do
    expect{dsc_xexchreceiveconnector[:dsc_requiretls] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_requiretls' do
    expect{dsc_xexchreceiveconnector[:dsc_requiretls] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_servicediscoveryfqdn' do
    expect{dsc_xexchreceiveconnector[:dsc_servicediscoveryfqdn] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servicediscoveryfqdn' do
    expect{dsc_xexchreceiveconnector[:dsc_servicediscoveryfqdn] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servicediscoveryfqdn' do
    expect{dsc_xexchreceiveconnector[:dsc_servicediscoveryfqdn] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servicediscoveryfqdn' do
    expect{dsc_xexchreceiveconnector[:dsc_servicediscoveryfqdn] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_sizeenabled predefined value Enabled' do
    dsc_xexchreceiveconnector[:dsc_sizeenabled] = 'Enabled'
    expect(dsc_xexchreceiveconnector[:dsc_sizeenabled]).to eq('Enabled')
  end

  it 'should accept dsc_sizeenabled predefined value enabled' do
    dsc_xexchreceiveconnector[:dsc_sizeenabled] = 'enabled'
    expect(dsc_xexchreceiveconnector[:dsc_sizeenabled]).to eq('enabled')
  end

  it 'should accept dsc_sizeenabled predefined value Disabled' do
    dsc_xexchreceiveconnector[:dsc_sizeenabled] = 'Disabled'
    expect(dsc_xexchreceiveconnector[:dsc_sizeenabled]).to eq('Disabled')
  end

  it 'should accept dsc_sizeenabled predefined value disabled' do
    dsc_xexchreceiveconnector[:dsc_sizeenabled] = 'disabled'
    expect(dsc_xexchreceiveconnector[:dsc_sizeenabled]).to eq('disabled')
  end

  it 'should accept dsc_sizeenabled predefined value EnabledWithoutValue' do
    dsc_xexchreceiveconnector[:dsc_sizeenabled] = 'EnabledWithoutValue'
    expect(dsc_xexchreceiveconnector[:dsc_sizeenabled]).to eq('EnabledWithoutValue')
  end

  it 'should accept dsc_sizeenabled predefined value enabledwithoutvalue' do
    dsc_xexchreceiveconnector[:dsc_sizeenabled] = 'enabledwithoutvalue'
    expect(dsc_xexchreceiveconnector[:dsc_sizeenabled]).to eq('enabledwithoutvalue')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchreceiveconnector[:dsc_sizeenabled] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sizeenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_sizeenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sizeenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_sizeenabled] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sizeenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_sizeenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sizeenabled' do
    expect{dsc_xexchreceiveconnector[:dsc_sizeenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_suppressxanonymoustls' do
    expect{dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_suppressxanonymoustls' do
    dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls] = true
    expect(dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_suppressxanonymoustls" do
    dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls] = 'true'
    expect(dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_suppressxanonymoustls" do
    dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls] = 'false'
    expect(dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_suppressxanonymoustls" do
    dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls] = 'True'
    expect(dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_suppressxanonymoustls" do
    dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls] = 'False'
    expect(dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_suppressxanonymoustls" do
    dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls] = :true
    expect(dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_suppressxanonymoustls" do
    dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls] = :false
    expect(dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls]).to eq(false)
  end

  it 'should not accept int for dsc_suppressxanonymoustls' do
    expect{dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_suppressxanonymoustls' do
    expect{dsc_xexchreceiveconnector[:dsc_suppressxanonymoustls] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_tarpitinterval' do
    expect{dsc_xexchreceiveconnector[:dsc_tarpitinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_tarpitinterval' do
    expect{dsc_xexchreceiveconnector[:dsc_tarpitinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_tarpitinterval' do
    expect{dsc_xexchreceiveconnector[:dsc_tarpitinterval] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_tarpitinterval' do
    expect{dsc_xexchreceiveconnector[:dsc_tarpitinterval] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_tlscertificatename' do
    expect{dsc_xexchreceiveconnector[:dsc_tlscertificatename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_tlscertificatename' do
    expect{dsc_xexchreceiveconnector[:dsc_tlscertificatename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_tlscertificatename' do
    expect{dsc_xexchreceiveconnector[:dsc_tlscertificatename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_tlscertificatename' do
    expect{dsc_xexchreceiveconnector[:dsc_tlscertificatename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_tlsdomaincapabilities' do
    dsc_xexchreceiveconnector[:dsc_tlsdomaincapabilities] = ["foo", "bar", "spec"]
    expect(dsc_xexchreceiveconnector[:dsc_tlsdomaincapabilities]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_tlsdomaincapabilities' do
    expect{dsc_xexchreceiveconnector[:dsc_tlsdomaincapabilities] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_tlsdomaincapabilities' do
    expect{dsc_xexchreceiveconnector[:dsc_tlsdomaincapabilities] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_tlsdomaincapabilities' do
    expect{dsc_xexchreceiveconnector[:dsc_tlsdomaincapabilities] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_transportrole predefined value FrontendTransport' do
    dsc_xexchreceiveconnector[:dsc_transportrole] = 'FrontendTransport'
    expect(dsc_xexchreceiveconnector[:dsc_transportrole]).to eq('FrontendTransport')
  end

  it 'should accept dsc_transportrole predefined value frontendtransport' do
    dsc_xexchreceiveconnector[:dsc_transportrole] = 'frontendtransport'
    expect(dsc_xexchreceiveconnector[:dsc_transportrole]).to eq('frontendtransport')
  end

  it 'should accept dsc_transportrole predefined value HubTransport' do
    dsc_xexchreceiveconnector[:dsc_transportrole] = 'HubTransport'
    expect(dsc_xexchreceiveconnector[:dsc_transportrole]).to eq('HubTransport')
  end

  it 'should accept dsc_transportrole predefined value hubtransport' do
    dsc_xexchreceiveconnector[:dsc_transportrole] = 'hubtransport'
    expect(dsc_xexchreceiveconnector[:dsc_transportrole]).to eq('hubtransport')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchreceiveconnector[:dsc_transportrole] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_transportrole' do
    expect{dsc_xexchreceiveconnector[:dsc_transportrole] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_transportrole' do
    expect{dsc_xexchreceiveconnector[:dsc_transportrole] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_transportrole' do
    expect{dsc_xexchreceiveconnector[:dsc_transportrole] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_transportrole' do
    expect{dsc_xexchreceiveconnector[:dsc_transportrole] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_usage predefined value Client' do
    dsc_xexchreceiveconnector[:dsc_usage] = 'Client'
    expect(dsc_xexchreceiveconnector[:dsc_usage]).to eq('Client')
  end

  it 'should accept dsc_usage predefined value client' do
    dsc_xexchreceiveconnector[:dsc_usage] = 'client'
    expect(dsc_xexchreceiveconnector[:dsc_usage]).to eq('client')
  end

  it 'should accept dsc_usage predefined value Internal' do
    dsc_xexchreceiveconnector[:dsc_usage] = 'Internal'
    expect(dsc_xexchreceiveconnector[:dsc_usage]).to eq('Internal')
  end

  it 'should accept dsc_usage predefined value internal' do
    dsc_xexchreceiveconnector[:dsc_usage] = 'internal'
    expect(dsc_xexchreceiveconnector[:dsc_usage]).to eq('internal')
  end

  it 'should accept dsc_usage predefined value Internet' do
    dsc_xexchreceiveconnector[:dsc_usage] = 'Internet'
    expect(dsc_xexchreceiveconnector[:dsc_usage]).to eq('Internet')
  end

  it 'should accept dsc_usage predefined value internet' do
    dsc_xexchreceiveconnector[:dsc_usage] = 'internet'
    expect(dsc_xexchreceiveconnector[:dsc_usage]).to eq('internet')
  end

  it 'should accept dsc_usage predefined value Partner' do
    dsc_xexchreceiveconnector[:dsc_usage] = 'Partner'
    expect(dsc_xexchreceiveconnector[:dsc_usage]).to eq('Partner')
  end

  it 'should accept dsc_usage predefined value partner' do
    dsc_xexchreceiveconnector[:dsc_usage] = 'partner'
    expect(dsc_xexchreceiveconnector[:dsc_usage]).to eq('partner')
  end

  it 'should accept dsc_usage predefined value Custom' do
    dsc_xexchreceiveconnector[:dsc_usage] = 'Custom'
    expect(dsc_xexchreceiveconnector[:dsc_usage]).to eq('Custom')
  end

  it 'should accept dsc_usage predefined value custom' do
    dsc_xexchreceiveconnector[:dsc_usage] = 'custom'
    expect(dsc_xexchreceiveconnector[:dsc_usage]).to eq('custom')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchreceiveconnector[:dsc_usage] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usage' do
    expect{dsc_xexchreceiveconnector[:dsc_usage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usage' do
    expect{dsc_xexchreceiveconnector[:dsc_usage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usage' do
    expect{dsc_xexchreceiveconnector[:dsc_usage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usage' do
    expect{dsc_xexchreceiveconnector[:dsc_usage] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchreceiveconnector)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchreceiveconnector)
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
        dsc_xexchreceiveconnector.original_parameters[:dsc_ensure] = 'present'
        dsc_xexchreceiveconnector[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xexchreceiveconnector)
      end

      it "should update :ensure to :present" do
        expect(dsc_xexchreceiveconnector[:ensure]).to eq(:present)
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
        dsc_xexchreceiveconnector.original_parameters[:dsc_ensure] = 'absent'
        dsc_xexchreceiveconnector[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xexchreceiveconnector)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xexchreceiveconnector[:ensure]).to eq(:absent)
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
