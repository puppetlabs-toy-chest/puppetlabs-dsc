#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_archive) do
  let :dsc_archive do
    Puppet::Type.type(:dsc_archive).new(
      :name     => 'foo',
      :dsc_path => 'foo',
      :dsc_destination => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_archive.to_s).to eq("Dsc_archive[foo]")
  end

  # required attributes
  it 'should require that dsc_path is specified' do
    #dsc_archive[:dsc_path]
    expect { Puppet::Type.type(:dsc_archive).new(
      :name     => 'foo',
      :dsc_destination => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_path is a required attribute/)
  end
  it 'should require that dsc_destination is specified' do
    #dsc_archive[:dsc_destination]
    expect { Puppet::Type.type(:dsc_archive).new(
      :name     => 'foo',
      :dsc_path => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_destination is a required attribute/)
  end

  it 'should accept predefined value SHA-1' do
    dsc_archive[:dsc_checksum] = 'SHA-1'
    expect(dsc_archive[:dsc_checksum]).to eq(:'SHA-1')
  end

  it 'should accept predefined value SHA-256' do
    dsc_archive[:dsc_checksum] = 'SHA-256'
    expect(dsc_archive[:dsc_checksum]).to eq(:'SHA-256')
  end

  it 'should accept predefined value SHA-512' do
    dsc_archive[:dsc_checksum] = 'SHA-512'
    expect(dsc_archive[:dsc_checksum]).to eq(:'SHA-512')
  end

  it 'should accept predefined value CreatedDate' do
    dsc_archive[:dsc_checksum] = 'CreatedDate'
    expect(dsc_archive[:dsc_checksum]).to eq(:'CreatedDate')
  end

  it 'should accept predefined value ModifiedDate' do
    dsc_archive[:dsc_checksum] = 'ModifiedDate'
    expect(dsc_archive[:dsc_checksum]).to eq(:'ModifiedDate')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_archive[:dsc_checksum] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should default to ensure => present' do
    expect(dsc_archive[:ensure]).to eq :present
  end

  it 'should not accept dsc_ensure and notify about using ensure insteed' do
    expect{dsc_archive[:dsc_ensure] = 'present'}.to raise_error(Puppet::ResourceError, /Please use 'ensure => present' or 'ensure => absent' insteed of 'dsc_ensure'/)
  end

  # it 'should accept dsc_name' do
  #   dsc_archive[:dsc_name] = 'my_string'
  #   expect(dsc_archive[:dsc_name]).to eq('my_string')
  # end

end
