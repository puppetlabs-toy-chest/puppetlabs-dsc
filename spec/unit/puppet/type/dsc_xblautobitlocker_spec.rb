#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xblautobitlocker) do

  let :dsc_xblautobitlocker do
    Puppet::Type.type(:dsc_xblautobitlocker).new(
      :name     => 'foo',
      :dsc_drivetype => 'Fixed',
    )
  end

  it "should stringify normally" do
    expect(dsc_xblautobitlocker.to_s).to eq("Dsc_xblautobitlocker[foo]")
  end

  it 'should require that dsc_drivetype is specified' do
    #dsc_xblautobitlocker[:dsc_drivetype]
    expect { Puppet::Type.type(:dsc_xblautobitlocker).new(
      :name     => 'foo',
      :dsc_mindiskcapacitygb => -32,
      :dsc_primaryprotector => 'PasswordProtector',
      :dsc_autounlock => true,
      :dsc_adaccountorgroup => 'foo',
      :dsc_adaccountorgroupprotector => true,
      :dsc_encryptionmethod => 'Aes128',
      :dsc_hardwareencryption => true,
      :dsc_password => {"user"=>"user", "password"=>"password"},
      :dsc_passwordprotector => true,
      :dsc_pin => {"user"=>"user", "password"=>"password"},
      :dsc_recoverykeypath => 'foo',
      :dsc_recoverykeyprotector => true,
      :dsc_recoverypasswordprotector => true,
      :dsc_service => true,
      :dsc_skiphardwaretest => true,
      :dsc_startupkeypath => 'foo',
      :dsc_startupkeyprotector => true,
      :dsc_tpmprotector => true,
      :dsc_usedspaceonly => true,
    )}.to raise_error(Puppet::Error, /dsc_drivetype is a required attribute/)
  end

  it 'should accept dsc_drivetype predefined value Fixed' do
    dsc_xblautobitlocker[:dsc_drivetype] = 'Fixed'
    expect(dsc_xblautobitlocker[:dsc_drivetype]).to eq('Fixed')
  end

  it 'should accept dsc_drivetype predefined value fixed' do
    dsc_xblautobitlocker[:dsc_drivetype] = 'fixed'
    expect(dsc_xblautobitlocker[:dsc_drivetype]).to eq('fixed')
  end

  it 'should accept dsc_drivetype predefined value Removable' do
    dsc_xblautobitlocker[:dsc_drivetype] = 'Removable'
    expect(dsc_xblautobitlocker[:dsc_drivetype]).to eq('Removable')
  end

  it 'should accept dsc_drivetype predefined value removable' do
    dsc_xblautobitlocker[:dsc_drivetype] = 'removable'
    expect(dsc_xblautobitlocker[:dsc_drivetype]).to eq('removable')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xblautobitlocker[:dsc_drivetype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_drivetype' do
    expect{dsc_xblautobitlocker[:dsc_drivetype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_drivetype' do
    expect{dsc_xblautobitlocker[:dsc_drivetype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_drivetype' do
    expect{dsc_xblautobitlocker[:dsc_drivetype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_drivetype' do
    expect{dsc_xblautobitlocker[:dsc_drivetype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_mindiskcapacitygb' do
    expect{dsc_xblautobitlocker[:dsc_mindiskcapacitygb] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mindiskcapacitygb' do
    expect{dsc_xblautobitlocker[:dsc_mindiskcapacitygb] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_mindiskcapacitygb' do
    dsc_xblautobitlocker[:dsc_mindiskcapacitygb] = -32
    expect(dsc_xblautobitlocker[:dsc_mindiskcapacitygb]).to eq(-32)
  end

  it 'should accept string-like int for dsc_mindiskcapacitygb' do
    dsc_xblautobitlocker[:dsc_mindiskcapacitygb] = '16'
    expect(dsc_xblautobitlocker[:dsc_mindiskcapacitygb]).to eq(16)
  end

  it 'should accept string-like int for dsc_mindiskcapacitygb' do
    dsc_xblautobitlocker[:dsc_mindiskcapacitygb] = '-16'
    expect(dsc_xblautobitlocker[:dsc_mindiskcapacitygb]).to eq(-16)
  end

  it 'should accept string-like int for dsc_mindiskcapacitygb' do
    dsc_xblautobitlocker[:dsc_mindiskcapacitygb] = '32'
    expect(dsc_xblautobitlocker[:dsc_mindiskcapacitygb]).to eq(32)
  end

  it 'should accept string-like int for dsc_mindiskcapacitygb' do
    dsc_xblautobitlocker[:dsc_mindiskcapacitygb] = '-32'
    expect(dsc_xblautobitlocker[:dsc_mindiskcapacitygb]).to eq(-32)
  end


  it 'should accept dsc_primaryprotector predefined value PasswordProtector' do
    dsc_xblautobitlocker[:dsc_primaryprotector] = 'PasswordProtector'
    expect(dsc_xblautobitlocker[:dsc_primaryprotector]).to eq('PasswordProtector')
  end

  it 'should accept dsc_primaryprotector predefined value passwordprotector' do
    dsc_xblautobitlocker[:dsc_primaryprotector] = 'passwordprotector'
    expect(dsc_xblautobitlocker[:dsc_primaryprotector]).to eq('passwordprotector')
  end

  it 'should accept dsc_primaryprotector predefined value RecoveryPasswordProtector' do
    dsc_xblautobitlocker[:dsc_primaryprotector] = 'RecoveryPasswordProtector'
    expect(dsc_xblautobitlocker[:dsc_primaryprotector]).to eq('RecoveryPasswordProtector')
  end

  it 'should accept dsc_primaryprotector predefined value recoverypasswordprotector' do
    dsc_xblautobitlocker[:dsc_primaryprotector] = 'recoverypasswordprotector'
    expect(dsc_xblautobitlocker[:dsc_primaryprotector]).to eq('recoverypasswordprotector')
  end

  it 'should accept dsc_primaryprotector predefined value StartupKeyProtector' do
    dsc_xblautobitlocker[:dsc_primaryprotector] = 'StartupKeyProtector'
    expect(dsc_xblautobitlocker[:dsc_primaryprotector]).to eq('StartupKeyProtector')
  end

  it 'should accept dsc_primaryprotector predefined value startupkeyprotector' do
    dsc_xblautobitlocker[:dsc_primaryprotector] = 'startupkeyprotector'
    expect(dsc_xblautobitlocker[:dsc_primaryprotector]).to eq('startupkeyprotector')
  end

  it 'should accept dsc_primaryprotector predefined value TpmProtector' do
    dsc_xblautobitlocker[:dsc_primaryprotector] = 'TpmProtector'
    expect(dsc_xblautobitlocker[:dsc_primaryprotector]).to eq('TpmProtector')
  end

  it 'should accept dsc_primaryprotector predefined value tpmprotector' do
    dsc_xblautobitlocker[:dsc_primaryprotector] = 'tpmprotector'
    expect(dsc_xblautobitlocker[:dsc_primaryprotector]).to eq('tpmprotector')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xblautobitlocker[:dsc_primaryprotector] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_primaryprotector' do
    expect{dsc_xblautobitlocker[:dsc_primaryprotector] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_primaryprotector' do
    expect{dsc_xblautobitlocker[:dsc_primaryprotector] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_primaryprotector' do
    expect{dsc_xblautobitlocker[:dsc_primaryprotector] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_primaryprotector' do
    expect{dsc_xblautobitlocker[:dsc_primaryprotector] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autounlock' do
    expect{dsc_xblautobitlocker[:dsc_autounlock] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_autounlock' do
    dsc_xblautobitlocker[:dsc_autounlock] = true
    expect(dsc_xblautobitlocker[:dsc_autounlock]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_autounlock" do
    dsc_xblautobitlocker[:dsc_autounlock] = 'true'
    expect(dsc_xblautobitlocker[:dsc_autounlock]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_autounlock" do
    dsc_xblautobitlocker[:dsc_autounlock] = 'false'
    expect(dsc_xblautobitlocker[:dsc_autounlock]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_autounlock" do
    dsc_xblautobitlocker[:dsc_autounlock] = 'True'
    expect(dsc_xblautobitlocker[:dsc_autounlock]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_autounlock" do
    dsc_xblautobitlocker[:dsc_autounlock] = 'False'
    expect(dsc_xblautobitlocker[:dsc_autounlock]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_autounlock" do
    dsc_xblautobitlocker[:dsc_autounlock] = :true
    expect(dsc_xblautobitlocker[:dsc_autounlock]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_autounlock" do
    dsc_xblautobitlocker[:dsc_autounlock] = :false
    expect(dsc_xblautobitlocker[:dsc_autounlock]).to eq(false)
  end

  it 'should not accept int for dsc_autounlock' do
    expect{dsc_xblautobitlocker[:dsc_autounlock] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autounlock' do
    expect{dsc_xblautobitlocker[:dsc_autounlock] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adaccountorgroup' do
    expect{dsc_xblautobitlocker[:dsc_adaccountorgroup] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_adaccountorgroup' do
    expect{dsc_xblautobitlocker[:dsc_adaccountorgroup] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_adaccountorgroup' do
    expect{dsc_xblautobitlocker[:dsc_adaccountorgroup] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adaccountorgroup' do
    expect{dsc_xblautobitlocker[:dsc_adaccountorgroup] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adaccountorgroupprotector' do
    expect{dsc_xblautobitlocker[:dsc_adaccountorgroupprotector] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_adaccountorgroupprotector' do
    dsc_xblautobitlocker[:dsc_adaccountorgroupprotector] = true
    expect(dsc_xblautobitlocker[:dsc_adaccountorgroupprotector]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_adaccountorgroupprotector" do
    dsc_xblautobitlocker[:dsc_adaccountorgroupprotector] = 'true'
    expect(dsc_xblautobitlocker[:dsc_adaccountorgroupprotector]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_adaccountorgroupprotector" do
    dsc_xblautobitlocker[:dsc_adaccountorgroupprotector] = 'false'
    expect(dsc_xblautobitlocker[:dsc_adaccountorgroupprotector]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_adaccountorgroupprotector" do
    dsc_xblautobitlocker[:dsc_adaccountorgroupprotector] = 'True'
    expect(dsc_xblautobitlocker[:dsc_adaccountorgroupprotector]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_adaccountorgroupprotector" do
    dsc_xblautobitlocker[:dsc_adaccountorgroupprotector] = 'False'
    expect(dsc_xblautobitlocker[:dsc_adaccountorgroupprotector]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_adaccountorgroupprotector" do
    dsc_xblautobitlocker[:dsc_adaccountorgroupprotector] = :true
    expect(dsc_xblautobitlocker[:dsc_adaccountorgroupprotector]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_adaccountorgroupprotector" do
    dsc_xblautobitlocker[:dsc_adaccountorgroupprotector] = :false
    expect(dsc_xblautobitlocker[:dsc_adaccountorgroupprotector]).to eq(false)
  end

  it 'should not accept int for dsc_adaccountorgroupprotector' do
    expect{dsc_xblautobitlocker[:dsc_adaccountorgroupprotector] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adaccountorgroupprotector' do
    expect{dsc_xblautobitlocker[:dsc_adaccountorgroupprotector] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_encryptionmethod predefined value Aes128' do
    dsc_xblautobitlocker[:dsc_encryptionmethod] = 'Aes128'
    expect(dsc_xblautobitlocker[:dsc_encryptionmethod]).to eq('Aes128')
  end

  it 'should accept dsc_encryptionmethod predefined value aes128' do
    dsc_xblautobitlocker[:dsc_encryptionmethod] = 'aes128'
    expect(dsc_xblautobitlocker[:dsc_encryptionmethod]).to eq('aes128')
  end

  it 'should accept dsc_encryptionmethod predefined value Aes256' do
    dsc_xblautobitlocker[:dsc_encryptionmethod] = 'Aes256'
    expect(dsc_xblautobitlocker[:dsc_encryptionmethod]).to eq('Aes256')
  end

  it 'should accept dsc_encryptionmethod predefined value aes256' do
    dsc_xblautobitlocker[:dsc_encryptionmethod] = 'aes256'
    expect(dsc_xblautobitlocker[:dsc_encryptionmethod]).to eq('aes256')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xblautobitlocker[:dsc_encryptionmethod] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_encryptionmethod' do
    expect{dsc_xblautobitlocker[:dsc_encryptionmethod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_encryptionmethod' do
    expect{dsc_xblautobitlocker[:dsc_encryptionmethod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_encryptionmethod' do
    expect{dsc_xblautobitlocker[:dsc_encryptionmethod] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_encryptionmethod' do
    expect{dsc_xblautobitlocker[:dsc_encryptionmethod] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_hardwareencryption' do
    expect{dsc_xblautobitlocker[:dsc_hardwareencryption] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_hardwareencryption' do
    dsc_xblautobitlocker[:dsc_hardwareencryption] = true
    expect(dsc_xblautobitlocker[:dsc_hardwareencryption]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_hardwareencryption" do
    dsc_xblautobitlocker[:dsc_hardwareencryption] = 'true'
    expect(dsc_xblautobitlocker[:dsc_hardwareencryption]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_hardwareencryption" do
    dsc_xblautobitlocker[:dsc_hardwareencryption] = 'false'
    expect(dsc_xblautobitlocker[:dsc_hardwareencryption]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_hardwareencryption" do
    dsc_xblautobitlocker[:dsc_hardwareencryption] = 'True'
    expect(dsc_xblautobitlocker[:dsc_hardwareencryption]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_hardwareencryption" do
    dsc_xblautobitlocker[:dsc_hardwareencryption] = 'False'
    expect(dsc_xblautobitlocker[:dsc_hardwareencryption]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_hardwareencryption" do
    dsc_xblautobitlocker[:dsc_hardwareencryption] = :true
    expect(dsc_xblautobitlocker[:dsc_hardwareencryption]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_hardwareencryption" do
    dsc_xblautobitlocker[:dsc_hardwareencryption] = :false
    expect(dsc_xblautobitlocker[:dsc_hardwareencryption]).to eq(false)
  end

  it 'should not accept int for dsc_hardwareencryption' do
    expect{dsc_xblautobitlocker[:dsc_hardwareencryption] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_hardwareencryption' do
    expect{dsc_xblautobitlocker[:dsc_hardwareencryption] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_password" do
    expect{dsc_xblautobitlocker[:dsc_password] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_password' do
    expect{dsc_xblautobitlocker[:dsc_password] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_password' do
    expect{dsc_xblautobitlocker[:dsc_password] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_password' do
    expect{dsc_xblautobitlocker[:dsc_password] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_password' do
    expect{dsc_xblautobitlocker[:dsc_password] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_passwordprotector' do
    expect{dsc_xblautobitlocker[:dsc_passwordprotector] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_passwordprotector' do
    dsc_xblautobitlocker[:dsc_passwordprotector] = true
    expect(dsc_xblautobitlocker[:dsc_passwordprotector]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_passwordprotector" do
    dsc_xblautobitlocker[:dsc_passwordprotector] = 'true'
    expect(dsc_xblautobitlocker[:dsc_passwordprotector]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_passwordprotector" do
    dsc_xblautobitlocker[:dsc_passwordprotector] = 'false'
    expect(dsc_xblautobitlocker[:dsc_passwordprotector]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_passwordprotector" do
    dsc_xblautobitlocker[:dsc_passwordprotector] = 'True'
    expect(dsc_xblautobitlocker[:dsc_passwordprotector]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_passwordprotector" do
    dsc_xblautobitlocker[:dsc_passwordprotector] = 'False'
    expect(dsc_xblautobitlocker[:dsc_passwordprotector]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_passwordprotector" do
    dsc_xblautobitlocker[:dsc_passwordprotector] = :true
    expect(dsc_xblautobitlocker[:dsc_passwordprotector]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_passwordprotector" do
    dsc_xblautobitlocker[:dsc_passwordprotector] = :false
    expect(dsc_xblautobitlocker[:dsc_passwordprotector]).to eq(false)
  end

  it 'should not accept int for dsc_passwordprotector' do
    expect{dsc_xblautobitlocker[:dsc_passwordprotector] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_passwordprotector' do
    expect{dsc_xblautobitlocker[:dsc_passwordprotector] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_pin" do
    expect{dsc_xblautobitlocker[:dsc_pin] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pin' do
    expect{dsc_xblautobitlocker[:dsc_pin] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pin' do
    expect{dsc_xblautobitlocker[:dsc_pin] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pin' do
    expect{dsc_xblautobitlocker[:dsc_pin] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pin' do
    expect{dsc_xblautobitlocker[:dsc_pin] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_recoverykeypath' do
    expect{dsc_xblautobitlocker[:dsc_recoverykeypath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_recoverykeypath' do
    expect{dsc_xblautobitlocker[:dsc_recoverykeypath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_recoverykeypath' do
    expect{dsc_xblautobitlocker[:dsc_recoverykeypath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_recoverykeypath' do
    expect{dsc_xblautobitlocker[:dsc_recoverykeypath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_recoverykeyprotector' do
    expect{dsc_xblautobitlocker[:dsc_recoverykeyprotector] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_recoverykeyprotector' do
    dsc_xblautobitlocker[:dsc_recoverykeyprotector] = true
    expect(dsc_xblautobitlocker[:dsc_recoverykeyprotector]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_recoverykeyprotector" do
    dsc_xblautobitlocker[:dsc_recoverykeyprotector] = 'true'
    expect(dsc_xblautobitlocker[:dsc_recoverykeyprotector]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_recoverykeyprotector" do
    dsc_xblautobitlocker[:dsc_recoverykeyprotector] = 'false'
    expect(dsc_xblautobitlocker[:dsc_recoverykeyprotector]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_recoverykeyprotector" do
    dsc_xblautobitlocker[:dsc_recoverykeyprotector] = 'True'
    expect(dsc_xblautobitlocker[:dsc_recoverykeyprotector]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_recoverykeyprotector" do
    dsc_xblautobitlocker[:dsc_recoverykeyprotector] = 'False'
    expect(dsc_xblautobitlocker[:dsc_recoverykeyprotector]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_recoverykeyprotector" do
    dsc_xblautobitlocker[:dsc_recoverykeyprotector] = :true
    expect(dsc_xblautobitlocker[:dsc_recoverykeyprotector]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_recoverykeyprotector" do
    dsc_xblautobitlocker[:dsc_recoverykeyprotector] = :false
    expect(dsc_xblautobitlocker[:dsc_recoverykeyprotector]).to eq(false)
  end

  it 'should not accept int for dsc_recoverykeyprotector' do
    expect{dsc_xblautobitlocker[:dsc_recoverykeyprotector] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_recoverykeyprotector' do
    expect{dsc_xblautobitlocker[:dsc_recoverykeyprotector] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_recoverypasswordprotector' do
    expect{dsc_xblautobitlocker[:dsc_recoverypasswordprotector] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_recoverypasswordprotector' do
    dsc_xblautobitlocker[:dsc_recoverypasswordprotector] = true
    expect(dsc_xblautobitlocker[:dsc_recoverypasswordprotector]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_recoverypasswordprotector" do
    dsc_xblautobitlocker[:dsc_recoverypasswordprotector] = 'true'
    expect(dsc_xblautobitlocker[:dsc_recoverypasswordprotector]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_recoverypasswordprotector" do
    dsc_xblautobitlocker[:dsc_recoverypasswordprotector] = 'false'
    expect(dsc_xblautobitlocker[:dsc_recoverypasswordprotector]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_recoverypasswordprotector" do
    dsc_xblautobitlocker[:dsc_recoverypasswordprotector] = 'True'
    expect(dsc_xblautobitlocker[:dsc_recoverypasswordprotector]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_recoverypasswordprotector" do
    dsc_xblautobitlocker[:dsc_recoverypasswordprotector] = 'False'
    expect(dsc_xblautobitlocker[:dsc_recoverypasswordprotector]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_recoverypasswordprotector" do
    dsc_xblautobitlocker[:dsc_recoverypasswordprotector] = :true
    expect(dsc_xblautobitlocker[:dsc_recoverypasswordprotector]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_recoverypasswordprotector" do
    dsc_xblautobitlocker[:dsc_recoverypasswordprotector] = :false
    expect(dsc_xblautobitlocker[:dsc_recoverypasswordprotector]).to eq(false)
  end

  it 'should not accept int for dsc_recoverypasswordprotector' do
    expect{dsc_xblautobitlocker[:dsc_recoverypasswordprotector] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_recoverypasswordprotector' do
    expect{dsc_xblautobitlocker[:dsc_recoverypasswordprotector] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_service' do
    expect{dsc_xblautobitlocker[:dsc_service] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_service' do
    dsc_xblautobitlocker[:dsc_service] = true
    expect(dsc_xblautobitlocker[:dsc_service]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_service" do
    dsc_xblautobitlocker[:dsc_service] = 'true'
    expect(dsc_xblautobitlocker[:dsc_service]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_service" do
    dsc_xblautobitlocker[:dsc_service] = 'false'
    expect(dsc_xblautobitlocker[:dsc_service]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_service" do
    dsc_xblautobitlocker[:dsc_service] = 'True'
    expect(dsc_xblautobitlocker[:dsc_service]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_service" do
    dsc_xblautobitlocker[:dsc_service] = 'False'
    expect(dsc_xblautobitlocker[:dsc_service]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_service" do
    dsc_xblautobitlocker[:dsc_service] = :true
    expect(dsc_xblautobitlocker[:dsc_service]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_service" do
    dsc_xblautobitlocker[:dsc_service] = :false
    expect(dsc_xblautobitlocker[:dsc_service]).to eq(false)
  end

  it 'should not accept int for dsc_service' do
    expect{dsc_xblautobitlocker[:dsc_service] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_service' do
    expect{dsc_xblautobitlocker[:dsc_service] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_skiphardwaretest' do
    expect{dsc_xblautobitlocker[:dsc_skiphardwaretest] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_skiphardwaretest' do
    dsc_xblautobitlocker[:dsc_skiphardwaretest] = true
    expect(dsc_xblautobitlocker[:dsc_skiphardwaretest]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_skiphardwaretest" do
    dsc_xblautobitlocker[:dsc_skiphardwaretest] = 'true'
    expect(dsc_xblautobitlocker[:dsc_skiphardwaretest]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_skiphardwaretest" do
    dsc_xblautobitlocker[:dsc_skiphardwaretest] = 'false'
    expect(dsc_xblautobitlocker[:dsc_skiphardwaretest]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_skiphardwaretest" do
    dsc_xblautobitlocker[:dsc_skiphardwaretest] = 'True'
    expect(dsc_xblautobitlocker[:dsc_skiphardwaretest]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_skiphardwaretest" do
    dsc_xblautobitlocker[:dsc_skiphardwaretest] = 'False'
    expect(dsc_xblautobitlocker[:dsc_skiphardwaretest]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_skiphardwaretest" do
    dsc_xblautobitlocker[:dsc_skiphardwaretest] = :true
    expect(dsc_xblautobitlocker[:dsc_skiphardwaretest]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_skiphardwaretest" do
    dsc_xblautobitlocker[:dsc_skiphardwaretest] = :false
    expect(dsc_xblautobitlocker[:dsc_skiphardwaretest]).to eq(false)
  end

  it 'should not accept int for dsc_skiphardwaretest' do
    expect{dsc_xblautobitlocker[:dsc_skiphardwaretest] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_skiphardwaretest' do
    expect{dsc_xblautobitlocker[:dsc_skiphardwaretest] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_startupkeypath' do
    expect{dsc_xblautobitlocker[:dsc_startupkeypath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_startupkeypath' do
    expect{dsc_xblautobitlocker[:dsc_startupkeypath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_startupkeypath' do
    expect{dsc_xblautobitlocker[:dsc_startupkeypath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_startupkeypath' do
    expect{dsc_xblautobitlocker[:dsc_startupkeypath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_startupkeyprotector' do
    expect{dsc_xblautobitlocker[:dsc_startupkeyprotector] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_startupkeyprotector' do
    dsc_xblautobitlocker[:dsc_startupkeyprotector] = true
    expect(dsc_xblautobitlocker[:dsc_startupkeyprotector]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_startupkeyprotector" do
    dsc_xblautobitlocker[:dsc_startupkeyprotector] = 'true'
    expect(dsc_xblautobitlocker[:dsc_startupkeyprotector]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_startupkeyprotector" do
    dsc_xblautobitlocker[:dsc_startupkeyprotector] = 'false'
    expect(dsc_xblautobitlocker[:dsc_startupkeyprotector]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_startupkeyprotector" do
    dsc_xblautobitlocker[:dsc_startupkeyprotector] = 'True'
    expect(dsc_xblautobitlocker[:dsc_startupkeyprotector]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_startupkeyprotector" do
    dsc_xblautobitlocker[:dsc_startupkeyprotector] = 'False'
    expect(dsc_xblautobitlocker[:dsc_startupkeyprotector]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_startupkeyprotector" do
    dsc_xblautobitlocker[:dsc_startupkeyprotector] = :true
    expect(dsc_xblautobitlocker[:dsc_startupkeyprotector]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_startupkeyprotector" do
    dsc_xblautobitlocker[:dsc_startupkeyprotector] = :false
    expect(dsc_xblautobitlocker[:dsc_startupkeyprotector]).to eq(false)
  end

  it 'should not accept int for dsc_startupkeyprotector' do
    expect{dsc_xblautobitlocker[:dsc_startupkeyprotector] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_startupkeyprotector' do
    expect{dsc_xblautobitlocker[:dsc_startupkeyprotector] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_tpmprotector' do
    expect{dsc_xblautobitlocker[:dsc_tpmprotector] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_tpmprotector' do
    dsc_xblautobitlocker[:dsc_tpmprotector] = true
    expect(dsc_xblautobitlocker[:dsc_tpmprotector]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_tpmprotector" do
    dsc_xblautobitlocker[:dsc_tpmprotector] = 'true'
    expect(dsc_xblautobitlocker[:dsc_tpmprotector]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_tpmprotector" do
    dsc_xblautobitlocker[:dsc_tpmprotector] = 'false'
    expect(dsc_xblautobitlocker[:dsc_tpmprotector]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_tpmprotector" do
    dsc_xblautobitlocker[:dsc_tpmprotector] = 'True'
    expect(dsc_xblautobitlocker[:dsc_tpmprotector]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_tpmprotector" do
    dsc_xblautobitlocker[:dsc_tpmprotector] = 'False'
    expect(dsc_xblautobitlocker[:dsc_tpmprotector]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_tpmprotector" do
    dsc_xblautobitlocker[:dsc_tpmprotector] = :true
    expect(dsc_xblautobitlocker[:dsc_tpmprotector]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_tpmprotector" do
    dsc_xblautobitlocker[:dsc_tpmprotector] = :false
    expect(dsc_xblautobitlocker[:dsc_tpmprotector]).to eq(false)
  end

  it 'should not accept int for dsc_tpmprotector' do
    expect{dsc_xblautobitlocker[:dsc_tpmprotector] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_tpmprotector' do
    expect{dsc_xblautobitlocker[:dsc_tpmprotector] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usedspaceonly' do
    expect{dsc_xblautobitlocker[:dsc_usedspaceonly] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_usedspaceonly' do
    dsc_xblautobitlocker[:dsc_usedspaceonly] = true
    expect(dsc_xblautobitlocker[:dsc_usedspaceonly]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_usedspaceonly" do
    dsc_xblautobitlocker[:dsc_usedspaceonly] = 'true'
    expect(dsc_xblautobitlocker[:dsc_usedspaceonly]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_usedspaceonly" do
    dsc_xblautobitlocker[:dsc_usedspaceonly] = 'false'
    expect(dsc_xblautobitlocker[:dsc_usedspaceonly]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_usedspaceonly" do
    dsc_xblautobitlocker[:dsc_usedspaceonly] = 'True'
    expect(dsc_xblautobitlocker[:dsc_usedspaceonly]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_usedspaceonly" do
    dsc_xblautobitlocker[:dsc_usedspaceonly] = 'False'
    expect(dsc_xblautobitlocker[:dsc_usedspaceonly]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_usedspaceonly" do
    dsc_xblautobitlocker[:dsc_usedspaceonly] = :true
    expect(dsc_xblautobitlocker[:dsc_usedspaceonly]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_usedspaceonly" do
    dsc_xblautobitlocker[:dsc_usedspaceonly] = :false
    expect(dsc_xblautobitlocker[:dsc_usedspaceonly]).to eq(false)
  end

  it 'should not accept int for dsc_usedspaceonly' do
    expect{dsc_xblautobitlocker[:dsc_usedspaceonly] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usedspaceonly' do
    expect{dsc_xblautobitlocker[:dsc_usedspaceonly] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xblautobitlocker)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xblautobitlocker)
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
