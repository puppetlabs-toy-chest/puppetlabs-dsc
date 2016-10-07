#! /usr/bin/env ruby
require 'spec_helper'
require 'puppet_x/puppetlabs/dsc_type_helpers'

describe PuppetX::Dsc::TypeHelpers do
  class SpecValues
    @spec_test_values         = {
      'int8'     => -16,
      'int8[]'   => [-128, 0, 127],
      'int16'    => -16,
      'int16[]'  => [-16, 32, -64],
      'int32'    => -32,
      'int32[]'  => [-32, 64, -128],
      'int64'    => -64,
      'int64[]'  => [-64, 128, -256],
      'sint8'     => -128,
      'sint8[]'   => [-128, 0, 127],
      'sint16'    => -16,
      'sint16[]'  => [-16, 32, -64],
      'sint32'    => -32,
      'sint32[]'  => [-32, 64, -128],
      'sint64'    => -64,
      'sint64[]'  => [-64, 128, -256],
      'uint8'    => 1,
      'uint8[]'  => [0, 16, 255],
      'uint16'   => 16,
      'uint16[]' => [16, 32, 64],
      'uint32'   => 32,
      'uint32[]' => [32, 64, 128],
      'uint64'   => 64,
      'uint64[]' => [64, 128, 256],
    }

    def self.get_test_value(type)
      @spec_test_values[type]
    end
  end

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

    {'32' => 32, '-32' => -32, ['1', '-1'] => [1, -1]}.each do |k, v|
      it "converts #{k.class} #{k} to #{v.class} #{v}" do
        expect(PuppetX::Dsc::TypeHelpers.munge_integer(k)).to eq(v)
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

    [
      'int8', 'int8[]', 'int16', 'int16[]', 'int32', 'int32[]', 'int64', 'int64[]',
      'sint8', 'sint8[]', 'sint16', 'sint16[]', 'sint32', 'sint32[]', 'sint64', 'sint64[]',
      'uint8', 'uint8[]', 'uint16', 'uint16[]', 'uint32', 'uint32[]', 'uint64', 'uint64[]',
    ].each do |numeric_type|
      values = SpecValues.get_test_value(numeric_type)

      Array(values).each do |value|
        it "should consider #{value} a valid #{numeric_type}" do
          expect { described_class.validate_type_value(numeric_type, value) }.not_to raise_error
        end
      end

      is_array_type = numeric_type.end_with?('[]')
      if is_array_type
        it "should consider an array of values #{values} a valid #{numeric_type}" do
          expect { described_class.validate_type_value(numeric_type, values) }.not_to raise_error
        end
      end

      it "should not consider true a valid #{numeric_type}" do
        expect { described_class.validate_type_value(numeric_type, true) }.to raise_error(RuntimeError)
      end

      is_unsigned = numeric_type.start_with?('u')
      if is_unsigned
        it "should not consider signed (negative) value a valid #{numeric_type}" do
          value = -32
          expect(value).to be < 0
          expect{ described_class.validate_type_value(numeric_type, value) }.to raise_error(RuntimeError)
        end
      end
    end
  end
end
