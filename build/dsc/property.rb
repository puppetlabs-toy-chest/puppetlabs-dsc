module Dsc
  class Property

    attr_reader :property_hash

    def initialize(cim_feature)
      @cim_feature = cim_feature
      @name          = nil
      @type          = nil
      @required      = nil
      @values        = nil
    end

    def name
      @name ||= @cim_feature.name
    end

    def type
      @type ||= @cim_feature.type.to_s
    end

    def required?
      @required ||= @cim_feature.qualifiers.detect{|q| q.name.downcase == "key" }
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
      ["int16","int32","int64"].include?(type)
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