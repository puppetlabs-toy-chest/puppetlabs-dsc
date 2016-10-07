#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwebsite) do

  let :dsc_xwebsite do
    Puppet::Type.type(:dsc_xwebsite).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xwebsite).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_name => 'foo',
      :dsc_physicalpath => 'foo',
      :dsc_state => 'Started',
      :dsc_applicationpool => 'foo',
      :dsc_bindinginfo => {"Protocol"=>"http", "BindingInformation"=>"foo", "IPAddress"=>"foo", "Port"=>16, "HostName"=>"foo", "CertificateThumbprint"=>"foo", "CertificateStoreName"=>"My", "SslFlags"=>"0"},
      :dsc_defaultpage => ["foo", "bar", "spec"],
      :dsc_enabledprotocols => 'foo',
      :dsc_authenticationinfo => {"Anonymous"=>true, "Basic"=>true, "Digest"=>true, "Windows"=>true},
      :dsc_preloadenabled => true,
      :dsc_serviceautostartenabled => true,
      :dsc_serviceautostartprovider => 'foo',
      :dsc_applicationtype => 'foo',
      :dsc_logpath => 'foo',
      :dsc_logflags => 'Date',
      :dsc_logperiod => 'Hourly',
      :dsc_logtruncatesize => 'foo',
      :dsc_loglocaltimerollover => true,
      :dsc_logformat => 'IIS',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xwebsite.to_s).to eq("Dsc_xwebsite[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xwebsite[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xwebsite[:dsc_ensure] = 'Present'
    expect(dsc_xwebsite[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xwebsite[:dsc_ensure] = 'present'
    expect(dsc_xwebsite[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebsite[:dsc_ensure] = 'present'
    expect(dsc_xwebsite[:ensure]).to eq(dsc_xwebsite[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xwebsite[:dsc_ensure] = 'Absent'
    expect(dsc_xwebsite[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xwebsite[:dsc_ensure] = 'absent'
    expect(dsc_xwebsite[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebsite[:dsc_ensure] = 'absent'
    expect(dsc_xwebsite[:ensure]).to eq(dsc_xwebsite[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebsite[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xwebsite[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xwebsite[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xwebsite[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xwebsite[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_name is specified' do
    #dsc_xwebsite[:dsc_name]
    expect { Puppet::Type.type(:dsc_xwebsite).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xwebsite[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xwebsite[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xwebsite[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xwebsite[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_physicalpath' do
    expect{dsc_xwebsite[:dsc_physicalpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_physicalpath' do
    expect{dsc_xwebsite[:dsc_physicalpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_physicalpath' do
    expect{dsc_xwebsite[:dsc_physicalpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_physicalpath' do
    expect{dsc_xwebsite[:dsc_physicalpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_state predefined value Started' do
    dsc_xwebsite[:dsc_state] = 'Started'
    expect(dsc_xwebsite[:dsc_state]).to eq('Started')
  end

  it 'should accept dsc_state predefined value started' do
    dsc_xwebsite[:dsc_state] = 'started'
    expect(dsc_xwebsite[:dsc_state]).to eq('started')
  end

  it 'should accept dsc_state predefined value Stopped' do
    dsc_xwebsite[:dsc_state] = 'Stopped'
    expect(dsc_xwebsite[:dsc_state]).to eq('Stopped')
  end

  it 'should accept dsc_state predefined value stopped' do
    dsc_xwebsite[:dsc_state] = 'stopped'
    expect(dsc_xwebsite[:dsc_state]).to eq('stopped')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebsite[:dsc_state] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_state' do
    expect{dsc_xwebsite[:dsc_state] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_state' do
    expect{dsc_xwebsite[:dsc_state] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_state' do
    expect{dsc_xwebsite[:dsc_state] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_state' do
    expect{dsc_xwebsite[:dsc_state] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationpool' do
    expect{dsc_xwebsite[:dsc_applicationpool] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationpool' do
    expect{dsc_xwebsite[:dsc_applicationpool] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationpool' do
    expect{dsc_xwebsite[:dsc_applicationpool] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationpool' do
    expect{dsc_xwebsite[:dsc_applicationpool] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept a hash for dsc_bindinginfo' do
    dsc_xwebsite[:dsc_bindinginfo] = {"Protocol"=>"http", "BindingInformation"=>"foo", "IPAddress"=>"foo", "Port"=>16, "HostName"=>"foo", "CertificateThumbprint"=>"foo", "CertificateStoreName"=>"My", "SslFlags"=>"0"}
    expect(dsc_xwebsite[:dsc_bindinginfo]).to eq([{"Protocol"=>"http", "BindingInformation"=>"foo", "IPAddress"=>"foo", "Port"=>16, "HostName"=>"foo", "CertificateThumbprint"=>"foo", "CertificateStoreName"=>"My", "SslFlags"=>"0"}])
  end

  it 'should accept a an array of hashes for dsc_bindinginfo' do
    dsc_xwebsite[:dsc_bindinginfo] = [{"Protocol"=>"http", "BindingInformation"=>"foo", "IPAddress"=>"foo", "Port"=>16, "HostName"=>"foo", "CertificateThumbprint"=>"foo", "CertificateStoreName"=>"My", "SslFlags"=>"0"}]
    expect(dsc_xwebsite[:dsc_bindinginfo]).to eq([{"Protocol"=>"http", "BindingInformation"=>"foo", "IPAddress"=>"foo", "Port"=>16, "HostName"=>"foo", "CertificateThumbprint"=>"foo", "CertificateStoreName"=>"My", "SslFlags"=>"0"}])
  end

  it 'should not accept boolean for dsc_bindinginfo' do
    expect{dsc_xwebsite[:dsc_bindinginfo] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_bindinginfo' do
    expect{dsc_xwebsite[:dsc_bindinginfo] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_bindinginfo' do
    expect{dsc_xwebsite[:dsc_bindinginfo] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_defaultpage' do
    dsc_xwebsite[:dsc_defaultpage] = ["foo", "bar", "spec"]
    expect(dsc_xwebsite[:dsc_defaultpage]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_defaultpage' do
    expect{dsc_xwebsite[:dsc_defaultpage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_defaultpage' do
    expect{dsc_xwebsite[:dsc_defaultpage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_defaultpage' do
    expect{dsc_xwebsite[:dsc_defaultpage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enabledprotocols' do
    expect{dsc_xwebsite[:dsc_enabledprotocols] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_enabledprotocols' do
    expect{dsc_xwebsite[:dsc_enabledprotocols] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_enabledprotocols' do
    expect{dsc_xwebsite[:dsc_enabledprotocols] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabledprotocols' do
    expect{dsc_xwebsite[:dsc_enabledprotocols] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_authenticationinfo' do
    expect{dsc_xwebsite[:dsc_authenticationinfo] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_authenticationinfo' do
    expect{dsc_xwebsite[:dsc_authenticationinfo] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_authenticationinfo' do
    expect{dsc_xwebsite[:dsc_authenticationinfo] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_authenticationinfo' do
    expect{dsc_xwebsite[:dsc_authenticationinfo] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_preloadenabled' do
    expect{dsc_xwebsite[:dsc_preloadenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_preloadenabled' do
    dsc_xwebsite[:dsc_preloadenabled] = true
    expect(dsc_xwebsite[:dsc_preloadenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_preloadenabled" do
    dsc_xwebsite[:dsc_preloadenabled] = 'true'
    expect(dsc_xwebsite[:dsc_preloadenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_preloadenabled" do
    dsc_xwebsite[:dsc_preloadenabled] = 'false'
    expect(dsc_xwebsite[:dsc_preloadenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_preloadenabled" do
    dsc_xwebsite[:dsc_preloadenabled] = 'True'
    expect(dsc_xwebsite[:dsc_preloadenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_preloadenabled" do
    dsc_xwebsite[:dsc_preloadenabled] = 'False'
    expect(dsc_xwebsite[:dsc_preloadenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_preloadenabled" do
    dsc_xwebsite[:dsc_preloadenabled] = :true
    expect(dsc_xwebsite[:dsc_preloadenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_preloadenabled" do
    dsc_xwebsite[:dsc_preloadenabled] = :false
    expect(dsc_xwebsite[:dsc_preloadenabled]).to eq(false)
  end

  it 'should not accept int for dsc_preloadenabled' do
    expect{dsc_xwebsite[:dsc_preloadenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_preloadenabled' do
    expect{dsc_xwebsite[:dsc_preloadenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_serviceautostartenabled' do
    expect{dsc_xwebsite[:dsc_serviceautostartenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_serviceautostartenabled' do
    dsc_xwebsite[:dsc_serviceautostartenabled] = true
    expect(dsc_xwebsite[:dsc_serviceautostartenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_serviceautostartenabled" do
    dsc_xwebsite[:dsc_serviceautostartenabled] = 'true'
    expect(dsc_xwebsite[:dsc_serviceautostartenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_serviceautostartenabled" do
    dsc_xwebsite[:dsc_serviceautostartenabled] = 'false'
    expect(dsc_xwebsite[:dsc_serviceautostartenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_serviceautostartenabled" do
    dsc_xwebsite[:dsc_serviceautostartenabled] = 'True'
    expect(dsc_xwebsite[:dsc_serviceautostartenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_serviceautostartenabled" do
    dsc_xwebsite[:dsc_serviceautostartenabled] = 'False'
    expect(dsc_xwebsite[:dsc_serviceautostartenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_serviceautostartenabled" do
    dsc_xwebsite[:dsc_serviceautostartenabled] = :true
    expect(dsc_xwebsite[:dsc_serviceautostartenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_serviceautostartenabled" do
    dsc_xwebsite[:dsc_serviceautostartenabled] = :false
    expect(dsc_xwebsite[:dsc_serviceautostartenabled]).to eq(false)
  end

  it 'should not accept int for dsc_serviceautostartenabled' do
    expect{dsc_xwebsite[:dsc_serviceautostartenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serviceautostartenabled' do
    expect{dsc_xwebsite[:dsc_serviceautostartenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_serviceautostartprovider' do
    expect{dsc_xwebsite[:dsc_serviceautostartprovider] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serviceautostartprovider' do
    expect{dsc_xwebsite[:dsc_serviceautostartprovider] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serviceautostartprovider' do
    expect{dsc_xwebsite[:dsc_serviceautostartprovider] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serviceautostartprovider' do
    expect{dsc_xwebsite[:dsc_serviceautostartprovider] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationtype' do
    expect{dsc_xwebsite[:dsc_applicationtype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationtype' do
    expect{dsc_xwebsite[:dsc_applicationtype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationtype' do
    expect{dsc_xwebsite[:dsc_applicationtype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationtype' do
    expect{dsc_xwebsite[:dsc_applicationtype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logpath' do
    expect{dsc_xwebsite[:dsc_logpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logpath' do
    expect{dsc_xwebsite[:dsc_logpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logpath' do
    expect{dsc_xwebsite[:dsc_logpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logpath' do
    expect{dsc_xwebsite[:dsc_logpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_logflags predefined value Date' do
    dsc_xwebsite[:dsc_logflags] = 'Date'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['Date'])
  end

  it 'should accept dsc_logflags predefined value date' do
    dsc_xwebsite[:dsc_logflags] = 'date'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['date'])
  end

  it 'should accept dsc_logflags predefined value Time' do
    dsc_xwebsite[:dsc_logflags] = 'Time'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['Time'])
  end

  it 'should accept dsc_logflags predefined value time' do
    dsc_xwebsite[:dsc_logflags] = 'time'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['time'])
  end

  it 'should accept dsc_logflags predefined value ClientIP' do
    dsc_xwebsite[:dsc_logflags] = 'ClientIP'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['ClientIP'])
  end

  it 'should accept dsc_logflags predefined value clientip' do
    dsc_xwebsite[:dsc_logflags] = 'clientip'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['clientip'])
  end

  it 'should accept dsc_logflags predefined value UserName' do
    dsc_xwebsite[:dsc_logflags] = 'UserName'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['UserName'])
  end

  it 'should accept dsc_logflags predefined value username' do
    dsc_xwebsite[:dsc_logflags] = 'username'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['username'])
  end

  it 'should accept dsc_logflags predefined value SiteName' do
    dsc_xwebsite[:dsc_logflags] = 'SiteName'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['SiteName'])
  end

  it 'should accept dsc_logflags predefined value sitename' do
    dsc_xwebsite[:dsc_logflags] = 'sitename'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['sitename'])
  end

  it 'should accept dsc_logflags predefined value ComputerName' do
    dsc_xwebsite[:dsc_logflags] = 'ComputerName'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['ComputerName'])
  end

  it 'should accept dsc_logflags predefined value computername' do
    dsc_xwebsite[:dsc_logflags] = 'computername'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['computername'])
  end

  it 'should accept dsc_logflags predefined value ServerIP' do
    dsc_xwebsite[:dsc_logflags] = 'ServerIP'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['ServerIP'])
  end

  it 'should accept dsc_logflags predefined value serverip' do
    dsc_xwebsite[:dsc_logflags] = 'serverip'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['serverip'])
  end

  it 'should accept dsc_logflags predefined value Method' do
    dsc_xwebsite[:dsc_logflags] = 'Method'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['Method'])
  end

  it 'should accept dsc_logflags predefined value method' do
    dsc_xwebsite[:dsc_logflags] = 'method'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['method'])
  end

  it 'should accept dsc_logflags predefined value UriStem' do
    dsc_xwebsite[:dsc_logflags] = 'UriStem'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['UriStem'])
  end

  it 'should accept dsc_logflags predefined value uristem' do
    dsc_xwebsite[:dsc_logflags] = 'uristem'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['uristem'])
  end

  it 'should accept dsc_logflags predefined value UriQuery' do
    dsc_xwebsite[:dsc_logflags] = 'UriQuery'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['UriQuery'])
  end

  it 'should accept dsc_logflags predefined value uriquery' do
    dsc_xwebsite[:dsc_logflags] = 'uriquery'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['uriquery'])
  end

  it 'should accept dsc_logflags predefined value HttpStatus' do
    dsc_xwebsite[:dsc_logflags] = 'HttpStatus'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['HttpStatus'])
  end

  it 'should accept dsc_logflags predefined value httpstatus' do
    dsc_xwebsite[:dsc_logflags] = 'httpstatus'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['httpstatus'])
  end

  it 'should accept dsc_logflags predefined value Win32Status' do
    dsc_xwebsite[:dsc_logflags] = 'Win32Status'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['Win32Status'])
  end

  it 'should accept dsc_logflags predefined value win32status' do
    dsc_xwebsite[:dsc_logflags] = 'win32status'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['win32status'])
  end

  it 'should accept dsc_logflags predefined value BytesSent' do
    dsc_xwebsite[:dsc_logflags] = 'BytesSent'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['BytesSent'])
  end

  it 'should accept dsc_logflags predefined value bytessent' do
    dsc_xwebsite[:dsc_logflags] = 'bytessent'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['bytessent'])
  end

  it 'should accept dsc_logflags predefined value BytesRecv' do
    dsc_xwebsite[:dsc_logflags] = 'BytesRecv'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['BytesRecv'])
  end

  it 'should accept dsc_logflags predefined value bytesrecv' do
    dsc_xwebsite[:dsc_logflags] = 'bytesrecv'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['bytesrecv'])
  end

  it 'should accept dsc_logflags predefined value TimeTaken' do
    dsc_xwebsite[:dsc_logflags] = 'TimeTaken'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['TimeTaken'])
  end

  it 'should accept dsc_logflags predefined value timetaken' do
    dsc_xwebsite[:dsc_logflags] = 'timetaken'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['timetaken'])
  end

  it 'should accept dsc_logflags predefined value ServerPort' do
    dsc_xwebsite[:dsc_logflags] = 'ServerPort'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['ServerPort'])
  end

  it 'should accept dsc_logflags predefined value serverport' do
    dsc_xwebsite[:dsc_logflags] = 'serverport'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['serverport'])
  end

  it 'should accept dsc_logflags predefined value UserAgent' do
    dsc_xwebsite[:dsc_logflags] = 'UserAgent'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['UserAgent'])
  end

  it 'should accept dsc_logflags predefined value useragent' do
    dsc_xwebsite[:dsc_logflags] = 'useragent'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['useragent'])
  end

  it 'should accept dsc_logflags predefined value Cookie' do
    dsc_xwebsite[:dsc_logflags] = 'Cookie'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['Cookie'])
  end

  it 'should accept dsc_logflags predefined value cookie' do
    dsc_xwebsite[:dsc_logflags] = 'cookie'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['cookie'])
  end

  it 'should accept dsc_logflags predefined value Referer' do
    dsc_xwebsite[:dsc_logflags] = 'Referer'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['Referer'])
  end

  it 'should accept dsc_logflags predefined value referer' do
    dsc_xwebsite[:dsc_logflags] = 'referer'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['referer'])
  end

  it 'should accept dsc_logflags predefined value ProtocolVersion' do
    dsc_xwebsite[:dsc_logflags] = 'ProtocolVersion'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['ProtocolVersion'])
  end

  it 'should accept dsc_logflags predefined value protocolversion' do
    dsc_xwebsite[:dsc_logflags] = 'protocolversion'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['protocolversion'])
  end

  it 'should accept dsc_logflags predefined value Host' do
    dsc_xwebsite[:dsc_logflags] = 'Host'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['Host'])
  end

  it 'should accept dsc_logflags predefined value host' do
    dsc_xwebsite[:dsc_logflags] = 'host'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['host'])
  end

  it 'should accept dsc_logflags predefined value HttpSubStatus' do
    dsc_xwebsite[:dsc_logflags] = 'HttpSubStatus'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['HttpSubStatus'])
  end

  it 'should accept dsc_logflags predefined value httpsubstatus' do
    dsc_xwebsite[:dsc_logflags] = 'httpsubstatus'
    expect(dsc_xwebsite[:dsc_logflags]).to eq(['httpsubstatus'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebsite[:dsc_logflags] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_logflags' do
    dsc_xwebsite[:dsc_logflags] = ["Date", "Time", "ClientIP", "UserName", "SiteName", "ComputerName", "ServerIP", "Method", "UriStem", "UriQuery", "HttpStatus", "Win32Status", "BytesSent", "BytesRecv", "TimeTaken", "ServerPort", "UserAgent", "Cookie", "Referer", "ProtocolVersion", "Host", "HttpSubStatus"]
    expect(dsc_xwebsite[:dsc_logflags]).to eq(["Date", "Time", "ClientIP", "UserName", "SiteName", "ComputerName", "ServerIP", "Method", "UriStem", "UriQuery", "HttpStatus", "Win32Status", "BytesSent", "BytesRecv", "TimeTaken", "ServerPort", "UserAgent", "Cookie", "Referer", "ProtocolVersion", "Host", "HttpSubStatus"])
  end

  it 'should not accept boolean for dsc_logflags' do
    expect{dsc_xwebsite[:dsc_logflags] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logflags' do
    expect{dsc_xwebsite[:dsc_logflags] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logflags' do
    expect{dsc_xwebsite[:dsc_logflags] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_logperiod predefined value Hourly' do
    dsc_xwebsite[:dsc_logperiod] = 'Hourly'
    expect(dsc_xwebsite[:dsc_logperiod]).to eq('Hourly')
  end

  it 'should accept dsc_logperiod predefined value hourly' do
    dsc_xwebsite[:dsc_logperiod] = 'hourly'
    expect(dsc_xwebsite[:dsc_logperiod]).to eq('hourly')
  end

  it 'should accept dsc_logperiod predefined value Daily' do
    dsc_xwebsite[:dsc_logperiod] = 'Daily'
    expect(dsc_xwebsite[:dsc_logperiod]).to eq('Daily')
  end

  it 'should accept dsc_logperiod predefined value daily' do
    dsc_xwebsite[:dsc_logperiod] = 'daily'
    expect(dsc_xwebsite[:dsc_logperiod]).to eq('daily')
  end

  it 'should accept dsc_logperiod predefined value Weekly' do
    dsc_xwebsite[:dsc_logperiod] = 'Weekly'
    expect(dsc_xwebsite[:dsc_logperiod]).to eq('Weekly')
  end

  it 'should accept dsc_logperiod predefined value weekly' do
    dsc_xwebsite[:dsc_logperiod] = 'weekly'
    expect(dsc_xwebsite[:dsc_logperiod]).to eq('weekly')
  end

  it 'should accept dsc_logperiod predefined value Monthly' do
    dsc_xwebsite[:dsc_logperiod] = 'Monthly'
    expect(dsc_xwebsite[:dsc_logperiod]).to eq('Monthly')
  end

  it 'should accept dsc_logperiod predefined value monthly' do
    dsc_xwebsite[:dsc_logperiod] = 'monthly'
    expect(dsc_xwebsite[:dsc_logperiod]).to eq('monthly')
  end

  it 'should accept dsc_logperiod predefined value MaxSize' do
    dsc_xwebsite[:dsc_logperiod] = 'MaxSize'
    expect(dsc_xwebsite[:dsc_logperiod]).to eq('MaxSize')
  end

  it 'should accept dsc_logperiod predefined value maxsize' do
    dsc_xwebsite[:dsc_logperiod] = 'maxsize'
    expect(dsc_xwebsite[:dsc_logperiod]).to eq('maxsize')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebsite[:dsc_logperiod] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logperiod' do
    expect{dsc_xwebsite[:dsc_logperiod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logperiod' do
    expect{dsc_xwebsite[:dsc_logperiod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logperiod' do
    expect{dsc_xwebsite[:dsc_logperiod] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logperiod' do
    expect{dsc_xwebsite[:dsc_logperiod] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logtruncatesize' do
    expect{dsc_xwebsite[:dsc_logtruncatesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logtruncatesize' do
    expect{dsc_xwebsite[:dsc_logtruncatesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logtruncatesize' do
    expect{dsc_xwebsite[:dsc_logtruncatesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logtruncatesize' do
    expect{dsc_xwebsite[:dsc_logtruncatesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_loglocaltimerollover' do
    expect{dsc_xwebsite[:dsc_loglocaltimerollover] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_loglocaltimerollover' do
    dsc_xwebsite[:dsc_loglocaltimerollover] = true
    expect(dsc_xwebsite[:dsc_loglocaltimerollover]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_loglocaltimerollover" do
    dsc_xwebsite[:dsc_loglocaltimerollover] = 'true'
    expect(dsc_xwebsite[:dsc_loglocaltimerollover]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_loglocaltimerollover" do
    dsc_xwebsite[:dsc_loglocaltimerollover] = 'false'
    expect(dsc_xwebsite[:dsc_loglocaltimerollover]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_loglocaltimerollover" do
    dsc_xwebsite[:dsc_loglocaltimerollover] = 'True'
    expect(dsc_xwebsite[:dsc_loglocaltimerollover]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_loglocaltimerollover" do
    dsc_xwebsite[:dsc_loglocaltimerollover] = 'False'
    expect(dsc_xwebsite[:dsc_loglocaltimerollover]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_loglocaltimerollover" do
    dsc_xwebsite[:dsc_loglocaltimerollover] = :true
    expect(dsc_xwebsite[:dsc_loglocaltimerollover]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_loglocaltimerollover" do
    dsc_xwebsite[:dsc_loglocaltimerollover] = :false
    expect(dsc_xwebsite[:dsc_loglocaltimerollover]).to eq(false)
  end

  it 'should not accept int for dsc_loglocaltimerollover' do
    expect{dsc_xwebsite[:dsc_loglocaltimerollover] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_loglocaltimerollover' do
    expect{dsc_xwebsite[:dsc_loglocaltimerollover] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_logformat predefined value IIS' do
    dsc_xwebsite[:dsc_logformat] = 'IIS'
    expect(dsc_xwebsite[:dsc_logformat]).to eq('IIS')
  end

  it 'should accept dsc_logformat predefined value iis' do
    dsc_xwebsite[:dsc_logformat] = 'iis'
    expect(dsc_xwebsite[:dsc_logformat]).to eq('iis')
  end

  it 'should accept dsc_logformat predefined value W3C' do
    dsc_xwebsite[:dsc_logformat] = 'W3C'
    expect(dsc_xwebsite[:dsc_logformat]).to eq('W3C')
  end

  it 'should accept dsc_logformat predefined value w3c' do
    dsc_xwebsite[:dsc_logformat] = 'w3c'
    expect(dsc_xwebsite[:dsc_logformat]).to eq('w3c')
  end

  it 'should accept dsc_logformat predefined value NCSA' do
    dsc_xwebsite[:dsc_logformat] = 'NCSA'
    expect(dsc_xwebsite[:dsc_logformat]).to eq('NCSA')
  end

  it 'should accept dsc_logformat predefined value ncsa' do
    dsc_xwebsite[:dsc_logformat] = 'ncsa'
    expect(dsc_xwebsite[:dsc_logformat]).to eq('ncsa')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebsite[:dsc_logformat] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logformat' do
    expect{dsc_xwebsite[:dsc_logformat] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logformat' do
    expect{dsc_xwebsite[:dsc_logformat] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logformat' do
    expect{dsc_xwebsite[:dsc_logformat] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logformat' do
    expect{dsc_xwebsite[:dsc_logformat] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwebsite)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwebsite)
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
        dsc_xwebsite.original_parameters[:dsc_ensure] = 'present'
        dsc_xwebsite[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xwebsite)
      end

      it "should update :ensure to :present" do
        expect(dsc_xwebsite[:ensure]).to eq(:present)
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
        dsc_xwebsite.original_parameters[:dsc_ensure] = 'absent'
        dsc_xwebsite[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xwebsite)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xwebsite[:ensure]).to eq(:absent)
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
