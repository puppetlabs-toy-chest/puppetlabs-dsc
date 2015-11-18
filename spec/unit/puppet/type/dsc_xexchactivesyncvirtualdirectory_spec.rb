#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchactivesyncvirtualdirectory) do

  let :dsc_xexchactivesyncvirtualdirectory do
    Puppet::Type.type(:dsc_xexchactivesyncvirtualdirectory).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchactivesyncvirtualdirectory.to_s).to eq("Dsc_xexchactivesyncvirtualdirectory[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchactivesyncvirtualdirectory[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchactivesyncvirtualdirectory).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_allowservicerestart => true,
      :dsc_autocertbasedauth => true,
      :dsc_autocertbasedauththumbprint => 'foo',
      :dsc_autocertbasedauthhttpsbindings => ["foo", "bar", "spec"],
      :dsc_basicauthenabled => true,
      :dsc_clientcertauth => 'Ignore',
      :dsc_compressionenabled => true,
      :dsc_domaincontroller => 'foo',
      :dsc_externalauthenticationmethods => ["foo", "bar", "spec"],
      :dsc_externalurl => 'foo',
      :dsc_internalauthenticationmethods => ["foo", "bar", "spec"],
      :dsc_internalurl => 'foo',
      :dsc_windowsauthenabled => true,
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart] = true
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart] = :true
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart] = :false
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autocertbasedauth' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_autocertbasedauth' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth] = true
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_autocertbasedauth" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth] = 'true'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_autocertbasedauth" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth] = 'false'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_autocertbasedauth" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth] = 'True'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_autocertbasedauth" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth] = 'False'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_autocertbasedauth" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth] = :true
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_autocertbasedauth" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth] = :false
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth]).to eq(false)
  end

  it 'should not accept int for dsc_autocertbasedauth' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autocertbasedauth' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauth] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autocertbasedauththumbprint' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauththumbprint] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autocertbasedauththumbprint' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauththumbprint] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_autocertbasedauththumbprint' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauththumbprint] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autocertbasedauththumbprint' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauththumbprint] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_autocertbasedauthhttpsbindings' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauthhttpsbindings] = ["foo", "bar", "spec"]
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauthhttpsbindings]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_autocertbasedauthhttpsbindings' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauthhttpsbindings] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_autocertbasedauthhttpsbindings' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauthhttpsbindings] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autocertbasedauthhttpsbindings' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_autocertbasedauthhttpsbindings] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_basicauthenabled' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_basicauthenabled' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled] = true
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_basicauthenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled] = 'true'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_basicauthenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled] = 'false'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_basicauthenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled] = 'True'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_basicauthenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled] = 'False'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_basicauthenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled] = :true
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_basicauthenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled] = :false
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled]).to eq(false)
  end

  it 'should not accept int for dsc_basicauthenabled' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_basicauthenabled' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_basicauthenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_clientcertauth predefined value Ignore' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth] = 'Ignore'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth]).to eq('Ignore')
  end

  it 'should accept dsc_clientcertauth predefined value ignore' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth] = 'ignore'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth]).to eq('ignore')
  end

  it 'should accept dsc_clientcertauth predefined value Allowed' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth] = 'Allowed'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth]).to eq('Allowed')
  end

  it 'should accept dsc_clientcertauth predefined value allowed' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth] = 'allowed'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth]).to eq('allowed')
  end

  it 'should accept dsc_clientcertauth predefined value Required' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth] = 'Required'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth]).to eq('Required')
  end

  it 'should accept dsc_clientcertauth predefined value required' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth] = 'required'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth]).to eq('required')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_clientcertauth' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_clientcertauth' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_clientcertauth' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_clientcertauth' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_clientcertauth] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_compressionenabled' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_compressionenabled' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled] = true
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_compressionenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled] = 'true'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_compressionenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled] = 'false'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_compressionenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled] = 'True'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_compressionenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled] = 'False'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_compressionenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled] = :true
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_compressionenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled] = :false
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled]).to eq(false)
  end

  it 'should not accept int for dsc_compressionenabled' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_compressionenabled' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_compressionenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_externalauthenticationmethods' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_externalauthenticationmethods] = ["foo", "bar", "spec"]
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_externalauthenticationmethods]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_externalauthenticationmethods' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_externalauthenticationmethods] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externalauthenticationmethods' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_externalauthenticationmethods] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalauthenticationmethods' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_externalauthenticationmethods] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externalurl' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_externalurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_externalurl' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_externalurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externalurl' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_externalurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalurl' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_externalurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_internalauthenticationmethods' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_internalauthenticationmethods] = ["foo", "bar", "spec"]
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_internalauthenticationmethods]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_internalauthenticationmethods' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_internalauthenticationmethods] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internalauthenticationmethods' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_internalauthenticationmethods] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internalauthenticationmethods' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_internalauthenticationmethods] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internalurl' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_internalurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_internalurl' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_internalurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internalurl' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_internalurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internalurl' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_internalurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_windowsauthenabled' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_windowsauthenabled' do
    dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled] = true
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_windowsauthenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled] = 'true'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_windowsauthenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled] = 'false'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_windowsauthenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled] = 'True'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_windowsauthenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled] = 'False'
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_windowsauthenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled] = :true
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_windowsauthenabled" do
    dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled] = :false
    expect(dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled]).to eq(false)
  end

  it 'should not accept int for dsc_windowsauthenabled' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_windowsauthenabled' do
    expect{dsc_xexchactivesyncvirtualdirectory[:dsc_windowsauthenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchactivesyncvirtualdirectory)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchactivesyncvirtualdirectory)
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
