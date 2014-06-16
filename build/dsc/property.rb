module Dsc
  class Property
    
    attr_reader :property_hash

    def initialize(property_hash)
      @property_hash = property_hash
      @name          = nil
      @type          = nil
      @required      = nil
      @values        = nil
    end

    def name
      @name ||= @property_hash['Name']
    end

    def type
      @type ||= @property_hash['PropertyType']
    end

    def clean_type
      type.downcase.gsub(/[\[\]]/, "")
    end

    def required?
      @required ||= @property_hash['IsMandatory']
    end
    
    def values
      @values ||= @property_hash['Values']
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

    def array?
      type =~/.*\[\]\]/
    end

    def bool?
      ["bool","boolean"].include?(clean_type)
    end

    def uint?
      ["uint32","uint16","uint64"].include?(clean_type)
    end
    
    def int?
      ["int32","int16","int64"].include?(clean_type)
    end

    def string?
      ["string"].include?(clean_type)
    end

  end
end