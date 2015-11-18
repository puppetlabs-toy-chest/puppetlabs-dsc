#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchoutlookanywhere) do

  let :dsc_xexchoutlookanywhere do
    Puppet::Type.type(:dsc_xexchoutlookanywhere).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchoutlookanywhere.to_s).to eq("Dsc_xexchoutlookanywhere[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchoutlookanywhere[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchoutlookanywhere).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_allowservicerestart => true,
      :dsc_domaincontroller => 'foo',
      :dsc_externalclientsrequiressl => true,
      :dsc_extendedprotectionflags => ["foo", "bar", "spec"],
      :dsc_extendedprotectionspnlist => ["foo", "bar", "spec"],
      :dsc_extendedprotectiontokenchecking => 'Allow',
      :dsc_externalclientauthenticationmethod => 'Ntlm',
      :dsc_externalhostname => 'foo',
      :dsc_iisauthenticationmethods => ["foo", "bar", "spec"],
      :dsc_internalclientauthenticationmethod => 'Ntlm',
      :dsc_internalclientsrequiressl => true,
      :dsc_internalhostname => 'foo',
      :dsc_ssloffloading => true,
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchoutlookanywhere[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchoutlookanywhere[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchoutlookanywhere[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchoutlookanywhere[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchoutlookanywhere[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchoutlookanywhere[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchoutlookanywhere[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchoutlookanywhere[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchoutlookanywhere[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchoutlookanywhere[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchoutlookanywhere[:dsc_allowservicerestart] = true
    expect(dsc_xexchoutlookanywhere[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchoutlookanywhere[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchoutlookanywhere[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchoutlookanywhere[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchoutlookanywhere[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchoutlookanywhere[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchoutlookanywhere[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchoutlookanywhere[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchoutlookanywhere[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchoutlookanywhere[:dsc_allowservicerestart] = :true
    expect(dsc_xexchoutlookanywhere[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchoutlookanywhere[:dsc_allowservicerestart] = :false
    expect(dsc_xexchoutlookanywhere[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchoutlookanywhere[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchoutlookanywhere[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchoutlookanywhere[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchoutlookanywhere[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchoutlookanywhere[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchoutlookanywhere[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externalclientsrequiressl' do
    expect{dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_externalclientsrequiressl' do
    dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl] = true
    expect(dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_externalclientsrequiressl" do
    dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl] = 'true'
    expect(dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_externalclientsrequiressl" do
    dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl] = 'false'
    expect(dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_externalclientsrequiressl" do
    dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl] = 'True'
    expect(dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_externalclientsrequiressl" do
    dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl] = 'False'
    expect(dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_externalclientsrequiressl" do
    dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl] = :true
    expect(dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_externalclientsrequiressl" do
    dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl] = :false
    expect(dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl]).to eq(false)
  end

  it 'should not accept int for dsc_externalclientsrequiressl' do
    expect{dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalclientsrequiressl' do
    expect{dsc_xexchoutlookanywhere[:dsc_externalclientsrequiressl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_extendedprotectionflags' do
    dsc_xexchoutlookanywhere[:dsc_extendedprotectionflags] = ["foo", "bar", "spec"]
    expect(dsc_xexchoutlookanywhere[:dsc_extendedprotectionflags]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_extendedprotectionflags' do
    expect{dsc_xexchoutlookanywhere[:dsc_extendedprotectionflags] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_extendedprotectionflags' do
    expect{dsc_xexchoutlookanywhere[:dsc_extendedprotectionflags] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_extendedprotectionflags' do
    expect{dsc_xexchoutlookanywhere[:dsc_extendedprotectionflags] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_extendedprotectionspnlist' do
    dsc_xexchoutlookanywhere[:dsc_extendedprotectionspnlist] = ["foo", "bar", "spec"]
    expect(dsc_xexchoutlookanywhere[:dsc_extendedprotectionspnlist]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_extendedprotectionspnlist' do
    expect{dsc_xexchoutlookanywhere[:dsc_extendedprotectionspnlist] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_extendedprotectionspnlist' do
    expect{dsc_xexchoutlookanywhere[:dsc_extendedprotectionspnlist] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_extendedprotectionspnlist' do
    expect{dsc_xexchoutlookanywhere[:dsc_extendedprotectionspnlist] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_extendedprotectiontokenchecking predefined value Allow' do
    dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking] = 'Allow'
    expect(dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking]).to eq('Allow')
  end

  it 'should accept dsc_extendedprotectiontokenchecking predefined value allow' do
    dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking] = 'allow'
    expect(dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking]).to eq('allow')
  end

  it 'should accept dsc_extendedprotectiontokenchecking predefined value None' do
    dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking] = 'None'
    expect(dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking]).to eq('None')
  end

  it 'should accept dsc_extendedprotectiontokenchecking predefined value none' do
    dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking] = 'none'
    expect(dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking]).to eq('none')
  end

  it 'should accept dsc_extendedprotectiontokenchecking predefined value Require' do
    dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking] = 'Require'
    expect(dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking]).to eq('Require')
  end

  it 'should accept dsc_extendedprotectiontokenchecking predefined value require' do
    dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking] = 'require'
    expect(dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking]).to eq('require')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_extendedprotectiontokenchecking' do
    expect{dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_extendedprotectiontokenchecking' do
    expect{dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_extendedprotectiontokenchecking' do
    expect{dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_extendedprotectiontokenchecking' do
    expect{dsc_xexchoutlookanywhere[:dsc_extendedprotectiontokenchecking] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_externalclientauthenticationmethod predefined value Ntlm' do
    dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod] = 'Ntlm'
    expect(dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod]).to eq('Ntlm')
  end

  it 'should accept dsc_externalclientauthenticationmethod predefined value ntlm' do
    dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod] = 'ntlm'
    expect(dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod]).to eq('ntlm')
  end

  it 'should accept dsc_externalclientauthenticationmethod predefined value Basic' do
    dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod] = 'Basic'
    expect(dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod]).to eq('Basic')
  end

  it 'should accept dsc_externalclientauthenticationmethod predefined value basic' do
    dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod] = 'basic'
    expect(dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod]).to eq('basic')
  end

  it 'should accept dsc_externalclientauthenticationmethod predefined value Negotiate' do
    dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod] = 'Negotiate'
    expect(dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod]).to eq('Negotiate')
  end

  it 'should accept dsc_externalclientauthenticationmethod predefined value negotiate' do
    dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod] = 'negotiate'
    expect(dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod]).to eq('negotiate')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externalclientauthenticationmethod' do
    expect{dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_externalclientauthenticationmethod' do
    expect{dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externalclientauthenticationmethod' do
    expect{dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalclientauthenticationmethod' do
    expect{dsc_xexchoutlookanywhere[:dsc_externalclientauthenticationmethod] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externalhostname' do
    expect{dsc_xexchoutlookanywhere[:dsc_externalhostname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_externalhostname' do
    expect{dsc_xexchoutlookanywhere[:dsc_externalhostname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externalhostname' do
    expect{dsc_xexchoutlookanywhere[:dsc_externalhostname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalhostname' do
    expect{dsc_xexchoutlookanywhere[:dsc_externalhostname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_iisauthenticationmethods' do
    dsc_xexchoutlookanywhere[:dsc_iisauthenticationmethods] = ["foo", "bar", "spec"]
    expect(dsc_xexchoutlookanywhere[:dsc_iisauthenticationmethods]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_iisauthenticationmethods' do
    expect{dsc_xexchoutlookanywhere[:dsc_iisauthenticationmethods] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_iisauthenticationmethods' do
    expect{dsc_xexchoutlookanywhere[:dsc_iisauthenticationmethods] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_iisauthenticationmethods' do
    expect{dsc_xexchoutlookanywhere[:dsc_iisauthenticationmethods] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_internalclientauthenticationmethod predefined value Ntlm' do
    dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod] = 'Ntlm'
    expect(dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod]).to eq('Ntlm')
  end

  it 'should accept dsc_internalclientauthenticationmethod predefined value ntlm' do
    dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod] = 'ntlm'
    expect(dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod]).to eq('ntlm')
  end

  it 'should accept dsc_internalclientauthenticationmethod predefined value Basic' do
    dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod] = 'Basic'
    expect(dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod]).to eq('Basic')
  end

  it 'should accept dsc_internalclientauthenticationmethod predefined value basic' do
    dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod] = 'basic'
    expect(dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod]).to eq('basic')
  end

  it 'should accept dsc_internalclientauthenticationmethod predefined value Negotiate' do
    dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod] = 'Negotiate'
    expect(dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod]).to eq('Negotiate')
  end

  it 'should accept dsc_internalclientauthenticationmethod predefined value negotiate' do
    dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod] = 'negotiate'
    expect(dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod]).to eq('negotiate')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internalclientauthenticationmethod' do
    expect{dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_internalclientauthenticationmethod' do
    expect{dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internalclientauthenticationmethod' do
    expect{dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internalclientauthenticationmethod' do
    expect{dsc_xexchoutlookanywhere[:dsc_internalclientauthenticationmethod] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internalclientsrequiressl' do
    expect{dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_internalclientsrequiressl' do
    dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl] = true
    expect(dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_internalclientsrequiressl" do
    dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl] = 'true'
    expect(dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_internalclientsrequiressl" do
    dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl] = 'false'
    expect(dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_internalclientsrequiressl" do
    dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl] = 'True'
    expect(dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_internalclientsrequiressl" do
    dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl] = 'False'
    expect(dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_internalclientsrequiressl" do
    dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl] = :true
    expect(dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_internalclientsrequiressl" do
    dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl] = :false
    expect(dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl]).to eq(false)
  end

  it 'should not accept int for dsc_internalclientsrequiressl' do
    expect{dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internalclientsrequiressl' do
    expect{dsc_xexchoutlookanywhere[:dsc_internalclientsrequiressl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internalhostname' do
    expect{dsc_xexchoutlookanywhere[:dsc_internalhostname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_internalhostname' do
    expect{dsc_xexchoutlookanywhere[:dsc_internalhostname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internalhostname' do
    expect{dsc_xexchoutlookanywhere[:dsc_internalhostname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internalhostname' do
    expect{dsc_xexchoutlookanywhere[:dsc_internalhostname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ssloffloading' do
    expect{dsc_xexchoutlookanywhere[:dsc_ssloffloading] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_ssloffloading' do
    dsc_xexchoutlookanywhere[:dsc_ssloffloading] = true
    expect(dsc_xexchoutlookanywhere[:dsc_ssloffloading]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_ssloffloading" do
    dsc_xexchoutlookanywhere[:dsc_ssloffloading] = 'true'
    expect(dsc_xexchoutlookanywhere[:dsc_ssloffloading]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_ssloffloading" do
    dsc_xexchoutlookanywhere[:dsc_ssloffloading] = 'false'
    expect(dsc_xexchoutlookanywhere[:dsc_ssloffloading]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_ssloffloading" do
    dsc_xexchoutlookanywhere[:dsc_ssloffloading] = 'True'
    expect(dsc_xexchoutlookanywhere[:dsc_ssloffloading]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_ssloffloading" do
    dsc_xexchoutlookanywhere[:dsc_ssloffloading] = 'False'
    expect(dsc_xexchoutlookanywhere[:dsc_ssloffloading]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_ssloffloading" do
    dsc_xexchoutlookanywhere[:dsc_ssloffloading] = :true
    expect(dsc_xexchoutlookanywhere[:dsc_ssloffloading]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_ssloffloading" do
    dsc_xexchoutlookanywhere[:dsc_ssloffloading] = :false
    expect(dsc_xexchoutlookanywhere[:dsc_ssloffloading]).to eq(false)
  end

  it 'should not accept int for dsc_ssloffloading' do
    expect{dsc_xexchoutlookanywhere[:dsc_ssloffloading] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ssloffloading' do
    expect{dsc_xexchoutlookanywhere[:dsc_ssloffloading] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchoutlookanywhere)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchoutlookanywhere)
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
