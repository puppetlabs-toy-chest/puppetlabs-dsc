module Puppet_x
  module Msutter

    module DscTypeHelpers
      def self.included(type)
        type.extend(DscTypeHelpers)
      end

      def initialize(*args)
        super(*args)
        # # enable usage of dsc_ensure
        # if self.class.ensurable? && self.class.validparameter?(:dsc_ensure)
        #   self[:ensure] = self[:dsc_ensure].to_s.downcase.to_sym unless self[:dsc_ensure].nil?
        # end
      end

    end

  end
end

class String
  def to_bool
    return true if self =~ (/^(true|t|yes|y|1)$/i)
    return false if self.empty? || self =~ (/^(false|f|no|n|0)$/i)

    raise ArgumentError.new "invalid value: #{self}"
  end
end
