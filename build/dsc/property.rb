module Dsc
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
      begin
        if @description.nil? && @cim_feature.description
          content = @cim_feature.description
          content.gsub!(/\xe2\x80\x9c/u, "'") # usage of single quotes as this string will be injected in a double bracket "#{content}"
          content.gsub!(/\xe2\x80\x9d/u, "'") # usage of single quotes as this string will be injected in a double bracket "#{content}"
          content.gsub!(/\xe2\x80\x98/u, "'")
          content.gsub!(/\xe2\x80\x99/u, "'")
          content.gsub!(/\xe2\x80\x93/u, "-")
          content.gsub!(/\xe2\x80\x94/u, "--")
          content.gsub!(/\xe2\x80\xa6/u, "...")
          @description ||= content
        end
        @description
      rescue
        @description ||= "Description could no be generated. Illegal Chars found in original scheam.mof file"
        @description
      end
    end

    def type
      @type ||= (embeddedinstance? ?
        embeddedinstance_class_name + (embeddedinstance_array? ? '[]' : '') :
        @cim_feature.type.to_s.downcase)
    end

    def required?
      @required ||= @cim_feature.qualifiers.detect{|q| q.name.downcase == "key" }
    end

    def embeddedinstance
      @cim_feature.qualifiers.detect{|q| q.name.downcase == "embeddedinstance" }
    end

    def embeddedinstance?
      embeddedinstance ? true: false
    end

    def embeddedinstance_array?
      embeddedinstance? && @cim_feature.type.to_s.casecmp('string[]') == 0
    end

    def embeddedinstance_class_name
      embeddedinstance.value
    end

    def values
      @values ||=
        if is_ensure? && ! @cim_feature.values
          $stderr.puts "WARNING: Processing #{@resource_mof_path}\nEnsurable property '#{name}' is missing a values specification - using default 'present'\n"
          ['Present']
        else
          @cim_feature.values
        end
    end

    def is_ensure?
      name.downcase == 'ensure' ? true : false
    end

    def dependable?
      name.downcase == 'dependson' ? true : false
    end

    def is_name?
      name.downcase == 'name' ? true : false
    end

    def credential?
      embeddedinstance? && embeddedinstance_class_name == 'MSFT_Credential'
    end

    def keyvaluepair?
      embeddedinstance? && embeddedinstance_class_name == 'MSFT_KeyValuePair'
    end

    def bool?
      ["bool","boolean"].include?(type)
    end

    def uint?
      ["uint8","uint16","uint32","uint64"].include?(type)
    end

    def uint_array?
      ["uint8[]","uint16[]","uint32[]","uint64[]"].include?(type)
    end

    def int?
      ["int8","int16","int32","int64","sint8","sint16","sint32","sint64"].include?(type)
    end

    def int_array?
      ["int8[]","int16[]","int32[]","int64[]","sint8[]","sint16[]","sint32[]","sint64[]"].include?(type)
    end

    def string?
      ["string"].include?(type)
    end

    def string_array?
      ["string[]"].include?(type)
    end

    def array?
      string_array? or int_array? or uint_array? or embeddedinstance_array?
    end

  end
end
