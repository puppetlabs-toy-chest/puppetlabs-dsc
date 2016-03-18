#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspuserprofileproperty) do

  let :dsc_xspuserprofileproperty do
    Puppet::Type.type(:dsc_xspuserprofileproperty).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xspuserprofileproperty).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_ensure => 'Present',
      :dsc_userprofileservice => 'foo',
      :dsc_displayname => 'foo',
      :dsc_type => 'BigInteger',
      :dsc_description => 'foo',
      :dsc_policysetting => 'Mandatory',
      :dsc_privacysetting => 'Public',
      :dsc_mappingconnectionname => 'foo',
      :dsc_mappingpropertyname => 'foo',
      :dsc_mappingdirection => 'foo',
      :dsc_length => 32,
      :dsc_displayorder => 32,
      :dsc_iseventlog => true,
      :dsc_isvisibleoneditor => true,
      :dsc_isvisibleonviewer => true,
      :dsc_isusereditable => true,
      :dsc_isalias => true,
      :dsc_issearchable => true,
      :dsc_useroverrideprivacy => true,
      :dsc_termstore => 'foo',
      :dsc_termgroup => 'foo',
      :dsc_termset => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xspuserprofileproperty.to_s).to eq("Dsc_xspuserprofileproperty[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xspuserprofileproperty[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspuserprofileproperty[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspuserprofileproperty).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspuserprofileproperty[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspuserprofileproperty[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspuserprofileproperty[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspuserprofileproperty[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xspuserprofileproperty[:dsc_ensure] = 'Present'
    expect(dsc_xspuserprofileproperty[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xspuserprofileproperty[:dsc_ensure] = 'present'
    expect(dsc_xspuserprofileproperty[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xspuserprofileproperty[:dsc_ensure] = 'present'
    expect(dsc_xspuserprofileproperty[:ensure]).to eq(dsc_xspuserprofileproperty[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xspuserprofileproperty[:dsc_ensure] = 'Absent'
    expect(dsc_xspuserprofileproperty[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xspuserprofileproperty[:dsc_ensure] = 'absent'
    expect(dsc_xspuserprofileproperty[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xspuserprofileproperty[:dsc_ensure] = 'absent'
    expect(dsc_xspuserprofileproperty[:ensure]).to eq(dsc_xspuserprofileproperty[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspuserprofileproperty[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xspuserprofileproperty[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xspuserprofileproperty[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xspuserprofileproperty[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xspuserprofileproperty[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_userprofileservice' do
    expect{dsc_xspuserprofileproperty[:dsc_userprofileservice] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_userprofileservice' do
    expect{dsc_xspuserprofileproperty[:dsc_userprofileservice] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_userprofileservice' do
    expect{dsc_xspuserprofileproperty[:dsc_userprofileservice] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_userprofileservice' do
    expect{dsc_xspuserprofileproperty[:dsc_userprofileservice] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displayname' do
    expect{dsc_xspuserprofileproperty[:dsc_displayname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayname' do
    expect{dsc_xspuserprofileproperty[:dsc_displayname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displayname' do
    expect{dsc_xspuserprofileproperty[:dsc_displayname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displayname' do
    expect{dsc_xspuserprofileproperty[:dsc_displayname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_type predefined value BigInteger' do
    dsc_xspuserprofileproperty[:dsc_type] = 'BigInteger'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('BigInteger')
  end

  it 'should accept dsc_type predefined value biginteger' do
    dsc_xspuserprofileproperty[:dsc_type] = 'biginteger'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('biginteger')
  end

  it 'should accept dsc_type predefined value Binary' do
    dsc_xspuserprofileproperty[:dsc_type] = 'Binary'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('Binary')
  end

  it 'should accept dsc_type predefined value binary' do
    dsc_xspuserprofileproperty[:dsc_type] = 'binary'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('binary')
  end

  it 'should accept dsc_type predefined value Boolean' do
    dsc_xspuserprofileproperty[:dsc_type] = 'Boolean'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('Boolean')
  end

  it 'should accept dsc_type predefined value boolean' do
    dsc_xspuserprofileproperty[:dsc_type] = 'boolean'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('boolean')
  end

  it 'should accept dsc_type predefined value Date' do
    dsc_xspuserprofileproperty[:dsc_type] = 'Date'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('Date')
  end

  it 'should accept dsc_type predefined value date' do
    dsc_xspuserprofileproperty[:dsc_type] = 'date'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('date')
  end

  it 'should accept dsc_type predefined value DateNoYear' do
    dsc_xspuserprofileproperty[:dsc_type] = 'DateNoYear'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('DateNoYear')
  end

  it 'should accept dsc_type predefined value datenoyear' do
    dsc_xspuserprofileproperty[:dsc_type] = 'datenoyear'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('datenoyear')
  end

  it 'should accept dsc_type predefined value DateTime' do
    dsc_xspuserprofileproperty[:dsc_type] = 'DateTime'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('DateTime')
  end

  it 'should accept dsc_type predefined value datetime' do
    dsc_xspuserprofileproperty[:dsc_type] = 'datetime'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('datetime')
  end

  it 'should accept dsc_type predefined value Email' do
    dsc_xspuserprofileproperty[:dsc_type] = 'Email'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('Email')
  end

  it 'should accept dsc_type predefined value email' do
    dsc_xspuserprofileproperty[:dsc_type] = 'email'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('email')
  end

  it 'should accept dsc_type predefined value Float' do
    dsc_xspuserprofileproperty[:dsc_type] = 'Float'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('Float')
  end

  it 'should accept dsc_type predefined value float' do
    dsc_xspuserprofileproperty[:dsc_type] = 'float'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('float')
  end

  it 'should accept dsc_type predefined value Guid' do
    dsc_xspuserprofileproperty[:dsc_type] = 'Guid'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('Guid')
  end

  it 'should accept dsc_type predefined value guid' do
    dsc_xspuserprofileproperty[:dsc_type] = 'guid'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('guid')
  end

  it 'should accept dsc_type predefined value HTML' do
    dsc_xspuserprofileproperty[:dsc_type] = 'HTML'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('HTML')
  end

  it 'should accept dsc_type predefined value html' do
    dsc_xspuserprofileproperty[:dsc_type] = 'html'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('html')
  end

  it 'should accept dsc_type predefined value Integer' do
    dsc_xspuserprofileproperty[:dsc_type] = 'Integer'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('Integer')
  end

  it 'should accept dsc_type predefined value integer' do
    dsc_xspuserprofileproperty[:dsc_type] = 'integer'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('integer')
  end

  it 'should accept dsc_type predefined value Person' do
    dsc_xspuserprofileproperty[:dsc_type] = 'Person'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('Person')
  end

  it 'should accept dsc_type predefined value person' do
    dsc_xspuserprofileproperty[:dsc_type] = 'person'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('person')
  end

  it 'should accept dsc_type predefined value String' do
    dsc_xspuserprofileproperty[:dsc_type] = 'String'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('String')
  end

  it 'should accept dsc_type predefined value string' do
    dsc_xspuserprofileproperty[:dsc_type] = 'string'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('string')
  end

  it 'should accept dsc_type predefined value StringMultiValue' do
    dsc_xspuserprofileproperty[:dsc_type] = 'StringMultiValue'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('StringMultiValue')
  end

  it 'should accept dsc_type predefined value stringmultivalue' do
    dsc_xspuserprofileproperty[:dsc_type] = 'stringmultivalue'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('stringmultivalue')
  end

  it 'should accept dsc_type predefined value TimeZone' do
    dsc_xspuserprofileproperty[:dsc_type] = 'TimeZone'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('TimeZone')
  end

  it 'should accept dsc_type predefined value timezone' do
    dsc_xspuserprofileproperty[:dsc_type] = 'timezone'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('timezone')
  end

  it 'should accept dsc_type predefined value URL' do
    dsc_xspuserprofileproperty[:dsc_type] = 'URL'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('URL')
  end

  it 'should accept dsc_type predefined value url' do
    dsc_xspuserprofileproperty[:dsc_type] = 'url'
    expect(dsc_xspuserprofileproperty[:dsc_type]).to eq('url')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspuserprofileproperty[:dsc_type] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_type' do
    expect{dsc_xspuserprofileproperty[:dsc_type] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_type' do
    expect{dsc_xspuserprofileproperty[:dsc_type] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_type' do
    expect{dsc_xspuserprofileproperty[:dsc_type] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_type' do
    expect{dsc_xspuserprofileproperty[:dsc_type] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xspuserprofileproperty[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xspuserprofileproperty[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xspuserprofileproperty[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xspuserprofileproperty[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_policysetting predefined value Mandatory' do
    dsc_xspuserprofileproperty[:dsc_policysetting] = 'Mandatory'
    expect(dsc_xspuserprofileproperty[:dsc_policysetting]).to eq('Mandatory')
  end

  it 'should accept dsc_policysetting predefined value mandatory' do
    dsc_xspuserprofileproperty[:dsc_policysetting] = 'mandatory'
    expect(dsc_xspuserprofileproperty[:dsc_policysetting]).to eq('mandatory')
  end

  it 'should accept dsc_policysetting predefined value Optin' do
    dsc_xspuserprofileproperty[:dsc_policysetting] = 'Optin'
    expect(dsc_xspuserprofileproperty[:dsc_policysetting]).to eq('Optin')
  end

  it 'should accept dsc_policysetting predefined value optin' do
    dsc_xspuserprofileproperty[:dsc_policysetting] = 'optin'
    expect(dsc_xspuserprofileproperty[:dsc_policysetting]).to eq('optin')
  end

  it 'should accept dsc_policysetting predefined value Optout' do
    dsc_xspuserprofileproperty[:dsc_policysetting] = 'Optout'
    expect(dsc_xspuserprofileproperty[:dsc_policysetting]).to eq('Optout')
  end

  it 'should accept dsc_policysetting predefined value optout' do
    dsc_xspuserprofileproperty[:dsc_policysetting] = 'optout'
    expect(dsc_xspuserprofileproperty[:dsc_policysetting]).to eq('optout')
  end

  it 'should accept dsc_policysetting predefined value Disabled' do
    dsc_xspuserprofileproperty[:dsc_policysetting] = 'Disabled'
    expect(dsc_xspuserprofileproperty[:dsc_policysetting]).to eq('Disabled')
  end

  it 'should accept dsc_policysetting predefined value disabled' do
    dsc_xspuserprofileproperty[:dsc_policysetting] = 'disabled'
    expect(dsc_xspuserprofileproperty[:dsc_policysetting]).to eq('disabled')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspuserprofileproperty[:dsc_policysetting] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_policysetting' do
    expect{dsc_xspuserprofileproperty[:dsc_policysetting] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_policysetting' do
    expect{dsc_xspuserprofileproperty[:dsc_policysetting] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_policysetting' do
    expect{dsc_xspuserprofileproperty[:dsc_policysetting] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_policysetting' do
    expect{dsc_xspuserprofileproperty[:dsc_policysetting] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_privacysetting predefined value Public' do
    dsc_xspuserprofileproperty[:dsc_privacysetting] = 'Public'
    expect(dsc_xspuserprofileproperty[:dsc_privacysetting]).to eq('Public')
  end

  it 'should accept dsc_privacysetting predefined value public' do
    dsc_xspuserprofileproperty[:dsc_privacysetting] = 'public'
    expect(dsc_xspuserprofileproperty[:dsc_privacysetting]).to eq('public')
  end

  it 'should accept dsc_privacysetting predefined value Contacts' do
    dsc_xspuserprofileproperty[:dsc_privacysetting] = 'Contacts'
    expect(dsc_xspuserprofileproperty[:dsc_privacysetting]).to eq('Contacts')
  end

  it 'should accept dsc_privacysetting predefined value contacts' do
    dsc_xspuserprofileproperty[:dsc_privacysetting] = 'contacts'
    expect(dsc_xspuserprofileproperty[:dsc_privacysetting]).to eq('contacts')
  end

  it 'should accept dsc_privacysetting predefined value Organization' do
    dsc_xspuserprofileproperty[:dsc_privacysetting] = 'Organization'
    expect(dsc_xspuserprofileproperty[:dsc_privacysetting]).to eq('Organization')
  end

  it 'should accept dsc_privacysetting predefined value organization' do
    dsc_xspuserprofileproperty[:dsc_privacysetting] = 'organization'
    expect(dsc_xspuserprofileproperty[:dsc_privacysetting]).to eq('organization')
  end

  it 'should accept dsc_privacysetting predefined value Manager' do
    dsc_xspuserprofileproperty[:dsc_privacysetting] = 'Manager'
    expect(dsc_xspuserprofileproperty[:dsc_privacysetting]).to eq('Manager')
  end

  it 'should accept dsc_privacysetting predefined value manager' do
    dsc_xspuserprofileproperty[:dsc_privacysetting] = 'manager'
    expect(dsc_xspuserprofileproperty[:dsc_privacysetting]).to eq('manager')
  end

  it 'should accept dsc_privacysetting predefined value Private' do
    dsc_xspuserprofileproperty[:dsc_privacysetting] = 'Private'
    expect(dsc_xspuserprofileproperty[:dsc_privacysetting]).to eq('Private')
  end

  it 'should accept dsc_privacysetting predefined value private' do
    dsc_xspuserprofileproperty[:dsc_privacysetting] = 'private'
    expect(dsc_xspuserprofileproperty[:dsc_privacysetting]).to eq('private')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspuserprofileproperty[:dsc_privacysetting] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_privacysetting' do
    expect{dsc_xspuserprofileproperty[:dsc_privacysetting] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_privacysetting' do
    expect{dsc_xspuserprofileproperty[:dsc_privacysetting] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_privacysetting' do
    expect{dsc_xspuserprofileproperty[:dsc_privacysetting] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_privacysetting' do
    expect{dsc_xspuserprofileproperty[:dsc_privacysetting] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_mappingconnectionname' do
    expect{dsc_xspuserprofileproperty[:dsc_mappingconnectionname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mappingconnectionname' do
    expect{dsc_xspuserprofileproperty[:dsc_mappingconnectionname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mappingconnectionname' do
    expect{dsc_xspuserprofileproperty[:dsc_mappingconnectionname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mappingconnectionname' do
    expect{dsc_xspuserprofileproperty[:dsc_mappingconnectionname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_mappingpropertyname' do
    expect{dsc_xspuserprofileproperty[:dsc_mappingpropertyname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mappingpropertyname' do
    expect{dsc_xspuserprofileproperty[:dsc_mappingpropertyname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mappingpropertyname' do
    expect{dsc_xspuserprofileproperty[:dsc_mappingpropertyname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mappingpropertyname' do
    expect{dsc_xspuserprofileproperty[:dsc_mappingpropertyname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_mappingdirection' do
    expect{dsc_xspuserprofileproperty[:dsc_mappingdirection] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mappingdirection' do
    expect{dsc_xspuserprofileproperty[:dsc_mappingdirection] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mappingdirection' do
    expect{dsc_xspuserprofileproperty[:dsc_mappingdirection] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mappingdirection' do
    expect{dsc_xspuserprofileproperty[:dsc_mappingdirection] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_length' do
    expect{dsc_xspuserprofileproperty[:dsc_length] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_length' do
    expect{dsc_xspuserprofileproperty[:dsc_length] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_length' do
    dsc_xspuserprofileproperty[:dsc_length] = 32
    expect(dsc_xspuserprofileproperty[:dsc_length]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_length' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspuserprofileproperty[:dsc_length] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_length' do
    dsc_xspuserprofileproperty[:dsc_length] = '16'
    expect(dsc_xspuserprofileproperty[:dsc_length]).to eq(16)
  end

  it 'should accept string-like uint for dsc_length' do
    dsc_xspuserprofileproperty[:dsc_length] = '32'
    expect(dsc_xspuserprofileproperty[:dsc_length]).to eq(32)
  end

  it 'should accept string-like uint for dsc_length' do
    dsc_xspuserprofileproperty[:dsc_length] = '64'
    expect(dsc_xspuserprofileproperty[:dsc_length]).to eq(64)
  end

  it 'should not accept array for dsc_displayorder' do
    expect{dsc_xspuserprofileproperty[:dsc_displayorder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayorder' do
    expect{dsc_xspuserprofileproperty[:dsc_displayorder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_displayorder' do
    dsc_xspuserprofileproperty[:dsc_displayorder] = 32
    expect(dsc_xspuserprofileproperty[:dsc_displayorder]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_displayorder' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspuserprofileproperty[:dsc_displayorder] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_displayorder' do
    dsc_xspuserprofileproperty[:dsc_displayorder] = '16'
    expect(dsc_xspuserprofileproperty[:dsc_displayorder]).to eq(16)
  end

  it 'should accept string-like uint for dsc_displayorder' do
    dsc_xspuserprofileproperty[:dsc_displayorder] = '32'
    expect(dsc_xspuserprofileproperty[:dsc_displayorder]).to eq(32)
  end

  it 'should accept string-like uint for dsc_displayorder' do
    dsc_xspuserprofileproperty[:dsc_displayorder] = '64'
    expect(dsc_xspuserprofileproperty[:dsc_displayorder]).to eq(64)
  end

  it 'should not accept array for dsc_iseventlog' do
    expect{dsc_xspuserprofileproperty[:dsc_iseventlog] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_iseventlog' do
    dsc_xspuserprofileproperty[:dsc_iseventlog] = true
    expect(dsc_xspuserprofileproperty[:dsc_iseventlog]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_iseventlog" do
    dsc_xspuserprofileproperty[:dsc_iseventlog] = 'true'
    expect(dsc_xspuserprofileproperty[:dsc_iseventlog]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_iseventlog" do
    dsc_xspuserprofileproperty[:dsc_iseventlog] = 'false'
    expect(dsc_xspuserprofileproperty[:dsc_iseventlog]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_iseventlog" do
    dsc_xspuserprofileproperty[:dsc_iseventlog] = 'True'
    expect(dsc_xspuserprofileproperty[:dsc_iseventlog]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_iseventlog" do
    dsc_xspuserprofileproperty[:dsc_iseventlog] = 'False'
    expect(dsc_xspuserprofileproperty[:dsc_iseventlog]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_iseventlog" do
    dsc_xspuserprofileproperty[:dsc_iseventlog] = :true
    expect(dsc_xspuserprofileproperty[:dsc_iseventlog]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_iseventlog" do
    dsc_xspuserprofileproperty[:dsc_iseventlog] = :false
    expect(dsc_xspuserprofileproperty[:dsc_iseventlog]).to eq(false)
  end

  it 'should not accept int for dsc_iseventlog' do
    expect{dsc_xspuserprofileproperty[:dsc_iseventlog] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_iseventlog' do
    expect{dsc_xspuserprofileproperty[:dsc_iseventlog] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_isvisibleoneditor' do
    expect{dsc_xspuserprofileproperty[:dsc_isvisibleoneditor] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_isvisibleoneditor' do
    dsc_xspuserprofileproperty[:dsc_isvisibleoneditor] = true
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleoneditor]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_isvisibleoneditor" do
    dsc_xspuserprofileproperty[:dsc_isvisibleoneditor] = 'true'
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleoneditor]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_isvisibleoneditor" do
    dsc_xspuserprofileproperty[:dsc_isvisibleoneditor] = 'false'
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleoneditor]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_isvisibleoneditor" do
    dsc_xspuserprofileproperty[:dsc_isvisibleoneditor] = 'True'
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleoneditor]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_isvisibleoneditor" do
    dsc_xspuserprofileproperty[:dsc_isvisibleoneditor] = 'False'
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleoneditor]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_isvisibleoneditor" do
    dsc_xspuserprofileproperty[:dsc_isvisibleoneditor] = :true
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleoneditor]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_isvisibleoneditor" do
    dsc_xspuserprofileproperty[:dsc_isvisibleoneditor] = :false
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleoneditor]).to eq(false)
  end

  it 'should not accept int for dsc_isvisibleoneditor' do
    expect{dsc_xspuserprofileproperty[:dsc_isvisibleoneditor] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_isvisibleoneditor' do
    expect{dsc_xspuserprofileproperty[:dsc_isvisibleoneditor] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_isvisibleonviewer' do
    expect{dsc_xspuserprofileproperty[:dsc_isvisibleonviewer] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_isvisibleonviewer' do
    dsc_xspuserprofileproperty[:dsc_isvisibleonviewer] = true
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleonviewer]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_isvisibleonviewer" do
    dsc_xspuserprofileproperty[:dsc_isvisibleonviewer] = 'true'
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleonviewer]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_isvisibleonviewer" do
    dsc_xspuserprofileproperty[:dsc_isvisibleonviewer] = 'false'
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleonviewer]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_isvisibleonviewer" do
    dsc_xspuserprofileproperty[:dsc_isvisibleonviewer] = 'True'
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleonviewer]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_isvisibleonviewer" do
    dsc_xspuserprofileproperty[:dsc_isvisibleonviewer] = 'False'
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleonviewer]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_isvisibleonviewer" do
    dsc_xspuserprofileproperty[:dsc_isvisibleonviewer] = :true
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleonviewer]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_isvisibleonviewer" do
    dsc_xspuserprofileproperty[:dsc_isvisibleonviewer] = :false
    expect(dsc_xspuserprofileproperty[:dsc_isvisibleonviewer]).to eq(false)
  end

  it 'should not accept int for dsc_isvisibleonviewer' do
    expect{dsc_xspuserprofileproperty[:dsc_isvisibleonviewer] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_isvisibleonviewer' do
    expect{dsc_xspuserprofileproperty[:dsc_isvisibleonviewer] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_isusereditable' do
    expect{dsc_xspuserprofileproperty[:dsc_isusereditable] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_isusereditable' do
    dsc_xspuserprofileproperty[:dsc_isusereditable] = true
    expect(dsc_xspuserprofileproperty[:dsc_isusereditable]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_isusereditable" do
    dsc_xspuserprofileproperty[:dsc_isusereditable] = 'true'
    expect(dsc_xspuserprofileproperty[:dsc_isusereditable]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_isusereditable" do
    dsc_xspuserprofileproperty[:dsc_isusereditable] = 'false'
    expect(dsc_xspuserprofileproperty[:dsc_isusereditable]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_isusereditable" do
    dsc_xspuserprofileproperty[:dsc_isusereditable] = 'True'
    expect(dsc_xspuserprofileproperty[:dsc_isusereditable]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_isusereditable" do
    dsc_xspuserprofileproperty[:dsc_isusereditable] = 'False'
    expect(dsc_xspuserprofileproperty[:dsc_isusereditable]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_isusereditable" do
    dsc_xspuserprofileproperty[:dsc_isusereditable] = :true
    expect(dsc_xspuserprofileproperty[:dsc_isusereditable]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_isusereditable" do
    dsc_xspuserprofileproperty[:dsc_isusereditable] = :false
    expect(dsc_xspuserprofileproperty[:dsc_isusereditable]).to eq(false)
  end

  it 'should not accept int for dsc_isusereditable' do
    expect{dsc_xspuserprofileproperty[:dsc_isusereditable] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_isusereditable' do
    expect{dsc_xspuserprofileproperty[:dsc_isusereditable] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_isalias' do
    expect{dsc_xspuserprofileproperty[:dsc_isalias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_isalias' do
    dsc_xspuserprofileproperty[:dsc_isalias] = true
    expect(dsc_xspuserprofileproperty[:dsc_isalias]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_isalias" do
    dsc_xspuserprofileproperty[:dsc_isalias] = 'true'
    expect(dsc_xspuserprofileproperty[:dsc_isalias]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_isalias" do
    dsc_xspuserprofileproperty[:dsc_isalias] = 'false'
    expect(dsc_xspuserprofileproperty[:dsc_isalias]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_isalias" do
    dsc_xspuserprofileproperty[:dsc_isalias] = 'True'
    expect(dsc_xspuserprofileproperty[:dsc_isalias]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_isalias" do
    dsc_xspuserprofileproperty[:dsc_isalias] = 'False'
    expect(dsc_xspuserprofileproperty[:dsc_isalias]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_isalias" do
    dsc_xspuserprofileproperty[:dsc_isalias] = :true
    expect(dsc_xspuserprofileproperty[:dsc_isalias]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_isalias" do
    dsc_xspuserprofileproperty[:dsc_isalias] = :false
    expect(dsc_xspuserprofileproperty[:dsc_isalias]).to eq(false)
  end

  it 'should not accept int for dsc_isalias' do
    expect{dsc_xspuserprofileproperty[:dsc_isalias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_isalias' do
    expect{dsc_xspuserprofileproperty[:dsc_isalias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_issearchable' do
    expect{dsc_xspuserprofileproperty[:dsc_issearchable] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_issearchable' do
    dsc_xspuserprofileproperty[:dsc_issearchable] = true
    expect(dsc_xspuserprofileproperty[:dsc_issearchable]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_issearchable" do
    dsc_xspuserprofileproperty[:dsc_issearchable] = 'true'
    expect(dsc_xspuserprofileproperty[:dsc_issearchable]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_issearchable" do
    dsc_xspuserprofileproperty[:dsc_issearchable] = 'false'
    expect(dsc_xspuserprofileproperty[:dsc_issearchable]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_issearchable" do
    dsc_xspuserprofileproperty[:dsc_issearchable] = 'True'
    expect(dsc_xspuserprofileproperty[:dsc_issearchable]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_issearchable" do
    dsc_xspuserprofileproperty[:dsc_issearchable] = 'False'
    expect(dsc_xspuserprofileproperty[:dsc_issearchable]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_issearchable" do
    dsc_xspuserprofileproperty[:dsc_issearchable] = :true
    expect(dsc_xspuserprofileproperty[:dsc_issearchable]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_issearchable" do
    dsc_xspuserprofileproperty[:dsc_issearchable] = :false
    expect(dsc_xspuserprofileproperty[:dsc_issearchable]).to eq(false)
  end

  it 'should not accept int for dsc_issearchable' do
    expect{dsc_xspuserprofileproperty[:dsc_issearchable] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_issearchable' do
    expect{dsc_xspuserprofileproperty[:dsc_issearchable] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_useroverrideprivacy' do
    expect{dsc_xspuserprofileproperty[:dsc_useroverrideprivacy] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_useroverrideprivacy' do
    dsc_xspuserprofileproperty[:dsc_useroverrideprivacy] = true
    expect(dsc_xspuserprofileproperty[:dsc_useroverrideprivacy]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_useroverrideprivacy" do
    dsc_xspuserprofileproperty[:dsc_useroverrideprivacy] = 'true'
    expect(dsc_xspuserprofileproperty[:dsc_useroverrideprivacy]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_useroverrideprivacy" do
    dsc_xspuserprofileproperty[:dsc_useroverrideprivacy] = 'false'
    expect(dsc_xspuserprofileproperty[:dsc_useroverrideprivacy]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_useroverrideprivacy" do
    dsc_xspuserprofileproperty[:dsc_useroverrideprivacy] = 'True'
    expect(dsc_xspuserprofileproperty[:dsc_useroverrideprivacy]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_useroverrideprivacy" do
    dsc_xspuserprofileproperty[:dsc_useroverrideprivacy] = 'False'
    expect(dsc_xspuserprofileproperty[:dsc_useroverrideprivacy]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_useroverrideprivacy" do
    dsc_xspuserprofileproperty[:dsc_useroverrideprivacy] = :true
    expect(dsc_xspuserprofileproperty[:dsc_useroverrideprivacy]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_useroverrideprivacy" do
    dsc_xspuserprofileproperty[:dsc_useroverrideprivacy] = :false
    expect(dsc_xspuserprofileproperty[:dsc_useroverrideprivacy]).to eq(false)
  end

  it 'should not accept int for dsc_useroverrideprivacy' do
    expect{dsc_xspuserprofileproperty[:dsc_useroverrideprivacy] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_useroverrideprivacy' do
    expect{dsc_xspuserprofileproperty[:dsc_useroverrideprivacy] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_termstore' do
    expect{dsc_xspuserprofileproperty[:dsc_termstore] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_termstore' do
    expect{dsc_xspuserprofileproperty[:dsc_termstore] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_termstore' do
    expect{dsc_xspuserprofileproperty[:dsc_termstore] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_termstore' do
    expect{dsc_xspuserprofileproperty[:dsc_termstore] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_termgroup' do
    expect{dsc_xspuserprofileproperty[:dsc_termgroup] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_termgroup' do
    expect{dsc_xspuserprofileproperty[:dsc_termgroup] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_termgroup' do
    expect{dsc_xspuserprofileproperty[:dsc_termgroup] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_termgroup' do
    expect{dsc_xspuserprofileproperty[:dsc_termgroup] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_termset' do
    expect{dsc_xspuserprofileproperty[:dsc_termset] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_termset' do
    expect{dsc_xspuserprofileproperty[:dsc_termset] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_termset' do
    expect{dsc_xspuserprofileproperty[:dsc_termset] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_termset' do
    expect{dsc_xspuserprofileproperty[:dsc_termset] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspuserprofileproperty[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspuserprofileproperty[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspuserprofileproperty[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspuserprofileproperty[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspuserprofileproperty[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspuserprofileproperty)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspuserprofileproperty)
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
        dsc_xspuserprofileproperty.original_parameters[:dsc_ensure] = 'present'
        dsc_xspuserprofileproperty[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xspuserprofileproperty)
      end

      it "should update :ensure to :present" do
        expect(dsc_xspuserprofileproperty[:ensure]).to eq(:present)
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
        dsc_xspuserprofileproperty.original_parameters[:dsc_ensure] = 'absent'
        dsc_xspuserprofileproperty[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xspuserprofileproperty)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xspuserprofileproperty[:ensure]).to eq(:absent)
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
