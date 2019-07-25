# rubocop:disable Style/ClassAndModuleChildren
module Dsc
  # Handle DSC Property types
  class Property
    attr_reader :property_hash

    def initialize(cim_feature, resource_mof_path)
      @cim_feature = cim_feature
      @resource_mof_path = resource_mof_path
      @name          = nil
      @description   = nil
      @type          = nil
      @required      = nil
      @values        = nil
    end

    def name
      @name ||= @cim_feature.name
    end

    def description
      if @description.nil? && @cim_feature.description
        content = @cim_feature.description
        content.gsub!(%r{\xe2\x80\x9c}u, "'") # usage of single quotes as this string will be injected in a double bracket "#{content}"
        content.gsub!(%r{\xe2\x80\x9d}u, "'") # usage of single quotes as this string will be injected in a double bracket "#{content}"
        content.gsub!(%r{\xe2\x80\x98}u, "'")
        content.gsub!(%r{\xe2\x80\x99}u, "'")
        content.gsub!(%r{\xe2\x80\x93}u, '-')
        content.gsub!(%r{\xe2\x80\x94}u, '--')
        content.gsub!(%r{\xe2\x80\xa6}u, '...')
        @description ||= content
      end
      @description
    rescue
      @description ||= 'Description could no be generated. Illegal Chars found in original scheam.mof file'
      @description
    end

    def type
      @type ||= if embeddedinstance?
                  embeddedinstance_class_name + (embeddedinstance_array? ? '[]' : '')
                else
                  @cim_feature.type.to_s.downcase
                end
    end

    def required?
      @required ||= @cim_feature.qualifiers.find { |q| q.name.casecmp('key').zero? }
    end

    def embeddedinstance
      @cim_feature.qualifiers.find { |q| q.name.casecmp('embeddedinstance').zero? }
    end

    def embeddedinstance?
      embeddedinstance ? true : false
    end

    def embeddedinstance_array?
      embeddedinstance? && @cim_feature.type.to_s.casecmp('string[]').zero?
    end

    def embeddedinstance_class_name
      embeddedinstance.value
    end

    def values
      @values ||=
        if ensure? && !@cim_feature.values
          $stderr.puts "WARNING: Processing #{@resource_mof_path}\nEnsurable property '#{name}' is missing a values specification - using default 'present'\n"
          ['Present']
        else
          @cim_feature.values
        end
    end

    def ensure?
      name.casecmp('ensure').zero? ? true : false
    end

    def dependable?
      name.casecmp('dependson').zero? ? true : false
    end

    def name?
      name.casecmp('name').zero? ? true : false
    end

    def credential?
      embeddedinstance? && embeddedinstance_class_name == 'MSFT_Credential'
    end

    def keyvaluepair?
      embeddedinstance? && embeddedinstance_class_name == 'MSFT_KeyValuePair'
    end

    def bool?
      ['bool', 'boolean'].include?(type)
    end

    def uint?
      ['uint8', 'uint16', 'uint32', 'uint64'].include?(type)
    end

    def uint_array?
      ['uint8[]', 'uint16[]', 'uint32[]', 'uint64[]'].include?(type)
    end

    def int?
      ['int8', 'int16', 'int32', 'int64', 'sint8', 'sint16', 'sint32', 'sint64'].include?(type)
    end

    def int_array?
      ['int8[]', 'int16[]', 'int32[]', 'int64[]', 'sint8[]', 'sint16[]', 'sint32[]', 'sint64[]'].include?(type)
    end

    def string?
      ['string'].include?(type)
    end

    def string_array?
      ['string[]'].include?(type)
    end

    def array?
      string_array? || int_array? || uint_array? || embeddedinstance_array?
    end
  end
end
