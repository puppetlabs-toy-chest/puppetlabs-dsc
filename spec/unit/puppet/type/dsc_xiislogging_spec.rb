#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xiislogging) do

  let :dsc_xiislogging do
    Puppet::Type.type(:dsc_xiislogging).new(
      :name     => 'foo',
      :dsc_logpath => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xiislogging).new(
      :name     => 'foo',
      :dsc_logpath => 'foo',
      :dsc_logflags => 'Date',
      :dsc_logperiod => 'Hourly',
      :dsc_logtruncatesize => 'foo',
      :dsc_loglocaltimerollover => true,
      :dsc_logformat => 'IIS',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xiislogging.to_s).to eq("Dsc_xiislogging[foo]")
  end

  it 'should require that dsc_logpath is specified' do
    #dsc_xiislogging[:dsc_logpath]
    expect { Puppet::Type.type(:dsc_xiislogging).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_logpath is a required attribute/)
  end

  it 'should not accept array for dsc_logpath' do
    expect{dsc_xiislogging[:dsc_logpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logpath' do
    expect{dsc_xiislogging[:dsc_logpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logpath' do
    expect{dsc_xiislogging[:dsc_logpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logpath' do
    expect{dsc_xiislogging[:dsc_logpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_logflags predefined value Date' do
    dsc_xiislogging[:dsc_logflags] = 'Date'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['Date'])
  end

  it 'should accept dsc_logflags predefined value date' do
    dsc_xiislogging[:dsc_logflags] = 'date'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['date'])
  end

  it 'should accept dsc_logflags predefined value Time' do
    dsc_xiislogging[:dsc_logflags] = 'Time'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['Time'])
  end

  it 'should accept dsc_logflags predefined value time' do
    dsc_xiislogging[:dsc_logflags] = 'time'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['time'])
  end

  it 'should accept dsc_logflags predefined value ClientIP' do
    dsc_xiislogging[:dsc_logflags] = 'ClientIP'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['ClientIP'])
  end

  it 'should accept dsc_logflags predefined value clientip' do
    dsc_xiislogging[:dsc_logflags] = 'clientip'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['clientip'])
  end

  it 'should accept dsc_logflags predefined value UserName' do
    dsc_xiislogging[:dsc_logflags] = 'UserName'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['UserName'])
  end

  it 'should accept dsc_logflags predefined value username' do
    dsc_xiislogging[:dsc_logflags] = 'username'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['username'])
  end

  it 'should accept dsc_logflags predefined value SiteName' do
    dsc_xiislogging[:dsc_logflags] = 'SiteName'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['SiteName'])
  end

  it 'should accept dsc_logflags predefined value sitename' do
    dsc_xiislogging[:dsc_logflags] = 'sitename'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['sitename'])
  end

  it 'should accept dsc_logflags predefined value ComputerName' do
    dsc_xiislogging[:dsc_logflags] = 'ComputerName'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['ComputerName'])
  end

  it 'should accept dsc_logflags predefined value computername' do
    dsc_xiislogging[:dsc_logflags] = 'computername'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['computername'])
  end

  it 'should accept dsc_logflags predefined value ServerIP' do
    dsc_xiislogging[:dsc_logflags] = 'ServerIP'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['ServerIP'])
  end

  it 'should accept dsc_logflags predefined value serverip' do
    dsc_xiislogging[:dsc_logflags] = 'serverip'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['serverip'])
  end

  it 'should accept dsc_logflags predefined value Method' do
    dsc_xiislogging[:dsc_logflags] = 'Method'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['Method'])
  end

  it 'should accept dsc_logflags predefined value method' do
    dsc_xiislogging[:dsc_logflags] = 'method'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['method'])
  end

  it 'should accept dsc_logflags predefined value UriStem' do
    dsc_xiislogging[:dsc_logflags] = 'UriStem'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['UriStem'])
  end

  it 'should accept dsc_logflags predefined value uristem' do
    dsc_xiislogging[:dsc_logflags] = 'uristem'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['uristem'])
  end

  it 'should accept dsc_logflags predefined value UriQuery' do
    dsc_xiislogging[:dsc_logflags] = 'UriQuery'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['UriQuery'])
  end

  it 'should accept dsc_logflags predefined value uriquery' do
    dsc_xiislogging[:dsc_logflags] = 'uriquery'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['uriquery'])
  end

  it 'should accept dsc_logflags predefined value HttpStatus' do
    dsc_xiislogging[:dsc_logflags] = 'HttpStatus'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['HttpStatus'])
  end

  it 'should accept dsc_logflags predefined value httpstatus' do
    dsc_xiislogging[:dsc_logflags] = 'httpstatus'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['httpstatus'])
  end

  it 'should accept dsc_logflags predefined value Win32Status' do
    dsc_xiislogging[:dsc_logflags] = 'Win32Status'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['Win32Status'])
  end

  it 'should accept dsc_logflags predefined value win32status' do
    dsc_xiislogging[:dsc_logflags] = 'win32status'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['win32status'])
  end

  it 'should accept dsc_logflags predefined value BytesSent' do
    dsc_xiislogging[:dsc_logflags] = 'BytesSent'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['BytesSent'])
  end

  it 'should accept dsc_logflags predefined value bytessent' do
    dsc_xiislogging[:dsc_logflags] = 'bytessent'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['bytessent'])
  end

  it 'should accept dsc_logflags predefined value BytesRecv' do
    dsc_xiislogging[:dsc_logflags] = 'BytesRecv'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['BytesRecv'])
  end

  it 'should accept dsc_logflags predefined value bytesrecv' do
    dsc_xiislogging[:dsc_logflags] = 'bytesrecv'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['bytesrecv'])
  end

  it 'should accept dsc_logflags predefined value TimeTaken' do
    dsc_xiislogging[:dsc_logflags] = 'TimeTaken'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['TimeTaken'])
  end

  it 'should accept dsc_logflags predefined value timetaken' do
    dsc_xiislogging[:dsc_logflags] = 'timetaken'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['timetaken'])
  end

  it 'should accept dsc_logflags predefined value ServerPort' do
    dsc_xiislogging[:dsc_logflags] = 'ServerPort'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['ServerPort'])
  end

  it 'should accept dsc_logflags predefined value serverport' do
    dsc_xiislogging[:dsc_logflags] = 'serverport'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['serverport'])
  end

  it 'should accept dsc_logflags predefined value UserAgent' do
    dsc_xiislogging[:dsc_logflags] = 'UserAgent'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['UserAgent'])
  end

  it 'should accept dsc_logflags predefined value useragent' do
    dsc_xiislogging[:dsc_logflags] = 'useragent'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['useragent'])
  end

  it 'should accept dsc_logflags predefined value Cookie' do
    dsc_xiislogging[:dsc_logflags] = 'Cookie'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['Cookie'])
  end

  it 'should accept dsc_logflags predefined value cookie' do
    dsc_xiislogging[:dsc_logflags] = 'cookie'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['cookie'])
  end

  it 'should accept dsc_logflags predefined value Referer' do
    dsc_xiislogging[:dsc_logflags] = 'Referer'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['Referer'])
  end

  it 'should accept dsc_logflags predefined value referer' do
    dsc_xiislogging[:dsc_logflags] = 'referer'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['referer'])
  end

  it 'should accept dsc_logflags predefined value ProtocolVersion' do
    dsc_xiislogging[:dsc_logflags] = 'ProtocolVersion'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['ProtocolVersion'])
  end

  it 'should accept dsc_logflags predefined value protocolversion' do
    dsc_xiislogging[:dsc_logflags] = 'protocolversion'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['protocolversion'])
  end

  it 'should accept dsc_logflags predefined value Host' do
    dsc_xiislogging[:dsc_logflags] = 'Host'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['Host'])
  end

  it 'should accept dsc_logflags predefined value host' do
    dsc_xiislogging[:dsc_logflags] = 'host'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['host'])
  end

  it 'should accept dsc_logflags predefined value HttpSubStatus' do
    dsc_xiislogging[:dsc_logflags] = 'HttpSubStatus'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['HttpSubStatus'])
  end

  it 'should accept dsc_logflags predefined value httpsubstatus' do
    dsc_xiislogging[:dsc_logflags] = 'httpsubstatus'
    expect(dsc_xiislogging[:dsc_logflags]).to eq(['httpsubstatus'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xiislogging[:dsc_logflags] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_logflags' do
    dsc_xiislogging[:dsc_logflags] = ["Date", "Time", "ClientIP", "UserName", "SiteName", "ComputerName", "ServerIP", "Method", "UriStem", "UriQuery", "HttpStatus", "Win32Status", "BytesSent", "BytesRecv", "TimeTaken", "ServerPort", "UserAgent", "Cookie", "Referer", "ProtocolVersion", "Host", "HttpSubStatus"]
    expect(dsc_xiislogging[:dsc_logflags]).to eq(["Date", "Time", "ClientIP", "UserName", "SiteName", "ComputerName", "ServerIP", "Method", "UriStem", "UriQuery", "HttpStatus", "Win32Status", "BytesSent", "BytesRecv", "TimeTaken", "ServerPort", "UserAgent", "Cookie", "Referer", "ProtocolVersion", "Host", "HttpSubStatus"])
  end

  it 'should not accept boolean for dsc_logflags' do
    expect{dsc_xiislogging[:dsc_logflags] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logflags' do
    expect{dsc_xiislogging[:dsc_logflags] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logflags' do
    expect{dsc_xiislogging[:dsc_logflags] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_logperiod predefined value Hourly' do
    dsc_xiislogging[:dsc_logperiod] = 'Hourly'
    expect(dsc_xiislogging[:dsc_logperiod]).to eq('Hourly')
  end

  it 'should accept dsc_logperiod predefined value hourly' do
    dsc_xiislogging[:dsc_logperiod] = 'hourly'
    expect(dsc_xiislogging[:dsc_logperiod]).to eq('hourly')
  end

  it 'should accept dsc_logperiod predefined value Daily' do
    dsc_xiislogging[:dsc_logperiod] = 'Daily'
    expect(dsc_xiislogging[:dsc_logperiod]).to eq('Daily')
  end

  it 'should accept dsc_logperiod predefined value daily' do
    dsc_xiislogging[:dsc_logperiod] = 'daily'
    expect(dsc_xiislogging[:dsc_logperiod]).to eq('daily')
  end

  it 'should accept dsc_logperiod predefined value Weekly' do
    dsc_xiislogging[:dsc_logperiod] = 'Weekly'
    expect(dsc_xiislogging[:dsc_logperiod]).to eq('Weekly')
  end

  it 'should accept dsc_logperiod predefined value weekly' do
    dsc_xiislogging[:dsc_logperiod] = 'weekly'
    expect(dsc_xiislogging[:dsc_logperiod]).to eq('weekly')
  end

  it 'should accept dsc_logperiod predefined value Monthly' do
    dsc_xiislogging[:dsc_logperiod] = 'Monthly'
    expect(dsc_xiislogging[:dsc_logperiod]).to eq('Monthly')
  end

  it 'should accept dsc_logperiod predefined value monthly' do
    dsc_xiislogging[:dsc_logperiod] = 'monthly'
    expect(dsc_xiislogging[:dsc_logperiod]).to eq('monthly')
  end

  it 'should accept dsc_logperiod predefined value MaxSize' do
    dsc_xiislogging[:dsc_logperiod] = 'MaxSize'
    expect(dsc_xiislogging[:dsc_logperiod]).to eq('MaxSize')
  end

  it 'should accept dsc_logperiod predefined value maxsize' do
    dsc_xiislogging[:dsc_logperiod] = 'maxsize'
    expect(dsc_xiislogging[:dsc_logperiod]).to eq('maxsize')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xiislogging[:dsc_logperiod] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logperiod' do
    expect{dsc_xiislogging[:dsc_logperiod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logperiod' do
    expect{dsc_xiislogging[:dsc_logperiod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logperiod' do
    expect{dsc_xiislogging[:dsc_logperiod] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logperiod' do
    expect{dsc_xiislogging[:dsc_logperiod] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logtruncatesize' do
    expect{dsc_xiislogging[:dsc_logtruncatesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logtruncatesize' do
    expect{dsc_xiislogging[:dsc_logtruncatesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logtruncatesize' do
    expect{dsc_xiislogging[:dsc_logtruncatesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logtruncatesize' do
    expect{dsc_xiislogging[:dsc_logtruncatesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_loglocaltimerollover' do
    expect{dsc_xiislogging[:dsc_loglocaltimerollover] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_loglocaltimerollover' do
    dsc_xiislogging[:dsc_loglocaltimerollover] = true
    expect(dsc_xiislogging[:dsc_loglocaltimerollover]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_loglocaltimerollover" do
    dsc_xiislogging[:dsc_loglocaltimerollover] = 'true'
    expect(dsc_xiislogging[:dsc_loglocaltimerollover]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_loglocaltimerollover" do
    dsc_xiislogging[:dsc_loglocaltimerollover] = 'false'
    expect(dsc_xiislogging[:dsc_loglocaltimerollover]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_loglocaltimerollover" do
    dsc_xiislogging[:dsc_loglocaltimerollover] = 'True'
    expect(dsc_xiislogging[:dsc_loglocaltimerollover]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_loglocaltimerollover" do
    dsc_xiislogging[:dsc_loglocaltimerollover] = 'False'
    expect(dsc_xiislogging[:dsc_loglocaltimerollover]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_loglocaltimerollover" do
    dsc_xiislogging[:dsc_loglocaltimerollover] = :true
    expect(dsc_xiislogging[:dsc_loglocaltimerollover]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_loglocaltimerollover" do
    dsc_xiislogging[:dsc_loglocaltimerollover] = :false
    expect(dsc_xiislogging[:dsc_loglocaltimerollover]).to eq(false)
  end

  it 'should not accept int for dsc_loglocaltimerollover' do
    expect{dsc_xiislogging[:dsc_loglocaltimerollover] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_loglocaltimerollover' do
    expect{dsc_xiislogging[:dsc_loglocaltimerollover] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_logformat predefined value IIS' do
    dsc_xiislogging[:dsc_logformat] = 'IIS'
    expect(dsc_xiislogging[:dsc_logformat]).to eq('IIS')
  end

  it 'should accept dsc_logformat predefined value iis' do
    dsc_xiislogging[:dsc_logformat] = 'iis'
    expect(dsc_xiislogging[:dsc_logformat]).to eq('iis')
  end

  it 'should accept dsc_logformat predefined value W3C' do
    dsc_xiislogging[:dsc_logformat] = 'W3C'
    expect(dsc_xiislogging[:dsc_logformat]).to eq('W3C')
  end

  it 'should accept dsc_logformat predefined value w3c' do
    dsc_xiislogging[:dsc_logformat] = 'w3c'
    expect(dsc_xiislogging[:dsc_logformat]).to eq('w3c')
  end

  it 'should accept dsc_logformat predefined value NCSA' do
    dsc_xiislogging[:dsc_logformat] = 'NCSA'
    expect(dsc_xiislogging[:dsc_logformat]).to eq('NCSA')
  end

  it 'should accept dsc_logformat predefined value ncsa' do
    dsc_xiislogging[:dsc_logformat] = 'ncsa'
    expect(dsc_xiislogging[:dsc_logformat]).to eq('ncsa')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xiislogging[:dsc_logformat] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logformat' do
    expect{dsc_xiislogging[:dsc_logformat] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logformat' do
    expect{dsc_xiislogging[:dsc_logformat] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logformat' do
    expect{dsc_xiislogging[:dsc_logformat] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logformat' do
    expect{dsc_xiislogging[:dsc_logformat] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xiislogging)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xiislogging)
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

  end
end
