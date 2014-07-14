module Dsc
  class Property

    attr_reader :property_hash

    def initialize(cim_feature)
      @cim_feature = cim_feature
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
      @type ||= @cim_feature.type.to_s.downcase
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

    def embeddedinstance_class_name
      embeddedinstance.value
    end

    def values
      @values ||= @cim_feature.values
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

    def bool?
      ["bool","boolean"].include?(type)
    end

    def uint?
      ["uint16","uint32","uint64"].include?(type)
    end

    def uint_array?
      ["uint16[]","uint32[]","uint64[]"].include?(type)
    end

    def int?
      ["int16","int32","int64","sint16","sint32","sint64"].include?(type)
    end

    def int_array?
      ["int16[]","int32[]","int64[]"].include?(type)
    end

    def string?
      ["string"].include?(type)
    end

    def string_array?
      ["string[]"].include?(type)
    end

    def array?
      string_array? or int_array? or uint_array?
    end

  end
end
