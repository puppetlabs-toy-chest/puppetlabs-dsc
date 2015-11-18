#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xadcscertificationauthority) do

  let :dsc_xadcscertificationauthority do
    Puppet::Type.type(:dsc_xadcscertificationauthority).new(
      :name     => 'foo',
      :dsc_catype => 'EnterpriseRootCA',
    )
  end

  it "should stringify normally" do
    expect(dsc_xadcscertificationauthority.to_s).to eq("Dsc_xadcscertificationauthority[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xadcscertificationauthority[:ensure]).to eq :present
  end

  it 'should require that dsc_catype is specified' do
    #dsc_xadcscertificationauthority[:dsc_catype]
    expect { Puppet::Type.type(:dsc_xadcscertificationauthority).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_ensure => 'Present',
      :dsc_cacommonname => 'foo',
      :dsc_cadistinguishednamesuffix => 'foo',
      :dsc_certfile => 'foo',
      :dsc_certfilepassword => {"user"=>"user", "password"=>"password"},
      :dsc_certificateid => 'foo',
      :dsc_cryptoprovidername => 'foo',
      :dsc_databasedirectory => 'foo',
      :dsc_hashalgorithmname => 'foo',
      :dsc_ignoreunicode => true,
      :dsc_keycontainername => 'foo',
      :dsc_keylength => 32,
      :dsc_logdirectory => 'foo',
      :dsc_outputcertrequestfile => 'foo',
      :dsc_overwriteexistingcainds => true,
      :dsc_overwriteexistingdatabase => true,
      :dsc_overwriteexistingkey => true,
      :dsc_parentca => 'foo',
      :dsc_validityperiod => 'Hours',
      :dsc_validityperiodunits => 32,
    )}.to raise_error(Puppet::Error, /dsc_catype is a required attribute/)
  end

  it 'should accept dsc_catype predefined value EnterpriseRootCA' do
    dsc_xadcscertificationauthority[:dsc_catype] = 'EnterpriseRootCA'
    expect(dsc_xadcscertificationauthority[:dsc_catype]).to eq('EnterpriseRootCA')
  end

  it 'should accept dsc_catype predefined value enterpriserootca' do
    dsc_xadcscertificationauthority[:dsc_catype] = 'enterpriserootca'
    expect(dsc_xadcscertificationauthority[:dsc_catype]).to eq('enterpriserootca')
  end

  it 'should accept dsc_catype predefined value EnterpriseSubordinateCA' do
    dsc_xadcscertificationauthority[:dsc_catype] = 'EnterpriseSubordinateCA'
    expect(dsc_xadcscertificationauthority[:dsc_catype]).to eq('EnterpriseSubordinateCA')
  end

  it 'should accept dsc_catype predefined value enterprisesubordinateca' do
    dsc_xadcscertificationauthority[:dsc_catype] = 'enterprisesubordinateca'
    expect(dsc_xadcscertificationauthority[:dsc_catype]).to eq('enterprisesubordinateca')
  end

  it 'should accept dsc_catype predefined value StandaloneRootCA' do
    dsc_xadcscertificationauthority[:dsc_catype] = 'StandaloneRootCA'
    expect(dsc_xadcscertificationauthority[:dsc_catype]).to eq('StandaloneRootCA')
  end

  it 'should accept dsc_catype predefined value standalonerootca' do
    dsc_xadcscertificationauthority[:dsc_catype] = 'standalonerootca'
    expect(dsc_xadcscertificationauthority[:dsc_catype]).to eq('standalonerootca')
  end

  it 'should accept dsc_catype predefined value StandaloneSubordinateCA' do
    dsc_xadcscertificationauthority[:dsc_catype] = 'StandaloneSubordinateCA'
    expect(dsc_xadcscertificationauthority[:dsc_catype]).to eq('StandaloneSubordinateCA')
  end

  it 'should accept dsc_catype predefined value standalonesubordinateca' do
    dsc_xadcscertificationauthority[:dsc_catype] = 'standalonesubordinateca'
    expect(dsc_xadcscertificationauthority[:dsc_catype]).to eq('standalonesubordinateca')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xadcscertificationauthority[:dsc_catype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_catype' do
    expect{dsc_xadcscertificationauthority[:dsc_catype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_catype' do
    expect{dsc_xadcscertificationauthority[:dsc_catype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_catype' do
    expect{dsc_xadcscertificationauthority[:dsc_catype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_catype' do
    expect{dsc_xadcscertificationauthority[:dsc_catype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xadcscertificationauthority[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xadcscertificationauthority[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xadcscertificationauthority[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xadcscertificationauthority[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xadcscertificationauthority[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xadcscertificationauthority[:dsc_ensure] = 'Present'
    expect(dsc_xadcscertificationauthority[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xadcscertificationauthority[:dsc_ensure] = 'present'
    expect(dsc_xadcscertificationauthority[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xadcscertificationauthority[:dsc_ensure] = 'present'
    expect(dsc_xadcscertificationauthority[:ensure]).to eq(dsc_xadcscertificationauthority[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xadcscertificationauthority[:dsc_ensure] = 'Absent'
    expect(dsc_xadcscertificationauthority[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xadcscertificationauthority[:dsc_ensure] = 'absent'
    expect(dsc_xadcscertificationauthority[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xadcscertificationauthority[:dsc_ensure] = 'absent'
    expect(dsc_xadcscertificationauthority[:ensure]).to eq(dsc_xadcscertificationauthority[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xadcscertificationauthority[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xadcscertificationauthority[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xadcscertificationauthority[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xadcscertificationauthority[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xadcscertificationauthority[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_cacommonname' do
    expect{dsc_xadcscertificationauthority[:dsc_cacommonname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_cacommonname' do
    expect{dsc_xadcscertificationauthority[:dsc_cacommonname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_cacommonname' do
    expect{dsc_xadcscertificationauthority[:dsc_cacommonname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_cacommonname' do
    expect{dsc_xadcscertificationauthority[:dsc_cacommonname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_cadistinguishednamesuffix' do
    expect{dsc_xadcscertificationauthority[:dsc_cadistinguishednamesuffix] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_cadistinguishednamesuffix' do
    expect{dsc_xadcscertificationauthority[:dsc_cadistinguishednamesuffix] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_cadistinguishednamesuffix' do
    expect{dsc_xadcscertificationauthority[:dsc_cadistinguishednamesuffix] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_cadistinguishednamesuffix' do
    expect{dsc_xadcscertificationauthority[:dsc_cadistinguishednamesuffix] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_certfile' do
    expect{dsc_xadcscertificationauthority[:dsc_certfile] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_certfile' do
    expect{dsc_xadcscertificationauthority[:dsc_certfile] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_certfile' do
    expect{dsc_xadcscertificationauthority[:dsc_certfile] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_certfile' do
    expect{dsc_xadcscertificationauthority[:dsc_certfile] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_certfilepassword" do
    expect{dsc_xadcscertificationauthority[:dsc_certfilepassword] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_certfilepassword' do
    expect{dsc_xadcscertificationauthority[:dsc_certfilepassword] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_certfilepassword' do
    expect{dsc_xadcscertificationauthority[:dsc_certfilepassword] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_certfilepassword' do
    expect{dsc_xadcscertificationauthority[:dsc_certfilepassword] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_certfilepassword' do
    expect{dsc_xadcscertificationauthority[:dsc_certfilepassword] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_certificateid' do
    expect{dsc_xadcscertificationauthority[:dsc_certificateid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_certificateid' do
    expect{dsc_xadcscertificationauthority[:dsc_certificateid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_certificateid' do
    expect{dsc_xadcscertificationauthority[:dsc_certificateid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_certificateid' do
    expect{dsc_xadcscertificationauthority[:dsc_certificateid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_cryptoprovidername' do
    expect{dsc_xadcscertificationauthority[:dsc_cryptoprovidername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_cryptoprovidername' do
    expect{dsc_xadcscertificationauthority[:dsc_cryptoprovidername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_cryptoprovidername' do
    expect{dsc_xadcscertificationauthority[:dsc_cryptoprovidername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_cryptoprovidername' do
    expect{dsc_xadcscertificationauthority[:dsc_cryptoprovidername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasedirectory' do
    expect{dsc_xadcscertificationauthority[:dsc_databasedirectory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasedirectory' do
    expect{dsc_xadcscertificationauthority[:dsc_databasedirectory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasedirectory' do
    expect{dsc_xadcscertificationauthority[:dsc_databasedirectory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasedirectory' do
    expect{dsc_xadcscertificationauthority[:dsc_databasedirectory] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_hashalgorithmname' do
    expect{dsc_xadcscertificationauthority[:dsc_hashalgorithmname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_hashalgorithmname' do
    expect{dsc_xadcscertificationauthority[:dsc_hashalgorithmname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_hashalgorithmname' do
    expect{dsc_xadcscertificationauthority[:dsc_hashalgorithmname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_hashalgorithmname' do
    expect{dsc_xadcscertificationauthority[:dsc_hashalgorithmname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ignoreunicode' do
    expect{dsc_xadcscertificationauthority[:dsc_ignoreunicode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_ignoreunicode' do
    dsc_xadcscertificationauthority[:dsc_ignoreunicode] = true
    expect(dsc_xadcscertificationauthority[:dsc_ignoreunicode]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_ignoreunicode" do
    dsc_xadcscertificationauthority[:dsc_ignoreunicode] = 'true'
    expect(dsc_xadcscertificationauthority[:dsc_ignoreunicode]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_ignoreunicode" do
    dsc_xadcscertificationauthority[:dsc_ignoreunicode] = 'false'
    expect(dsc_xadcscertificationauthority[:dsc_ignoreunicode]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_ignoreunicode" do
    dsc_xadcscertificationauthority[:dsc_ignoreunicode] = 'True'
    expect(dsc_xadcscertificationauthority[:dsc_ignoreunicode]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_ignoreunicode" do
    dsc_xadcscertificationauthority[:dsc_ignoreunicode] = 'False'
    expect(dsc_xadcscertificationauthority[:dsc_ignoreunicode]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_ignoreunicode" do
    dsc_xadcscertificationauthority[:dsc_ignoreunicode] = :true
    expect(dsc_xadcscertificationauthority[:dsc_ignoreunicode]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_ignoreunicode" do
    dsc_xadcscertificationauthority[:dsc_ignoreunicode] = :false
    expect(dsc_xadcscertificationauthority[:dsc_ignoreunicode]).to eq(false)
  end

  it 'should not accept int for dsc_ignoreunicode' do
    expect{dsc_xadcscertificationauthority[:dsc_ignoreunicode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ignoreunicode' do
    expect{dsc_xadcscertificationauthority[:dsc_ignoreunicode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_keycontainername' do
    expect{dsc_xadcscertificationauthority[:dsc_keycontainername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_keycontainername' do
    expect{dsc_xadcscertificationauthority[:dsc_keycontainername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_keycontainername' do
    expect{dsc_xadcscertificationauthority[:dsc_keycontainername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_keycontainername' do
    expect{dsc_xadcscertificationauthority[:dsc_keycontainername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_keylength' do
    expect{dsc_xadcscertificationauthority[:dsc_keylength] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_keylength' do
    expect{dsc_xadcscertificationauthority[:dsc_keylength] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_keylength' do
    dsc_xadcscertificationauthority[:dsc_keylength] = 32
    expect(dsc_xadcscertificationauthority[:dsc_keylength]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_keylength' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xadcscertificationauthority[:dsc_keylength] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_keylength' do
    dsc_xadcscertificationauthority[:dsc_keylength] = '16'
    expect(dsc_xadcscertificationauthority[:dsc_keylength]).to eq(16)
  end

  it 'should accept string-like uint for dsc_keylength' do
    dsc_xadcscertificationauthority[:dsc_keylength] = '32'
    expect(dsc_xadcscertificationauthority[:dsc_keylength]).to eq(32)
  end

  it 'should accept string-like uint for dsc_keylength' do
    dsc_xadcscertificationauthority[:dsc_keylength] = '64'
    expect(dsc_xadcscertificationauthority[:dsc_keylength]).to eq(64)
  end

  it 'should not accept array for dsc_logdirectory' do
    expect{dsc_xadcscertificationauthority[:dsc_logdirectory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logdirectory' do
    expect{dsc_xadcscertificationauthority[:dsc_logdirectory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logdirectory' do
    expect{dsc_xadcscertificationauthority[:dsc_logdirectory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logdirectory' do
    expect{dsc_xadcscertificationauthority[:dsc_logdirectory] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_outputcertrequestfile' do
    expect{dsc_xadcscertificationauthority[:dsc_outputcertrequestfile] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_outputcertrequestfile' do
    expect{dsc_xadcscertificationauthority[:dsc_outputcertrequestfile] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_outputcertrequestfile' do
    expect{dsc_xadcscertificationauthority[:dsc_outputcertrequestfile] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_outputcertrequestfile' do
    expect{dsc_xadcscertificationauthority[:dsc_outputcertrequestfile] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_overwriteexistingcainds' do
    expect{dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_overwriteexistingcainds' do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds] = true
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_overwriteexistingcainds" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds] = 'true'
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_overwriteexistingcainds" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds] = 'false'
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_overwriteexistingcainds" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds] = 'True'
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_overwriteexistingcainds" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds] = 'False'
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_overwriteexistingcainds" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds] = :true
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_overwriteexistingcainds" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds] = :false
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds]).to eq(false)
  end

  it 'should not accept int for dsc_overwriteexistingcainds' do
    expect{dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_overwriteexistingcainds' do
    expect{dsc_xadcscertificationauthority[:dsc_overwriteexistingcainds] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_overwriteexistingdatabase' do
    expect{dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_overwriteexistingdatabase' do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase] = true
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_overwriteexistingdatabase" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase] = 'true'
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_overwriteexistingdatabase" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase] = 'false'
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_overwriteexistingdatabase" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase] = 'True'
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_overwriteexistingdatabase" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase] = 'False'
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_overwriteexistingdatabase" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase] = :true
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_overwriteexistingdatabase" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase] = :false
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase]).to eq(false)
  end

  it 'should not accept int for dsc_overwriteexistingdatabase' do
    expect{dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_overwriteexistingdatabase' do
    expect{dsc_xadcscertificationauthority[:dsc_overwriteexistingdatabase] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_overwriteexistingkey' do
    expect{dsc_xadcscertificationauthority[:dsc_overwriteexistingkey] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_overwriteexistingkey' do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingkey] = true
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingkey]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_overwriteexistingkey" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingkey] = 'true'
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingkey]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_overwriteexistingkey" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingkey] = 'false'
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingkey]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_overwriteexistingkey" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingkey] = 'True'
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingkey]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_overwriteexistingkey" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingkey] = 'False'
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingkey]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_overwriteexistingkey" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingkey] = :true
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingkey]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_overwriteexistingkey" do
    dsc_xadcscertificationauthority[:dsc_overwriteexistingkey] = :false
    expect(dsc_xadcscertificationauthority[:dsc_overwriteexistingkey]).to eq(false)
  end

  it 'should not accept int for dsc_overwriteexistingkey' do
    expect{dsc_xadcscertificationauthority[:dsc_overwriteexistingkey] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_overwriteexistingkey' do
    expect{dsc_xadcscertificationauthority[:dsc_overwriteexistingkey] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_parentca' do
    expect{dsc_xadcscertificationauthority[:dsc_parentca] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_parentca' do
    expect{dsc_xadcscertificationauthority[:dsc_parentca] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_parentca' do
    expect{dsc_xadcscertificationauthority[:dsc_parentca] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_parentca' do
    expect{dsc_xadcscertificationauthority[:dsc_parentca] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_validityperiod predefined value Hours' do
    dsc_xadcscertificationauthority[:dsc_validityperiod] = 'Hours'
    expect(dsc_xadcscertificationauthority[:dsc_validityperiod]).to eq('Hours')
  end

  it 'should accept dsc_validityperiod predefined value hours' do
    dsc_xadcscertificationauthority[:dsc_validityperiod] = 'hours'
    expect(dsc_xadcscertificationauthority[:dsc_validityperiod]).to eq('hours')
  end

  it 'should accept dsc_validityperiod predefined value Days' do
    dsc_xadcscertificationauthority[:dsc_validityperiod] = 'Days'
    expect(dsc_xadcscertificationauthority[:dsc_validityperiod]).to eq('Days')
  end

  it 'should accept dsc_validityperiod predefined value days' do
    dsc_xadcscertificationauthority[:dsc_validityperiod] = 'days'
    expect(dsc_xadcscertificationauthority[:dsc_validityperiod]).to eq('days')
  end

  it 'should accept dsc_validityperiod predefined value Months' do
    dsc_xadcscertificationauthority[:dsc_validityperiod] = 'Months'
    expect(dsc_xadcscertificationauthority[:dsc_validityperiod]).to eq('Months')
  end

  it 'should accept dsc_validityperiod predefined value months' do
    dsc_xadcscertificationauthority[:dsc_validityperiod] = 'months'
    expect(dsc_xadcscertificationauthority[:dsc_validityperiod]).to eq('months')
  end

  it 'should accept dsc_validityperiod predefined value Years' do
    dsc_xadcscertificationauthority[:dsc_validityperiod] = 'Years'
    expect(dsc_xadcscertificationauthority[:dsc_validityperiod]).to eq('Years')
  end

  it 'should accept dsc_validityperiod predefined value years' do
    dsc_xadcscertificationauthority[:dsc_validityperiod] = 'years'
    expect(dsc_xadcscertificationauthority[:dsc_validityperiod]).to eq('years')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xadcscertificationauthority[:dsc_validityperiod] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_validityperiod' do
    expect{dsc_xadcscertificationauthority[:dsc_validityperiod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_validityperiod' do
    expect{dsc_xadcscertificationauthority[:dsc_validityperiod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_validityperiod' do
    expect{dsc_xadcscertificationauthority[:dsc_validityperiod] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_validityperiod' do
    expect{dsc_xadcscertificationauthority[:dsc_validityperiod] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_validityperiodunits' do
    expect{dsc_xadcscertificationauthority[:dsc_validityperiodunits] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_validityperiodunits' do
    expect{dsc_xadcscertificationauthority[:dsc_validityperiodunits] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_validityperiodunits' do
    dsc_xadcscertificationauthority[:dsc_validityperiodunits] = 32
    expect(dsc_xadcscertificationauthority[:dsc_validityperiodunits]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_validityperiodunits' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xadcscertificationauthority[:dsc_validityperiodunits] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_validityperiodunits' do
    dsc_xadcscertificationauthority[:dsc_validityperiodunits] = '16'
    expect(dsc_xadcscertificationauthority[:dsc_validityperiodunits]).to eq(16)
  end

  it 'should accept string-like uint for dsc_validityperiodunits' do
    dsc_xadcscertificationauthority[:dsc_validityperiodunits] = '32'
    expect(dsc_xadcscertificationauthority[:dsc_validityperiodunits]).to eq(32)
  end

  it 'should accept string-like uint for dsc_validityperiodunits' do
    dsc_xadcscertificationauthority[:dsc_validityperiodunits] = '64'
    expect(dsc_xadcscertificationauthority[:dsc_validityperiodunits]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xadcscertificationauthority)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xadcscertificationauthority)
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
        dsc_xadcscertificationauthority.original_parameters[:dsc_ensure] = 'present'
        dsc_xadcscertificationauthority[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xadcscertificationauthority)
      end

      it "should update :ensure to :present" do
        expect(dsc_xadcscertificationauthority[:ensure]).to eq(:present)
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
        dsc_xadcscertificationauthority.original_parameters[:dsc_ensure] = 'absent'
        dsc_xadcscertificationauthority[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xadcscertificationauthority)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xadcscertificationauthority[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
