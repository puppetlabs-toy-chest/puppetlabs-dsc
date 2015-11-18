#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchowavirtualdirectory) do

  let :dsc_xexchowavirtualdirectory do
    Puppet::Type.type(:dsc_xexchowavirtualdirectory).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchowavirtualdirectory.to_s).to eq("Dsc_xexchowavirtualdirectory[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchowavirtualdirectory[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchowavirtualdirectory).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_adfsauthentication => true,
      :dsc_allowservicerestart => true,
      :dsc_basicauthentication => true,
      :dsc_changepasswordenabled => true,
      :dsc_digestauthentication => true,
      :dsc_domaincontroller => 'foo',
      :dsc_externalauthenticationmethods => ["foo", "bar", "spec"],
      :dsc_externalurl => 'foo',
      :dsc_formsauthentication => true,
      :dsc_internalurl => 'foo',
      :dsc_instantmessagingenabled => true,
      :dsc_instantmessagingcertificatethumbprint => 'foo',
      :dsc_instantmessagingservername => 'foo',
      :dsc_instantmessagingtype => 'None',
      :dsc_logonpagepublicprivateselectionenabled => true,
      :dsc_logonpagelightselectionenabled => true,
      :dsc_windowsauthentication => true,
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchowavirtualdirectory[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchowavirtualdirectory[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchowavirtualdirectory[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchowavirtualdirectory[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchowavirtualdirectory[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchowavirtualdirectory[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchowavirtualdirectory[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchowavirtualdirectory[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchowavirtualdirectory[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adfsauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_adfsauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_adfsauthentication' do
    dsc_xexchowavirtualdirectory[:dsc_adfsauthentication] = true
    expect(dsc_xexchowavirtualdirectory[:dsc_adfsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_adfsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_adfsauthentication] = 'true'
    expect(dsc_xexchowavirtualdirectory[:dsc_adfsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_adfsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_adfsauthentication] = 'false'
    expect(dsc_xexchowavirtualdirectory[:dsc_adfsauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_adfsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_adfsauthentication] = 'True'
    expect(dsc_xexchowavirtualdirectory[:dsc_adfsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_adfsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_adfsauthentication] = 'False'
    expect(dsc_xexchowavirtualdirectory[:dsc_adfsauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_adfsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_adfsauthentication] = :true
    expect(dsc_xexchowavirtualdirectory[:dsc_adfsauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_adfsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_adfsauthentication] = :false
    expect(dsc_xexchowavirtualdirectory[:dsc_adfsauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_adfsauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_adfsauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adfsauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_adfsauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchowavirtualdirectory[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchowavirtualdirectory[:dsc_allowservicerestart] = true
    expect(dsc_xexchowavirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchowavirtualdirectory[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchowavirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchowavirtualdirectory[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchowavirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchowavirtualdirectory[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchowavirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchowavirtualdirectory[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchowavirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchowavirtualdirectory[:dsc_allowservicerestart] = :true
    expect(dsc_xexchowavirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchowavirtualdirectory[:dsc_allowservicerestart] = :false
    expect(dsc_xexchowavirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchowavirtualdirectory[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchowavirtualdirectory[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_basicauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_basicauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_basicauthentication' do
    dsc_xexchowavirtualdirectory[:dsc_basicauthentication] = true
    expect(dsc_xexchowavirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_basicauthentication] = 'true'
    expect(dsc_xexchowavirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_basicauthentication] = 'false'
    expect(dsc_xexchowavirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_basicauthentication] = 'True'
    expect(dsc_xexchowavirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_basicauthentication] = 'False'
    expect(dsc_xexchowavirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_basicauthentication] = :true
    expect(dsc_xexchowavirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_basicauthentication] = :false
    expect(dsc_xexchowavirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_basicauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_basicauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_basicauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_basicauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_changepasswordenabled' do
    expect{dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_changepasswordenabled' do
    dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled] = true
    expect(dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_changepasswordenabled" do
    dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled] = 'true'
    expect(dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_changepasswordenabled" do
    dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled] = 'false'
    expect(dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_changepasswordenabled" do
    dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled] = 'True'
    expect(dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_changepasswordenabled" do
    dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled] = 'False'
    expect(dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_changepasswordenabled" do
    dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled] = :true
    expect(dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_changepasswordenabled" do
    dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled] = :false
    expect(dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled]).to eq(false)
  end

  it 'should not accept int for dsc_changepasswordenabled' do
    expect{dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_changepasswordenabled' do
    expect{dsc_xexchowavirtualdirectory[:dsc_changepasswordenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_digestauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_digestauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_digestauthentication' do
    dsc_xexchowavirtualdirectory[:dsc_digestauthentication] = true
    expect(dsc_xexchowavirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_digestauthentication] = 'true'
    expect(dsc_xexchowavirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_digestauthentication] = 'false'
    expect(dsc_xexchowavirtualdirectory[:dsc_digestauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_digestauthentication] = 'True'
    expect(dsc_xexchowavirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_digestauthentication] = 'False'
    expect(dsc_xexchowavirtualdirectory[:dsc_digestauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_digestauthentication] = :true
    expect(dsc_xexchowavirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_digestauthentication] = :false
    expect(dsc_xexchowavirtualdirectory[:dsc_digestauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_digestauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_digestauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_digestauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_digestauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchowavirtualdirectory[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchowavirtualdirectory[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchowavirtualdirectory[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchowavirtualdirectory[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_externalauthenticationmethods' do
    dsc_xexchowavirtualdirectory[:dsc_externalauthenticationmethods] = ["foo", "bar", "spec"]
    expect(dsc_xexchowavirtualdirectory[:dsc_externalauthenticationmethods]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_externalauthenticationmethods' do
    expect{dsc_xexchowavirtualdirectory[:dsc_externalauthenticationmethods] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externalauthenticationmethods' do
    expect{dsc_xexchowavirtualdirectory[:dsc_externalauthenticationmethods] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalauthenticationmethods' do
    expect{dsc_xexchowavirtualdirectory[:dsc_externalauthenticationmethods] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externalurl' do
    expect{dsc_xexchowavirtualdirectory[:dsc_externalurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_externalurl' do
    expect{dsc_xexchowavirtualdirectory[:dsc_externalurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externalurl' do
    expect{dsc_xexchowavirtualdirectory[:dsc_externalurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalurl' do
    expect{dsc_xexchowavirtualdirectory[:dsc_externalurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_formsauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_formsauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_formsauthentication' do
    dsc_xexchowavirtualdirectory[:dsc_formsauthentication] = true
    expect(dsc_xexchowavirtualdirectory[:dsc_formsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_formsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_formsauthentication] = 'true'
    expect(dsc_xexchowavirtualdirectory[:dsc_formsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_formsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_formsauthentication] = 'false'
    expect(dsc_xexchowavirtualdirectory[:dsc_formsauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_formsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_formsauthentication] = 'True'
    expect(dsc_xexchowavirtualdirectory[:dsc_formsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_formsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_formsauthentication] = 'False'
    expect(dsc_xexchowavirtualdirectory[:dsc_formsauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_formsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_formsauthentication] = :true
    expect(dsc_xexchowavirtualdirectory[:dsc_formsauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_formsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_formsauthentication] = :false
    expect(dsc_xexchowavirtualdirectory[:dsc_formsauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_formsauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_formsauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_formsauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_formsauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internalurl' do
    expect{dsc_xexchowavirtualdirectory[:dsc_internalurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_internalurl' do
    expect{dsc_xexchowavirtualdirectory[:dsc_internalurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internalurl' do
    expect{dsc_xexchowavirtualdirectory[:dsc_internalurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internalurl' do
    expect{dsc_xexchowavirtualdirectory[:dsc_internalurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_instantmessagingenabled' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_instantmessagingenabled' do
    dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled] = true
    expect(dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_instantmessagingenabled" do
    dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled] = 'true'
    expect(dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_instantmessagingenabled" do
    dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled] = 'false'
    expect(dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_instantmessagingenabled" do
    dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled] = 'True'
    expect(dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_instantmessagingenabled" do
    dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled] = 'False'
    expect(dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_instantmessagingenabled" do
    dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled] = :true
    expect(dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_instantmessagingenabled" do
    dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled] = :false
    expect(dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled]).to eq(false)
  end

  it 'should not accept int for dsc_instantmessagingenabled' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instantmessagingenabled' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_instantmessagingcertificatethumbprint' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingcertificatethumbprint] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instantmessagingcertificatethumbprint' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingcertificatethumbprint] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instantmessagingcertificatethumbprint' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingcertificatethumbprint] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instantmessagingcertificatethumbprint' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingcertificatethumbprint] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_instantmessagingservername' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingservername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instantmessagingservername' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingservername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instantmessagingservername' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingservername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instantmessagingservername' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingservername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_instantmessagingtype predefined value None' do
    dsc_xexchowavirtualdirectory[:dsc_instantmessagingtype] = 'None'
    expect(dsc_xexchowavirtualdirectory[:dsc_instantmessagingtype]).to eq('None')
  end

  it 'should accept dsc_instantmessagingtype predefined value none' do
    dsc_xexchowavirtualdirectory[:dsc_instantmessagingtype] = 'none'
    expect(dsc_xexchowavirtualdirectory[:dsc_instantmessagingtype]).to eq('none')
  end

  it 'should accept dsc_instantmessagingtype predefined value Ocs' do
    dsc_xexchowavirtualdirectory[:dsc_instantmessagingtype] = 'Ocs'
    expect(dsc_xexchowavirtualdirectory[:dsc_instantmessagingtype]).to eq('Ocs')
  end

  it 'should accept dsc_instantmessagingtype predefined value ocs' do
    dsc_xexchowavirtualdirectory[:dsc_instantmessagingtype] = 'ocs'
    expect(dsc_xexchowavirtualdirectory[:dsc_instantmessagingtype]).to eq('ocs')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingtype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_instantmessagingtype' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingtype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instantmessagingtype' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingtype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instantmessagingtype' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingtype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instantmessagingtype' do
    expect{dsc_xexchowavirtualdirectory[:dsc_instantmessagingtype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logonpagepublicprivateselectionenabled' do
    expect{dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_logonpagepublicprivateselectionenabled' do
    dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled] = true
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_logonpagepublicprivateselectionenabled" do
    dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled] = 'true'
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_logonpagepublicprivateselectionenabled" do
    dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled] = 'false'
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_logonpagepublicprivateselectionenabled" do
    dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled] = 'True'
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_logonpagepublicprivateselectionenabled" do
    dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled] = 'False'
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_logonpagepublicprivateselectionenabled" do
    dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled] = :true
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_logonpagepublicprivateselectionenabled" do
    dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled] = :false
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled]).to eq(false)
  end

  it 'should not accept int for dsc_logonpagepublicprivateselectionenabled' do
    expect{dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logonpagepublicprivateselectionenabled' do
    expect{dsc_xexchowavirtualdirectory[:dsc_logonpagepublicprivateselectionenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logonpagelightselectionenabled' do
    expect{dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_logonpagelightselectionenabled' do
    dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled] = true
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_logonpagelightselectionenabled" do
    dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled] = 'true'
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_logonpagelightselectionenabled" do
    dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled] = 'false'
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_logonpagelightselectionenabled" do
    dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled] = 'True'
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_logonpagelightselectionenabled" do
    dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled] = 'False'
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_logonpagelightselectionenabled" do
    dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled] = :true
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_logonpagelightselectionenabled" do
    dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled] = :false
    expect(dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled]).to eq(false)
  end

  it 'should not accept int for dsc_logonpagelightselectionenabled' do
    expect{dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logonpagelightselectionenabled' do
    expect{dsc_xexchowavirtualdirectory[:dsc_logonpagelightselectionenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_windowsauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_windowsauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_windowsauthentication' do
    dsc_xexchowavirtualdirectory[:dsc_windowsauthentication] = true
    expect(dsc_xexchowavirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_windowsauthentication] = 'true'
    expect(dsc_xexchowavirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_windowsauthentication] = 'false'
    expect(dsc_xexchowavirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_windowsauthentication] = 'True'
    expect(dsc_xexchowavirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_windowsauthentication] = 'False'
    expect(dsc_xexchowavirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_windowsauthentication] = :true
    expect(dsc_xexchowavirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchowavirtualdirectory[:dsc_windowsauthentication] = :false
    expect(dsc_xexchowavirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_windowsauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_windowsauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_windowsauthentication' do
    expect{dsc_xexchowavirtualdirectory[:dsc_windowsauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchowavirtualdirectory)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchowavirtualdirectory)
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
