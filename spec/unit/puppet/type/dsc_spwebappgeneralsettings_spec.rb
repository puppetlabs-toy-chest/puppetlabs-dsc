#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spwebappgeneralsettings) do

  let :dsc_spwebappgeneralsettings do
    Puppet::Type.type(:dsc_spwebappgeneralsettings).new(
      :name     => 'foo',
      :dsc_url => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spwebappgeneralsettings).new(
      :name     => 'foo',
      :dsc_url => 'foo',
      :dsc_timezone => 32,
      :dsc_alerts => true,
      :dsc_alertslimit => 32,
      :dsc_rss => true,
      :dsc_blogapi => true,
      :dsc_blogapiauthenticated => true,
      :dsc_browserfilehandling => 'Strict',
      :dsc_securityvalidation => true,
      :dsc_securityvalidationexpires => true,
      :dsc_securityvalidationtimeoutminutes => 32,
      :dsc_recyclebinenabled => true,
      :dsc_recyclebincleanupenabled => true,
      :dsc_recyclebinretentionperiod => 32,
      :dsc_secondstagerecyclebinquota => 32,
      :dsc_maximumuploadsize => 32,
      :dsc_customerexperienceprogram => true,
      :dsc_allowonlinewebpartcatalog => true,
      :dsc_selfservicesitecreationenabled => true,
      :dsc_presenceenabled => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spwebappgeneralsettings.to_s).to eq("Dsc_spwebappgeneralsettings[foo]")
  end

  it 'should require that dsc_url is specified' do
    #dsc_spwebappgeneralsettings[:dsc_url]
    expect { Puppet::Type.type(:dsc_spwebappgeneralsettings).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_url is a required attribute/)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_spwebappgeneralsettings[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_spwebappgeneralsettings[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_spwebappgeneralsettings[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_url' do
    expect{dsc_spwebappgeneralsettings[:dsc_url] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_timezone' do
    expect{dsc_spwebappgeneralsettings[:dsc_timezone] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_timezone' do
    expect{dsc_spwebappgeneralsettings[:dsc_timezone] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_timezone' do
    dsc_spwebappgeneralsettings[:dsc_timezone] = 32
    expect(dsc_spwebappgeneralsettings[:dsc_timezone]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_timezone' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwebappgeneralsettings[:dsc_timezone] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_timezone' do
    dsc_spwebappgeneralsettings[:dsc_timezone] = '16'
    expect(dsc_spwebappgeneralsettings[:dsc_timezone]).to eq(16)
  end

  it 'should accept string-like uint for dsc_timezone' do
    dsc_spwebappgeneralsettings[:dsc_timezone] = '32'
    expect(dsc_spwebappgeneralsettings[:dsc_timezone]).to eq(32)
  end

  it 'should accept string-like uint for dsc_timezone' do
    dsc_spwebappgeneralsettings[:dsc_timezone] = '64'
    expect(dsc_spwebappgeneralsettings[:dsc_timezone]).to eq(64)
  end

  it 'should not accept array for dsc_alerts' do
    expect{dsc_spwebappgeneralsettings[:dsc_alerts] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_alerts' do
    dsc_spwebappgeneralsettings[:dsc_alerts] = true
    expect(dsc_spwebappgeneralsettings[:dsc_alerts]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_alerts" do
    dsc_spwebappgeneralsettings[:dsc_alerts] = 'true'
    expect(dsc_spwebappgeneralsettings[:dsc_alerts]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_alerts" do
    dsc_spwebappgeneralsettings[:dsc_alerts] = 'false'
    expect(dsc_spwebappgeneralsettings[:dsc_alerts]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_alerts" do
    dsc_spwebappgeneralsettings[:dsc_alerts] = 'True'
    expect(dsc_spwebappgeneralsettings[:dsc_alerts]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_alerts" do
    dsc_spwebappgeneralsettings[:dsc_alerts] = 'False'
    expect(dsc_spwebappgeneralsettings[:dsc_alerts]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_alerts" do
    dsc_spwebappgeneralsettings[:dsc_alerts] = :true
    expect(dsc_spwebappgeneralsettings[:dsc_alerts]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_alerts" do
    dsc_spwebappgeneralsettings[:dsc_alerts] = :false
    expect(dsc_spwebappgeneralsettings[:dsc_alerts]).to eq(false)
  end

  it 'should not accept int for dsc_alerts' do
    expect{dsc_spwebappgeneralsettings[:dsc_alerts] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_alerts' do
    expect{dsc_spwebappgeneralsettings[:dsc_alerts] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_alertslimit' do
    expect{dsc_spwebappgeneralsettings[:dsc_alertslimit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_alertslimit' do
    expect{dsc_spwebappgeneralsettings[:dsc_alertslimit] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_alertslimit' do
    dsc_spwebappgeneralsettings[:dsc_alertslimit] = 32
    expect(dsc_spwebappgeneralsettings[:dsc_alertslimit]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_alertslimit' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwebappgeneralsettings[:dsc_alertslimit] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_alertslimit' do
    dsc_spwebappgeneralsettings[:dsc_alertslimit] = '16'
    expect(dsc_spwebappgeneralsettings[:dsc_alertslimit]).to eq(16)
  end

  it 'should accept string-like uint for dsc_alertslimit' do
    dsc_spwebappgeneralsettings[:dsc_alertslimit] = '32'
    expect(dsc_spwebappgeneralsettings[:dsc_alertslimit]).to eq(32)
  end

  it 'should accept string-like uint for dsc_alertslimit' do
    dsc_spwebappgeneralsettings[:dsc_alertslimit] = '64'
    expect(dsc_spwebappgeneralsettings[:dsc_alertslimit]).to eq(64)
  end

  it 'should not accept array for dsc_rss' do
    expect{dsc_spwebappgeneralsettings[:dsc_rss] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_rss' do
    dsc_spwebappgeneralsettings[:dsc_rss] = true
    expect(dsc_spwebappgeneralsettings[:dsc_rss]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_rss" do
    dsc_spwebappgeneralsettings[:dsc_rss] = 'true'
    expect(dsc_spwebappgeneralsettings[:dsc_rss]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_rss" do
    dsc_spwebappgeneralsettings[:dsc_rss] = 'false'
    expect(dsc_spwebappgeneralsettings[:dsc_rss]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_rss" do
    dsc_spwebappgeneralsettings[:dsc_rss] = 'True'
    expect(dsc_spwebappgeneralsettings[:dsc_rss]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_rss" do
    dsc_spwebappgeneralsettings[:dsc_rss] = 'False'
    expect(dsc_spwebappgeneralsettings[:dsc_rss]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_rss" do
    dsc_spwebappgeneralsettings[:dsc_rss] = :true
    expect(dsc_spwebappgeneralsettings[:dsc_rss]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_rss" do
    dsc_spwebappgeneralsettings[:dsc_rss] = :false
    expect(dsc_spwebappgeneralsettings[:dsc_rss]).to eq(false)
  end

  it 'should not accept int for dsc_rss' do
    expect{dsc_spwebappgeneralsettings[:dsc_rss] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rss' do
    expect{dsc_spwebappgeneralsettings[:dsc_rss] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_blogapi' do
    expect{dsc_spwebappgeneralsettings[:dsc_blogapi] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_blogapi' do
    dsc_spwebappgeneralsettings[:dsc_blogapi] = true
    expect(dsc_spwebappgeneralsettings[:dsc_blogapi]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_blogapi" do
    dsc_spwebappgeneralsettings[:dsc_blogapi] = 'true'
    expect(dsc_spwebappgeneralsettings[:dsc_blogapi]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_blogapi" do
    dsc_spwebappgeneralsettings[:dsc_blogapi] = 'false'
    expect(dsc_spwebappgeneralsettings[:dsc_blogapi]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_blogapi" do
    dsc_spwebappgeneralsettings[:dsc_blogapi] = 'True'
    expect(dsc_spwebappgeneralsettings[:dsc_blogapi]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_blogapi" do
    dsc_spwebappgeneralsettings[:dsc_blogapi] = 'False'
    expect(dsc_spwebappgeneralsettings[:dsc_blogapi]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_blogapi" do
    dsc_spwebappgeneralsettings[:dsc_blogapi] = :true
    expect(dsc_spwebappgeneralsettings[:dsc_blogapi]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_blogapi" do
    dsc_spwebappgeneralsettings[:dsc_blogapi] = :false
    expect(dsc_spwebappgeneralsettings[:dsc_blogapi]).to eq(false)
  end

  it 'should not accept int for dsc_blogapi' do
    expect{dsc_spwebappgeneralsettings[:dsc_blogapi] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_blogapi' do
    expect{dsc_spwebappgeneralsettings[:dsc_blogapi] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_blogapiauthenticated' do
    expect{dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_blogapiauthenticated' do
    dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated] = true
    expect(dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_blogapiauthenticated" do
    dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated] = 'true'
    expect(dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_blogapiauthenticated" do
    dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated] = 'false'
    expect(dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_blogapiauthenticated" do
    dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated] = 'True'
    expect(dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_blogapiauthenticated" do
    dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated] = 'False'
    expect(dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_blogapiauthenticated" do
    dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated] = :true
    expect(dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_blogapiauthenticated" do
    dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated] = :false
    expect(dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated]).to eq(false)
  end

  it 'should not accept int for dsc_blogapiauthenticated' do
    expect{dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_blogapiauthenticated' do
    expect{dsc_spwebappgeneralsettings[:dsc_blogapiauthenticated] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_browserfilehandling predefined value Strict' do
    dsc_spwebappgeneralsettings[:dsc_browserfilehandling] = 'Strict'
    expect(dsc_spwebappgeneralsettings[:dsc_browserfilehandling]).to eq('Strict')
  end

  it 'should accept dsc_browserfilehandling predefined value strict' do
    dsc_spwebappgeneralsettings[:dsc_browserfilehandling] = 'strict'
    expect(dsc_spwebappgeneralsettings[:dsc_browserfilehandling]).to eq('strict')
  end

  it 'should accept dsc_browserfilehandling predefined value Permissive' do
    dsc_spwebappgeneralsettings[:dsc_browserfilehandling] = 'Permissive'
    expect(dsc_spwebappgeneralsettings[:dsc_browserfilehandling]).to eq('Permissive')
  end

  it 'should accept dsc_browserfilehandling predefined value permissive' do
    dsc_spwebappgeneralsettings[:dsc_browserfilehandling] = 'permissive'
    expect(dsc_spwebappgeneralsettings[:dsc_browserfilehandling]).to eq('permissive')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spwebappgeneralsettings[:dsc_browserfilehandling] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_browserfilehandling' do
    expect{dsc_spwebappgeneralsettings[:dsc_browserfilehandling] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_browserfilehandling' do
    expect{dsc_spwebappgeneralsettings[:dsc_browserfilehandling] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_browserfilehandling' do
    expect{dsc_spwebappgeneralsettings[:dsc_browserfilehandling] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_browserfilehandling' do
    expect{dsc_spwebappgeneralsettings[:dsc_browserfilehandling] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_securityvalidation' do
    expect{dsc_spwebappgeneralsettings[:dsc_securityvalidation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_securityvalidation' do
    dsc_spwebappgeneralsettings[:dsc_securityvalidation] = true
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidation]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_securityvalidation" do
    dsc_spwebappgeneralsettings[:dsc_securityvalidation] = 'true'
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidation]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_securityvalidation" do
    dsc_spwebappgeneralsettings[:dsc_securityvalidation] = 'false'
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidation]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_securityvalidation" do
    dsc_spwebappgeneralsettings[:dsc_securityvalidation] = 'True'
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidation]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_securityvalidation" do
    dsc_spwebappgeneralsettings[:dsc_securityvalidation] = 'False'
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidation]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_securityvalidation" do
    dsc_spwebappgeneralsettings[:dsc_securityvalidation] = :true
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidation]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_securityvalidation" do
    dsc_spwebappgeneralsettings[:dsc_securityvalidation] = :false
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidation]).to eq(false)
  end

  it 'should not accept int for dsc_securityvalidation' do
    expect{dsc_spwebappgeneralsettings[:dsc_securityvalidation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_securityvalidation' do
    expect{dsc_spwebappgeneralsettings[:dsc_securityvalidation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_securityvalidationexpires' do
    expect{dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_securityvalidationexpires' do
    dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires] = true
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_securityvalidationexpires" do
    dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires] = 'true'
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_securityvalidationexpires" do
    dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires] = 'false'
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_securityvalidationexpires" do
    dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires] = 'True'
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_securityvalidationexpires" do
    dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires] = 'False'
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_securityvalidationexpires" do
    dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires] = :true
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_securityvalidationexpires" do
    dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires] = :false
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires]).to eq(false)
  end

  it 'should not accept int for dsc_securityvalidationexpires' do
    expect{dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_securityvalidationexpires' do
    expect{dsc_spwebappgeneralsettings[:dsc_securityvalidationexpires] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_securityvalidationtimeoutminutes' do
    expect{dsc_spwebappgeneralsettings[:dsc_securityvalidationtimeoutminutes] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_securityvalidationtimeoutminutes' do
    expect{dsc_spwebappgeneralsettings[:dsc_securityvalidationtimeoutminutes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_securityvalidationtimeoutminutes' do
    dsc_spwebappgeneralsettings[:dsc_securityvalidationtimeoutminutes] = 32
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidationtimeoutminutes]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_securityvalidationtimeoutminutes' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwebappgeneralsettings[:dsc_securityvalidationtimeoutminutes] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_securityvalidationtimeoutminutes' do
    dsc_spwebappgeneralsettings[:dsc_securityvalidationtimeoutminutes] = '16'
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidationtimeoutminutes]).to eq(16)
  end

  it 'should accept string-like uint for dsc_securityvalidationtimeoutminutes' do
    dsc_spwebappgeneralsettings[:dsc_securityvalidationtimeoutminutes] = '32'
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidationtimeoutminutes]).to eq(32)
  end

  it 'should accept string-like uint for dsc_securityvalidationtimeoutminutes' do
    dsc_spwebappgeneralsettings[:dsc_securityvalidationtimeoutminutes] = '64'
    expect(dsc_spwebappgeneralsettings[:dsc_securityvalidationtimeoutminutes]).to eq(64)
  end

  it 'should not accept array for dsc_recyclebinenabled' do
    expect{dsc_spwebappgeneralsettings[:dsc_recyclebinenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_recyclebinenabled' do
    dsc_spwebappgeneralsettings[:dsc_recyclebinenabled] = true
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebinenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_recyclebinenabled" do
    dsc_spwebappgeneralsettings[:dsc_recyclebinenabled] = 'true'
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebinenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_recyclebinenabled" do
    dsc_spwebappgeneralsettings[:dsc_recyclebinenabled] = 'false'
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebinenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_recyclebinenabled" do
    dsc_spwebappgeneralsettings[:dsc_recyclebinenabled] = 'True'
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebinenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_recyclebinenabled" do
    dsc_spwebappgeneralsettings[:dsc_recyclebinenabled] = 'False'
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebinenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_recyclebinenabled" do
    dsc_spwebappgeneralsettings[:dsc_recyclebinenabled] = :true
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebinenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_recyclebinenabled" do
    dsc_spwebappgeneralsettings[:dsc_recyclebinenabled] = :false
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebinenabled]).to eq(false)
  end

  it 'should not accept int for dsc_recyclebinenabled' do
    expect{dsc_spwebappgeneralsettings[:dsc_recyclebinenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_recyclebinenabled' do
    expect{dsc_spwebappgeneralsettings[:dsc_recyclebinenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_recyclebincleanupenabled' do
    expect{dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_recyclebincleanupenabled' do
    dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled] = true
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_recyclebincleanupenabled" do
    dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled] = 'true'
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_recyclebincleanupenabled" do
    dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled] = 'false'
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_recyclebincleanupenabled" do
    dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled] = 'True'
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_recyclebincleanupenabled" do
    dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled] = 'False'
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_recyclebincleanupenabled" do
    dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled] = :true
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_recyclebincleanupenabled" do
    dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled] = :false
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled]).to eq(false)
  end

  it 'should not accept int for dsc_recyclebincleanupenabled' do
    expect{dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_recyclebincleanupenabled' do
    expect{dsc_spwebappgeneralsettings[:dsc_recyclebincleanupenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_recyclebinretentionperiod' do
    expect{dsc_spwebappgeneralsettings[:dsc_recyclebinretentionperiod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_recyclebinretentionperiod' do
    expect{dsc_spwebappgeneralsettings[:dsc_recyclebinretentionperiod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_recyclebinretentionperiod' do
    dsc_spwebappgeneralsettings[:dsc_recyclebinretentionperiod] = 32
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebinretentionperiod]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_recyclebinretentionperiod' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwebappgeneralsettings[:dsc_recyclebinretentionperiod] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_recyclebinretentionperiod' do
    dsc_spwebappgeneralsettings[:dsc_recyclebinretentionperiod] = '16'
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebinretentionperiod]).to eq(16)
  end

  it 'should accept string-like uint for dsc_recyclebinretentionperiod' do
    dsc_spwebappgeneralsettings[:dsc_recyclebinretentionperiod] = '32'
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebinretentionperiod]).to eq(32)
  end

  it 'should accept string-like uint for dsc_recyclebinretentionperiod' do
    dsc_spwebappgeneralsettings[:dsc_recyclebinretentionperiod] = '64'
    expect(dsc_spwebappgeneralsettings[:dsc_recyclebinretentionperiod]).to eq(64)
  end

  it 'should not accept array for dsc_secondstagerecyclebinquota' do
    expect{dsc_spwebappgeneralsettings[:dsc_secondstagerecyclebinquota] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_secondstagerecyclebinquota' do
    expect{dsc_spwebappgeneralsettings[:dsc_secondstagerecyclebinquota] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_secondstagerecyclebinquota' do
    dsc_spwebappgeneralsettings[:dsc_secondstagerecyclebinquota] = 32
    expect(dsc_spwebappgeneralsettings[:dsc_secondstagerecyclebinquota]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_secondstagerecyclebinquota' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwebappgeneralsettings[:dsc_secondstagerecyclebinquota] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_secondstagerecyclebinquota' do
    dsc_spwebappgeneralsettings[:dsc_secondstagerecyclebinquota] = '16'
    expect(dsc_spwebappgeneralsettings[:dsc_secondstagerecyclebinquota]).to eq(16)
  end

  it 'should accept string-like uint for dsc_secondstagerecyclebinquota' do
    dsc_spwebappgeneralsettings[:dsc_secondstagerecyclebinquota] = '32'
    expect(dsc_spwebappgeneralsettings[:dsc_secondstagerecyclebinquota]).to eq(32)
  end

  it 'should accept string-like uint for dsc_secondstagerecyclebinquota' do
    dsc_spwebappgeneralsettings[:dsc_secondstagerecyclebinquota] = '64'
    expect(dsc_spwebappgeneralsettings[:dsc_secondstagerecyclebinquota]).to eq(64)
  end

  it 'should not accept array for dsc_maximumuploadsize' do
    expect{dsc_spwebappgeneralsettings[:dsc_maximumuploadsize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maximumuploadsize' do
    expect{dsc_spwebappgeneralsettings[:dsc_maximumuploadsize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maximumuploadsize' do
    dsc_spwebappgeneralsettings[:dsc_maximumuploadsize] = 32
    expect(dsc_spwebappgeneralsettings[:dsc_maximumuploadsize]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_maximumuploadsize' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwebappgeneralsettings[:dsc_maximumuploadsize] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_maximumuploadsize' do
    dsc_spwebappgeneralsettings[:dsc_maximumuploadsize] = '16'
    expect(dsc_spwebappgeneralsettings[:dsc_maximumuploadsize]).to eq(16)
  end

  it 'should accept string-like uint for dsc_maximumuploadsize' do
    dsc_spwebappgeneralsettings[:dsc_maximumuploadsize] = '32'
    expect(dsc_spwebappgeneralsettings[:dsc_maximumuploadsize]).to eq(32)
  end

  it 'should accept string-like uint for dsc_maximumuploadsize' do
    dsc_spwebappgeneralsettings[:dsc_maximumuploadsize] = '64'
    expect(dsc_spwebappgeneralsettings[:dsc_maximumuploadsize]).to eq(64)
  end

  it 'should not accept array for dsc_customerexperienceprogram' do
    expect{dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_customerexperienceprogram' do
    dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram] = true
    expect(dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_customerexperienceprogram" do
    dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram] = 'true'
    expect(dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_customerexperienceprogram" do
    dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram] = 'false'
    expect(dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_customerexperienceprogram" do
    dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram] = 'True'
    expect(dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_customerexperienceprogram" do
    dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram] = 'False'
    expect(dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_customerexperienceprogram" do
    dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram] = :true
    expect(dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_customerexperienceprogram" do
    dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram] = :false
    expect(dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram]).to eq(false)
  end

  it 'should not accept int for dsc_customerexperienceprogram' do
    expect{dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_customerexperienceprogram' do
    expect{dsc_spwebappgeneralsettings[:dsc_customerexperienceprogram] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowonlinewebpartcatalog' do
    expect{dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowonlinewebpartcatalog' do
    dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog] = true
    expect(dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowonlinewebpartcatalog" do
    dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog] = 'true'
    expect(dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowonlinewebpartcatalog" do
    dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog] = 'false'
    expect(dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowonlinewebpartcatalog" do
    dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog] = 'True'
    expect(dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowonlinewebpartcatalog" do
    dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog] = 'False'
    expect(dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowonlinewebpartcatalog" do
    dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog] = :true
    expect(dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowonlinewebpartcatalog" do
    dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog] = :false
    expect(dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog]).to eq(false)
  end

  it 'should not accept int for dsc_allowonlinewebpartcatalog' do
    expect{dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowonlinewebpartcatalog' do
    expect{dsc_spwebappgeneralsettings[:dsc_allowonlinewebpartcatalog] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_selfservicesitecreationenabled' do
    expect{dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_selfservicesitecreationenabled' do
    dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled] = true
    expect(dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_selfservicesitecreationenabled" do
    dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled] = 'true'
    expect(dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_selfservicesitecreationenabled" do
    dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled] = 'false'
    expect(dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_selfservicesitecreationenabled" do
    dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled] = 'True'
    expect(dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_selfservicesitecreationenabled" do
    dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled] = 'False'
    expect(dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_selfservicesitecreationenabled" do
    dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled] = :true
    expect(dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_selfservicesitecreationenabled" do
    dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled] = :false
    expect(dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled]).to eq(false)
  end

  it 'should not accept int for dsc_selfservicesitecreationenabled' do
    expect{dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_selfservicesitecreationenabled' do
    expect{dsc_spwebappgeneralsettings[:dsc_selfservicesitecreationenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_presenceenabled' do
    expect{dsc_spwebappgeneralsettings[:dsc_presenceenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_presenceenabled' do
    dsc_spwebappgeneralsettings[:dsc_presenceenabled] = true
    expect(dsc_spwebappgeneralsettings[:dsc_presenceenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_presenceenabled" do
    dsc_spwebappgeneralsettings[:dsc_presenceenabled] = 'true'
    expect(dsc_spwebappgeneralsettings[:dsc_presenceenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_presenceenabled" do
    dsc_spwebappgeneralsettings[:dsc_presenceenabled] = 'false'
    expect(dsc_spwebappgeneralsettings[:dsc_presenceenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_presenceenabled" do
    dsc_spwebappgeneralsettings[:dsc_presenceenabled] = 'True'
    expect(dsc_spwebappgeneralsettings[:dsc_presenceenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_presenceenabled" do
    dsc_spwebappgeneralsettings[:dsc_presenceenabled] = 'False'
    expect(dsc_spwebappgeneralsettings[:dsc_presenceenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_presenceenabled" do
    dsc_spwebappgeneralsettings[:dsc_presenceenabled] = :true
    expect(dsc_spwebappgeneralsettings[:dsc_presenceenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_presenceenabled" do
    dsc_spwebappgeneralsettings[:dsc_presenceenabled] = :false
    expect(dsc_spwebappgeneralsettings[:dsc_presenceenabled]).to eq(false)
  end

  it 'should not accept int for dsc_presenceenabled' do
    expect{dsc_spwebappgeneralsettings[:dsc_presenceenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_presenceenabled' do
    expect{dsc_spwebappgeneralsettings[:dsc_presenceenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spwebappgeneralsettings[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spwebappgeneralsettings[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spwebappgeneralsettings[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spwebappgeneralsettings[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spwebappgeneralsettings[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spwebappgeneralsettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spwebappgeneralsettings)
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
