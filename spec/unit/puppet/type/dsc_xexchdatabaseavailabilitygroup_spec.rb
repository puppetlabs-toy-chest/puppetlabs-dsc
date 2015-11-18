#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchdatabaseavailabilitygroup) do

  let :dsc_xexchdatabaseavailabilitygroup do
    Puppet::Type.type(:dsc_xexchdatabaseavailabilitygroup).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchdatabaseavailabilitygroup.to_s).to eq("Dsc_xexchdatabaseavailabilitygroup[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xexchdatabaseavailabilitygroup[:dsc_name]
    expect { Puppet::Type.type(:dsc_xexchdatabaseavailabilitygroup).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_autodagtotalnumberofservers => -32,
      :dsc_alternatewitnessdirectory => 'foo',
      :dsc_alternatewitnessserver => 'foo',
      :dsc_autodagautoreseedenabled => true,
      :dsc_autodagdatabasecopiesperdatabase => -32,
      :dsc_autodagdatabasecopiespervolume => -32,
      :dsc_autodagdatabasesrootfolderpath => 'foo',
      :dsc_autodagdiskreclaimerenabled => true,
      :dsc_autodagtotalnumberofdatabases => -32,
      :dsc_autodagvolumesrootfolderpath => 'foo',
      :dsc_databaseavailabilitygroupipaddresses => ["foo", "bar", "spec"],
      :dsc_datacenteractivationmode => 'Off',
      :dsc_domaincontroller => 'foo',
      :dsc_manualdagnetworkconfiguration => true,
      :dsc_networkcompression => 'Disabled',
      :dsc_networkencryption => 'Disabled',
      :dsc_replaylagmanagerenabled => true,
      :dsc_replicationport => 16,
      :dsc_skipdagvalidation => true,
      :dsc_witnessdirectory => 'foo',
      :dsc_witnessserver => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autodagtotalnumberofservers' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofservers] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autodagtotalnumberofservers' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofservers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_autodagtotalnumberofservers' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofservers] = -32
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofservers]).to eq(-32)
  end

  it 'should accept string-like int for dsc_autodagtotalnumberofservers' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofservers] = '16'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofservers]).to eq(16)
  end

  it 'should accept string-like int for dsc_autodagtotalnumberofservers' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofservers] = '-16'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofservers]).to eq(-16)
  end

  it 'should accept string-like int for dsc_autodagtotalnumberofservers' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofservers] = '32'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofservers]).to eq(32)
  end

  it 'should accept string-like int for dsc_autodagtotalnumberofservers' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofservers] = '-32'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofservers]).to eq(-32)
  end


  it 'should not accept array for dsc_alternatewitnessdirectory' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_alternatewitnessdirectory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_alternatewitnessdirectory' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_alternatewitnessdirectory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_alternatewitnessdirectory' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_alternatewitnessdirectory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_alternatewitnessdirectory' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_alternatewitnessdirectory] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_alternatewitnessserver' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_alternatewitnessserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_alternatewitnessserver' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_alternatewitnessserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_alternatewitnessserver' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_alternatewitnessserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_alternatewitnessserver' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_alternatewitnessserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autodagautoreseedenabled' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_autodagautoreseedenabled' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled] = true
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_autodagautoreseedenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled] = 'true'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_autodagautoreseedenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled] = 'false'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_autodagautoreseedenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled] = 'True'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_autodagautoreseedenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled] = 'False'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_autodagautoreseedenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled] = :true
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_autodagautoreseedenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled] = :false
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled]).to eq(false)
  end

  it 'should not accept int for dsc_autodagautoreseedenabled' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autodagautoreseedenabled' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagautoreseedenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autodagdatabasecopiesperdatabase' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiesperdatabase] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autodagdatabasecopiesperdatabase' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiesperdatabase] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_autodagdatabasecopiesperdatabase' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiesperdatabase] = -32
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiesperdatabase]).to eq(-32)
  end

  it 'should accept string-like int for dsc_autodagdatabasecopiesperdatabase' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiesperdatabase] = '16'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiesperdatabase]).to eq(16)
  end

  it 'should accept string-like int for dsc_autodagdatabasecopiesperdatabase' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiesperdatabase] = '-16'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiesperdatabase]).to eq(-16)
  end

  it 'should accept string-like int for dsc_autodagdatabasecopiesperdatabase' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiesperdatabase] = '32'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiesperdatabase]).to eq(32)
  end

  it 'should accept string-like int for dsc_autodagdatabasecopiesperdatabase' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiesperdatabase] = '-32'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiesperdatabase]).to eq(-32)
  end


  it 'should not accept array for dsc_autodagdatabasecopiespervolume' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiespervolume] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autodagdatabasecopiespervolume' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiespervolume] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_autodagdatabasecopiespervolume' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiespervolume] = -32
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiespervolume]).to eq(-32)
  end

  it 'should accept string-like int for dsc_autodagdatabasecopiespervolume' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiespervolume] = '16'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiespervolume]).to eq(16)
  end

  it 'should accept string-like int for dsc_autodagdatabasecopiespervolume' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiespervolume] = '-16'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiespervolume]).to eq(-16)
  end

  it 'should accept string-like int for dsc_autodagdatabasecopiespervolume' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiespervolume] = '32'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiespervolume]).to eq(32)
  end

  it 'should accept string-like int for dsc_autodagdatabasecopiespervolume' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiespervolume] = '-32'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasecopiespervolume]).to eq(-32)
  end


  it 'should not accept array for dsc_autodagdatabasesrootfolderpath' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasesrootfolderpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autodagdatabasesrootfolderpath' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasesrootfolderpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_autodagdatabasesrootfolderpath' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasesrootfolderpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autodagdatabasesrootfolderpath' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdatabasesrootfolderpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autodagdiskreclaimerenabled' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_autodagdiskreclaimerenabled' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled] = true
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_autodagdiskreclaimerenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled] = 'true'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_autodagdiskreclaimerenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled] = 'false'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_autodagdiskreclaimerenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled] = 'True'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_autodagdiskreclaimerenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled] = 'False'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_autodagdiskreclaimerenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled] = :true
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_autodagdiskreclaimerenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled] = :false
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled]).to eq(false)
  end

  it 'should not accept int for dsc_autodagdiskreclaimerenabled' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autodagdiskreclaimerenabled' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagdiskreclaimerenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autodagtotalnumberofdatabases' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofdatabases] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autodagtotalnumberofdatabases' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofdatabases] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_autodagtotalnumberofdatabases' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofdatabases] = -32
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofdatabases]).to eq(-32)
  end

  it 'should accept string-like int for dsc_autodagtotalnumberofdatabases' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofdatabases] = '16'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofdatabases]).to eq(16)
  end

  it 'should accept string-like int for dsc_autodagtotalnumberofdatabases' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofdatabases] = '-16'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofdatabases]).to eq(-16)
  end

  it 'should accept string-like int for dsc_autodagtotalnumberofdatabases' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofdatabases] = '32'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofdatabases]).to eq(32)
  end

  it 'should accept string-like int for dsc_autodagtotalnumberofdatabases' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofdatabases] = '-32'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_autodagtotalnumberofdatabases]).to eq(-32)
  end


  it 'should not accept array for dsc_autodagvolumesrootfolderpath' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagvolumesrootfolderpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autodagvolumesrootfolderpath' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagvolumesrootfolderpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_autodagvolumesrootfolderpath' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagvolumesrootfolderpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autodagvolumesrootfolderpath' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_autodagvolumesrootfolderpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_databaseavailabilitygroupipaddresses' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_databaseavailabilitygroupipaddresses] = ["foo", "bar", "spec"]
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_databaseavailabilitygroupipaddresses]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_databaseavailabilitygroupipaddresses' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_databaseavailabilitygroupipaddresses] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseavailabilitygroupipaddresses' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_databaseavailabilitygroupipaddresses] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseavailabilitygroupipaddresses' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_databaseavailabilitygroupipaddresses] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_datacenteractivationmode predefined value Off' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_datacenteractivationmode] = 'Off'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_datacenteractivationmode]).to eq('Off')
  end

  it 'should accept dsc_datacenteractivationmode predefined value off' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_datacenteractivationmode] = 'off'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_datacenteractivationmode]).to eq('off')
  end

  it 'should accept dsc_datacenteractivationmode predefined value DagOnly' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_datacenteractivationmode] = 'DagOnly'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_datacenteractivationmode]).to eq('DagOnly')
  end

  it 'should accept dsc_datacenteractivationmode predefined value dagonly' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_datacenteractivationmode] = 'dagonly'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_datacenteractivationmode]).to eq('dagonly')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_datacenteractivationmode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_datacenteractivationmode' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_datacenteractivationmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_datacenteractivationmode' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_datacenteractivationmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_datacenteractivationmode' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_datacenteractivationmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_datacenteractivationmode' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_datacenteractivationmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_manualdagnetworkconfiguration' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_manualdagnetworkconfiguration' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration] = true
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_manualdagnetworkconfiguration" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration] = 'true'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_manualdagnetworkconfiguration" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration] = 'false'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_manualdagnetworkconfiguration" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration] = 'True'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_manualdagnetworkconfiguration" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration] = 'False'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_manualdagnetworkconfiguration" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration] = :true
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_manualdagnetworkconfiguration" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration] = :false
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration]).to eq(false)
  end

  it 'should not accept int for dsc_manualdagnetworkconfiguration' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_manualdagnetworkconfiguration' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_manualdagnetworkconfiguration] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_networkcompression predefined value Disabled' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression] = 'Disabled'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression]).to eq('Disabled')
  end

  it 'should accept dsc_networkcompression predefined value disabled' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression] = 'disabled'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression]).to eq('disabled')
  end

  it 'should accept dsc_networkcompression predefined value Enabled' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression] = 'Enabled'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression]).to eq('Enabled')
  end

  it 'should accept dsc_networkcompression predefined value enabled' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression] = 'enabled'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression]).to eq('enabled')
  end

  it 'should accept dsc_networkcompression predefined value InterSubnetOnly' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression] = 'InterSubnetOnly'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression]).to eq('InterSubnetOnly')
  end

  it 'should accept dsc_networkcompression predefined value intersubnetonly' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression] = 'intersubnetonly'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression]).to eq('intersubnetonly')
  end

  it 'should accept dsc_networkcompression predefined value SeedOnly' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression] = 'SeedOnly'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression]).to eq('SeedOnly')
  end

  it 'should accept dsc_networkcompression predefined value seedonly' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression] = 'seedonly'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression]).to eq('seedonly')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_networkcompression' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_networkcompression' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_networkcompression' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_networkcompression' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_networkcompression] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_networkencryption predefined value Disabled' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption] = 'Disabled'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption]).to eq('Disabled')
  end

  it 'should accept dsc_networkencryption predefined value disabled' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption] = 'disabled'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption]).to eq('disabled')
  end

  it 'should accept dsc_networkencryption predefined value Enabled' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption] = 'Enabled'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption]).to eq('Enabled')
  end

  it 'should accept dsc_networkencryption predefined value enabled' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption] = 'enabled'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption]).to eq('enabled')
  end

  it 'should accept dsc_networkencryption predefined value InterSubnetOnly' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption] = 'InterSubnetOnly'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption]).to eq('InterSubnetOnly')
  end

  it 'should accept dsc_networkencryption predefined value intersubnetonly' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption] = 'intersubnetonly'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption]).to eq('intersubnetonly')
  end

  it 'should accept dsc_networkencryption predefined value SeedOnly' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption] = 'SeedOnly'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption]).to eq('SeedOnly')
  end

  it 'should accept dsc_networkencryption predefined value seedonly' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption] = 'seedonly'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption]).to eq('seedonly')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_networkencryption' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_networkencryption' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_networkencryption' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_networkencryption' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_networkencryption] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_replaylagmanagerenabled' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_replaylagmanagerenabled' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled] = true
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_replaylagmanagerenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled] = 'true'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_replaylagmanagerenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled] = 'false'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_replaylagmanagerenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled] = 'True'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_replaylagmanagerenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled] = 'False'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_replaylagmanagerenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled] = :true
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_replaylagmanagerenabled" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled] = :false
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled]).to eq(false)
  end

  it 'should not accept int for dsc_replaylagmanagerenabled' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_replaylagmanagerenabled' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_replaylagmanagerenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_replicationport' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_replicationport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_replicationport' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_replicationport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_replicationport' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_replicationport] = 16
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_replicationport]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_replicationport' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_replicationport] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_replicationport' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_replicationport] = '16'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_replicationport]).to eq(16)
  end

  it 'should accept string-like uint for dsc_replicationport' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_replicationport] = '32'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_replicationport]).to eq(32)
  end

  it 'should accept string-like uint for dsc_replicationport' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_replicationport] = '64'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_replicationport]).to eq(64)
  end

  it 'should not accept array for dsc_skipdagvalidation' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_skipdagvalidation' do
    dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation] = true
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_skipdagvalidation" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation] = 'true'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_skipdagvalidation" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation] = 'false'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_skipdagvalidation" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation] = 'True'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_skipdagvalidation" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation] = 'False'
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_skipdagvalidation" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation] = :true
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_skipdagvalidation" do
    dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation] = :false
    expect(dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation]).to eq(false)
  end

  it 'should not accept int for dsc_skipdagvalidation' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_skipdagvalidation' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_skipdagvalidation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_witnessdirectory' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_witnessdirectory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_witnessdirectory' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_witnessdirectory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_witnessdirectory' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_witnessdirectory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_witnessdirectory' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_witnessdirectory] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_witnessserver' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_witnessserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_witnessserver' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_witnessserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_witnessserver' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_witnessserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_witnessserver' do
    expect{dsc_xexchdatabaseavailabilitygroup[:dsc_witnessserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchdatabaseavailabilitygroup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchdatabaseavailabilitygroup)
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
