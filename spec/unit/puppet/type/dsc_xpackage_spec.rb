#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xpackage) do

  let :dsc_xpackage do
    Puppet::Type.type(:dsc_xpackage).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_productid => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xpackage.to_s).to eq("Dsc_xpackage[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xpackage[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xpackage[:dsc_ensure] = 'Present'
    expect(dsc_xpackage[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xpackage[:dsc_ensure] = 'present'
    expect(dsc_xpackage[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xpackage[:dsc_ensure] = 'present'
    expect(dsc_xpackage[:ensure]).to eq(dsc_xpackage[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xpackage[:dsc_ensure] = 'Absent'
    expect(dsc_xpackage[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xpackage[:dsc_ensure] = 'absent'
    expect(dsc_xpackage[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xpackage[:dsc_ensure] = 'absent'
    expect(dsc_xpackage[:ensure]).to eq(dsc_xpackage[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xpackage[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xpackage[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xpackage[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xpackage[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xpackage[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_name is specified' do
    #dsc_xpackage[:dsc_name]
    expect { Puppet::Type.type(:dsc_xpackage).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_path => 'foo',
      :dsc_productid => 'foo',
      :dsc_arguments => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_returncode => [32, 64, 128],
      :dsc_logpath => 'foo',
      :dsc_packagedescription => 'foo',
      :dsc_publisher => 'foo',
      :dsc_installedon => 'foo',
      :dsc_size => 32,
      :dsc_version => 'foo',
      :dsc_installed => true,
      :dsc_runascredential => {"user"=>"user", "password"=>"password"},
      :dsc_filehash => 'foo',
      :dsc_hashalgorithm => 'SHA1',
      :dsc_signersubject => 'foo',
      :dsc_signerthumbprint => 'foo',
      :dsc_servercertificatevalidationcallback => 'foo',
      :dsc_installedcheckreghive => 'LocalMachine',
      :dsc_installedcheckregkey => 'foo',
      :dsc_installedcheckregvaluename => 'foo',
      :dsc_installedcheckregvaluedata => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xpackage[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xpackage[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xpackage[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xpackage[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xpackage[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xpackage[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xpackage[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xpackage[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_productid is specified' do
    #dsc_xpackage[:dsc_productid]
    expect { Puppet::Type.type(:dsc_xpackage).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_name => 'foo',
      :dsc_path => 'foo',
      :dsc_arguments => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_returncode => [32, 64, 128],
      :dsc_logpath => 'foo',
      :dsc_packagedescription => 'foo',
      :dsc_publisher => 'foo',
      :dsc_installedon => 'foo',
      :dsc_size => 32,
      :dsc_version => 'foo',
      :dsc_installed => true,
      :dsc_runascredential => {"user"=>"user", "password"=>"password"},
      :dsc_filehash => 'foo',
      :dsc_hashalgorithm => 'SHA1',
      :dsc_signersubject => 'foo',
      :dsc_signerthumbprint => 'foo',
      :dsc_servercertificatevalidationcallback => 'foo',
      :dsc_installedcheckreghive => 'LocalMachine',
      :dsc_installedcheckregkey => 'foo',
      :dsc_installedcheckregvaluename => 'foo',
      :dsc_installedcheckregvaluedata => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_productid is a required attribute/)
  end

  it 'should not accept array for dsc_productid' do
    expect{dsc_xpackage[:dsc_productid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_productid' do
    expect{dsc_xpackage[:dsc_productid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_productid' do
    expect{dsc_xpackage[:dsc_productid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_productid' do
    expect{dsc_xpackage[:dsc_productid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_arguments' do
    expect{dsc_xpackage[:dsc_arguments] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_arguments' do
    expect{dsc_xpackage[:dsc_arguments] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_arguments' do
    expect{dsc_xpackage[:dsc_arguments] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_arguments' do
    expect{dsc_xpackage[:dsc_arguments] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xpackage[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xpackage[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xpackage[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xpackage[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xpackage[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_returncode' do
    dsc_xpackage[:dsc_returncode] = [32, 64, 128]
    expect(dsc_xpackage[:dsc_returncode]).to eq([32, 64, 128])
  end

  it 'should not accept boolean for dsc_returncode' do
    expect{dsc_xpackage[:dsc_returncode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_returncode' do
    dsc_xpackage[:dsc_returncode] = 32
    expect(dsc_xpackage[:dsc_returncode]).to eq([32])
  end

  it 'should not accept signed (negative) value for dsc_returncode' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xpackage[:dsc_returncode] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_returncode' do
    dsc_xpackage[:dsc_returncode] = '16'
    expect(dsc_xpackage[:dsc_returncode]).to eq([16])
  end

  it 'should accept string-like uint for dsc_returncode' do
    dsc_xpackage[:dsc_returncode] = '32'
    expect(dsc_xpackage[:dsc_returncode]).to eq([32])
  end

  it 'should accept string-like uint for dsc_returncode' do
    dsc_xpackage[:dsc_returncode] = '64'
    expect(dsc_xpackage[:dsc_returncode]).to eq([64])
  end

  it 'should accept uint[] for dsc_returncode' do
    dsc_xpackage[:dsc_returncode] = [32, 64, 128]
    expect(dsc_xpackage[:dsc_returncode]).to eq([32, 64, 128])
  end

  it 'should accept string-like uint[] for dsc_returncode' do
    dsc_xpackage[:dsc_returncode] = ["16", "32", "64"]
    expect(dsc_xpackage[:dsc_returncode]).to eq([16, 32, 64])
  end

  it 'should not accept array for dsc_logpath' do
    expect{dsc_xpackage[:dsc_logpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logpath' do
    expect{dsc_xpackage[:dsc_logpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logpath' do
    expect{dsc_xpackage[:dsc_logpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logpath' do
    expect{dsc_xpackage[:dsc_logpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_packagedescription' do
    expect{dsc_xpackage[:dsc_packagedescription] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_packagedescription' do
    expect{dsc_xpackage[:dsc_packagedescription] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_packagedescription' do
    expect{dsc_xpackage[:dsc_packagedescription] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_packagedescription' do
    expect{dsc_xpackage[:dsc_packagedescription] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_publisher' do
    expect{dsc_xpackage[:dsc_publisher] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_publisher' do
    expect{dsc_xpackage[:dsc_publisher] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_publisher' do
    expect{dsc_xpackage[:dsc_publisher] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_publisher' do
    expect{dsc_xpackage[:dsc_publisher] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installedon' do
    expect{dsc_xpackage[:dsc_installedon] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installedon' do
    expect{dsc_xpackage[:dsc_installedon] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installedon' do
    expect{dsc_xpackage[:dsc_installedon] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installedon' do
    expect{dsc_xpackage[:dsc_installedon] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_size' do
    expect{dsc_xpackage[:dsc_size] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_size' do
    expect{dsc_xpackage[:dsc_size] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_size' do
    dsc_xpackage[:dsc_size] = 32
    expect(dsc_xpackage[:dsc_size]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_size' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xpackage[:dsc_size] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_size' do
    dsc_xpackage[:dsc_size] = '16'
    expect(dsc_xpackage[:dsc_size]).to eq(16)
  end

  it 'should accept string-like uint for dsc_size' do
    dsc_xpackage[:dsc_size] = '32'
    expect(dsc_xpackage[:dsc_size]).to eq(32)
  end

  it 'should accept string-like uint for dsc_size' do
    dsc_xpackage[:dsc_size] = '64'
    expect(dsc_xpackage[:dsc_size]).to eq(64)
  end

  it 'should not accept array for dsc_version' do
    expect{dsc_xpackage[:dsc_version] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_version' do
    expect{dsc_xpackage[:dsc_version] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_version' do
    expect{dsc_xpackage[:dsc_version] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_version' do
    expect{dsc_xpackage[:dsc_version] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installed' do
    expect{dsc_xpackage[:dsc_installed] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_installed' do
    dsc_xpackage[:dsc_installed] = true
    expect(dsc_xpackage[:dsc_installed]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_installed" do
    dsc_xpackage[:dsc_installed] = 'true'
    expect(dsc_xpackage[:dsc_installed]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_installed" do
    dsc_xpackage[:dsc_installed] = 'false'
    expect(dsc_xpackage[:dsc_installed]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_installed" do
    dsc_xpackage[:dsc_installed] = 'True'
    expect(dsc_xpackage[:dsc_installed]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_installed" do
    dsc_xpackage[:dsc_installed] = 'False'
    expect(dsc_xpackage[:dsc_installed]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_installed" do
    dsc_xpackage[:dsc_installed] = :true
    expect(dsc_xpackage[:dsc_installed]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_installed" do
    dsc_xpackage[:dsc_installed] = :false
    expect(dsc_xpackage[:dsc_installed]).to eq(false)
  end

  it 'should not accept int for dsc_installed' do
    expect{dsc_xpackage[:dsc_installed] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installed' do
    expect{dsc_xpackage[:dsc_installed] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_runascredential" do
    expect{dsc_xpackage[:dsc_runascredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_runascredential' do
    expect{dsc_xpackage[:dsc_runascredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_runascredential' do
    expect{dsc_xpackage[:dsc_runascredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_runascredential' do
    expect{dsc_xpackage[:dsc_runascredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_runascredential' do
    expect{dsc_xpackage[:dsc_runascredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_filehash' do
    expect{dsc_xpackage[:dsc_filehash] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_filehash' do
    expect{dsc_xpackage[:dsc_filehash] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_filehash' do
    expect{dsc_xpackage[:dsc_filehash] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_filehash' do
    expect{dsc_xpackage[:dsc_filehash] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_hashalgorithm predefined value SHA1' do
    dsc_xpackage[:dsc_hashalgorithm] = 'SHA1'
    expect(dsc_xpackage[:dsc_hashalgorithm]).to eq('SHA1')
  end

  it 'should accept dsc_hashalgorithm predefined value sha1' do
    dsc_xpackage[:dsc_hashalgorithm] = 'sha1'
    expect(dsc_xpackage[:dsc_hashalgorithm]).to eq('sha1')
  end

  it 'should accept dsc_hashalgorithm predefined value SHA256' do
    dsc_xpackage[:dsc_hashalgorithm] = 'SHA256'
    expect(dsc_xpackage[:dsc_hashalgorithm]).to eq('SHA256')
  end

  it 'should accept dsc_hashalgorithm predefined value sha256' do
    dsc_xpackage[:dsc_hashalgorithm] = 'sha256'
    expect(dsc_xpackage[:dsc_hashalgorithm]).to eq('sha256')
  end

  it 'should accept dsc_hashalgorithm predefined value SHA384' do
    dsc_xpackage[:dsc_hashalgorithm] = 'SHA384'
    expect(dsc_xpackage[:dsc_hashalgorithm]).to eq('SHA384')
  end

  it 'should accept dsc_hashalgorithm predefined value sha384' do
    dsc_xpackage[:dsc_hashalgorithm] = 'sha384'
    expect(dsc_xpackage[:dsc_hashalgorithm]).to eq('sha384')
  end

  it 'should accept dsc_hashalgorithm predefined value SHA512' do
    dsc_xpackage[:dsc_hashalgorithm] = 'SHA512'
    expect(dsc_xpackage[:dsc_hashalgorithm]).to eq('SHA512')
  end

  it 'should accept dsc_hashalgorithm predefined value sha512' do
    dsc_xpackage[:dsc_hashalgorithm] = 'sha512'
    expect(dsc_xpackage[:dsc_hashalgorithm]).to eq('sha512')
  end

  it 'should accept dsc_hashalgorithm predefined value MD5' do
    dsc_xpackage[:dsc_hashalgorithm] = 'MD5'
    expect(dsc_xpackage[:dsc_hashalgorithm]).to eq('MD5')
  end

  it 'should accept dsc_hashalgorithm predefined value md5' do
    dsc_xpackage[:dsc_hashalgorithm] = 'md5'
    expect(dsc_xpackage[:dsc_hashalgorithm]).to eq('md5')
  end

  it 'should accept dsc_hashalgorithm predefined value RIPEMD160' do
    dsc_xpackage[:dsc_hashalgorithm] = 'RIPEMD160'
    expect(dsc_xpackage[:dsc_hashalgorithm]).to eq('RIPEMD160')
  end

  it 'should accept dsc_hashalgorithm predefined value ripemd160' do
    dsc_xpackage[:dsc_hashalgorithm] = 'ripemd160'
    expect(dsc_xpackage[:dsc_hashalgorithm]).to eq('ripemd160')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xpackage[:dsc_hashalgorithm] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_hashalgorithm' do
    expect{dsc_xpackage[:dsc_hashalgorithm] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_hashalgorithm' do
    expect{dsc_xpackage[:dsc_hashalgorithm] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_hashalgorithm' do
    expect{dsc_xpackage[:dsc_hashalgorithm] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_hashalgorithm' do
    expect{dsc_xpackage[:dsc_hashalgorithm] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_signersubject' do
    expect{dsc_xpackage[:dsc_signersubject] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_signersubject' do
    expect{dsc_xpackage[:dsc_signersubject] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_signersubject' do
    expect{dsc_xpackage[:dsc_signersubject] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_signersubject' do
    expect{dsc_xpackage[:dsc_signersubject] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_signerthumbprint' do
    expect{dsc_xpackage[:dsc_signerthumbprint] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_signerthumbprint' do
    expect{dsc_xpackage[:dsc_signerthumbprint] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_signerthumbprint' do
    expect{dsc_xpackage[:dsc_signerthumbprint] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_signerthumbprint' do
    expect{dsc_xpackage[:dsc_signerthumbprint] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_servercertificatevalidationcallback' do
    expect{dsc_xpackage[:dsc_servercertificatevalidationcallback] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servercertificatevalidationcallback' do
    expect{dsc_xpackage[:dsc_servercertificatevalidationcallback] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servercertificatevalidationcallback' do
    expect{dsc_xpackage[:dsc_servercertificatevalidationcallback] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servercertificatevalidationcallback' do
    expect{dsc_xpackage[:dsc_servercertificatevalidationcallback] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_installedcheckreghive predefined value LocalMachine' do
    dsc_xpackage[:dsc_installedcheckreghive] = 'LocalMachine'
    expect(dsc_xpackage[:dsc_installedcheckreghive]).to eq('LocalMachine')
  end

  it 'should accept dsc_installedcheckreghive predefined value localmachine' do
    dsc_xpackage[:dsc_installedcheckreghive] = 'localmachine'
    expect(dsc_xpackage[:dsc_installedcheckreghive]).to eq('localmachine')
  end

  it 'should accept dsc_installedcheckreghive predefined value CurrentUser' do
    dsc_xpackage[:dsc_installedcheckreghive] = 'CurrentUser'
    expect(dsc_xpackage[:dsc_installedcheckreghive]).to eq('CurrentUser')
  end

  it 'should accept dsc_installedcheckreghive predefined value currentuser' do
    dsc_xpackage[:dsc_installedcheckreghive] = 'currentuser'
    expect(dsc_xpackage[:dsc_installedcheckreghive]).to eq('currentuser')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xpackage[:dsc_installedcheckreghive] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installedcheckreghive' do
    expect{dsc_xpackage[:dsc_installedcheckreghive] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installedcheckreghive' do
    expect{dsc_xpackage[:dsc_installedcheckreghive] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installedcheckreghive' do
    expect{dsc_xpackage[:dsc_installedcheckreghive] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installedcheckreghive' do
    expect{dsc_xpackage[:dsc_installedcheckreghive] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installedcheckregkey' do
    expect{dsc_xpackage[:dsc_installedcheckregkey] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installedcheckregkey' do
    expect{dsc_xpackage[:dsc_installedcheckregkey] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installedcheckregkey' do
    expect{dsc_xpackage[:dsc_installedcheckregkey] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installedcheckregkey' do
    expect{dsc_xpackage[:dsc_installedcheckregkey] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installedcheckregvaluename' do
    expect{dsc_xpackage[:dsc_installedcheckregvaluename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installedcheckregvaluename' do
    expect{dsc_xpackage[:dsc_installedcheckregvaluename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installedcheckregvaluename' do
    expect{dsc_xpackage[:dsc_installedcheckregvaluename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installedcheckregvaluename' do
    expect{dsc_xpackage[:dsc_installedcheckregvaluename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installedcheckregvaluedata' do
    expect{dsc_xpackage[:dsc_installedcheckregvaluedata] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installedcheckregvaluedata' do
    expect{dsc_xpackage[:dsc_installedcheckregvaluedata] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installedcheckregvaluedata' do
    expect{dsc_xpackage[:dsc_installedcheckregvaluedata] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installedcheckregvaluedata' do
    expect{dsc_xpackage[:dsc_installedcheckregvaluedata] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xpackage)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xpackage)
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
        dsc_xpackage.original_parameters[:dsc_ensure] = 'present'
        dsc_xpackage[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xpackage)
      end

      it "should update :ensure to :present" do
        expect(dsc_xpackage[:ensure]).to eq(:present)
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
        dsc_xpackage.original_parameters[:dsc_ensure] = 'absent'
        dsc_xpackage[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xpackage)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xpackage[:ensure]).to eq(:absent)
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
