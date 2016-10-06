#! /usr/bin/env ruby
require 'spec_helper'
require 'puppet_x/puppetlabs/dsc_type_helpers'

describe PuppetX::Dsc::TypeHelpers do
  def format_type_value(type_value)
    case
    when type_value.class.name == 'Symbol'
      ":#{type_value}"
    when type_value.class.name == 'String'
      "'#{type_value}'"
    when type_value.class.name == 'Numeric'
      "#{type_value}"
    else
      type_value
    end
  end

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

  context "validate_type_value" do
    [true, false].each do |bool|
      it 'should accept boolean values' do
        value = format_type_value(bool)
        expect(described_class.validate_type_value('boolean', value)).to eq(bool)
      end
    end
  end
end
