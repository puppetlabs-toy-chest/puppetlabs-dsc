module Dsc
  class Resource
  
    def initialize(resource_hash)
      @resource_hash       = resource_hash
      @name                = nil
      @properties          = nil
      @filtered_properties = nil
      @module              = nil
    end

    def name
      @name ||= @resource_hash['Name']
    end

    def properties
      unless @properties
        @properties ||= @resource_hash['Properties'].collect{|p| Dsc::Property.new(p) }
      end
      @properties
    end

    def filtered_properties
      unless @filtered_properties
        @filtered_properties ||= properties.select{|p| !p.dependable? && !p.is_ensure? }.sort_by { |p| [p.required? ? 0 : 1, p.name.downcase] } 
      end
      @filtered_properties
    end

    def ensurable?
      properties.detect{|p|p.is_ensure?} ? true : false
    end

    def has_name?
      properties.detect{|p|p.is_name?} ? true : false
    end

    def module
      @module ||= @resource_hash['Module']['Name'] if @resource_hash['Module']
    end

  end
end
