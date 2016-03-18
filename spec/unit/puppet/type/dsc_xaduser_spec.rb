#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xaduser) do

  let :dsc_xaduser do
    Puppet::Type.type(:dsc_xaduser).new(
      :name     => 'foo',
      :dsc_domainname => 'foo',
      :dsc_username => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xaduser).new(
      :name     => 'foo',
      :dsc_domainname => 'foo',
      :dsc_username => 'foo',
      :dsc_password => {"user"=>"user", "password"=>"password"},
      :dsc_ensure => 'Present',
      :dsc_commonname => 'foo',
      :dsc_userprincipalname => 'foo',
      :dsc_displayname => 'foo',
      :dsc_path => 'foo',
      :dsc_givenname => 'foo',
      :dsc_initials => 'foo',
      :dsc_surname => 'foo',
      :dsc_description => 'foo',
      :dsc_streetaddress => 'foo',
      :dsc_pobox => 'foo',
      :dsc_city => 'foo',
      :dsc_state => 'foo',
      :dsc_postalcode => 'foo',
      :dsc_country => 'foo',
      :dsc_department => 'foo',
      :dsc_division => 'foo',
      :dsc_company => 'foo',
      :dsc_office => 'foo',
      :dsc_jobtitle => 'foo',
      :dsc_emailaddress => 'foo',
      :dsc_employeeid => 'foo',
      :dsc_employeenumber => 'foo',
      :dsc_homedirectory => 'foo',
      :dsc_homedrive => 'foo',
      :dsc_homepage => 'foo',
      :dsc_profilepath => 'foo',
      :dsc_logonscript => 'foo',
      :dsc_notes => 'foo',
      :dsc_officephone => 'foo',
      :dsc_mobilephone => 'foo',
      :dsc_fax => 'foo',
      :dsc_homephone => 'foo',
      :dsc_pager => 'foo',
      :dsc_ipphone => 'foo',
      :dsc_manager => 'foo',
      :dsc_enabled => true,
      :dsc_cannotchangepassword => true,
      :dsc_passwordneverexpires => true,
      :dsc_domaincontroller => 'foo',
      :dsc_domainadministratorcredential => {"user"=>"user", "password"=>"password"},
      :dsc_distinguishedname => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xaduser.to_s).to eq("Dsc_xaduser[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xaduser[:ensure]).to eq :present
  end

  it 'should require that dsc_domainname is specified' do
    #dsc_xaduser[:dsc_domainname]
    expect { Puppet::Type.type(:dsc_xaduser).new(
      :name     => 'foo',
      :dsc_username => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_domainname is a required attribute/)
  end

  it 'should not accept array for dsc_domainname' do
    expect{dsc_xaduser[:dsc_domainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainname' do
    expect{dsc_xaduser[:dsc_domainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainname' do
    expect{dsc_xaduser[:dsc_domainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainname' do
    expect{dsc_xaduser[:dsc_domainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_username is specified' do
    #dsc_xaduser[:dsc_username]
    expect { Puppet::Type.type(:dsc_xaduser).new(
      :name     => 'foo',
      :dsc_domainname => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_username is a required attribute/)
  end

  it 'should not accept array for dsc_username' do
    expect{dsc_xaduser[:dsc_username] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_username' do
    expect{dsc_xaduser[:dsc_username] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_username' do
    expect{dsc_xaduser[:dsc_username] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_username' do
    expect{dsc_xaduser[:dsc_username] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_password" do
    expect{dsc_xaduser[:dsc_password] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_password' do
    expect{dsc_xaduser[:dsc_password] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_password' do
    expect{dsc_xaduser[:dsc_password] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_password' do
    expect{dsc_xaduser[:dsc_password] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_password' do
    expect{dsc_xaduser[:dsc_password] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xaduser[:dsc_ensure] = 'Present'
    expect(dsc_xaduser[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xaduser[:dsc_ensure] = 'present'
    expect(dsc_xaduser[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xaduser[:dsc_ensure] = 'present'
    expect(dsc_xaduser[:ensure]).to eq(dsc_xaduser[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xaduser[:dsc_ensure] = 'Absent'
    expect(dsc_xaduser[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xaduser[:dsc_ensure] = 'absent'
    expect(dsc_xaduser[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xaduser[:dsc_ensure] = 'absent'
    expect(dsc_xaduser[:ensure]).to eq(dsc_xaduser[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xaduser[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xaduser[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xaduser[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xaduser[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xaduser[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_commonname' do
    expect{dsc_xaduser[:dsc_commonname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_commonname' do
    expect{dsc_xaduser[:dsc_commonname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_commonname' do
    expect{dsc_xaduser[:dsc_commonname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_commonname' do
    expect{dsc_xaduser[:dsc_commonname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_userprincipalname' do
    expect{dsc_xaduser[:dsc_userprincipalname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_userprincipalname' do
    expect{dsc_xaduser[:dsc_userprincipalname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_userprincipalname' do
    expect{dsc_xaduser[:dsc_userprincipalname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_userprincipalname' do
    expect{dsc_xaduser[:dsc_userprincipalname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displayname' do
    expect{dsc_xaduser[:dsc_displayname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayname' do
    expect{dsc_xaduser[:dsc_displayname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displayname' do
    expect{dsc_xaduser[:dsc_displayname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displayname' do
    expect{dsc_xaduser[:dsc_displayname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xaduser[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xaduser[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xaduser[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xaduser[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_givenname' do
    expect{dsc_xaduser[:dsc_givenname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_givenname' do
    expect{dsc_xaduser[:dsc_givenname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_givenname' do
    expect{dsc_xaduser[:dsc_givenname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_givenname' do
    expect{dsc_xaduser[:dsc_givenname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_initials' do
    expect{dsc_xaduser[:dsc_initials] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_initials' do
    expect{dsc_xaduser[:dsc_initials] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_initials' do
    expect{dsc_xaduser[:dsc_initials] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_initials' do
    expect{dsc_xaduser[:dsc_initials] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_surname' do
    expect{dsc_xaduser[:dsc_surname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_surname' do
    expect{dsc_xaduser[:dsc_surname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_surname' do
    expect{dsc_xaduser[:dsc_surname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_surname' do
    expect{dsc_xaduser[:dsc_surname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xaduser[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xaduser[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xaduser[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xaduser[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_streetaddress' do
    expect{dsc_xaduser[:dsc_streetaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_streetaddress' do
    expect{dsc_xaduser[:dsc_streetaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_streetaddress' do
    expect{dsc_xaduser[:dsc_streetaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_streetaddress' do
    expect{dsc_xaduser[:dsc_streetaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pobox' do
    expect{dsc_xaduser[:dsc_pobox] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pobox' do
    expect{dsc_xaduser[:dsc_pobox] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pobox' do
    expect{dsc_xaduser[:dsc_pobox] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pobox' do
    expect{dsc_xaduser[:dsc_pobox] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_city' do
    expect{dsc_xaduser[:dsc_city] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_city' do
    expect{dsc_xaduser[:dsc_city] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_city' do
    expect{dsc_xaduser[:dsc_city] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_city' do
    expect{dsc_xaduser[:dsc_city] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_state' do
    expect{dsc_xaduser[:dsc_state] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_state' do
    expect{dsc_xaduser[:dsc_state] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_state' do
    expect{dsc_xaduser[:dsc_state] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_state' do
    expect{dsc_xaduser[:dsc_state] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_postalcode' do
    expect{dsc_xaduser[:dsc_postalcode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_postalcode' do
    expect{dsc_xaduser[:dsc_postalcode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_postalcode' do
    expect{dsc_xaduser[:dsc_postalcode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_postalcode' do
    expect{dsc_xaduser[:dsc_postalcode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_country' do
    expect{dsc_xaduser[:dsc_country] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_country' do
    expect{dsc_xaduser[:dsc_country] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_country' do
    expect{dsc_xaduser[:dsc_country] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_country' do
    expect{dsc_xaduser[:dsc_country] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_department' do
    expect{dsc_xaduser[:dsc_department] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_department' do
    expect{dsc_xaduser[:dsc_department] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_department' do
    expect{dsc_xaduser[:dsc_department] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_department' do
    expect{dsc_xaduser[:dsc_department] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_division' do
    expect{dsc_xaduser[:dsc_division] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_division' do
    expect{dsc_xaduser[:dsc_division] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_division' do
    expect{dsc_xaduser[:dsc_division] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_division' do
    expect{dsc_xaduser[:dsc_division] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_company' do
    expect{dsc_xaduser[:dsc_company] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_company' do
    expect{dsc_xaduser[:dsc_company] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_company' do
    expect{dsc_xaduser[:dsc_company] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_company' do
    expect{dsc_xaduser[:dsc_company] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_office' do
    expect{dsc_xaduser[:dsc_office] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_office' do
    expect{dsc_xaduser[:dsc_office] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_office' do
    expect{dsc_xaduser[:dsc_office] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_office' do
    expect{dsc_xaduser[:dsc_office] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_jobtitle' do
    expect{dsc_xaduser[:dsc_jobtitle] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_jobtitle' do
    expect{dsc_xaduser[:dsc_jobtitle] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_jobtitle' do
    expect{dsc_xaduser[:dsc_jobtitle] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_jobtitle' do
    expect{dsc_xaduser[:dsc_jobtitle] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_emailaddress' do
    expect{dsc_xaduser[:dsc_emailaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_emailaddress' do
    expect{dsc_xaduser[:dsc_emailaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_emailaddress' do
    expect{dsc_xaduser[:dsc_emailaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_emailaddress' do
    expect{dsc_xaduser[:dsc_emailaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_employeeid' do
    expect{dsc_xaduser[:dsc_employeeid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_employeeid' do
    expect{dsc_xaduser[:dsc_employeeid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_employeeid' do
    expect{dsc_xaduser[:dsc_employeeid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_employeeid' do
    expect{dsc_xaduser[:dsc_employeeid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_employeenumber' do
    expect{dsc_xaduser[:dsc_employeenumber] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_employeenumber' do
    expect{dsc_xaduser[:dsc_employeenumber] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_employeenumber' do
    expect{dsc_xaduser[:dsc_employeenumber] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_employeenumber' do
    expect{dsc_xaduser[:dsc_employeenumber] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_homedirectory' do
    expect{dsc_xaduser[:dsc_homedirectory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_homedirectory' do
    expect{dsc_xaduser[:dsc_homedirectory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_homedirectory' do
    expect{dsc_xaduser[:dsc_homedirectory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_homedirectory' do
    expect{dsc_xaduser[:dsc_homedirectory] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_homedrive' do
    expect{dsc_xaduser[:dsc_homedrive] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_homedrive' do
    expect{dsc_xaduser[:dsc_homedrive] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_homedrive' do
    expect{dsc_xaduser[:dsc_homedrive] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_homedrive' do
    expect{dsc_xaduser[:dsc_homedrive] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_homepage' do
    expect{dsc_xaduser[:dsc_homepage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_homepage' do
    expect{dsc_xaduser[:dsc_homepage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_homepage' do
    expect{dsc_xaduser[:dsc_homepage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_homepage' do
    expect{dsc_xaduser[:dsc_homepage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_profilepath' do
    expect{dsc_xaduser[:dsc_profilepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_profilepath' do
    expect{dsc_xaduser[:dsc_profilepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_profilepath' do
    expect{dsc_xaduser[:dsc_profilepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_profilepath' do
    expect{dsc_xaduser[:dsc_profilepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logonscript' do
    expect{dsc_xaduser[:dsc_logonscript] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logonscript' do
    expect{dsc_xaduser[:dsc_logonscript] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logonscript' do
    expect{dsc_xaduser[:dsc_logonscript] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logonscript' do
    expect{dsc_xaduser[:dsc_logonscript] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_notes' do
    expect{dsc_xaduser[:dsc_notes] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_notes' do
    expect{dsc_xaduser[:dsc_notes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_notes' do
    expect{dsc_xaduser[:dsc_notes] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_notes' do
    expect{dsc_xaduser[:dsc_notes] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_officephone' do
    expect{dsc_xaduser[:dsc_officephone] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_officephone' do
    expect{dsc_xaduser[:dsc_officephone] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_officephone' do
    expect{dsc_xaduser[:dsc_officephone] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_officephone' do
    expect{dsc_xaduser[:dsc_officephone] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_mobilephone' do
    expect{dsc_xaduser[:dsc_mobilephone] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mobilephone' do
    expect{dsc_xaduser[:dsc_mobilephone] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mobilephone' do
    expect{dsc_xaduser[:dsc_mobilephone] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mobilephone' do
    expect{dsc_xaduser[:dsc_mobilephone] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_fax' do
    expect{dsc_xaduser[:dsc_fax] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_fax' do
    expect{dsc_xaduser[:dsc_fax] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_fax' do
    expect{dsc_xaduser[:dsc_fax] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_fax' do
    expect{dsc_xaduser[:dsc_fax] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_homephone' do
    expect{dsc_xaduser[:dsc_homephone] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_homephone' do
    expect{dsc_xaduser[:dsc_homephone] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_homephone' do
    expect{dsc_xaduser[:dsc_homephone] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_homephone' do
    expect{dsc_xaduser[:dsc_homephone] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pager' do
    expect{dsc_xaduser[:dsc_pager] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pager' do
    expect{dsc_xaduser[:dsc_pager] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pager' do
    expect{dsc_xaduser[:dsc_pager] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pager' do
    expect{dsc_xaduser[:dsc_pager] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ipphone' do
    expect{dsc_xaduser[:dsc_ipphone] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ipphone' do
    expect{dsc_xaduser[:dsc_ipphone] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ipphone' do
    expect{dsc_xaduser[:dsc_ipphone] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ipphone' do
    expect{dsc_xaduser[:dsc_ipphone] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_manager' do
    expect{dsc_xaduser[:dsc_manager] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_manager' do
    expect{dsc_xaduser[:dsc_manager] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_manager' do
    expect{dsc_xaduser[:dsc_manager] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_manager' do
    expect{dsc_xaduser[:dsc_manager] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enabled' do
    expect{dsc_xaduser[:dsc_enabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enabled' do
    dsc_xaduser[:dsc_enabled] = true
    expect(dsc_xaduser[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enabled" do
    dsc_xaduser[:dsc_enabled] = 'true'
    expect(dsc_xaduser[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enabled" do
    dsc_xaduser[:dsc_enabled] = 'false'
    expect(dsc_xaduser[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enabled" do
    dsc_xaduser[:dsc_enabled] = 'True'
    expect(dsc_xaduser[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enabled" do
    dsc_xaduser[:dsc_enabled] = 'False'
    expect(dsc_xaduser[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enabled" do
    dsc_xaduser[:dsc_enabled] = :true
    expect(dsc_xaduser[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enabled" do
    dsc_xaduser[:dsc_enabled] = :false
    expect(dsc_xaduser[:dsc_enabled]).to eq(false)
  end

  it 'should not accept int for dsc_enabled' do
    expect{dsc_xaduser[:dsc_enabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabled' do
    expect{dsc_xaduser[:dsc_enabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_cannotchangepassword' do
    expect{dsc_xaduser[:dsc_cannotchangepassword] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_cannotchangepassword' do
    dsc_xaduser[:dsc_cannotchangepassword] = true
    expect(dsc_xaduser[:dsc_cannotchangepassword]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_cannotchangepassword" do
    dsc_xaduser[:dsc_cannotchangepassword] = 'true'
    expect(dsc_xaduser[:dsc_cannotchangepassword]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_cannotchangepassword" do
    dsc_xaduser[:dsc_cannotchangepassword] = 'false'
    expect(dsc_xaduser[:dsc_cannotchangepassword]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_cannotchangepassword" do
    dsc_xaduser[:dsc_cannotchangepassword] = 'True'
    expect(dsc_xaduser[:dsc_cannotchangepassword]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_cannotchangepassword" do
    dsc_xaduser[:dsc_cannotchangepassword] = 'False'
    expect(dsc_xaduser[:dsc_cannotchangepassword]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_cannotchangepassword" do
    dsc_xaduser[:dsc_cannotchangepassword] = :true
    expect(dsc_xaduser[:dsc_cannotchangepassword]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_cannotchangepassword" do
    dsc_xaduser[:dsc_cannotchangepassword] = :false
    expect(dsc_xaduser[:dsc_cannotchangepassword]).to eq(false)
  end

  it 'should not accept int for dsc_cannotchangepassword' do
    expect{dsc_xaduser[:dsc_cannotchangepassword] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_cannotchangepassword' do
    expect{dsc_xaduser[:dsc_cannotchangepassword] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_passwordneverexpires' do
    expect{dsc_xaduser[:dsc_passwordneverexpires] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_passwordneverexpires' do
    dsc_xaduser[:dsc_passwordneverexpires] = true
    expect(dsc_xaduser[:dsc_passwordneverexpires]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_passwordneverexpires" do
    dsc_xaduser[:dsc_passwordneverexpires] = 'true'
    expect(dsc_xaduser[:dsc_passwordneverexpires]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_passwordneverexpires" do
    dsc_xaduser[:dsc_passwordneverexpires] = 'false'
    expect(dsc_xaduser[:dsc_passwordneverexpires]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_passwordneverexpires" do
    dsc_xaduser[:dsc_passwordneverexpires] = 'True'
    expect(dsc_xaduser[:dsc_passwordneverexpires]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_passwordneverexpires" do
    dsc_xaduser[:dsc_passwordneverexpires] = 'False'
    expect(dsc_xaduser[:dsc_passwordneverexpires]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_passwordneverexpires" do
    dsc_xaduser[:dsc_passwordneverexpires] = :true
    expect(dsc_xaduser[:dsc_passwordneverexpires]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_passwordneverexpires" do
    dsc_xaduser[:dsc_passwordneverexpires] = :false
    expect(dsc_xaduser[:dsc_passwordneverexpires]).to eq(false)
  end

  it 'should not accept int for dsc_passwordneverexpires' do
    expect{dsc_xaduser[:dsc_passwordneverexpires] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_passwordneverexpires' do
    expect{dsc_xaduser[:dsc_passwordneverexpires] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xaduser[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xaduser[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xaduser[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xaduser[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_domainadministratorcredential" do
    expect{dsc_xaduser[:dsc_domainadministratorcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainadministratorcredential' do
    expect{dsc_xaduser[:dsc_domainadministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainadministratorcredential' do
    expect{dsc_xaduser[:dsc_domainadministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainadministratorcredential' do
    expect{dsc_xaduser[:dsc_domainadministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainadministratorcredential' do
    expect{dsc_xaduser[:dsc_domainadministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_distinguishedname' do
    expect{dsc_xaduser[:dsc_distinguishedname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_distinguishedname' do
    expect{dsc_xaduser[:dsc_distinguishedname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_distinguishedname' do
    expect{dsc_xaduser[:dsc_distinguishedname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_distinguishedname' do
    expect{dsc_xaduser[:dsc_distinguishedname] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xaduser)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xaduser)
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
        dsc_xaduser.original_parameters[:dsc_ensure] = 'present'
        dsc_xaduser[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xaduser)
      end

      it "should update :ensure to :present" do
        expect(dsc_xaduser[:ensure]).to eq(:present)
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
        dsc_xaduser.original_parameters[:dsc_ensure] = 'absent'
        dsc_xaduser[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xaduser)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xaduser[:ensure]).to eq(:absent)
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
