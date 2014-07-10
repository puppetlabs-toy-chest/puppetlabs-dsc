module Puppetx
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
