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

  # it 'should default to ensure => present' do
  #   expect(dsc_archive[:ensure]).to eq :present
  # end

  # it 'should accept dsc_name' do
  #   dsc_archive[:dsc_name] = 'my_string'
  #   expect(dsc_archive[:dsc_name]).to eq('my_string')
  # end

end
