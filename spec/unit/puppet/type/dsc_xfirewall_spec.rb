#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xfirewall) do

  let :dsc_xfirewall do
    Puppet::Type.type(:dsc_xfirewall).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xfirewall).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_displayname => 'foo',
      :dsc_group => 'foo',
      :dsc_displaygroup => 'foo',
      :dsc_ensure => 'Present',
      :dsc_enabled => 'True',
      :dsc_action => 'NotConfigured',
      :dsc_profile => ["foo", "bar", "spec"],
      :dsc_direction => 'Inbound',
      :dsc_remoteport => ["foo", "bar", "spec"],
      :dsc_localport => ["foo", "bar", "spec"],
      :dsc_protocol => 'foo',
      :dsc_description => 'foo',
      :dsc_program => 'foo',
      :dsc_service => 'foo',
      :dsc_authentication => 'NotRequired',
      :dsc_encryption => 'NotRequired',
      :dsc_interfacealias => ["foo", "bar", "spec"],
      :dsc_interfacetype => 'Any',
      :dsc_localaddress => ["foo", "bar", "spec"],
      :dsc_localuser => 'foo',
      :dsc_package => 'foo',
      :dsc_platform => ["foo", "bar", "spec"],
      :dsc_remoteaddress => ["foo", "bar", "spec"],
      :dsc_remotemachine => 'foo',
      :dsc_remoteuser => 'foo',
      :dsc_dynamictransport => 'Any',
      :dsc_edgetraversalpolicy => 'Block',
      :dsc_icmptype => ["foo", "bar", "spec"],
      :dsc_localonlymapping => true,
      :dsc_loosesourcemapping => true,
      :dsc_overrideblockrules => true,
      :dsc_owner => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xfirewall.to_s).to eq("Dsc_xfirewall[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xfirewall[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xfirewall[:dsc_name]
    expect { Puppet::Type.type(:dsc_xfirewall).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xfirewall[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xfirewall[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xfirewall[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xfirewall[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displayname' do
    expect{dsc_xfirewall[:dsc_displayname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayname' do
    expect{dsc_xfirewall[:dsc_displayname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displayname' do
    expect{dsc_xfirewall[:dsc_displayname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displayname' do
    expect{dsc_xfirewall[:dsc_displayname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_group' do
    expect{dsc_xfirewall[:dsc_group] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_group' do
    expect{dsc_xfirewall[:dsc_group] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_group' do
    expect{dsc_xfirewall[:dsc_group] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_group' do
    expect{dsc_xfirewall[:dsc_group] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displaygroup' do
    expect{dsc_xfirewall[:dsc_displaygroup] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displaygroup' do
    expect{dsc_xfirewall[:dsc_displaygroup] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displaygroup' do
    expect{dsc_xfirewall[:dsc_displaygroup] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displaygroup' do
    expect{dsc_xfirewall[:dsc_displaygroup] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xfirewall[:dsc_ensure] = 'Present'
    expect(dsc_xfirewall[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xfirewall[:dsc_ensure] = 'present'
    expect(dsc_xfirewall[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xfirewall[:dsc_ensure] = 'present'
    expect(dsc_xfirewall[:ensure]).to eq(dsc_xfirewall[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xfirewall[:dsc_ensure] = 'Absent'
    expect(dsc_xfirewall[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xfirewall[:dsc_ensure] = 'absent'
    expect(dsc_xfirewall[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xfirewall[:dsc_ensure] = 'absent'
    expect(dsc_xfirewall[:ensure]).to eq(dsc_xfirewall[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xfirewall[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xfirewall[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xfirewall[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xfirewall[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_enabled predefined value True' do
    dsc_xfirewall[:dsc_enabled] = 'True'
    expect(dsc_xfirewall[:dsc_enabled]).to eq('True')
  end

  it 'should accept dsc_enabled predefined value true' do
    dsc_xfirewall[:dsc_enabled] = 'true'
    expect(dsc_xfirewall[:dsc_enabled]).to eq('true')
  end

  it 'should accept dsc_enabled predefined value False' do
    dsc_xfirewall[:dsc_enabled] = 'False'
    expect(dsc_xfirewall[:dsc_enabled]).to eq('False')
  end

  it 'should accept dsc_enabled predefined value false' do
    dsc_xfirewall[:dsc_enabled] = 'false'
    expect(dsc_xfirewall[:dsc_enabled]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_enabled] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enabled' do
    expect{dsc_xfirewall[:dsc_enabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_enabled' do
    expect{dsc_xfirewall[:dsc_enabled] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_enabled' do
    expect{dsc_xfirewall[:dsc_enabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabled' do
    expect{dsc_xfirewall[:dsc_enabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_action predefined value NotConfigured' do
    dsc_xfirewall[:dsc_action] = 'NotConfigured'
    expect(dsc_xfirewall[:dsc_action]).to eq('NotConfigured')
  end

  it 'should accept dsc_action predefined value notconfigured' do
    dsc_xfirewall[:dsc_action] = 'notconfigured'
    expect(dsc_xfirewall[:dsc_action]).to eq('notconfigured')
  end

  it 'should accept dsc_action predefined value Allow' do
    dsc_xfirewall[:dsc_action] = 'Allow'
    expect(dsc_xfirewall[:dsc_action]).to eq('Allow')
  end

  it 'should accept dsc_action predefined value allow' do
    dsc_xfirewall[:dsc_action] = 'allow'
    expect(dsc_xfirewall[:dsc_action]).to eq('allow')
  end

  it 'should accept dsc_action predefined value Block' do
    dsc_xfirewall[:dsc_action] = 'Block'
    expect(dsc_xfirewall[:dsc_action]).to eq('Block')
  end

  it 'should accept dsc_action predefined value block' do
    dsc_xfirewall[:dsc_action] = 'block'
    expect(dsc_xfirewall[:dsc_action]).to eq('block')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_action] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_action' do
    expect{dsc_xfirewall[:dsc_action] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_action' do
    expect{dsc_xfirewall[:dsc_action] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_action' do
    expect{dsc_xfirewall[:dsc_action] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_action' do
    expect{dsc_xfirewall[:dsc_action] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_profile' do
    dsc_xfirewall[:dsc_profile] = ["foo", "bar", "spec"]
    expect(dsc_xfirewall[:dsc_profile]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_profile' do
    expect{dsc_xfirewall[:dsc_profile] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_profile' do
    expect{dsc_xfirewall[:dsc_profile] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_profile' do
    expect{dsc_xfirewall[:dsc_profile] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_direction predefined value Inbound' do
    dsc_xfirewall[:dsc_direction] = 'Inbound'
    expect(dsc_xfirewall[:dsc_direction]).to eq('Inbound')
  end

  it 'should accept dsc_direction predefined value inbound' do
    dsc_xfirewall[:dsc_direction] = 'inbound'
    expect(dsc_xfirewall[:dsc_direction]).to eq('inbound')
  end

  it 'should accept dsc_direction predefined value Outbound' do
    dsc_xfirewall[:dsc_direction] = 'Outbound'
    expect(dsc_xfirewall[:dsc_direction]).to eq('Outbound')
  end

  it 'should accept dsc_direction predefined value outbound' do
    dsc_xfirewall[:dsc_direction] = 'outbound'
    expect(dsc_xfirewall[:dsc_direction]).to eq('outbound')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_direction] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_direction' do
    expect{dsc_xfirewall[:dsc_direction] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_direction' do
    expect{dsc_xfirewall[:dsc_direction] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_direction' do
    expect{dsc_xfirewall[:dsc_direction] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_direction' do
    expect{dsc_xfirewall[:dsc_direction] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_remoteport' do
    dsc_xfirewall[:dsc_remoteport] = ["foo", "bar", "spec"]
    expect(dsc_xfirewall[:dsc_remoteport]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_remoteport' do
    expect{dsc_xfirewall[:dsc_remoteport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_remoteport' do
    expect{dsc_xfirewall[:dsc_remoteport] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_remoteport' do
    expect{dsc_xfirewall[:dsc_remoteport] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_localport' do
    dsc_xfirewall[:dsc_localport] = ["foo", "bar", "spec"]
    expect(dsc_xfirewall[:dsc_localport]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_localport' do
    expect{dsc_xfirewall[:dsc_localport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_localport' do
    expect{dsc_xfirewall[:dsc_localport] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_localport' do
    expect{dsc_xfirewall[:dsc_localport] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_protocol' do
    expect{dsc_xfirewall[:dsc_protocol] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_protocol' do
    expect{dsc_xfirewall[:dsc_protocol] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_protocol' do
    expect{dsc_xfirewall[:dsc_protocol] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_protocol' do
    expect{dsc_xfirewall[:dsc_protocol] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xfirewall[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xfirewall[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xfirewall[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xfirewall[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_program' do
    expect{dsc_xfirewall[:dsc_program] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_program' do
    expect{dsc_xfirewall[:dsc_program] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_program' do
    expect{dsc_xfirewall[:dsc_program] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_program' do
    expect{dsc_xfirewall[:dsc_program] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_service' do
    expect{dsc_xfirewall[:dsc_service] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_service' do
    expect{dsc_xfirewall[:dsc_service] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_service' do
    expect{dsc_xfirewall[:dsc_service] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_service' do
    expect{dsc_xfirewall[:dsc_service] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_authentication predefined value NotRequired' do
    dsc_xfirewall[:dsc_authentication] = 'NotRequired'
    expect(dsc_xfirewall[:dsc_authentication]).to eq('NotRequired')
  end

  it 'should accept dsc_authentication predefined value notrequired' do
    dsc_xfirewall[:dsc_authentication] = 'notrequired'
    expect(dsc_xfirewall[:dsc_authentication]).to eq('notrequired')
  end

  it 'should accept dsc_authentication predefined value Required' do
    dsc_xfirewall[:dsc_authentication] = 'Required'
    expect(dsc_xfirewall[:dsc_authentication]).to eq('Required')
  end

  it 'should accept dsc_authentication predefined value required' do
    dsc_xfirewall[:dsc_authentication] = 'required'
    expect(dsc_xfirewall[:dsc_authentication]).to eq('required')
  end

  it 'should accept dsc_authentication predefined value NoEncap' do
    dsc_xfirewall[:dsc_authentication] = 'NoEncap'
    expect(dsc_xfirewall[:dsc_authentication]).to eq('NoEncap')
  end

  it 'should accept dsc_authentication predefined value noencap' do
    dsc_xfirewall[:dsc_authentication] = 'noencap'
    expect(dsc_xfirewall[:dsc_authentication]).to eq('noencap')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_authentication] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_authentication' do
    expect{dsc_xfirewall[:dsc_authentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_authentication' do
    expect{dsc_xfirewall[:dsc_authentication] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_authentication' do
    expect{dsc_xfirewall[:dsc_authentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_authentication' do
    expect{dsc_xfirewall[:dsc_authentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_encryption predefined value NotRequired' do
    dsc_xfirewall[:dsc_encryption] = 'NotRequired'
    expect(dsc_xfirewall[:dsc_encryption]).to eq('NotRequired')
  end

  it 'should accept dsc_encryption predefined value notrequired' do
    dsc_xfirewall[:dsc_encryption] = 'notrequired'
    expect(dsc_xfirewall[:dsc_encryption]).to eq('notrequired')
  end

  it 'should accept dsc_encryption predefined value Required' do
    dsc_xfirewall[:dsc_encryption] = 'Required'
    expect(dsc_xfirewall[:dsc_encryption]).to eq('Required')
  end

  it 'should accept dsc_encryption predefined value required' do
    dsc_xfirewall[:dsc_encryption] = 'required'
    expect(dsc_xfirewall[:dsc_encryption]).to eq('required')
  end

  it 'should accept dsc_encryption predefined value Dynamic' do
    dsc_xfirewall[:dsc_encryption] = 'Dynamic'
    expect(dsc_xfirewall[:dsc_encryption]).to eq('Dynamic')
  end

  it 'should accept dsc_encryption predefined value dynamic' do
    dsc_xfirewall[:dsc_encryption] = 'dynamic'
    expect(dsc_xfirewall[:dsc_encryption]).to eq('dynamic')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_encryption] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_encryption' do
    expect{dsc_xfirewall[:dsc_encryption] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_encryption' do
    expect{dsc_xfirewall[:dsc_encryption] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_encryption' do
    expect{dsc_xfirewall[:dsc_encryption] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_encryption' do
    expect{dsc_xfirewall[:dsc_encryption] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_interfacealias' do
    dsc_xfirewall[:dsc_interfacealias] = ["foo", "bar", "spec"]
    expect(dsc_xfirewall[:dsc_interfacealias]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_interfacealias' do
    expect{dsc_xfirewall[:dsc_interfacealias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_interfacealias' do
    expect{dsc_xfirewall[:dsc_interfacealias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_interfacealias' do
    expect{dsc_xfirewall[:dsc_interfacealias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_interfacetype predefined value Any' do
    dsc_xfirewall[:dsc_interfacetype] = 'Any'
    expect(dsc_xfirewall[:dsc_interfacetype]).to eq('Any')
  end

  it 'should accept dsc_interfacetype predefined value any' do
    dsc_xfirewall[:dsc_interfacetype] = 'any'
    expect(dsc_xfirewall[:dsc_interfacetype]).to eq('any')
  end

  it 'should accept dsc_interfacetype predefined value Wired' do
    dsc_xfirewall[:dsc_interfacetype] = 'Wired'
    expect(dsc_xfirewall[:dsc_interfacetype]).to eq('Wired')
  end

  it 'should accept dsc_interfacetype predefined value wired' do
    dsc_xfirewall[:dsc_interfacetype] = 'wired'
    expect(dsc_xfirewall[:dsc_interfacetype]).to eq('wired')
  end

  it 'should accept dsc_interfacetype predefined value Wireless' do
    dsc_xfirewall[:dsc_interfacetype] = 'Wireless'
    expect(dsc_xfirewall[:dsc_interfacetype]).to eq('Wireless')
  end

  it 'should accept dsc_interfacetype predefined value wireless' do
    dsc_xfirewall[:dsc_interfacetype] = 'wireless'
    expect(dsc_xfirewall[:dsc_interfacetype]).to eq('wireless')
  end

  it 'should accept dsc_interfacetype predefined value RemoteAccess' do
    dsc_xfirewall[:dsc_interfacetype] = 'RemoteAccess'
    expect(dsc_xfirewall[:dsc_interfacetype]).to eq('RemoteAccess')
  end

  it 'should accept dsc_interfacetype predefined value remoteaccess' do
    dsc_xfirewall[:dsc_interfacetype] = 'remoteaccess'
    expect(dsc_xfirewall[:dsc_interfacetype]).to eq('remoteaccess')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_interfacetype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_interfacetype' do
    expect{dsc_xfirewall[:dsc_interfacetype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_interfacetype' do
    expect{dsc_xfirewall[:dsc_interfacetype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_interfacetype' do
    expect{dsc_xfirewall[:dsc_interfacetype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_interfacetype' do
    expect{dsc_xfirewall[:dsc_interfacetype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_localaddress' do
    dsc_xfirewall[:dsc_localaddress] = ["foo", "bar", "spec"]
    expect(dsc_xfirewall[:dsc_localaddress]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_localaddress' do
    expect{dsc_xfirewall[:dsc_localaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_localaddress' do
    expect{dsc_xfirewall[:dsc_localaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_localaddress' do
    expect{dsc_xfirewall[:dsc_localaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_localuser' do
    expect{dsc_xfirewall[:dsc_localuser] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_localuser' do
    expect{dsc_xfirewall[:dsc_localuser] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_localuser' do
    expect{dsc_xfirewall[:dsc_localuser] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_localuser' do
    expect{dsc_xfirewall[:dsc_localuser] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_package' do
    expect{dsc_xfirewall[:dsc_package] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_package' do
    expect{dsc_xfirewall[:dsc_package] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_package' do
    expect{dsc_xfirewall[:dsc_package] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_package' do
    expect{dsc_xfirewall[:dsc_package] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_platform' do
    dsc_xfirewall[:dsc_platform] = ["foo", "bar", "spec"]
    expect(dsc_xfirewall[:dsc_platform]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_platform' do
    expect{dsc_xfirewall[:dsc_platform] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_platform' do
    expect{dsc_xfirewall[:dsc_platform] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_platform' do
    expect{dsc_xfirewall[:dsc_platform] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_remoteaddress' do
    dsc_xfirewall[:dsc_remoteaddress] = ["foo", "bar", "spec"]
    expect(dsc_xfirewall[:dsc_remoteaddress]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_remoteaddress' do
    expect{dsc_xfirewall[:dsc_remoteaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_remoteaddress' do
    expect{dsc_xfirewall[:dsc_remoteaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_remoteaddress' do
    expect{dsc_xfirewall[:dsc_remoteaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_remotemachine' do
    expect{dsc_xfirewall[:dsc_remotemachine] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_remotemachine' do
    expect{dsc_xfirewall[:dsc_remotemachine] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_remotemachine' do
    expect{dsc_xfirewall[:dsc_remotemachine] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_remotemachine' do
    expect{dsc_xfirewall[:dsc_remotemachine] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_remoteuser' do
    expect{dsc_xfirewall[:dsc_remoteuser] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_remoteuser' do
    expect{dsc_xfirewall[:dsc_remoteuser] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_remoteuser' do
    expect{dsc_xfirewall[:dsc_remoteuser] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_remoteuser' do
    expect{dsc_xfirewall[:dsc_remoteuser] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_dynamictransport predefined value Any' do
    dsc_xfirewall[:dsc_dynamictransport] = 'Any'
    expect(dsc_xfirewall[:dsc_dynamictransport]).to eq('Any')
  end

  it 'should accept dsc_dynamictransport predefined value any' do
    dsc_xfirewall[:dsc_dynamictransport] = 'any'
    expect(dsc_xfirewall[:dsc_dynamictransport]).to eq('any')
  end

  it 'should accept dsc_dynamictransport predefined value ProximityApps' do
    dsc_xfirewall[:dsc_dynamictransport] = 'ProximityApps'
    expect(dsc_xfirewall[:dsc_dynamictransport]).to eq('ProximityApps')
  end

  it 'should accept dsc_dynamictransport predefined value proximityapps' do
    dsc_xfirewall[:dsc_dynamictransport] = 'proximityapps'
    expect(dsc_xfirewall[:dsc_dynamictransport]).to eq('proximityapps')
  end

  it 'should accept dsc_dynamictransport predefined value ProximitySharing' do
    dsc_xfirewall[:dsc_dynamictransport] = 'ProximitySharing'
    expect(dsc_xfirewall[:dsc_dynamictransport]).to eq('ProximitySharing')
  end

  it 'should accept dsc_dynamictransport predefined value proximitysharing' do
    dsc_xfirewall[:dsc_dynamictransport] = 'proximitysharing'
    expect(dsc_xfirewall[:dsc_dynamictransport]).to eq('proximitysharing')
  end

  it 'should accept dsc_dynamictransport predefined value WifiDirectPrinting' do
    dsc_xfirewall[:dsc_dynamictransport] = 'WifiDirectPrinting'
    expect(dsc_xfirewall[:dsc_dynamictransport]).to eq('WifiDirectPrinting')
  end

  it 'should accept dsc_dynamictransport predefined value wifidirectprinting' do
    dsc_xfirewall[:dsc_dynamictransport] = 'wifidirectprinting'
    expect(dsc_xfirewall[:dsc_dynamictransport]).to eq('wifidirectprinting')
  end

  it 'should accept dsc_dynamictransport predefined value WifiDirectDisplay' do
    dsc_xfirewall[:dsc_dynamictransport] = 'WifiDirectDisplay'
    expect(dsc_xfirewall[:dsc_dynamictransport]).to eq('WifiDirectDisplay')
  end

  it 'should accept dsc_dynamictransport predefined value wifidirectdisplay' do
    dsc_xfirewall[:dsc_dynamictransport] = 'wifidirectdisplay'
    expect(dsc_xfirewall[:dsc_dynamictransport]).to eq('wifidirectdisplay')
  end

  it 'should accept dsc_dynamictransport predefined value WifiDirectDevices' do
    dsc_xfirewall[:dsc_dynamictransport] = 'WifiDirectDevices'
    expect(dsc_xfirewall[:dsc_dynamictransport]).to eq('WifiDirectDevices')
  end

  it 'should accept dsc_dynamictransport predefined value wifidirectdevices' do
    dsc_xfirewall[:dsc_dynamictransport] = 'wifidirectdevices'
    expect(dsc_xfirewall[:dsc_dynamictransport]).to eq('wifidirectdevices')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_dynamictransport] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dynamictransport' do
    expect{dsc_xfirewall[:dsc_dynamictransport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dynamictransport' do
    expect{dsc_xfirewall[:dsc_dynamictransport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dynamictransport' do
    expect{dsc_xfirewall[:dsc_dynamictransport] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dynamictransport' do
    expect{dsc_xfirewall[:dsc_dynamictransport] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_edgetraversalpolicy predefined value Block' do
    dsc_xfirewall[:dsc_edgetraversalpolicy] = 'Block'
    expect(dsc_xfirewall[:dsc_edgetraversalpolicy]).to eq('Block')
  end

  it 'should accept dsc_edgetraversalpolicy predefined value block' do
    dsc_xfirewall[:dsc_edgetraversalpolicy] = 'block'
    expect(dsc_xfirewall[:dsc_edgetraversalpolicy]).to eq('block')
  end

  it 'should accept dsc_edgetraversalpolicy predefined value Allow' do
    dsc_xfirewall[:dsc_edgetraversalpolicy] = 'Allow'
    expect(dsc_xfirewall[:dsc_edgetraversalpolicy]).to eq('Allow')
  end

  it 'should accept dsc_edgetraversalpolicy predefined value allow' do
    dsc_xfirewall[:dsc_edgetraversalpolicy] = 'allow'
    expect(dsc_xfirewall[:dsc_edgetraversalpolicy]).to eq('allow')
  end

  it 'should accept dsc_edgetraversalpolicy predefined value DeferToUser' do
    dsc_xfirewall[:dsc_edgetraversalpolicy] = 'DeferToUser'
    expect(dsc_xfirewall[:dsc_edgetraversalpolicy]).to eq('DeferToUser')
  end

  it 'should accept dsc_edgetraversalpolicy predefined value defertouser' do
    dsc_xfirewall[:dsc_edgetraversalpolicy] = 'defertouser'
    expect(dsc_xfirewall[:dsc_edgetraversalpolicy]).to eq('defertouser')
  end

  it 'should accept dsc_edgetraversalpolicy predefined value DeferToApp' do
    dsc_xfirewall[:dsc_edgetraversalpolicy] = 'DeferToApp'
    expect(dsc_xfirewall[:dsc_edgetraversalpolicy]).to eq('DeferToApp')
  end

  it 'should accept dsc_edgetraversalpolicy predefined value defertoapp' do
    dsc_xfirewall[:dsc_edgetraversalpolicy] = 'defertoapp'
    expect(dsc_xfirewall[:dsc_edgetraversalpolicy]).to eq('defertoapp')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_edgetraversalpolicy] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_edgetraversalpolicy' do
    expect{dsc_xfirewall[:dsc_edgetraversalpolicy] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_edgetraversalpolicy' do
    expect{dsc_xfirewall[:dsc_edgetraversalpolicy] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_edgetraversalpolicy' do
    expect{dsc_xfirewall[:dsc_edgetraversalpolicy] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_edgetraversalpolicy' do
    expect{dsc_xfirewall[:dsc_edgetraversalpolicy] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_icmptype' do
    dsc_xfirewall[:dsc_icmptype] = ["foo", "bar", "spec"]
    expect(dsc_xfirewall[:dsc_icmptype]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_icmptype' do
    expect{dsc_xfirewall[:dsc_icmptype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_icmptype' do
    expect{dsc_xfirewall[:dsc_icmptype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_icmptype' do
    expect{dsc_xfirewall[:dsc_icmptype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_localonlymapping' do
    expect{dsc_xfirewall[:dsc_localonlymapping] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_localonlymapping' do
    dsc_xfirewall[:dsc_localonlymapping] = true
    expect(dsc_xfirewall[:dsc_localonlymapping]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_localonlymapping" do
    dsc_xfirewall[:dsc_localonlymapping] = 'true'
    expect(dsc_xfirewall[:dsc_localonlymapping]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_localonlymapping" do
    dsc_xfirewall[:dsc_localonlymapping] = 'false'
    expect(dsc_xfirewall[:dsc_localonlymapping]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_localonlymapping" do
    dsc_xfirewall[:dsc_localonlymapping] = 'True'
    expect(dsc_xfirewall[:dsc_localonlymapping]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_localonlymapping" do
    dsc_xfirewall[:dsc_localonlymapping] = 'False'
    expect(dsc_xfirewall[:dsc_localonlymapping]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_localonlymapping" do
    dsc_xfirewall[:dsc_localonlymapping] = :true
    expect(dsc_xfirewall[:dsc_localonlymapping]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_localonlymapping" do
    dsc_xfirewall[:dsc_localonlymapping] = :false
    expect(dsc_xfirewall[:dsc_localonlymapping]).to eq(false)
  end

  it 'should not accept int for dsc_localonlymapping' do
    expect{dsc_xfirewall[:dsc_localonlymapping] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_localonlymapping' do
    expect{dsc_xfirewall[:dsc_localonlymapping] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_loosesourcemapping' do
    expect{dsc_xfirewall[:dsc_loosesourcemapping] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_loosesourcemapping' do
    dsc_xfirewall[:dsc_loosesourcemapping] = true
    expect(dsc_xfirewall[:dsc_loosesourcemapping]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_loosesourcemapping" do
    dsc_xfirewall[:dsc_loosesourcemapping] = 'true'
    expect(dsc_xfirewall[:dsc_loosesourcemapping]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_loosesourcemapping" do
    dsc_xfirewall[:dsc_loosesourcemapping] = 'false'
    expect(dsc_xfirewall[:dsc_loosesourcemapping]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_loosesourcemapping" do
    dsc_xfirewall[:dsc_loosesourcemapping] = 'True'
    expect(dsc_xfirewall[:dsc_loosesourcemapping]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_loosesourcemapping" do
    dsc_xfirewall[:dsc_loosesourcemapping] = 'False'
    expect(dsc_xfirewall[:dsc_loosesourcemapping]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_loosesourcemapping" do
    dsc_xfirewall[:dsc_loosesourcemapping] = :true
    expect(dsc_xfirewall[:dsc_loosesourcemapping]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_loosesourcemapping" do
    dsc_xfirewall[:dsc_loosesourcemapping] = :false
    expect(dsc_xfirewall[:dsc_loosesourcemapping]).to eq(false)
  end

  it 'should not accept int for dsc_loosesourcemapping' do
    expect{dsc_xfirewall[:dsc_loosesourcemapping] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_loosesourcemapping' do
    expect{dsc_xfirewall[:dsc_loosesourcemapping] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_overrideblockrules' do
    expect{dsc_xfirewall[:dsc_overrideblockrules] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_overrideblockrules' do
    dsc_xfirewall[:dsc_overrideblockrules] = true
    expect(dsc_xfirewall[:dsc_overrideblockrules]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_overrideblockrules" do
    dsc_xfirewall[:dsc_overrideblockrules] = 'true'
    expect(dsc_xfirewall[:dsc_overrideblockrules]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_overrideblockrules" do
    dsc_xfirewall[:dsc_overrideblockrules] = 'false'
    expect(dsc_xfirewall[:dsc_overrideblockrules]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_overrideblockrules" do
    dsc_xfirewall[:dsc_overrideblockrules] = 'True'
    expect(dsc_xfirewall[:dsc_overrideblockrules]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_overrideblockrules" do
    dsc_xfirewall[:dsc_overrideblockrules] = 'False'
    expect(dsc_xfirewall[:dsc_overrideblockrules]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_overrideblockrules" do
    dsc_xfirewall[:dsc_overrideblockrules] = :true
    expect(dsc_xfirewall[:dsc_overrideblockrules]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_overrideblockrules" do
    dsc_xfirewall[:dsc_overrideblockrules] = :false
    expect(dsc_xfirewall[:dsc_overrideblockrules]).to eq(false)
  end

  it 'should not accept int for dsc_overrideblockrules' do
    expect{dsc_xfirewall[:dsc_overrideblockrules] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_overrideblockrules' do
    expect{dsc_xfirewall[:dsc_overrideblockrules] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_owner' do
    expect{dsc_xfirewall[:dsc_owner] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_owner' do
    expect{dsc_xfirewall[:dsc_owner] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_owner' do
    expect{dsc_xfirewall[:dsc_owner] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_owner' do
    expect{dsc_xfirewall[:dsc_owner] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xfirewall)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xfirewall)
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
        dsc_xfirewall.original_parameters[:dsc_ensure] = 'present'
        dsc_xfirewall[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xfirewall)
      end

      it "should update :ensure to :present" do
        expect(dsc_xfirewall[:ensure]).to eq(:present)
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
        dsc_xfirewall.original_parameters[:dsc_ensure] = 'absent'
        dsc_xfirewall[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xfirewall)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xfirewall[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
