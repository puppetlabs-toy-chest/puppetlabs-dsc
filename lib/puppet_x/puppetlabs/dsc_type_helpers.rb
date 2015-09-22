module PuppetX
  module Dsc
    class TypeHelpers
      def self.munge_boolean(value)
        return true if value =~ (/^(true|t|yes|y|1)$/i)
        return false if value.empty? || value =~ (/^(false|f|no|n|0)$/i)

        raise ArgumentError.new "invalid value: #{value}"
      end
    end
  end
end
