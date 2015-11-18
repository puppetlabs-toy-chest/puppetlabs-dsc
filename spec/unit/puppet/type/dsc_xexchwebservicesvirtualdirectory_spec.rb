#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchwebservicesvirtualdirectory) do

  let :dsc_xexchwebservicesvirtualdirectory do
    Puppet::Type.type(:dsc_xexchwebservicesvirtualdirectory).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchwebservicesvirtualdirectory.to_s).to eq("Dsc_xexchwebservicesvirtualdirectory[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchwebservicesvirtualdirectory[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchwebservicesvirtualdirectory).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_allowservicerestart => true,
      :dsc_basicauthentication => true,
      :dsc_certificateauthentication => true,
      :dsc_digestauthentication => true,
      :dsc_domaincontroller => 'foo',
      :dsc_externalurl => 'foo',
      :dsc_internalnlbbypassurl => 'foo',
      :dsc_internalurl => 'foo',
      :dsc_oauthauthentication => true,
      :dsc_windowsauthentication => true,
      :dsc_wssecurityauthentication => true,
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart] = true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart] = :true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart] = :false
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_basicauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_basicauthentication' do
    dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication] = true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication] = 'true'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication] = 'false'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication] = 'True'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication] = 'False'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication] = :true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication] = :false
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_basicauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_basicauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_basicauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_certificateauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_certificateauthentication' do
    dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication] = true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_certificateauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication] = 'true'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_certificateauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication] = 'false'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_certificateauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication] = 'True'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_certificateauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication] = 'False'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_certificateauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication] = :true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_certificateauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication] = :false
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_certificateauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_certificateauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_certificateauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_digestauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_digestauthentication' do
    dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication] = true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication] = 'true'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication] = 'false'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication] = 'True'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication] = 'False'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication] = :true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication] = :false
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_digestauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_digestauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_digestauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externalurl' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_externalurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_externalurl' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_externalurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externalurl' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_externalurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalurl' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_externalurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internalnlbbypassurl' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_internalnlbbypassurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_internalnlbbypassurl' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_internalnlbbypassurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internalnlbbypassurl' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_internalnlbbypassurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internalnlbbypassurl' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_internalnlbbypassurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internalurl' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_internalurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_internalurl' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_internalurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internalurl' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_internalurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internalurl' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_internalurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_oauthauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_oauthauthentication' do
    dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication] = true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_oauthauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication] = 'true'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_oauthauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication] = 'false'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_oauthauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication] = 'True'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_oauthauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication] = 'False'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_oauthauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication] = :true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_oauthauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication] = :false
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_oauthauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_oauthauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_oauthauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_windowsauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_windowsauthentication' do
    dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication] = true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication] = 'true'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication] = 'false'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication] = 'True'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication] = 'False'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication] = :true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication] = :false
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_windowsauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_windowsauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_windowsauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_wssecurityauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_wssecurityauthentication' do
    dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication] = true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_wssecurityauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication] = 'true'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_wssecurityauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication] = 'false'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_wssecurityauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication] = 'True'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_wssecurityauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication] = 'False'
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_wssecurityauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication] = :true
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_wssecurityauthentication" do
    dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication] = :false
    expect(dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_wssecurityauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_wssecurityauthentication' do
    expect{dsc_xexchwebservicesvirtualdirectory[:dsc_wssecurityauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchwebservicesvirtualdirectory)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchwebservicesvirtualdirectory)
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
