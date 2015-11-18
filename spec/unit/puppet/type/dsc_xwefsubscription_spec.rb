#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwefsubscription) do

  let :dsc_xwefsubscription do
    Puppet::Type.type(:dsc_xwefsubscription).new(
      :name     => 'foo',
      :dsc_subscriptionid => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwefsubscription.to_s).to eq("Dsc_xwefsubscription[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xwefsubscription[:ensure]).to eq :present
  end

  it 'should require that dsc_subscriptionid is specified' do
    #dsc_xwefsubscription[:dsc_subscriptionid]
    expect { Puppet::Type.type(:dsc_xwefsubscription).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_subscriptiontype => 'CollectorInitiated',
      :dsc_description => 'foo',
      :dsc_enabled => 'true',
      :dsc_deliverymode => 'Push',
      :dsc_maxitems => -32,
      :dsc_maxlatencytime => 64,
      :dsc_heartbeatinterval => 64,
      :dsc_readexistingevents => 'true',
      :dsc_transportname => 'HTTP',
      :dsc_transportport => 'foo',
      :dsc_contentformat => 'foo',
      :dsc_locale => 'foo',
      :dsc_logfile => 'foo',
      :dsc_credentialstype => 'Default',
      :dsc_allowedsourcenondomaincomputers => ["foo", "bar", "spec"],
      :dsc_allowedsourcedomaincomputers => 'foo',
      :dsc_query => ["foo", "bar", "spec"],
      :dsc_address => ["foo", "bar", "spec"],
    )}.to raise_error(Puppet::Error, /dsc_subscriptionid is a required attribute/)
  end

  it 'should not accept array for dsc_subscriptionid' do
    expect{dsc_xwefsubscription[:dsc_subscriptionid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_subscriptionid' do
    expect{dsc_xwefsubscription[:dsc_subscriptionid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_subscriptionid' do
    expect{dsc_xwefsubscription[:dsc_subscriptionid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_subscriptionid' do
    expect{dsc_xwefsubscription[:dsc_subscriptionid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xwefsubscription[:dsc_ensure] = 'Present'
    expect(dsc_xwefsubscription[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xwefsubscription[:dsc_ensure] = 'present'
    expect(dsc_xwefsubscription[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwefsubscription[:dsc_ensure] = 'present'
    expect(dsc_xwefsubscription[:ensure]).to eq(dsc_xwefsubscription[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xwefsubscription[:dsc_ensure] = 'Absent'
    expect(dsc_xwefsubscription[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xwefsubscription[:dsc_ensure] = 'absent'
    expect(dsc_xwefsubscription[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwefsubscription[:dsc_ensure] = 'absent'
    expect(dsc_xwefsubscription[:ensure]).to eq(dsc_xwefsubscription[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwefsubscription[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xwefsubscription[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xwefsubscription[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xwefsubscription[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xwefsubscription[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_subscriptiontype predefined value CollectorInitiated' do
    dsc_xwefsubscription[:dsc_subscriptiontype] = 'CollectorInitiated'
    expect(dsc_xwefsubscription[:dsc_subscriptiontype]).to eq('CollectorInitiated')
  end

  it 'should accept dsc_subscriptiontype predefined value collectorinitiated' do
    dsc_xwefsubscription[:dsc_subscriptiontype] = 'collectorinitiated'
    expect(dsc_xwefsubscription[:dsc_subscriptiontype]).to eq('collectorinitiated')
  end

  it 'should accept dsc_subscriptiontype predefined value SourceInitiated' do
    dsc_xwefsubscription[:dsc_subscriptiontype] = 'SourceInitiated'
    expect(dsc_xwefsubscription[:dsc_subscriptiontype]).to eq('SourceInitiated')
  end

  it 'should accept dsc_subscriptiontype predefined value sourceinitiated' do
    dsc_xwefsubscription[:dsc_subscriptiontype] = 'sourceinitiated'
    expect(dsc_xwefsubscription[:dsc_subscriptiontype]).to eq('sourceinitiated')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwefsubscription[:dsc_subscriptiontype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_subscriptiontype' do
    expect{dsc_xwefsubscription[:dsc_subscriptiontype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_subscriptiontype' do
    expect{dsc_xwefsubscription[:dsc_subscriptiontype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_subscriptiontype' do
    expect{dsc_xwefsubscription[:dsc_subscriptiontype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_subscriptiontype' do
    expect{dsc_xwefsubscription[:dsc_subscriptiontype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xwefsubscription[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xwefsubscription[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xwefsubscription[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xwefsubscription[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_enabled predefined value true' do
    dsc_xwefsubscription[:dsc_enabled] = 'true'
    expect(dsc_xwefsubscription[:dsc_enabled]).to eq('true')
  end

  it 'should accept dsc_enabled predefined value true' do
    dsc_xwefsubscription[:dsc_enabled] = 'true'
    expect(dsc_xwefsubscription[:dsc_enabled]).to eq('true')
  end

  it 'should accept dsc_enabled predefined value false' do
    dsc_xwefsubscription[:dsc_enabled] = 'false'
    expect(dsc_xwefsubscription[:dsc_enabled]).to eq('false')
  end

  it 'should accept dsc_enabled predefined value false' do
    dsc_xwefsubscription[:dsc_enabled] = 'false'
    expect(dsc_xwefsubscription[:dsc_enabled]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwefsubscription[:dsc_enabled] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enabled' do
    expect{dsc_xwefsubscription[:dsc_enabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_enabled' do
    expect{dsc_xwefsubscription[:dsc_enabled] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_enabled' do
    expect{dsc_xwefsubscription[:dsc_enabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabled' do
    expect{dsc_xwefsubscription[:dsc_enabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_deliverymode predefined value Push' do
    dsc_xwefsubscription[:dsc_deliverymode] = 'Push'
    expect(dsc_xwefsubscription[:dsc_deliverymode]).to eq('Push')
  end

  it 'should accept dsc_deliverymode predefined value push' do
    dsc_xwefsubscription[:dsc_deliverymode] = 'push'
    expect(dsc_xwefsubscription[:dsc_deliverymode]).to eq('push')
  end

  it 'should accept dsc_deliverymode predefined value Pull' do
    dsc_xwefsubscription[:dsc_deliverymode] = 'Pull'
    expect(dsc_xwefsubscription[:dsc_deliverymode]).to eq('Pull')
  end

  it 'should accept dsc_deliverymode predefined value pull' do
    dsc_xwefsubscription[:dsc_deliverymode] = 'pull'
    expect(dsc_xwefsubscription[:dsc_deliverymode]).to eq('pull')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwefsubscription[:dsc_deliverymode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_deliverymode' do
    expect{dsc_xwefsubscription[:dsc_deliverymode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_deliverymode' do
    expect{dsc_xwefsubscription[:dsc_deliverymode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_deliverymode' do
    expect{dsc_xwefsubscription[:dsc_deliverymode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_deliverymode' do
    expect{dsc_xwefsubscription[:dsc_deliverymode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxitems' do
    expect{dsc_xwefsubscription[:dsc_maxitems] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxitems' do
    expect{dsc_xwefsubscription[:dsc_maxitems] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_maxitems' do
    dsc_xwefsubscription[:dsc_maxitems] = -32
    expect(dsc_xwefsubscription[:dsc_maxitems]).to eq(-32)
  end

  it 'should accept string-like int for dsc_maxitems' do
    dsc_xwefsubscription[:dsc_maxitems] = '16'
    expect(dsc_xwefsubscription[:dsc_maxitems]).to eq(16)
  end

  it 'should accept string-like int for dsc_maxitems' do
    dsc_xwefsubscription[:dsc_maxitems] = '-16'
    expect(dsc_xwefsubscription[:dsc_maxitems]).to eq(-16)
  end

  it 'should accept string-like int for dsc_maxitems' do
    dsc_xwefsubscription[:dsc_maxitems] = '32'
    expect(dsc_xwefsubscription[:dsc_maxitems]).to eq(32)
  end

  it 'should accept string-like int for dsc_maxitems' do
    dsc_xwefsubscription[:dsc_maxitems] = '-32'
    expect(dsc_xwefsubscription[:dsc_maxitems]).to eq(-32)
  end


  it 'should not accept array for dsc_maxlatencytime' do
    expect{dsc_xwefsubscription[:dsc_maxlatencytime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxlatencytime' do
    expect{dsc_xwefsubscription[:dsc_maxlatencytime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maxlatencytime' do
    dsc_xwefsubscription[:dsc_maxlatencytime] = 64
    expect(dsc_xwefsubscription[:dsc_maxlatencytime]).to eq(64)
  end

  it 'should not accept signed (negative) value for dsc_maxlatencytime' do
    value = -64
    expect(value).to be < 0
    expect{dsc_xwefsubscription[:dsc_maxlatencytime] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_maxlatencytime' do
    dsc_xwefsubscription[:dsc_maxlatencytime] = '16'
    expect(dsc_xwefsubscription[:dsc_maxlatencytime]).to eq(16)
  end

  it 'should accept string-like uint for dsc_maxlatencytime' do
    dsc_xwefsubscription[:dsc_maxlatencytime] = '32'
    expect(dsc_xwefsubscription[:dsc_maxlatencytime]).to eq(32)
  end

  it 'should accept string-like uint for dsc_maxlatencytime' do
    dsc_xwefsubscription[:dsc_maxlatencytime] = '64'
    expect(dsc_xwefsubscription[:dsc_maxlatencytime]).to eq(64)
  end

  it 'should not accept array for dsc_heartbeatinterval' do
    expect{dsc_xwefsubscription[:dsc_heartbeatinterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_heartbeatinterval' do
    expect{dsc_xwefsubscription[:dsc_heartbeatinterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_heartbeatinterval' do
    dsc_xwefsubscription[:dsc_heartbeatinterval] = 64
    expect(dsc_xwefsubscription[:dsc_heartbeatinterval]).to eq(64)
  end

  it 'should not accept signed (negative) value for dsc_heartbeatinterval' do
    value = -64
    expect(value).to be < 0
    expect{dsc_xwefsubscription[:dsc_heartbeatinterval] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_heartbeatinterval' do
    dsc_xwefsubscription[:dsc_heartbeatinterval] = '16'
    expect(dsc_xwefsubscription[:dsc_heartbeatinterval]).to eq(16)
  end

  it 'should accept string-like uint for dsc_heartbeatinterval' do
    dsc_xwefsubscription[:dsc_heartbeatinterval] = '32'
    expect(dsc_xwefsubscription[:dsc_heartbeatinterval]).to eq(32)
  end

  it 'should accept string-like uint for dsc_heartbeatinterval' do
    dsc_xwefsubscription[:dsc_heartbeatinterval] = '64'
    expect(dsc_xwefsubscription[:dsc_heartbeatinterval]).to eq(64)
  end

  it 'should accept dsc_readexistingevents predefined value true' do
    dsc_xwefsubscription[:dsc_readexistingevents] = 'true'
    expect(dsc_xwefsubscription[:dsc_readexistingevents]).to eq('true')
  end

  it 'should accept dsc_readexistingevents predefined value true' do
    dsc_xwefsubscription[:dsc_readexistingevents] = 'true'
    expect(dsc_xwefsubscription[:dsc_readexistingevents]).to eq('true')
  end

  it 'should accept dsc_readexistingevents predefined value false' do
    dsc_xwefsubscription[:dsc_readexistingevents] = 'false'
    expect(dsc_xwefsubscription[:dsc_readexistingevents]).to eq('false')
  end

  it 'should accept dsc_readexistingevents predefined value false' do
    dsc_xwefsubscription[:dsc_readexistingevents] = 'false'
    expect(dsc_xwefsubscription[:dsc_readexistingevents]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwefsubscription[:dsc_readexistingevents] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_readexistingevents' do
    expect{dsc_xwefsubscription[:dsc_readexistingevents] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_readexistingevents' do
    expect{dsc_xwefsubscription[:dsc_readexistingevents] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_readexistingevents' do
    expect{dsc_xwefsubscription[:dsc_readexistingevents] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_readexistingevents' do
    expect{dsc_xwefsubscription[:dsc_readexistingevents] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_transportname predefined value HTTP' do
    dsc_xwefsubscription[:dsc_transportname] = 'HTTP'
    expect(dsc_xwefsubscription[:dsc_transportname]).to eq('HTTP')
  end

  it 'should accept dsc_transportname predefined value http' do
    dsc_xwefsubscription[:dsc_transportname] = 'http'
    expect(dsc_xwefsubscription[:dsc_transportname]).to eq('http')
  end

  it 'should accept dsc_transportname predefined value HTTPS' do
    dsc_xwefsubscription[:dsc_transportname] = 'HTTPS'
    expect(dsc_xwefsubscription[:dsc_transportname]).to eq('HTTPS')
  end

  it 'should accept dsc_transportname predefined value https' do
    dsc_xwefsubscription[:dsc_transportname] = 'https'
    expect(dsc_xwefsubscription[:dsc_transportname]).to eq('https')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwefsubscription[:dsc_transportname] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_transportname' do
    expect{dsc_xwefsubscription[:dsc_transportname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_transportname' do
    expect{dsc_xwefsubscription[:dsc_transportname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_transportname' do
    expect{dsc_xwefsubscription[:dsc_transportname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_transportname' do
    expect{dsc_xwefsubscription[:dsc_transportname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_transportport' do
    expect{dsc_xwefsubscription[:dsc_transportport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_transportport' do
    expect{dsc_xwefsubscription[:dsc_transportport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_transportport' do
    expect{dsc_xwefsubscription[:dsc_transportport] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_transportport' do
    expect{dsc_xwefsubscription[:dsc_transportport] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_contentformat' do
    expect{dsc_xwefsubscription[:dsc_contentformat] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_contentformat' do
    expect{dsc_xwefsubscription[:dsc_contentformat] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_contentformat' do
    expect{dsc_xwefsubscription[:dsc_contentformat] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_contentformat' do
    expect{dsc_xwefsubscription[:dsc_contentformat] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_locale' do
    expect{dsc_xwefsubscription[:dsc_locale] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_locale' do
    expect{dsc_xwefsubscription[:dsc_locale] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_locale' do
    expect{dsc_xwefsubscription[:dsc_locale] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_locale' do
    expect{dsc_xwefsubscription[:dsc_locale] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logfile' do
    expect{dsc_xwefsubscription[:dsc_logfile] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logfile' do
    expect{dsc_xwefsubscription[:dsc_logfile] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logfile' do
    expect{dsc_xwefsubscription[:dsc_logfile] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logfile' do
    expect{dsc_xwefsubscription[:dsc_logfile] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_credentialstype predefined value Default' do
    dsc_xwefsubscription[:dsc_credentialstype] = 'Default'
    expect(dsc_xwefsubscription[:dsc_credentialstype]).to eq('Default')
  end

  it 'should accept dsc_credentialstype predefined value default' do
    dsc_xwefsubscription[:dsc_credentialstype] = 'default'
    expect(dsc_xwefsubscription[:dsc_credentialstype]).to eq('default')
  end

  it 'should accept dsc_credentialstype predefined value Basic' do
    dsc_xwefsubscription[:dsc_credentialstype] = 'Basic'
    expect(dsc_xwefsubscription[:dsc_credentialstype]).to eq('Basic')
  end

  it 'should accept dsc_credentialstype predefined value basic' do
    dsc_xwefsubscription[:dsc_credentialstype] = 'basic'
    expect(dsc_xwefsubscription[:dsc_credentialstype]).to eq('basic')
  end

  it 'should accept dsc_credentialstype predefined value Negotiate' do
    dsc_xwefsubscription[:dsc_credentialstype] = 'Negotiate'
    expect(dsc_xwefsubscription[:dsc_credentialstype]).to eq('Negotiate')
  end

  it 'should accept dsc_credentialstype predefined value negotiate' do
    dsc_xwefsubscription[:dsc_credentialstype] = 'negotiate'
    expect(dsc_xwefsubscription[:dsc_credentialstype]).to eq('negotiate')
  end

  it 'should accept dsc_credentialstype predefined value Digest' do
    dsc_xwefsubscription[:dsc_credentialstype] = 'Digest'
    expect(dsc_xwefsubscription[:dsc_credentialstype]).to eq('Digest')
  end

  it 'should accept dsc_credentialstype predefined value digest' do
    dsc_xwefsubscription[:dsc_credentialstype] = 'digest'
    expect(dsc_xwefsubscription[:dsc_credentialstype]).to eq('digest')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwefsubscription[:dsc_credentialstype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credentialstype' do
    expect{dsc_xwefsubscription[:dsc_credentialstype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credentialstype' do
    expect{dsc_xwefsubscription[:dsc_credentialstype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credentialstype' do
    expect{dsc_xwefsubscription[:dsc_credentialstype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credentialstype' do
    expect{dsc_xwefsubscription[:dsc_credentialstype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_allowedsourcenondomaincomputers' do
    dsc_xwefsubscription[:dsc_allowedsourcenondomaincomputers] = ["foo", "bar", "spec"]
    expect(dsc_xwefsubscription[:dsc_allowedsourcenondomaincomputers]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_allowedsourcenondomaincomputers' do
    expect{dsc_xwefsubscription[:dsc_allowedsourcenondomaincomputers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_allowedsourcenondomaincomputers' do
    expect{dsc_xwefsubscription[:dsc_allowedsourcenondomaincomputers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowedsourcenondomaincomputers' do
    expect{dsc_xwefsubscription[:dsc_allowedsourcenondomaincomputers] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowedsourcedomaincomputers' do
    expect{dsc_xwefsubscription[:dsc_allowedsourcedomaincomputers] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_allowedsourcedomaincomputers' do
    expect{dsc_xwefsubscription[:dsc_allowedsourcedomaincomputers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_allowedsourcedomaincomputers' do
    expect{dsc_xwefsubscription[:dsc_allowedsourcedomaincomputers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowedsourcedomaincomputers' do
    expect{dsc_xwefsubscription[:dsc_allowedsourcedomaincomputers] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_query' do
    dsc_xwefsubscription[:dsc_query] = ["foo", "bar", "spec"]
    expect(dsc_xwefsubscription[:dsc_query]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_query' do
    expect{dsc_xwefsubscription[:dsc_query] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_query' do
    expect{dsc_xwefsubscription[:dsc_query] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_query' do
    expect{dsc_xwefsubscription[:dsc_query] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_address' do
    dsc_xwefsubscription[:dsc_address] = ["foo", "bar", "spec"]
    expect(dsc_xwefsubscription[:dsc_address]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_address' do
    expect{dsc_xwefsubscription[:dsc_address] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_address' do
    expect{dsc_xwefsubscription[:dsc_address] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_address' do
    expect{dsc_xwefsubscription[:dsc_address] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwefsubscription)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwefsubscription)
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
        dsc_xwefsubscription.original_parameters[:dsc_ensure] = 'present'
        dsc_xwefsubscription[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xwefsubscription)
      end

      it "should update :ensure to :present" do
        expect(dsc_xwefsubscription[:ensure]).to eq(:present)
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
        dsc_xwefsubscription.original_parameters[:dsc_ensure] = 'absent'
        dsc_xwefsubscription[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xwefsubscription)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xwefsubscription[:ensure]).to eq(:absent)
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
