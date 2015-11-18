#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchtransportservice) do

  let :dsc_xexchtransportservice do
    Puppet::Type.type(:dsc_xexchtransportservice).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchtransportservice.to_s).to eq("Dsc_xexchtransportservice[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchtransportservice[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchtransportservice).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_allowservicerestart => true,
      :dsc_activeuserstatisticslogmaxage => 'foo',
      :dsc_activeuserstatisticslogmaxdirectorysize => 'foo',
      :dsc_activeuserstatisticslogmaxfilesize => 'foo',
      :dsc_activeuserstatisticslogpath => 'foo',
      :dsc_agentlogenabled => true,
      :dsc_agentlogmaxage => 'foo',
      :dsc_agentlogmaxdirectorysize => 'foo',
      :dsc_agentlogmaxfilesize => 'foo',
      :dsc_agentlogpath => 'foo',
      :dsc_connectivitylogenabled => true,
      :dsc_connectivitylogmaxage => 'foo',
      :dsc_connectivitylogmaxdirectorysize => 'foo',
      :dsc_connectivitylogmaxfilesize => 'foo',
      :dsc_connectivitylogpath => 'foo',
      :dsc_contentconversiontracingenabled => true,
      :dsc_delaynotificationtimeout => 'foo',
      :dsc_dnslogenabled => true,
      :dsc_dnslogmaxage => 'foo',
      :dsc_dnslogmaxdirectorysize => 'foo',
      :dsc_dnslogmaxfilesize => 'foo',
      :dsc_dnslogpath => 'foo',
      :dsc_externaldnsadapterenabled => true,
      :dsc_externaldnsadapterguid => 'foo',
      :dsc_externaldnsprotocoloption => 'Any',
      :dsc_externaldnsservers => ["foo", "bar", "spec"],
      :dsc_externalipaddress => 'foo',
      :dsc_internaldnsadapterenabled => true,
      :dsc_internaldnsadapterguid => 'foo',
      :dsc_internaldnsprotocoloption => 'Any',
      :dsc_internaldnsservers => ["foo", "bar", "spec"],
      :dsc_intraorgconnectorprotocollogginglevel => 'None',
      :dsc_intraorgconnectorsmtpmaxmessagesperconnection => -32,
      :dsc_irmlogenabled => true,
      :dsc_irmlogmaxage => 'foo',
      :dsc_irmlogmaxdirectorysize => 'foo',
      :dsc_irmlogmaxfilesize => 'foo',
      :dsc_irmlogpath => 'foo',
      :dsc_maxconcurrentmailboxdeliveries => -32,
      :dsc_maxconcurrentmailboxsubmissions => -32,
      :dsc_maxconnectionrateperminute => -32,
      :dsc_maxoutboundconnections => 'foo',
      :dsc_maxperdomainoutboundconnections => 'foo',
      :dsc_messageexpirationtimeout => 'foo',
      :dsc_messageretryinterval => 'foo',
      :dsc_messagetrackinglogenabled => true,
      :dsc_messagetrackinglogmaxage => 'foo',
      :dsc_messagetrackinglogmaxdirectorysize => 'foo',
      :dsc_messagetrackinglogmaxfilesize => 'foo',
      :dsc_messagetrackinglogpath => 'foo',
      :dsc_messagetrackinglogsubjectloggingenabled => true,
      :dsc_outboundconnectionfailureretryinterval => 'foo',
      :dsc_pickupdirectorymaxheadersize => 'foo',
      :dsc_pickupdirectorymaxmessagesperminute => -32,
      :dsc_pickupdirectorymaxrecipientspermessage => -32,
      :dsc_pickupdirectorypath => 'foo',
      :dsc_pipelinetracingenabled => true,
      :dsc_pipelinetracingpath => 'foo',
      :dsc_pipelinetracingsenderaddress => 'foo',
      :dsc_poisonmessagedetectionenabled => true,
      :dsc_poisonthreshold => -32,
      :dsc_queuelogmaxage => 'foo',
      :dsc_queuelogmaxdirectorysize => 'foo',
      :dsc_queuelogmaxfilesize => 'foo',
      :dsc_queuelogpath => 'foo',
      :dsc_queuemaxidletime => 'foo',
      :dsc_receiveprotocollogmaxage => 'foo',
      :dsc_receiveprotocollogmaxdirectorysize => 'foo',
      :dsc_receiveprotocollogmaxfilesize => 'foo',
      :dsc_receiveprotocollogpath => 'foo',
      :dsc_recipientvalidationcacheenabled => true,
      :dsc_replaydirectorypath => 'foo',
      :dsc_rootdropdirectorypath => 'foo',
      :dsc_routingtablelogmaxage => 'foo',
      :dsc_routingtablelogmaxdirectorysize => 'foo',
      :dsc_routingtablelogpath => 'foo',
      :dsc_sendprotocollogmaxage => 'foo',
      :dsc_sendprotocollogmaxdirectorysize => 'foo',
      :dsc_sendprotocollogmaxfilesize => 'foo',
      :dsc_sendprotocollogpath => 'foo',
      :dsc_serverstatisticslogmaxage => 'foo',
      :dsc_serverstatisticslogmaxdirectorysize => 'foo',
      :dsc_serverstatisticslogmaxfilesize => 'foo',
      :dsc_serverstatisticslogpath => 'foo',
      :dsc_transientfailureretrycount => -32,
      :dsc_transientfailureretryinterval => 'foo',
      :dsc_usedowngradedexchangeserverauth => true,
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchtransportservice[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchtransportservice[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchtransportservice[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchtransportservice[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchtransportservice[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchtransportservice[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchtransportservice[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchtransportservice[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchtransportservice[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchtransportservice[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchtransportservice[:dsc_allowservicerestart] = true
    expect(dsc_xexchtransportservice[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchtransportservice[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchtransportservice[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchtransportservice[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchtransportservice[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchtransportservice[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchtransportservice[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchtransportservice[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchtransportservice[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchtransportservice[:dsc_allowservicerestart] = :true
    expect(dsc_xexchtransportservice[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchtransportservice[:dsc_allowservicerestart] = :false
    expect(dsc_xexchtransportservice[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchtransportservice[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchtransportservice[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_activeuserstatisticslogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_activeuserstatisticslogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_activeuserstatisticslogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_activeuserstatisticslogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_activeuserstatisticslogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_activeuserstatisticslogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_activeuserstatisticslogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_activeuserstatisticslogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_activeuserstatisticslogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogmaxfilesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_activeuserstatisticslogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogmaxfilesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_activeuserstatisticslogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogmaxfilesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_activeuserstatisticslogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogmaxfilesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_activeuserstatisticslogpath' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_activeuserstatisticslogpath' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_activeuserstatisticslogpath' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_activeuserstatisticslogpath' do
    expect{dsc_xexchtransportservice[:dsc_activeuserstatisticslogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_agentlogenabled' do
    expect{dsc_xexchtransportservice[:dsc_agentlogenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_agentlogenabled' do
    dsc_xexchtransportservice[:dsc_agentlogenabled] = true
    expect(dsc_xexchtransportservice[:dsc_agentlogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_agentlogenabled" do
    dsc_xexchtransportservice[:dsc_agentlogenabled] = 'true'
    expect(dsc_xexchtransportservice[:dsc_agentlogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_agentlogenabled" do
    dsc_xexchtransportservice[:dsc_agentlogenabled] = 'false'
    expect(dsc_xexchtransportservice[:dsc_agentlogenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_agentlogenabled" do
    dsc_xexchtransportservice[:dsc_agentlogenabled] = 'True'
    expect(dsc_xexchtransportservice[:dsc_agentlogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_agentlogenabled" do
    dsc_xexchtransportservice[:dsc_agentlogenabled] = 'False'
    expect(dsc_xexchtransportservice[:dsc_agentlogenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_agentlogenabled" do
    dsc_xexchtransportservice[:dsc_agentlogenabled] = :true
    expect(dsc_xexchtransportservice[:dsc_agentlogenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_agentlogenabled" do
    dsc_xexchtransportservice[:dsc_agentlogenabled] = :false
    expect(dsc_xexchtransportservice[:dsc_agentlogenabled]).to eq(false)
  end

  it 'should not accept int for dsc_agentlogenabled' do
    expect{dsc_xexchtransportservice[:dsc_agentlogenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_agentlogenabled' do
    expect{dsc_xexchtransportservice[:dsc_agentlogenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_agentlogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_agentlogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_agentlogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_agentlogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_agentlogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_agentlogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_agentlogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_agentlogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_agentlogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_agentlogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_agentlogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_agentlogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_agentlogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_agentlogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_agentlogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_agentlogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_agentlogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_agentlogmaxfilesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_agentlogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_agentlogmaxfilesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_agentlogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_agentlogmaxfilesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_agentlogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_agentlogmaxfilesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_agentlogpath' do
    expect{dsc_xexchtransportservice[:dsc_agentlogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_agentlogpath' do
    expect{dsc_xexchtransportservice[:dsc_agentlogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_agentlogpath' do
    expect{dsc_xexchtransportservice[:dsc_agentlogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_agentlogpath' do
    expect{dsc_xexchtransportservice[:dsc_agentlogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectivitylogenabled' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_connectivitylogenabled' do
    dsc_xexchtransportservice[:dsc_connectivitylogenabled] = true
    expect(dsc_xexchtransportservice[:dsc_connectivitylogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_connectivitylogenabled" do
    dsc_xexchtransportservice[:dsc_connectivitylogenabled] = 'true'
    expect(dsc_xexchtransportservice[:dsc_connectivitylogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_connectivitylogenabled" do
    dsc_xexchtransportservice[:dsc_connectivitylogenabled] = 'false'
    expect(dsc_xexchtransportservice[:dsc_connectivitylogenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_connectivitylogenabled" do
    dsc_xexchtransportservice[:dsc_connectivitylogenabled] = 'True'
    expect(dsc_xexchtransportservice[:dsc_connectivitylogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_connectivitylogenabled" do
    dsc_xexchtransportservice[:dsc_connectivitylogenabled] = 'False'
    expect(dsc_xexchtransportservice[:dsc_connectivitylogenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_connectivitylogenabled" do
    dsc_xexchtransportservice[:dsc_connectivitylogenabled] = :true
    expect(dsc_xexchtransportservice[:dsc_connectivitylogenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_connectivitylogenabled" do
    dsc_xexchtransportservice[:dsc_connectivitylogenabled] = :false
    expect(dsc_xexchtransportservice[:dsc_connectivitylogenabled]).to eq(false)
  end

  it 'should not accept int for dsc_connectivitylogenabled' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectivitylogenabled' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectivitylogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectivitylogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectivitylogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectivitylogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectivitylogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectivitylogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectivitylogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectivitylogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectivitylogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogmaxfilesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectivitylogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogmaxfilesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectivitylogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogmaxfilesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectivitylogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogmaxfilesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectivitylogpath' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectivitylogpath' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectivitylogpath' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectivitylogpath' do
    expect{dsc_xexchtransportservice[:dsc_connectivitylogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_contentconversiontracingenabled' do
    expect{dsc_xexchtransportservice[:dsc_contentconversiontracingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_contentconversiontracingenabled' do
    dsc_xexchtransportservice[:dsc_contentconversiontracingenabled] = true
    expect(dsc_xexchtransportservice[:dsc_contentconversiontracingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_contentconversiontracingenabled" do
    dsc_xexchtransportservice[:dsc_contentconversiontracingenabled] = 'true'
    expect(dsc_xexchtransportservice[:dsc_contentconversiontracingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_contentconversiontracingenabled" do
    dsc_xexchtransportservice[:dsc_contentconversiontracingenabled] = 'false'
    expect(dsc_xexchtransportservice[:dsc_contentconversiontracingenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_contentconversiontracingenabled" do
    dsc_xexchtransportservice[:dsc_contentconversiontracingenabled] = 'True'
    expect(dsc_xexchtransportservice[:dsc_contentconversiontracingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_contentconversiontracingenabled" do
    dsc_xexchtransportservice[:dsc_contentconversiontracingenabled] = 'False'
    expect(dsc_xexchtransportservice[:dsc_contentconversiontracingenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_contentconversiontracingenabled" do
    dsc_xexchtransportservice[:dsc_contentconversiontracingenabled] = :true
    expect(dsc_xexchtransportservice[:dsc_contentconversiontracingenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_contentconversiontracingenabled" do
    dsc_xexchtransportservice[:dsc_contentconversiontracingenabled] = :false
    expect(dsc_xexchtransportservice[:dsc_contentconversiontracingenabled]).to eq(false)
  end

  it 'should not accept int for dsc_contentconversiontracingenabled' do
    expect{dsc_xexchtransportservice[:dsc_contentconversiontracingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_contentconversiontracingenabled' do
    expect{dsc_xexchtransportservice[:dsc_contentconversiontracingenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_delaynotificationtimeout' do
    expect{dsc_xexchtransportservice[:dsc_delaynotificationtimeout] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_delaynotificationtimeout' do
    expect{dsc_xexchtransportservice[:dsc_delaynotificationtimeout] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_delaynotificationtimeout' do
    expect{dsc_xexchtransportservice[:dsc_delaynotificationtimeout] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_delaynotificationtimeout' do
    expect{dsc_xexchtransportservice[:dsc_delaynotificationtimeout] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dnslogenabled' do
    expect{dsc_xexchtransportservice[:dsc_dnslogenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_dnslogenabled' do
    dsc_xexchtransportservice[:dsc_dnslogenabled] = true
    expect(dsc_xexchtransportservice[:dsc_dnslogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_dnslogenabled" do
    dsc_xexchtransportservice[:dsc_dnslogenabled] = 'true'
    expect(dsc_xexchtransportservice[:dsc_dnslogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_dnslogenabled" do
    dsc_xexchtransportservice[:dsc_dnslogenabled] = 'false'
    expect(dsc_xexchtransportservice[:dsc_dnslogenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_dnslogenabled" do
    dsc_xexchtransportservice[:dsc_dnslogenabled] = 'True'
    expect(dsc_xexchtransportservice[:dsc_dnslogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_dnslogenabled" do
    dsc_xexchtransportservice[:dsc_dnslogenabled] = 'False'
    expect(dsc_xexchtransportservice[:dsc_dnslogenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_dnslogenabled" do
    dsc_xexchtransportservice[:dsc_dnslogenabled] = :true
    expect(dsc_xexchtransportservice[:dsc_dnslogenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_dnslogenabled" do
    dsc_xexchtransportservice[:dsc_dnslogenabled] = :false
    expect(dsc_xexchtransportservice[:dsc_dnslogenabled]).to eq(false)
  end

  it 'should not accept int for dsc_dnslogenabled' do
    expect{dsc_xexchtransportservice[:dsc_dnslogenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dnslogenabled' do
    expect{dsc_xexchtransportservice[:dsc_dnslogenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dnslogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_dnslogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dnslogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_dnslogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dnslogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_dnslogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dnslogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_dnslogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dnslogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_dnslogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dnslogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_dnslogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dnslogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_dnslogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dnslogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_dnslogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dnslogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_dnslogmaxfilesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dnslogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_dnslogmaxfilesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dnslogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_dnslogmaxfilesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dnslogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_dnslogmaxfilesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dnslogpath' do
    expect{dsc_xexchtransportservice[:dsc_dnslogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dnslogpath' do
    expect{dsc_xexchtransportservice[:dsc_dnslogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dnslogpath' do
    expect{dsc_xexchtransportservice[:dsc_dnslogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dnslogpath' do
    expect{dsc_xexchtransportservice[:dsc_dnslogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externaldnsadapterenabled' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsadapterenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_externaldnsadapterenabled' do
    dsc_xexchtransportservice[:dsc_externaldnsadapterenabled] = true
    expect(dsc_xexchtransportservice[:dsc_externaldnsadapterenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_externaldnsadapterenabled" do
    dsc_xexchtransportservice[:dsc_externaldnsadapterenabled] = 'true'
    expect(dsc_xexchtransportservice[:dsc_externaldnsadapterenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_externaldnsadapterenabled" do
    dsc_xexchtransportservice[:dsc_externaldnsadapterenabled] = 'false'
    expect(dsc_xexchtransportservice[:dsc_externaldnsadapterenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_externaldnsadapterenabled" do
    dsc_xexchtransportservice[:dsc_externaldnsadapterenabled] = 'True'
    expect(dsc_xexchtransportservice[:dsc_externaldnsadapterenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_externaldnsadapterenabled" do
    dsc_xexchtransportservice[:dsc_externaldnsadapterenabled] = 'False'
    expect(dsc_xexchtransportservice[:dsc_externaldnsadapterenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_externaldnsadapterenabled" do
    dsc_xexchtransportservice[:dsc_externaldnsadapterenabled] = :true
    expect(dsc_xexchtransportservice[:dsc_externaldnsadapterenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_externaldnsadapterenabled" do
    dsc_xexchtransportservice[:dsc_externaldnsadapterenabled] = :false
    expect(dsc_xexchtransportservice[:dsc_externaldnsadapterenabled]).to eq(false)
  end

  it 'should not accept int for dsc_externaldnsadapterenabled' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsadapterenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externaldnsadapterenabled' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsadapterenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externaldnsadapterguid' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsadapterguid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_externaldnsadapterguid' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsadapterguid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externaldnsadapterguid' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsadapterguid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externaldnsadapterguid' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsadapterguid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_externaldnsprotocoloption predefined value Any' do
    dsc_xexchtransportservice[:dsc_externaldnsprotocoloption] = 'Any'
    expect(dsc_xexchtransportservice[:dsc_externaldnsprotocoloption]).to eq('Any')
  end

  it 'should accept dsc_externaldnsprotocoloption predefined value any' do
    dsc_xexchtransportservice[:dsc_externaldnsprotocoloption] = 'any'
    expect(dsc_xexchtransportservice[:dsc_externaldnsprotocoloption]).to eq('any')
  end

  it 'should accept dsc_externaldnsprotocoloption predefined value UseTcpOnly' do
    dsc_xexchtransportservice[:dsc_externaldnsprotocoloption] = 'UseTcpOnly'
    expect(dsc_xexchtransportservice[:dsc_externaldnsprotocoloption]).to eq('UseTcpOnly')
  end

  it 'should accept dsc_externaldnsprotocoloption predefined value usetcponly' do
    dsc_xexchtransportservice[:dsc_externaldnsprotocoloption] = 'usetcponly'
    expect(dsc_xexchtransportservice[:dsc_externaldnsprotocoloption]).to eq('usetcponly')
  end

  it 'should accept dsc_externaldnsprotocoloption predefined value UseUdpOnly' do
    dsc_xexchtransportservice[:dsc_externaldnsprotocoloption] = 'UseUdpOnly'
    expect(dsc_xexchtransportservice[:dsc_externaldnsprotocoloption]).to eq('UseUdpOnly')
  end

  it 'should accept dsc_externaldnsprotocoloption predefined value useudponly' do
    dsc_xexchtransportservice[:dsc_externaldnsprotocoloption] = 'useudponly'
    expect(dsc_xexchtransportservice[:dsc_externaldnsprotocoloption]).to eq('useudponly')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsprotocoloption] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externaldnsprotocoloption' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsprotocoloption] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_externaldnsprotocoloption' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsprotocoloption] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externaldnsprotocoloption' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsprotocoloption] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externaldnsprotocoloption' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsprotocoloption] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_externaldnsservers' do
    dsc_xexchtransportservice[:dsc_externaldnsservers] = ["foo", "bar", "spec"]
    expect(dsc_xexchtransportservice[:dsc_externaldnsservers]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_externaldnsservers' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsservers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externaldnsservers' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsservers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externaldnsservers' do
    expect{dsc_xexchtransportservice[:dsc_externaldnsservers] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externalipaddress' do
    expect{dsc_xexchtransportservice[:dsc_externalipaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_externalipaddress' do
    expect{dsc_xexchtransportservice[:dsc_externalipaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externalipaddress' do
    expect{dsc_xexchtransportservice[:dsc_externalipaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalipaddress' do
    expect{dsc_xexchtransportservice[:dsc_externalipaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internaldnsadapterenabled' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsadapterenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_internaldnsadapterenabled' do
    dsc_xexchtransportservice[:dsc_internaldnsadapterenabled] = true
    expect(dsc_xexchtransportservice[:dsc_internaldnsadapterenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_internaldnsadapterenabled" do
    dsc_xexchtransportservice[:dsc_internaldnsadapterenabled] = 'true'
    expect(dsc_xexchtransportservice[:dsc_internaldnsadapterenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_internaldnsadapterenabled" do
    dsc_xexchtransportservice[:dsc_internaldnsadapterenabled] = 'false'
    expect(dsc_xexchtransportservice[:dsc_internaldnsadapterenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_internaldnsadapterenabled" do
    dsc_xexchtransportservice[:dsc_internaldnsadapterenabled] = 'True'
    expect(dsc_xexchtransportservice[:dsc_internaldnsadapterenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_internaldnsadapterenabled" do
    dsc_xexchtransportservice[:dsc_internaldnsadapterenabled] = 'False'
    expect(dsc_xexchtransportservice[:dsc_internaldnsadapterenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_internaldnsadapterenabled" do
    dsc_xexchtransportservice[:dsc_internaldnsadapterenabled] = :true
    expect(dsc_xexchtransportservice[:dsc_internaldnsadapterenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_internaldnsadapterenabled" do
    dsc_xexchtransportservice[:dsc_internaldnsadapterenabled] = :false
    expect(dsc_xexchtransportservice[:dsc_internaldnsadapterenabled]).to eq(false)
  end

  it 'should not accept int for dsc_internaldnsadapterenabled' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsadapterenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internaldnsadapterenabled' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsadapterenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internaldnsadapterguid' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsadapterguid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_internaldnsadapterguid' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsadapterguid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internaldnsadapterguid' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsadapterguid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internaldnsadapterguid' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsadapterguid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_internaldnsprotocoloption predefined value Any' do
    dsc_xexchtransportservice[:dsc_internaldnsprotocoloption] = 'Any'
    expect(dsc_xexchtransportservice[:dsc_internaldnsprotocoloption]).to eq('Any')
  end

  it 'should accept dsc_internaldnsprotocoloption predefined value any' do
    dsc_xexchtransportservice[:dsc_internaldnsprotocoloption] = 'any'
    expect(dsc_xexchtransportservice[:dsc_internaldnsprotocoloption]).to eq('any')
  end

  it 'should accept dsc_internaldnsprotocoloption predefined value UseTcpOnly' do
    dsc_xexchtransportservice[:dsc_internaldnsprotocoloption] = 'UseTcpOnly'
    expect(dsc_xexchtransportservice[:dsc_internaldnsprotocoloption]).to eq('UseTcpOnly')
  end

  it 'should accept dsc_internaldnsprotocoloption predefined value usetcponly' do
    dsc_xexchtransportservice[:dsc_internaldnsprotocoloption] = 'usetcponly'
    expect(dsc_xexchtransportservice[:dsc_internaldnsprotocoloption]).to eq('usetcponly')
  end

  it 'should accept dsc_internaldnsprotocoloption predefined value UseUdpOnly' do
    dsc_xexchtransportservice[:dsc_internaldnsprotocoloption] = 'UseUdpOnly'
    expect(dsc_xexchtransportservice[:dsc_internaldnsprotocoloption]).to eq('UseUdpOnly')
  end

  it 'should accept dsc_internaldnsprotocoloption predefined value useudponly' do
    dsc_xexchtransportservice[:dsc_internaldnsprotocoloption] = 'useudponly'
    expect(dsc_xexchtransportservice[:dsc_internaldnsprotocoloption]).to eq('useudponly')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsprotocoloption] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internaldnsprotocoloption' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsprotocoloption] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_internaldnsprotocoloption' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsprotocoloption] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internaldnsprotocoloption' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsprotocoloption] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internaldnsprotocoloption' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsprotocoloption] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_internaldnsservers' do
    dsc_xexchtransportservice[:dsc_internaldnsservers] = ["foo", "bar", "spec"]
    expect(dsc_xexchtransportservice[:dsc_internaldnsservers]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_internaldnsservers' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsservers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internaldnsservers' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsservers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internaldnsservers' do
    expect{dsc_xexchtransportservice[:dsc_internaldnsservers] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_intraorgconnectorprotocollogginglevel predefined value None' do
    dsc_xexchtransportservice[:dsc_intraorgconnectorprotocollogginglevel] = 'None'
    expect(dsc_xexchtransportservice[:dsc_intraorgconnectorprotocollogginglevel]).to eq('None')
  end

  it 'should accept dsc_intraorgconnectorprotocollogginglevel predefined value none' do
    dsc_xexchtransportservice[:dsc_intraorgconnectorprotocollogginglevel] = 'none'
    expect(dsc_xexchtransportservice[:dsc_intraorgconnectorprotocollogginglevel]).to eq('none')
  end

  it 'should accept dsc_intraorgconnectorprotocollogginglevel predefined value Verbose' do
    dsc_xexchtransportservice[:dsc_intraorgconnectorprotocollogginglevel] = 'Verbose'
    expect(dsc_xexchtransportservice[:dsc_intraorgconnectorprotocollogginglevel]).to eq('Verbose')
  end

  it 'should accept dsc_intraorgconnectorprotocollogginglevel predefined value verbose' do
    dsc_xexchtransportservice[:dsc_intraorgconnectorprotocollogginglevel] = 'verbose'
    expect(dsc_xexchtransportservice[:dsc_intraorgconnectorprotocollogginglevel]).to eq('verbose')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchtransportservice[:dsc_intraorgconnectorprotocollogginglevel] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_intraorgconnectorprotocollogginglevel' do
    expect{dsc_xexchtransportservice[:dsc_intraorgconnectorprotocollogginglevel] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_intraorgconnectorprotocollogginglevel' do
    expect{dsc_xexchtransportservice[:dsc_intraorgconnectorprotocollogginglevel] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_intraorgconnectorprotocollogginglevel' do
    expect{dsc_xexchtransportservice[:dsc_intraorgconnectorprotocollogginglevel] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_intraorgconnectorprotocollogginglevel' do
    expect{dsc_xexchtransportservice[:dsc_intraorgconnectorprotocollogginglevel] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_intraorgconnectorsmtpmaxmessagesperconnection' do
    expect{dsc_xexchtransportservice[:dsc_intraorgconnectorsmtpmaxmessagesperconnection] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_intraorgconnectorsmtpmaxmessagesperconnection' do
    expect{dsc_xexchtransportservice[:dsc_intraorgconnectorsmtpmaxmessagesperconnection] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_intraorgconnectorsmtpmaxmessagesperconnection' do
    dsc_xexchtransportservice[:dsc_intraorgconnectorsmtpmaxmessagesperconnection] = -32
    expect(dsc_xexchtransportservice[:dsc_intraorgconnectorsmtpmaxmessagesperconnection]).to eq(-32)
  end

  it 'should accept string-like int for dsc_intraorgconnectorsmtpmaxmessagesperconnection' do
    dsc_xexchtransportservice[:dsc_intraorgconnectorsmtpmaxmessagesperconnection] = '16'
    expect(dsc_xexchtransportservice[:dsc_intraorgconnectorsmtpmaxmessagesperconnection]).to eq(16)
  end

  it 'should accept string-like int for dsc_intraorgconnectorsmtpmaxmessagesperconnection' do
    dsc_xexchtransportservice[:dsc_intraorgconnectorsmtpmaxmessagesperconnection] = '-16'
    expect(dsc_xexchtransportservice[:dsc_intraorgconnectorsmtpmaxmessagesperconnection]).to eq(-16)
  end

  it 'should accept string-like int for dsc_intraorgconnectorsmtpmaxmessagesperconnection' do
    dsc_xexchtransportservice[:dsc_intraorgconnectorsmtpmaxmessagesperconnection] = '32'
    expect(dsc_xexchtransportservice[:dsc_intraorgconnectorsmtpmaxmessagesperconnection]).to eq(32)
  end

  it 'should accept string-like int for dsc_intraorgconnectorsmtpmaxmessagesperconnection' do
    dsc_xexchtransportservice[:dsc_intraorgconnectorsmtpmaxmessagesperconnection] = '-32'
    expect(dsc_xexchtransportservice[:dsc_intraorgconnectorsmtpmaxmessagesperconnection]).to eq(-32)
  end


  it 'should not accept array for dsc_irmlogenabled' do
    expect{dsc_xexchtransportservice[:dsc_irmlogenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_irmlogenabled' do
    dsc_xexchtransportservice[:dsc_irmlogenabled] = true
    expect(dsc_xexchtransportservice[:dsc_irmlogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_irmlogenabled" do
    dsc_xexchtransportservice[:dsc_irmlogenabled] = 'true'
    expect(dsc_xexchtransportservice[:dsc_irmlogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_irmlogenabled" do
    dsc_xexchtransportservice[:dsc_irmlogenabled] = 'false'
    expect(dsc_xexchtransportservice[:dsc_irmlogenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_irmlogenabled" do
    dsc_xexchtransportservice[:dsc_irmlogenabled] = 'True'
    expect(dsc_xexchtransportservice[:dsc_irmlogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_irmlogenabled" do
    dsc_xexchtransportservice[:dsc_irmlogenabled] = 'False'
    expect(dsc_xexchtransportservice[:dsc_irmlogenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_irmlogenabled" do
    dsc_xexchtransportservice[:dsc_irmlogenabled] = :true
    expect(dsc_xexchtransportservice[:dsc_irmlogenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_irmlogenabled" do
    dsc_xexchtransportservice[:dsc_irmlogenabled] = :false
    expect(dsc_xexchtransportservice[:dsc_irmlogenabled]).to eq(false)
  end

  it 'should not accept int for dsc_irmlogenabled' do
    expect{dsc_xexchtransportservice[:dsc_irmlogenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_irmlogenabled' do
    expect{dsc_xexchtransportservice[:dsc_irmlogenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_irmlogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_irmlogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_irmlogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_irmlogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_irmlogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_irmlogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_irmlogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_irmlogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_irmlogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_irmlogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_irmlogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_irmlogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_irmlogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_irmlogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_irmlogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_irmlogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_irmlogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_irmlogmaxfilesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_irmlogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_irmlogmaxfilesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_irmlogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_irmlogmaxfilesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_irmlogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_irmlogmaxfilesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_irmlogpath' do
    expect{dsc_xexchtransportservice[:dsc_irmlogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_irmlogpath' do
    expect{dsc_xexchtransportservice[:dsc_irmlogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_irmlogpath' do
    expect{dsc_xexchtransportservice[:dsc_irmlogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_irmlogpath' do
    expect{dsc_xexchtransportservice[:dsc_irmlogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxconcurrentmailboxdeliveries' do
    expect{dsc_xexchtransportservice[:dsc_maxconcurrentmailboxdeliveries] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxconcurrentmailboxdeliveries' do
    expect{dsc_xexchtransportservice[:dsc_maxconcurrentmailboxdeliveries] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_maxconcurrentmailboxdeliveries' do
    dsc_xexchtransportservice[:dsc_maxconcurrentmailboxdeliveries] = -32
    expect(dsc_xexchtransportservice[:dsc_maxconcurrentmailboxdeliveries]).to eq(-32)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxdeliveries' do
    dsc_xexchtransportservice[:dsc_maxconcurrentmailboxdeliveries] = '16'
    expect(dsc_xexchtransportservice[:dsc_maxconcurrentmailboxdeliveries]).to eq(16)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxdeliveries' do
    dsc_xexchtransportservice[:dsc_maxconcurrentmailboxdeliveries] = '-16'
    expect(dsc_xexchtransportservice[:dsc_maxconcurrentmailboxdeliveries]).to eq(-16)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxdeliveries' do
    dsc_xexchtransportservice[:dsc_maxconcurrentmailboxdeliveries] = '32'
    expect(dsc_xexchtransportservice[:dsc_maxconcurrentmailboxdeliveries]).to eq(32)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxdeliveries' do
    dsc_xexchtransportservice[:dsc_maxconcurrentmailboxdeliveries] = '-32'
    expect(dsc_xexchtransportservice[:dsc_maxconcurrentmailboxdeliveries]).to eq(-32)
  end


  it 'should not accept array for dsc_maxconcurrentmailboxsubmissions' do
    expect{dsc_xexchtransportservice[:dsc_maxconcurrentmailboxsubmissions] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxconcurrentmailboxsubmissions' do
    expect{dsc_xexchtransportservice[:dsc_maxconcurrentmailboxsubmissions] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_maxconcurrentmailboxsubmissions' do
    dsc_xexchtransportservice[:dsc_maxconcurrentmailboxsubmissions] = -32
    expect(dsc_xexchtransportservice[:dsc_maxconcurrentmailboxsubmissions]).to eq(-32)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxsubmissions' do
    dsc_xexchtransportservice[:dsc_maxconcurrentmailboxsubmissions] = '16'
    expect(dsc_xexchtransportservice[:dsc_maxconcurrentmailboxsubmissions]).to eq(16)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxsubmissions' do
    dsc_xexchtransportservice[:dsc_maxconcurrentmailboxsubmissions] = '-16'
    expect(dsc_xexchtransportservice[:dsc_maxconcurrentmailboxsubmissions]).to eq(-16)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxsubmissions' do
    dsc_xexchtransportservice[:dsc_maxconcurrentmailboxsubmissions] = '32'
    expect(dsc_xexchtransportservice[:dsc_maxconcurrentmailboxsubmissions]).to eq(32)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxsubmissions' do
    dsc_xexchtransportservice[:dsc_maxconcurrentmailboxsubmissions] = '-32'
    expect(dsc_xexchtransportservice[:dsc_maxconcurrentmailboxsubmissions]).to eq(-32)
  end


  it 'should not accept array for dsc_maxconnectionrateperminute' do
    expect{dsc_xexchtransportservice[:dsc_maxconnectionrateperminute] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxconnectionrateperminute' do
    expect{dsc_xexchtransportservice[:dsc_maxconnectionrateperminute] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_maxconnectionrateperminute' do
    dsc_xexchtransportservice[:dsc_maxconnectionrateperminute] = -32
    expect(dsc_xexchtransportservice[:dsc_maxconnectionrateperminute]).to eq(-32)
  end

  it 'should accept string-like int for dsc_maxconnectionrateperminute' do
    dsc_xexchtransportservice[:dsc_maxconnectionrateperminute] = '16'
    expect(dsc_xexchtransportservice[:dsc_maxconnectionrateperminute]).to eq(16)
  end

  it 'should accept string-like int for dsc_maxconnectionrateperminute' do
    dsc_xexchtransportservice[:dsc_maxconnectionrateperminute] = '-16'
    expect(dsc_xexchtransportservice[:dsc_maxconnectionrateperminute]).to eq(-16)
  end

  it 'should accept string-like int for dsc_maxconnectionrateperminute' do
    dsc_xexchtransportservice[:dsc_maxconnectionrateperminute] = '32'
    expect(dsc_xexchtransportservice[:dsc_maxconnectionrateperminute]).to eq(32)
  end

  it 'should accept string-like int for dsc_maxconnectionrateperminute' do
    dsc_xexchtransportservice[:dsc_maxconnectionrateperminute] = '-32'
    expect(dsc_xexchtransportservice[:dsc_maxconnectionrateperminute]).to eq(-32)
  end


  it 'should not accept array for dsc_maxoutboundconnections' do
    expect{dsc_xexchtransportservice[:dsc_maxoutboundconnections] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxoutboundconnections' do
    expect{dsc_xexchtransportservice[:dsc_maxoutboundconnections] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maxoutboundconnections' do
    expect{dsc_xexchtransportservice[:dsc_maxoutboundconnections] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_maxoutboundconnections' do
    expect{dsc_xexchtransportservice[:dsc_maxoutboundconnections] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxperdomainoutboundconnections' do
    expect{dsc_xexchtransportservice[:dsc_maxperdomainoutboundconnections] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxperdomainoutboundconnections' do
    expect{dsc_xexchtransportservice[:dsc_maxperdomainoutboundconnections] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maxperdomainoutboundconnections' do
    expect{dsc_xexchtransportservice[:dsc_maxperdomainoutboundconnections] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_maxperdomainoutboundconnections' do
    expect{dsc_xexchtransportservice[:dsc_maxperdomainoutboundconnections] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_messageexpirationtimeout' do
    expect{dsc_xexchtransportservice[:dsc_messageexpirationtimeout] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_messageexpirationtimeout' do
    expect{dsc_xexchtransportservice[:dsc_messageexpirationtimeout] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_messageexpirationtimeout' do
    expect{dsc_xexchtransportservice[:dsc_messageexpirationtimeout] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_messageexpirationtimeout' do
    expect{dsc_xexchtransportservice[:dsc_messageexpirationtimeout] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_messageretryinterval' do
    expect{dsc_xexchtransportservice[:dsc_messageretryinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_messageretryinterval' do
    expect{dsc_xexchtransportservice[:dsc_messageretryinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_messageretryinterval' do
    expect{dsc_xexchtransportservice[:dsc_messageretryinterval] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_messageretryinterval' do
    expect{dsc_xexchtransportservice[:dsc_messageretryinterval] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_messagetrackinglogenabled' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_messagetrackinglogenabled' do
    dsc_xexchtransportservice[:dsc_messagetrackinglogenabled] = true
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_messagetrackinglogenabled" do
    dsc_xexchtransportservice[:dsc_messagetrackinglogenabled] = 'true'
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_messagetrackinglogenabled" do
    dsc_xexchtransportservice[:dsc_messagetrackinglogenabled] = 'false'
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_messagetrackinglogenabled" do
    dsc_xexchtransportservice[:dsc_messagetrackinglogenabled] = 'True'
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_messagetrackinglogenabled" do
    dsc_xexchtransportservice[:dsc_messagetrackinglogenabled] = 'False'
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_messagetrackinglogenabled" do
    dsc_xexchtransportservice[:dsc_messagetrackinglogenabled] = :true
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_messagetrackinglogenabled" do
    dsc_xexchtransportservice[:dsc_messagetrackinglogenabled] = :false
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogenabled]).to eq(false)
  end

  it 'should not accept int for dsc_messagetrackinglogenabled' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_messagetrackinglogenabled' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_messagetrackinglogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_messagetrackinglogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_messagetrackinglogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_messagetrackinglogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_messagetrackinglogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_messagetrackinglogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_messagetrackinglogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_messagetrackinglogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_messagetrackinglogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogmaxfilesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_messagetrackinglogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogmaxfilesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_messagetrackinglogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogmaxfilesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_messagetrackinglogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogmaxfilesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_messagetrackinglogpath' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_messagetrackinglogpath' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_messagetrackinglogpath' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_messagetrackinglogpath' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_messagetrackinglogsubjectloggingenabled' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_messagetrackinglogsubjectloggingenabled' do
    dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled] = true
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_messagetrackinglogsubjectloggingenabled" do
    dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled] = 'true'
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_messagetrackinglogsubjectloggingenabled" do
    dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled] = 'false'
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_messagetrackinglogsubjectloggingenabled" do
    dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled] = 'True'
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_messagetrackinglogsubjectloggingenabled" do
    dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled] = 'False'
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_messagetrackinglogsubjectloggingenabled" do
    dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled] = :true
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_messagetrackinglogsubjectloggingenabled" do
    dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled] = :false
    expect(dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled]).to eq(false)
  end

  it 'should not accept int for dsc_messagetrackinglogsubjectloggingenabled' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_messagetrackinglogsubjectloggingenabled' do
    expect{dsc_xexchtransportservice[:dsc_messagetrackinglogsubjectloggingenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_outboundconnectionfailureretryinterval' do
    expect{dsc_xexchtransportservice[:dsc_outboundconnectionfailureretryinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_outboundconnectionfailureretryinterval' do
    expect{dsc_xexchtransportservice[:dsc_outboundconnectionfailureretryinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_outboundconnectionfailureretryinterval' do
    expect{dsc_xexchtransportservice[:dsc_outboundconnectionfailureretryinterval] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_outboundconnectionfailureretryinterval' do
    expect{dsc_xexchtransportservice[:dsc_outboundconnectionfailureretryinterval] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pickupdirectorymaxheadersize' do
    expect{dsc_xexchtransportservice[:dsc_pickupdirectorymaxheadersize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pickupdirectorymaxheadersize' do
    expect{dsc_xexchtransportservice[:dsc_pickupdirectorymaxheadersize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pickupdirectorymaxheadersize' do
    expect{dsc_xexchtransportservice[:dsc_pickupdirectorymaxheadersize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pickupdirectorymaxheadersize' do
    expect{dsc_xexchtransportservice[:dsc_pickupdirectorymaxheadersize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pickupdirectorymaxmessagesperminute' do
    expect{dsc_xexchtransportservice[:dsc_pickupdirectorymaxmessagesperminute] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pickupdirectorymaxmessagesperminute' do
    expect{dsc_xexchtransportservice[:dsc_pickupdirectorymaxmessagesperminute] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_pickupdirectorymaxmessagesperminute' do
    dsc_xexchtransportservice[:dsc_pickupdirectorymaxmessagesperminute] = -32
    expect(dsc_xexchtransportservice[:dsc_pickupdirectorymaxmessagesperminute]).to eq(-32)
  end

  it 'should accept string-like int for dsc_pickupdirectorymaxmessagesperminute' do
    dsc_xexchtransportservice[:dsc_pickupdirectorymaxmessagesperminute] = '16'
    expect(dsc_xexchtransportservice[:dsc_pickupdirectorymaxmessagesperminute]).to eq(16)
  end

  it 'should accept string-like int for dsc_pickupdirectorymaxmessagesperminute' do
    dsc_xexchtransportservice[:dsc_pickupdirectorymaxmessagesperminute] = '-16'
    expect(dsc_xexchtransportservice[:dsc_pickupdirectorymaxmessagesperminute]).to eq(-16)
  end

  it 'should accept string-like int for dsc_pickupdirectorymaxmessagesperminute' do
    dsc_xexchtransportservice[:dsc_pickupdirectorymaxmessagesperminute] = '32'
    expect(dsc_xexchtransportservice[:dsc_pickupdirectorymaxmessagesperminute]).to eq(32)
  end

  it 'should accept string-like int for dsc_pickupdirectorymaxmessagesperminute' do
    dsc_xexchtransportservice[:dsc_pickupdirectorymaxmessagesperminute] = '-32'
    expect(dsc_xexchtransportservice[:dsc_pickupdirectorymaxmessagesperminute]).to eq(-32)
  end


  it 'should not accept array for dsc_pickupdirectorymaxrecipientspermessage' do
    expect{dsc_xexchtransportservice[:dsc_pickupdirectorymaxrecipientspermessage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pickupdirectorymaxrecipientspermessage' do
    expect{dsc_xexchtransportservice[:dsc_pickupdirectorymaxrecipientspermessage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_pickupdirectorymaxrecipientspermessage' do
    dsc_xexchtransportservice[:dsc_pickupdirectorymaxrecipientspermessage] = -32
    expect(dsc_xexchtransportservice[:dsc_pickupdirectorymaxrecipientspermessage]).to eq(-32)
  end

  it 'should accept string-like int for dsc_pickupdirectorymaxrecipientspermessage' do
    dsc_xexchtransportservice[:dsc_pickupdirectorymaxrecipientspermessage] = '16'
    expect(dsc_xexchtransportservice[:dsc_pickupdirectorymaxrecipientspermessage]).to eq(16)
  end

  it 'should accept string-like int for dsc_pickupdirectorymaxrecipientspermessage' do
    dsc_xexchtransportservice[:dsc_pickupdirectorymaxrecipientspermessage] = '-16'
    expect(dsc_xexchtransportservice[:dsc_pickupdirectorymaxrecipientspermessage]).to eq(-16)
  end

  it 'should accept string-like int for dsc_pickupdirectorymaxrecipientspermessage' do
    dsc_xexchtransportservice[:dsc_pickupdirectorymaxrecipientspermessage] = '32'
    expect(dsc_xexchtransportservice[:dsc_pickupdirectorymaxrecipientspermessage]).to eq(32)
  end

  it 'should accept string-like int for dsc_pickupdirectorymaxrecipientspermessage' do
    dsc_xexchtransportservice[:dsc_pickupdirectorymaxrecipientspermessage] = '-32'
    expect(dsc_xexchtransportservice[:dsc_pickupdirectorymaxrecipientspermessage]).to eq(-32)
  end


  it 'should not accept array for dsc_pickupdirectorypath' do
    expect{dsc_xexchtransportservice[:dsc_pickupdirectorypath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pickupdirectorypath' do
    expect{dsc_xexchtransportservice[:dsc_pickupdirectorypath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pickupdirectorypath' do
    expect{dsc_xexchtransportservice[:dsc_pickupdirectorypath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pickupdirectorypath' do
    expect{dsc_xexchtransportservice[:dsc_pickupdirectorypath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pipelinetracingenabled' do
    expect{dsc_xexchtransportservice[:dsc_pipelinetracingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_pipelinetracingenabled' do
    dsc_xexchtransportservice[:dsc_pipelinetracingenabled] = true
    expect(dsc_xexchtransportservice[:dsc_pipelinetracingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_pipelinetracingenabled" do
    dsc_xexchtransportservice[:dsc_pipelinetracingenabled] = 'true'
    expect(dsc_xexchtransportservice[:dsc_pipelinetracingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_pipelinetracingenabled" do
    dsc_xexchtransportservice[:dsc_pipelinetracingenabled] = 'false'
    expect(dsc_xexchtransportservice[:dsc_pipelinetracingenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_pipelinetracingenabled" do
    dsc_xexchtransportservice[:dsc_pipelinetracingenabled] = 'True'
    expect(dsc_xexchtransportservice[:dsc_pipelinetracingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_pipelinetracingenabled" do
    dsc_xexchtransportservice[:dsc_pipelinetracingenabled] = 'False'
    expect(dsc_xexchtransportservice[:dsc_pipelinetracingenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_pipelinetracingenabled" do
    dsc_xexchtransportservice[:dsc_pipelinetracingenabled] = :true
    expect(dsc_xexchtransportservice[:dsc_pipelinetracingenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_pipelinetracingenabled" do
    dsc_xexchtransportservice[:dsc_pipelinetracingenabled] = :false
    expect(dsc_xexchtransportservice[:dsc_pipelinetracingenabled]).to eq(false)
  end

  it 'should not accept int for dsc_pipelinetracingenabled' do
    expect{dsc_xexchtransportservice[:dsc_pipelinetracingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pipelinetracingenabled' do
    expect{dsc_xexchtransportservice[:dsc_pipelinetracingenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pipelinetracingpath' do
    expect{dsc_xexchtransportservice[:dsc_pipelinetracingpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pipelinetracingpath' do
    expect{dsc_xexchtransportservice[:dsc_pipelinetracingpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pipelinetracingpath' do
    expect{dsc_xexchtransportservice[:dsc_pipelinetracingpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pipelinetracingpath' do
    expect{dsc_xexchtransportservice[:dsc_pipelinetracingpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pipelinetracingsenderaddress' do
    expect{dsc_xexchtransportservice[:dsc_pipelinetracingsenderaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pipelinetracingsenderaddress' do
    expect{dsc_xexchtransportservice[:dsc_pipelinetracingsenderaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pipelinetracingsenderaddress' do
    expect{dsc_xexchtransportservice[:dsc_pipelinetracingsenderaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pipelinetracingsenderaddress' do
    expect{dsc_xexchtransportservice[:dsc_pipelinetracingsenderaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_poisonmessagedetectionenabled' do
    expect{dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_poisonmessagedetectionenabled' do
    dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled] = true
    expect(dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_poisonmessagedetectionenabled" do
    dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled] = 'true'
    expect(dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_poisonmessagedetectionenabled" do
    dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled] = 'false'
    expect(dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_poisonmessagedetectionenabled" do
    dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled] = 'True'
    expect(dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_poisonmessagedetectionenabled" do
    dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled] = 'False'
    expect(dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_poisonmessagedetectionenabled" do
    dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled] = :true
    expect(dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_poisonmessagedetectionenabled" do
    dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled] = :false
    expect(dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled]).to eq(false)
  end

  it 'should not accept int for dsc_poisonmessagedetectionenabled' do
    expect{dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_poisonmessagedetectionenabled' do
    expect{dsc_xexchtransportservice[:dsc_poisonmessagedetectionenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_poisonthreshold' do
    expect{dsc_xexchtransportservice[:dsc_poisonthreshold] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_poisonthreshold' do
    expect{dsc_xexchtransportservice[:dsc_poisonthreshold] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_poisonthreshold' do
    dsc_xexchtransportservice[:dsc_poisonthreshold] = -32
    expect(dsc_xexchtransportservice[:dsc_poisonthreshold]).to eq(-32)
  end

  it 'should accept string-like int for dsc_poisonthreshold' do
    dsc_xexchtransportservice[:dsc_poisonthreshold] = '16'
    expect(dsc_xexchtransportservice[:dsc_poisonthreshold]).to eq(16)
  end

  it 'should accept string-like int for dsc_poisonthreshold' do
    dsc_xexchtransportservice[:dsc_poisonthreshold] = '-16'
    expect(dsc_xexchtransportservice[:dsc_poisonthreshold]).to eq(-16)
  end

  it 'should accept string-like int for dsc_poisonthreshold' do
    dsc_xexchtransportservice[:dsc_poisonthreshold] = '32'
    expect(dsc_xexchtransportservice[:dsc_poisonthreshold]).to eq(32)
  end

  it 'should accept string-like int for dsc_poisonthreshold' do
    dsc_xexchtransportservice[:dsc_poisonthreshold] = '-32'
    expect(dsc_xexchtransportservice[:dsc_poisonthreshold]).to eq(-32)
  end


  it 'should not accept array for dsc_queuelogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_queuelogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_queuelogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_queuelogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_queuelogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_queuelogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_queuelogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_queuelogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_queuelogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_queuelogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_queuelogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_queuelogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_queuelogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_queuelogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_queuelogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_queuelogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_queuelogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_queuelogmaxfilesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_queuelogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_queuelogmaxfilesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_queuelogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_queuelogmaxfilesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_queuelogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_queuelogmaxfilesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_queuelogpath' do
    expect{dsc_xexchtransportservice[:dsc_queuelogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_queuelogpath' do
    expect{dsc_xexchtransportservice[:dsc_queuelogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_queuelogpath' do
    expect{dsc_xexchtransportservice[:dsc_queuelogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_queuelogpath' do
    expect{dsc_xexchtransportservice[:dsc_queuelogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_queuemaxidletime' do
    expect{dsc_xexchtransportservice[:dsc_queuemaxidletime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_queuemaxidletime' do
    expect{dsc_xexchtransportservice[:dsc_queuemaxidletime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_queuemaxidletime' do
    expect{dsc_xexchtransportservice[:dsc_queuemaxidletime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_queuemaxidletime' do
    expect{dsc_xexchtransportservice[:dsc_queuemaxidletime] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_receiveprotocollogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_receiveprotocollogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_receiveprotocollogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_receiveprotocollogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_receiveprotocollogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_receiveprotocollogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_receiveprotocollogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_receiveprotocollogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_receiveprotocollogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogmaxfilesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_receiveprotocollogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogmaxfilesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_receiveprotocollogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogmaxfilesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_receiveprotocollogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogmaxfilesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_receiveprotocollogpath' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_receiveprotocollogpath' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_receiveprotocollogpath' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_receiveprotocollogpath' do
    expect{dsc_xexchtransportservice[:dsc_receiveprotocollogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_recipientvalidationcacheenabled' do
    expect{dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_recipientvalidationcacheenabled' do
    dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled] = true
    expect(dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_recipientvalidationcacheenabled" do
    dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled] = 'true'
    expect(dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_recipientvalidationcacheenabled" do
    dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled] = 'false'
    expect(dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_recipientvalidationcacheenabled" do
    dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled] = 'True'
    expect(dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_recipientvalidationcacheenabled" do
    dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled] = 'False'
    expect(dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_recipientvalidationcacheenabled" do
    dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled] = :true
    expect(dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_recipientvalidationcacheenabled" do
    dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled] = :false
    expect(dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled]).to eq(false)
  end

  it 'should not accept int for dsc_recipientvalidationcacheenabled' do
    expect{dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_recipientvalidationcacheenabled' do
    expect{dsc_xexchtransportservice[:dsc_recipientvalidationcacheenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_replaydirectorypath' do
    expect{dsc_xexchtransportservice[:dsc_replaydirectorypath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_replaydirectorypath' do
    expect{dsc_xexchtransportservice[:dsc_replaydirectorypath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_replaydirectorypath' do
    expect{dsc_xexchtransportservice[:dsc_replaydirectorypath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_replaydirectorypath' do
    expect{dsc_xexchtransportservice[:dsc_replaydirectorypath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_rootdropdirectorypath' do
    expect{dsc_xexchtransportservice[:dsc_rootdropdirectorypath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_rootdropdirectorypath' do
    expect{dsc_xexchtransportservice[:dsc_rootdropdirectorypath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_rootdropdirectorypath' do
    expect{dsc_xexchtransportservice[:dsc_rootdropdirectorypath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rootdropdirectorypath' do
    expect{dsc_xexchtransportservice[:dsc_rootdropdirectorypath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_routingtablelogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_routingtablelogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_routingtablelogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_routingtablelogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_routingtablelogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_routingtablelogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_routingtablelogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_routingtablelogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_routingtablelogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_routingtablelogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_routingtablelogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_routingtablelogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_routingtablelogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_routingtablelogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_routingtablelogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_routingtablelogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_routingtablelogpath' do
    expect{dsc_xexchtransportservice[:dsc_routingtablelogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_routingtablelogpath' do
    expect{dsc_xexchtransportservice[:dsc_routingtablelogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_routingtablelogpath' do
    expect{dsc_xexchtransportservice[:dsc_routingtablelogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_routingtablelogpath' do
    expect{dsc_xexchtransportservice[:dsc_routingtablelogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendprotocollogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendprotocollogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sendprotocollogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sendprotocollogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendprotocollogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendprotocollogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sendprotocollogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sendprotocollogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendprotocollogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogmaxfilesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendprotocollogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogmaxfilesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sendprotocollogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogmaxfilesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sendprotocollogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogmaxfilesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendprotocollogpath' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendprotocollogpath' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sendprotocollogpath' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sendprotocollogpath' do
    expect{dsc_xexchtransportservice[:dsc_sendprotocollogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_serverstatisticslogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serverstatisticslogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serverstatisticslogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serverstatisticslogmaxage' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_serverstatisticslogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serverstatisticslogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serverstatisticslogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serverstatisticslogmaxdirectorysize' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_serverstatisticslogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogmaxfilesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serverstatisticslogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogmaxfilesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serverstatisticslogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogmaxfilesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serverstatisticslogmaxfilesize' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogmaxfilesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_serverstatisticslogpath' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serverstatisticslogpath' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serverstatisticslogpath' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serverstatisticslogpath' do
    expect{dsc_xexchtransportservice[:dsc_serverstatisticslogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_transientfailureretrycount' do
    expect{dsc_xexchtransportservice[:dsc_transientfailureretrycount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_transientfailureretrycount' do
    expect{dsc_xexchtransportservice[:dsc_transientfailureretrycount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_transientfailureretrycount' do
    dsc_xexchtransportservice[:dsc_transientfailureretrycount] = -32
    expect(dsc_xexchtransportservice[:dsc_transientfailureretrycount]).to eq(-32)
  end

  it 'should accept string-like int for dsc_transientfailureretrycount' do
    dsc_xexchtransportservice[:dsc_transientfailureretrycount] = '16'
    expect(dsc_xexchtransportservice[:dsc_transientfailureretrycount]).to eq(16)
  end

  it 'should accept string-like int for dsc_transientfailureretrycount' do
    dsc_xexchtransportservice[:dsc_transientfailureretrycount] = '-16'
    expect(dsc_xexchtransportservice[:dsc_transientfailureretrycount]).to eq(-16)
  end

  it 'should accept string-like int for dsc_transientfailureretrycount' do
    dsc_xexchtransportservice[:dsc_transientfailureretrycount] = '32'
    expect(dsc_xexchtransportservice[:dsc_transientfailureretrycount]).to eq(32)
  end

  it 'should accept string-like int for dsc_transientfailureretrycount' do
    dsc_xexchtransportservice[:dsc_transientfailureretrycount] = '-32'
    expect(dsc_xexchtransportservice[:dsc_transientfailureretrycount]).to eq(-32)
  end


  it 'should not accept array for dsc_transientfailureretryinterval' do
    expect{dsc_xexchtransportservice[:dsc_transientfailureretryinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_transientfailureretryinterval' do
    expect{dsc_xexchtransportservice[:dsc_transientfailureretryinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_transientfailureretryinterval' do
    expect{dsc_xexchtransportservice[:dsc_transientfailureretryinterval] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_transientfailureretryinterval' do
    expect{dsc_xexchtransportservice[:dsc_transientfailureretryinterval] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usedowngradedexchangeserverauth' do
    expect{dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_usedowngradedexchangeserverauth' do
    dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth] = true
    expect(dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_usedowngradedexchangeserverauth" do
    dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth] = 'true'
    expect(dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_usedowngradedexchangeserverauth" do
    dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth] = 'false'
    expect(dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_usedowngradedexchangeserverauth" do
    dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth] = 'True'
    expect(dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_usedowngradedexchangeserverauth" do
    dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth] = 'False'
    expect(dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_usedowngradedexchangeserverauth" do
    dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth] = :true
    expect(dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_usedowngradedexchangeserverauth" do
    dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth] = :false
    expect(dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth]).to eq(false)
  end

  it 'should not accept int for dsc_usedowngradedexchangeserverauth' do
    expect{dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usedowngradedexchangeserverauth' do
    expect{dsc_xexchtransportservice[:dsc_usedowngradedexchangeserverauth] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchtransportservice)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchtransportservice)
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

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
