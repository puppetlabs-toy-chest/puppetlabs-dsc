module PuppetX
  module Dsc
    class TypeHelpers
      def self.munge_boolean(value)
        return true if value =~ (/^(true|t|yes|y|1)$/i)
        return false if value.empty? || value =~ (/^(false|f|no|n|0)$/i)

        raise ArgumentError.new "invalid value: #{value}"
      end

      def self.munge_embeddedinstance(mof_type, embeddedinstance_value)
        remapped_value = embeddedinstance_value.map do |key, value|
          if mof_type[key.downcase]
            case mof_type[key.downcase][:type]
            when "bool", "boolean"
              value = munge_boolean(value.to_s)
            # particularly important to Puppet 3.x which parses numbers as strings
            when "uint8","uint16","uint32","uint64",
              "uint8[]","uint16[]","uint32[]","uint64[]",
              "int16","int32","int64",
              "sint16","sint32","sint64",
              "int16[]","int32[]","int64[]"

              unless Array(value).all? { |v| v.is_a?(Numeric) || v =~ /^[-+]?\d+$/ }
                fail "#{key} should only include numeric values: invalid value #{value}"
              end

              value = value.is_a?(Array) ? value.map { |v| v.to_i } : value.to_i
            end
          end

          [key, value]
        end

        Hash[remapped_value]
      end
    end
  end
end
