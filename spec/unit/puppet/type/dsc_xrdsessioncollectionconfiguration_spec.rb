#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xrdsessioncollectionconfiguration) do

  let :dsc_xrdsessioncollectionconfiguration do
    Puppet::Type.type(:dsc_xrdsessioncollectionconfiguration).new(
      :name     => 'foo',
      :dsc_collectionname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xrdsessioncollectionconfiguration.to_s).to eq("Dsc_xrdsessioncollectionconfiguration[foo]")
  end

  it 'should require that dsc_collectionname is specified' do
    #dsc_xrdsessioncollectionconfiguration[:dsc_collectionname]
    expect { Puppet::Type.type(:dsc_xrdsessioncollectionconfiguration).new(
      :name     => 'foo',
      :dsc_activesessionlimitmin => 32,
      :dsc_authenticateusingnla => true,
      :dsc_automaticreconnectionenabled => true,
      :dsc_brokenconnectionaction => 'foo',
      :dsc_clientdeviceredirectionoptions => 'foo',
      :dsc_clientprinterasdefault => true,
      :dsc_clientprinterredirected => true,
      :dsc_collectiondescription => 'foo',
      :dsc_connectionbroker => 'foo',
      :dsc_customrdpproperty => 'foo',
      :dsc_disconnectedsessionlimitmin => 32,
      :dsc_encryptionlevel => 'foo',
      :dsc_idlesessionlimitmin => 32,
      :dsc_maxredirectedmonitors => 32,
      :dsc_rdeasyprintdriverenabled => true,
      :dsc_securitylayer => 'foo',
      :dsc_temporaryfoldersdeletedonexit => true,
      :dsc_usergroup => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_collectionname is a required attribute/)
  end

  it 'should not accept array for dsc_collectionname' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_collectionname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_collectionname' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_collectionname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_collectionname' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_collectionname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_collectionname' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_collectionname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_activesessionlimitmin' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_activesessionlimitmin] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_activesessionlimitmin' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_activesessionlimitmin] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_activesessionlimitmin' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_activesessionlimitmin] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_activesessionlimitmin' do
    dsc_xrdsessioncollectionconfiguration[:dsc_activesessionlimitmin] = 32
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_activesessionlimitmin]).to eq(32)
  end


  it 'should accept string-like int for dsc_activesessionlimitmin' do
    dsc_xrdsessioncollectionconfiguration[:dsc_activesessionlimitmin] = '16'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_activesessionlimitmin]).to eq(16)
  end


  it 'should accept string-like int for dsc_activesessionlimitmin' do
    dsc_xrdsessioncollectionconfiguration[:dsc_activesessionlimitmin] = '32'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_activesessionlimitmin]).to eq(32)
  end


  it 'should accept string-like int for dsc_activesessionlimitmin' do
    dsc_xrdsessioncollectionconfiguration[:dsc_activesessionlimitmin] = '64'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_activesessionlimitmin]).to eq(64)
  end

  it 'should not accept array for dsc_authenticateusingnla' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_authenticateusingnla' do
    dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla] = true
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_authenticateusingnla" do
    dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla] = 'true'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_authenticateusingnla" do
    dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla] = 'false'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_authenticateusingnla" do
    dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla] = 'True'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_authenticateusingnla" do
    dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla] = 'False'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_authenticateusingnla" do
    dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla] = :true
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_authenticateusingnla" do
    dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla] = :false
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla]).to eq(false)
  end

  it 'should not accept int for dsc_authenticateusingnla' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_authenticateusingnla' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_authenticateusingnla] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_automaticreconnectionenabled' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_automaticreconnectionenabled' do
    dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled] = true
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_automaticreconnectionenabled" do
    dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled] = 'true'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_automaticreconnectionenabled" do
    dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled] = 'false'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_automaticreconnectionenabled" do
    dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled] = 'True'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_automaticreconnectionenabled" do
    dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled] = 'False'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_automaticreconnectionenabled" do
    dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled] = :true
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_automaticreconnectionenabled" do
    dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled] = :false
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled]).to eq(false)
  end

  it 'should not accept int for dsc_automaticreconnectionenabled' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_automaticreconnectionenabled' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_automaticreconnectionenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_brokenconnectionaction' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_brokenconnectionaction] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_brokenconnectionaction' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_brokenconnectionaction] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_brokenconnectionaction' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_brokenconnectionaction] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_brokenconnectionaction' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_brokenconnectionaction] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_clientdeviceredirectionoptions' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_clientdeviceredirectionoptions] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_clientdeviceredirectionoptions' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_clientdeviceredirectionoptions] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_clientdeviceredirectionoptions' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_clientdeviceredirectionoptions] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_clientdeviceredirectionoptions' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_clientdeviceredirectionoptions] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_clientprinterasdefault' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_clientprinterasdefault' do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault] = true
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_clientprinterasdefault" do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault] = 'true'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_clientprinterasdefault" do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault] = 'false'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_clientprinterasdefault" do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault] = 'True'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_clientprinterasdefault" do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault] = 'False'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_clientprinterasdefault" do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault] = :true
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_clientprinterasdefault" do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault] = :false
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault]).to eq(false)
  end

  it 'should not accept int for dsc_clientprinterasdefault' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_clientprinterasdefault' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterasdefault] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_clientprinterredirected' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_clientprinterredirected' do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected] = true
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_clientprinterredirected" do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected] = 'true'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_clientprinterredirected" do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected] = 'false'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_clientprinterredirected" do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected] = 'True'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_clientprinterredirected" do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected] = 'False'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_clientprinterredirected" do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected] = :true
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_clientprinterredirected" do
    dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected] = :false
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected]).to eq(false)
  end

  it 'should not accept int for dsc_clientprinterredirected' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_clientprinterredirected' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_clientprinterredirected] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_collectiondescription' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_collectiondescription] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_collectiondescription' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_collectiondescription] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_collectiondescription' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_collectiondescription] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_collectiondescription' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_collectiondescription] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectionbroker' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_connectionbroker] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectionbroker' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_connectionbroker] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectionbroker' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_connectionbroker] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectionbroker' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_connectionbroker] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_customrdpproperty' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_customrdpproperty] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_customrdpproperty' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_customrdpproperty] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_customrdpproperty' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_customrdpproperty] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_customrdpproperty' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_customrdpproperty] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disconnectedsessionlimitmin' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_disconnectedsessionlimitmin] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_disconnectedsessionlimitmin' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_disconnectedsessionlimitmin] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_disconnectedsessionlimitmin' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_disconnectedsessionlimitmin] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_disconnectedsessionlimitmin' do
    dsc_xrdsessioncollectionconfiguration[:dsc_disconnectedsessionlimitmin] = 32
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_disconnectedsessionlimitmin]).to eq(32)
  end


  it 'should accept string-like int for dsc_disconnectedsessionlimitmin' do
    dsc_xrdsessioncollectionconfiguration[:dsc_disconnectedsessionlimitmin] = '16'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_disconnectedsessionlimitmin]).to eq(16)
  end


  it 'should accept string-like int for dsc_disconnectedsessionlimitmin' do
    dsc_xrdsessioncollectionconfiguration[:dsc_disconnectedsessionlimitmin] = '32'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_disconnectedsessionlimitmin]).to eq(32)
  end


  it 'should accept string-like int for dsc_disconnectedsessionlimitmin' do
    dsc_xrdsessioncollectionconfiguration[:dsc_disconnectedsessionlimitmin] = '64'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_disconnectedsessionlimitmin]).to eq(64)
  end

  it 'should not accept array for dsc_encryptionlevel' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_encryptionlevel] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_encryptionlevel' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_encryptionlevel] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_encryptionlevel' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_encryptionlevel] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_encryptionlevel' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_encryptionlevel] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_idlesessionlimitmin' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_idlesessionlimitmin] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_idlesessionlimitmin' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_idlesessionlimitmin] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_idlesessionlimitmin' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_idlesessionlimitmin] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_idlesessionlimitmin' do
    dsc_xrdsessioncollectionconfiguration[:dsc_idlesessionlimitmin] = 32
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_idlesessionlimitmin]).to eq(32)
  end


  it 'should accept string-like int for dsc_idlesessionlimitmin' do
    dsc_xrdsessioncollectionconfiguration[:dsc_idlesessionlimitmin] = '16'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_idlesessionlimitmin]).to eq(16)
  end


  it 'should accept string-like int for dsc_idlesessionlimitmin' do
    dsc_xrdsessioncollectionconfiguration[:dsc_idlesessionlimitmin] = '32'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_idlesessionlimitmin]).to eq(32)
  end


  it 'should accept string-like int for dsc_idlesessionlimitmin' do
    dsc_xrdsessioncollectionconfiguration[:dsc_idlesessionlimitmin] = '64'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_idlesessionlimitmin]).to eq(64)
  end

  it 'should not accept array for dsc_maxredirectedmonitors' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_maxredirectedmonitors] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxredirectedmonitors' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_maxredirectedmonitors] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maxredirectedmonitors' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_maxredirectedmonitors] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maxredirectedmonitors' do
    dsc_xrdsessioncollectionconfiguration[:dsc_maxredirectedmonitors] = 32
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_maxredirectedmonitors]).to eq(32)
  end


  it 'should accept string-like int for dsc_maxredirectedmonitors' do
    dsc_xrdsessioncollectionconfiguration[:dsc_maxredirectedmonitors] = '16'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_maxredirectedmonitors]).to eq(16)
  end


  it 'should accept string-like int for dsc_maxredirectedmonitors' do
    dsc_xrdsessioncollectionconfiguration[:dsc_maxredirectedmonitors] = '32'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_maxredirectedmonitors]).to eq(32)
  end


  it 'should accept string-like int for dsc_maxredirectedmonitors' do
    dsc_xrdsessioncollectionconfiguration[:dsc_maxredirectedmonitors] = '64'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_maxredirectedmonitors]).to eq(64)
  end

  it 'should not accept array for dsc_rdeasyprintdriverenabled' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_rdeasyprintdriverenabled' do
    dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled] = true
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_rdeasyprintdriverenabled" do
    dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled] = 'true'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_rdeasyprintdriverenabled" do
    dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled] = 'false'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_rdeasyprintdriverenabled" do
    dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled] = 'True'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_rdeasyprintdriverenabled" do
    dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled] = 'False'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_rdeasyprintdriverenabled" do
    dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled] = :true
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_rdeasyprintdriverenabled" do
    dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled] = :false
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled]).to eq(false)
  end

  it 'should not accept int for dsc_rdeasyprintdriverenabled' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rdeasyprintdriverenabled' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_rdeasyprintdriverenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_securitylayer' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_securitylayer] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_securitylayer' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_securitylayer] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_securitylayer' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_securitylayer] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_securitylayer' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_securitylayer] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_temporaryfoldersdeletedonexit' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_temporaryfoldersdeletedonexit' do
    dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit] = true
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_temporaryfoldersdeletedonexit" do
    dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit] = 'true'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_temporaryfoldersdeletedonexit" do
    dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit] = 'false'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_temporaryfoldersdeletedonexit" do
    dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit] = 'True'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_temporaryfoldersdeletedonexit" do
    dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit] = 'False'
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_temporaryfoldersdeletedonexit" do
    dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit] = :true
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_temporaryfoldersdeletedonexit" do
    dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit] = :false
    expect(dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit]).to eq(false)
  end

  it 'should not accept int for dsc_temporaryfoldersdeletedonexit' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_temporaryfoldersdeletedonexit' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_temporaryfoldersdeletedonexit] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usergroup' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_usergroup] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usergroup' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_usergroup] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usergroup' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_usergroup] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usergroup' do
    expect{dsc_xrdsessioncollectionconfiguration[:dsc_usergroup] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xrdsessioncollectionconfiguration)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xrdsessioncollectionconfiguration)
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
        dsc_xrdsessioncollectionconfiguration[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xrdsessioncollectionconfiguration[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xrdsessioncollectionconfiguration)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xrdsessioncollectionconfiguration)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xRDSessionCollectionConfiguration as $MSFT_xRDSessionCollectionConfiguration1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xRDSessionCollectionConfiguration/)
    end


  end
end
