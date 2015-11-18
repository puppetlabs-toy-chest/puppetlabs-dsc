#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazurepackresourceprovider) do

  let :dsc_xazurepackresourceprovider do
    Puppet::Type.type(:dsc_xazurepackresourceprovider).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazurepackresourceprovider.to_s).to eq("Dsc_xazurepackresourceprovider[foo]")
  end

  it 'should not accept array for dsc_authenticationsite' do
    expect{dsc_xazurepackresourceprovider[:dsc_authenticationsite] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_authenticationsite' do
    expect{dsc_xazurepackresourceprovider[:dsc_authenticationsite] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_authenticationsite' do
    expect{dsc_xazurepackresourceprovider[:dsc_authenticationsite] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_authenticationsite' do
    expect{dsc_xazurepackresourceprovider[:dsc_authenticationsite] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adminuri' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminuri] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_adminuri' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminuri] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_adminuri' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminuri] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adminuri' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminuri] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_name is specified' do
    #dsc_xazurepackresourceprovider[:dsc_name]
    expect { Puppet::Type.type(:dsc_xazurepackresourceprovider).new(
      :name     => 'foo',
      :dsc_authenticationsite => 'foo',
      :dsc_adminuri => 'foo',
      :dsc_azurepackadmincredential => {"user"=>"user", "password"=>"password"},
      :dsc_displayname => 'foo',
      :dsc_enabled => true,
      :dsc_passthroughenabled => true,
      :dsc_allowanonymousaccess => true,
      :dsc_allowmultipleinstances => true,
      :dsc_adminforwardingaddress => 'foo',
      :dsc_adminauthenticationmode => 'None',
      :dsc_adminauthenticationuser => {"user"=>"user", "password"=>"password"},
      :dsc_adminauthenticationusername => 'foo',
      :dsc_tenantforwardingaddress => 'foo',
      :dsc_tenantauthenticationmode => 'None',
      :dsc_tenantauthenticationuser => {"user"=>"user", "password"=>"password"},
      :dsc_tenantauthenticationusername => 'foo',
      :dsc_tenantsourceuritemplate => 'foo',
      :dsc_tenanttargeturitemplate => 'foo',
      :dsc_usageforwardingaddress => 'foo',
      :dsc_usageauthenticationmode => 'None',
      :dsc_usageauthenticationuser => {"user"=>"user", "password"=>"password"},
      :dsc_usageauthenticationusername => 'foo',
      :dsc_healthcheckforwardingaddress => 'foo',
      :dsc_healthcheckauthenticationmode => 'None',
      :dsc_healthcheckauthenticationuser => {"user"=>"user", "password"=>"password"},
      :dsc_healthcheckauthenticationusername => 'foo',
      :dsc_notificationforwardingaddress => 'foo',
      :dsc_notificationauthenticationmode => 'None',
      :dsc_notificationauthenticationuser => {"user"=>"user", "password"=>"password"},
      :dsc_notificationauthenticationusername => 'foo',
      :dsc_instanceid => 'foo',
      :dsc_instancedisplayname => 'foo',
      :dsc_maxquotaupdatebatchsize => 'foo',
      :dsc_subscriptionstatuspollinginterval => 'foo',
      :dsc_type => 'Standard',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xazurepackresourceprovider[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xazurepackresourceprovider[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xazurepackresourceprovider[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xazurepackresourceprovider[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_azurepackadmincredential" do
    expect{dsc_xazurepackresourceprovider[:dsc_azurepackadmincredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackresourceprovider[:dsc_azurepackadmincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackresourceprovider[:dsc_azurepackadmincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackresourceprovider[:dsc_azurepackadmincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_azurepackadmincredential' do
    expect{dsc_xazurepackresourceprovider[:dsc_azurepackadmincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displayname' do
    expect{dsc_xazurepackresourceprovider[:dsc_displayname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayname' do
    expect{dsc_xazurepackresourceprovider[:dsc_displayname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displayname' do
    expect{dsc_xazurepackresourceprovider[:dsc_displayname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displayname' do
    expect{dsc_xazurepackresourceprovider[:dsc_displayname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enabled' do
    expect{dsc_xazurepackresourceprovider[:dsc_enabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enabled' do
    dsc_xazurepackresourceprovider[:dsc_enabled] = true
    expect(dsc_xazurepackresourceprovider[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enabled" do
    dsc_xazurepackresourceprovider[:dsc_enabled] = 'true'
    expect(dsc_xazurepackresourceprovider[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enabled" do
    dsc_xazurepackresourceprovider[:dsc_enabled] = 'false'
    expect(dsc_xazurepackresourceprovider[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enabled" do
    dsc_xazurepackresourceprovider[:dsc_enabled] = 'True'
    expect(dsc_xazurepackresourceprovider[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enabled" do
    dsc_xazurepackresourceprovider[:dsc_enabled] = 'False'
    expect(dsc_xazurepackresourceprovider[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enabled" do
    dsc_xazurepackresourceprovider[:dsc_enabled] = :true
    expect(dsc_xazurepackresourceprovider[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enabled" do
    dsc_xazurepackresourceprovider[:dsc_enabled] = :false
    expect(dsc_xazurepackresourceprovider[:dsc_enabled]).to eq(false)
  end

  it 'should not accept int for dsc_enabled' do
    expect{dsc_xazurepackresourceprovider[:dsc_enabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabled' do
    expect{dsc_xazurepackresourceprovider[:dsc_enabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_passthroughenabled' do
    expect{dsc_xazurepackresourceprovider[:dsc_passthroughenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_passthroughenabled' do
    dsc_xazurepackresourceprovider[:dsc_passthroughenabled] = true
    expect(dsc_xazurepackresourceprovider[:dsc_passthroughenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_passthroughenabled" do
    dsc_xazurepackresourceprovider[:dsc_passthroughenabled] = 'true'
    expect(dsc_xazurepackresourceprovider[:dsc_passthroughenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_passthroughenabled" do
    dsc_xazurepackresourceprovider[:dsc_passthroughenabled] = 'false'
    expect(dsc_xazurepackresourceprovider[:dsc_passthroughenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_passthroughenabled" do
    dsc_xazurepackresourceprovider[:dsc_passthroughenabled] = 'True'
    expect(dsc_xazurepackresourceprovider[:dsc_passthroughenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_passthroughenabled" do
    dsc_xazurepackresourceprovider[:dsc_passthroughenabled] = 'False'
    expect(dsc_xazurepackresourceprovider[:dsc_passthroughenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_passthroughenabled" do
    dsc_xazurepackresourceprovider[:dsc_passthroughenabled] = :true
    expect(dsc_xazurepackresourceprovider[:dsc_passthroughenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_passthroughenabled" do
    dsc_xazurepackresourceprovider[:dsc_passthroughenabled] = :false
    expect(dsc_xazurepackresourceprovider[:dsc_passthroughenabled]).to eq(false)
  end

  it 'should not accept int for dsc_passthroughenabled' do
    expect{dsc_xazurepackresourceprovider[:dsc_passthroughenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_passthroughenabled' do
    expect{dsc_xazurepackresourceprovider[:dsc_passthroughenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowanonymousaccess' do
    expect{dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowanonymousaccess' do
    dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess] = true
    expect(dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowanonymousaccess" do
    dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess] = 'true'
    expect(dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowanonymousaccess" do
    dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess] = 'false'
    expect(dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowanonymousaccess" do
    dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess] = 'True'
    expect(dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowanonymousaccess" do
    dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess] = 'False'
    expect(dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowanonymousaccess" do
    dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess] = :true
    expect(dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowanonymousaccess" do
    dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess] = :false
    expect(dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess]).to eq(false)
  end

  it 'should not accept int for dsc_allowanonymousaccess' do
    expect{dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowanonymousaccess' do
    expect{dsc_xazurepackresourceprovider[:dsc_allowanonymousaccess] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowmultipleinstances' do
    expect{dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowmultipleinstances' do
    dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances] = true
    expect(dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowmultipleinstances" do
    dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances] = 'true'
    expect(dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowmultipleinstances" do
    dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances] = 'false'
    expect(dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowmultipleinstances" do
    dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances] = 'True'
    expect(dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowmultipleinstances" do
    dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances] = 'False'
    expect(dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowmultipleinstances" do
    dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances] = :true
    expect(dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowmultipleinstances" do
    dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances] = :false
    expect(dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances]).to eq(false)
  end

  it 'should not accept int for dsc_allowmultipleinstances' do
    expect{dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowmultipleinstances' do
    expect{dsc_xazurepackresourceprovider[:dsc_allowmultipleinstances] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adminforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminforwardingaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_adminforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminforwardingaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_adminforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminforwardingaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adminforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminforwardingaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_adminauthenticationmode predefined value None' do
    dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode] = 'None'
    expect(dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode]).to eq('None')
  end

  it 'should accept dsc_adminauthenticationmode predefined value none' do
    dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode] = 'none'
    expect(dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode]).to eq('none')
  end

  it 'should accept dsc_adminauthenticationmode predefined value Basic' do
    dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode] = 'Basic'
    expect(dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode]).to eq('Basic')
  end

  it 'should accept dsc_adminauthenticationmode predefined value basic' do
    dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode] = 'basic'
    expect(dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode]).to eq('basic')
  end

  it 'should accept dsc_adminauthenticationmode predefined value Windows' do
    dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode] = 'Windows'
    expect(dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode]).to eq('Windows')
  end

  it 'should accept dsc_adminauthenticationmode predefined value windows' do
    dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode] = 'windows'
    expect(dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode]).to eq('windows')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adminauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_adminauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_adminauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adminauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_adminauthenticationuser" do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationuser] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adminauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationuser] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_adminauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationuser] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_adminauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationuser] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adminauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationuser] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adminauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_adminauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_adminauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adminauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_adminauthenticationusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_tenantforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantforwardingaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_tenantforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantforwardingaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_tenantforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantforwardingaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_tenantforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantforwardingaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_tenantauthenticationmode predefined value None' do
    dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode] = 'None'
    expect(dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode]).to eq('None')
  end

  it 'should accept dsc_tenantauthenticationmode predefined value none' do
    dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode] = 'none'
    expect(dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode]).to eq('none')
  end

  it 'should accept dsc_tenantauthenticationmode predefined value Basic' do
    dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode] = 'Basic'
    expect(dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode]).to eq('Basic')
  end

  it 'should accept dsc_tenantauthenticationmode predefined value basic' do
    dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode] = 'basic'
    expect(dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode]).to eq('basic')
  end

  it 'should accept dsc_tenantauthenticationmode predefined value Windows' do
    dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode] = 'Windows'
    expect(dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode]).to eq('Windows')
  end

  it 'should accept dsc_tenantauthenticationmode predefined value windows' do
    dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode] = 'windows'
    expect(dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode]).to eq('windows')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_tenantauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_tenantauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_tenantauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_tenantauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_tenantauthenticationuser" do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationuser] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_tenantauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationuser] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_tenantauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationuser] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_tenantauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationuser] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_tenantauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationuser] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_tenantauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_tenantauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_tenantauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_tenantauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantauthenticationusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_tenantsourceuritemplate' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantsourceuritemplate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_tenantsourceuritemplate' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantsourceuritemplate] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_tenantsourceuritemplate' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantsourceuritemplate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_tenantsourceuritemplate' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenantsourceuritemplate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_tenanttargeturitemplate' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenanttargeturitemplate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_tenanttargeturitemplate' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenanttargeturitemplate] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_tenanttargeturitemplate' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenanttargeturitemplate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_tenanttargeturitemplate' do
    expect{dsc_xazurepackresourceprovider[:dsc_tenanttargeturitemplate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usageforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageforwardingaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usageforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageforwardingaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usageforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageforwardingaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usageforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageforwardingaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_usageauthenticationmode predefined value None' do
    dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode] = 'None'
    expect(dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode]).to eq('None')
  end

  it 'should accept dsc_usageauthenticationmode predefined value none' do
    dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode] = 'none'
    expect(dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode]).to eq('none')
  end

  it 'should accept dsc_usageauthenticationmode predefined value Basic' do
    dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode] = 'Basic'
    expect(dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode]).to eq('Basic')
  end

  it 'should accept dsc_usageauthenticationmode predefined value basic' do
    dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode] = 'basic'
    expect(dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode]).to eq('basic')
  end

  it 'should accept dsc_usageauthenticationmode predefined value Windows' do
    dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode] = 'Windows'
    expect(dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode]).to eq('Windows')
  end

  it 'should accept dsc_usageauthenticationmode predefined value windows' do
    dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode] = 'windows'
    expect(dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode]).to eq('windows')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usageauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usageauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usageauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usageauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_usageauthenticationuser" do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationuser] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usageauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationuser] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usageauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationuser] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usageauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationuser] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usageauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationuser] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usageauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usageauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usageauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usageauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_usageauthenticationusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_healthcheckforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckforwardingaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_healthcheckforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckforwardingaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_healthcheckforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckforwardingaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_healthcheckforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckforwardingaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_healthcheckauthenticationmode predefined value None' do
    dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode] = 'None'
    expect(dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode]).to eq('None')
  end

  it 'should accept dsc_healthcheckauthenticationmode predefined value none' do
    dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode] = 'none'
    expect(dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode]).to eq('none')
  end

  it 'should accept dsc_healthcheckauthenticationmode predefined value Basic' do
    dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode] = 'Basic'
    expect(dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode]).to eq('Basic')
  end

  it 'should accept dsc_healthcheckauthenticationmode predefined value basic' do
    dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode] = 'basic'
    expect(dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode]).to eq('basic')
  end

  it 'should accept dsc_healthcheckauthenticationmode predefined value Windows' do
    dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode] = 'Windows'
    expect(dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode]).to eq('Windows')
  end

  it 'should accept dsc_healthcheckauthenticationmode predefined value windows' do
    dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode] = 'windows'
    expect(dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode]).to eq('windows')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_healthcheckauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_healthcheckauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_healthcheckauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_healthcheckauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_healthcheckauthenticationuser" do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationuser] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_healthcheckauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationuser] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_healthcheckauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationuser] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_healthcheckauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationuser] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_healthcheckauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationuser] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_healthcheckauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_healthcheckauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_healthcheckauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_healthcheckauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_healthcheckauthenticationusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_notificationforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationforwardingaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_notificationforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationforwardingaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_notificationforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationforwardingaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_notificationforwardingaddress' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationforwardingaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_notificationauthenticationmode predefined value None' do
    dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode] = 'None'
    expect(dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode]).to eq('None')
  end

  it 'should accept dsc_notificationauthenticationmode predefined value none' do
    dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode] = 'none'
    expect(dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode]).to eq('none')
  end

  it 'should accept dsc_notificationauthenticationmode predefined value Basic' do
    dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode] = 'Basic'
    expect(dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode]).to eq('Basic')
  end

  it 'should accept dsc_notificationauthenticationmode predefined value basic' do
    dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode] = 'basic'
    expect(dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode]).to eq('basic')
  end

  it 'should accept dsc_notificationauthenticationmode predefined value Windows' do
    dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode] = 'Windows'
    expect(dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode]).to eq('Windows')
  end

  it 'should accept dsc_notificationauthenticationmode predefined value windows' do
    dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode] = 'windows'
    expect(dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode]).to eq('windows')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_notificationauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_notificationauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_notificationauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_notificationauthenticationmode' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_notificationauthenticationuser" do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationuser] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_notificationauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationuser] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_notificationauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationuser] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_notificationauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationuser] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_notificationauthenticationuser' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationuser] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_notificationauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_notificationauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_notificationauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_notificationauthenticationusername' do
    expect{dsc_xazurepackresourceprovider[:dsc_notificationauthenticationusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_instanceid' do
    expect{dsc_xazurepackresourceprovider[:dsc_instanceid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instanceid' do
    expect{dsc_xazurepackresourceprovider[:dsc_instanceid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instanceid' do
    expect{dsc_xazurepackresourceprovider[:dsc_instanceid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instanceid' do
    expect{dsc_xazurepackresourceprovider[:dsc_instanceid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_instancedisplayname' do
    expect{dsc_xazurepackresourceprovider[:dsc_instancedisplayname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancedisplayname' do
    expect{dsc_xazurepackresourceprovider[:dsc_instancedisplayname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancedisplayname' do
    expect{dsc_xazurepackresourceprovider[:dsc_instancedisplayname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancedisplayname' do
    expect{dsc_xazurepackresourceprovider[:dsc_instancedisplayname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxquotaupdatebatchsize' do
    expect{dsc_xazurepackresourceprovider[:dsc_maxquotaupdatebatchsize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxquotaupdatebatchsize' do
    expect{dsc_xazurepackresourceprovider[:dsc_maxquotaupdatebatchsize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_maxquotaupdatebatchsize' do
    expect{dsc_xazurepackresourceprovider[:dsc_maxquotaupdatebatchsize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_maxquotaupdatebatchsize' do
    expect{dsc_xazurepackresourceprovider[:dsc_maxquotaupdatebatchsize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_subscriptionstatuspollinginterval' do
    expect{dsc_xazurepackresourceprovider[:dsc_subscriptionstatuspollinginterval] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_subscriptionstatuspollinginterval' do
    expect{dsc_xazurepackresourceprovider[:dsc_subscriptionstatuspollinginterval] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_subscriptionstatuspollinginterval' do
    expect{dsc_xazurepackresourceprovider[:dsc_subscriptionstatuspollinginterval] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_subscriptionstatuspollinginterval' do
    expect{dsc_xazurepackresourceprovider[:dsc_subscriptionstatuspollinginterval] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_type predefined value Standard' do
    dsc_xazurepackresourceprovider[:dsc_type] = 'Standard'
    expect(dsc_xazurepackresourceprovider[:dsc_type]).to eq('Standard')
  end

  it 'should accept dsc_type predefined value standard' do
    dsc_xazurepackresourceprovider[:dsc_type] = 'standard'
    expect(dsc_xazurepackresourceprovider[:dsc_type]).to eq('standard')
  end

  it 'should accept dsc_type predefined value UsageProvider' do
    dsc_xazurepackresourceprovider[:dsc_type] = 'UsageProvider'
    expect(dsc_xazurepackresourceprovider[:dsc_type]).to eq('UsageProvider')
  end

  it 'should accept dsc_type predefined value usageprovider' do
    dsc_xazurepackresourceprovider[:dsc_type] = 'usageprovider'
    expect(dsc_xazurepackresourceprovider[:dsc_type]).to eq('usageprovider')
  end

  it 'should accept dsc_type predefined value CloudServiceProvider' do
    dsc_xazurepackresourceprovider[:dsc_type] = 'CloudServiceProvider'
    expect(dsc_xazurepackresourceprovider[:dsc_type]).to eq('CloudServiceProvider')
  end

  it 'should accept dsc_type predefined value cloudserviceprovider' do
    dsc_xazurepackresourceprovider[:dsc_type] = 'cloudserviceprovider'
    expect(dsc_xazurepackresourceprovider[:dsc_type]).to eq('cloudserviceprovider')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurepackresourceprovider[:dsc_type] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_type' do
    expect{dsc_xazurepackresourceprovider[:dsc_type] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_type' do
    expect{dsc_xazurepackresourceprovider[:dsc_type] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_type' do
    expect{dsc_xazurepackresourceprovider[:dsc_type] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_type' do
    expect{dsc_xazurepackresourceprovider[:dsc_type] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xazurepackresourceprovider)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xazurepackresourceprovider)
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
