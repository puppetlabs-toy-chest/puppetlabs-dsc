#! /usr/bin/env ruby
require 'spec_helper'
require 'puppet_x/puppetlabs/dsc_type_helpers'

describe PuppetX::Dsc::TypeHelpers do
  context 'when munging' do
    ['true', 'True', :true].each do |value|
      it 'munge_boolean should create a valid bool for input #{value}' do
        expect(described_class.munge_boolean(value)).to eq(true)
      end
    end
    ['false', 'False', :false].each do |value|
      it 'munge_boolean should create a valid bool for input #{value}' do
        expect(described_class.munge_boolean(value)).to eq(false)
      end
    end
  end
end
