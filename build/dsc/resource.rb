module Dsc
  class Resource

    attr_accessor :resource_cim_class

    def initialize(mof_class, mof_path)
      @resource_mof_path   = mof_path
      @resource_cim_class  = mof_class
      @name                = nil
      @friendlyname        = nil
      @properties          = nil
      @array_properties    = nil
      @valuated_properties = nil
      @required_properties = nil
      @filtered_properties = nil
      @embedded_properties = nil
      @dsc_module          = nil
      @ps_module           = nil
    end

    def relative_mof_path
      Pathname.new(@resource_mof_path).relative_path_from(Pathname.new(File.expand_path("#{LIB_PATH}/.."))).to_s
    end

    def friendlyname
      @friendlyname ||= @resource_cim_class.qualifiers['Friendlyname'].value if @resource_cim_class.qualifiers['Friendlyname']
    end

    def name
      @ame ||= @resource_cim_class.name
    end

    def instance_name
      "Dsc_#{self.friendlyname.downcase}"
    end

    def properties
      unless @properties
        @properties ||= @resource_cim_class.features.collect{|cim_feature| Dsc::Property.new(cim_feature) }
      end
      @properties
    end

    def array_properties
      unless @array_properties
        @array_properties ||= properties.select{|rp| rp.array? }
      end
      @array_properties
    end

    def valuated_properties
      unless @valuated_properties
        @valuated_properties ||= properties.select{|rp| rp.values }
      end
      @valuated_properties
    end

    def required_properties
      unless @required_properties
        @required_properties ||= properties.select{|rp| rp.required? }
      end
      @required_properties
    end

    def filtered_properties
      unless @filtered_properties
        @filtered_properties = properties.select{|p| !p.dependable? && !p.is_ensure? }.sort_by { |p| [p.required? ? 0 : 1, p.name.downcase] }
      end
      @filtered_properties
    end

    def embedded_properties
      unless @embedded_properties
        @embedded_properties ||= properties.select{|rp| rp.embeddedinstance? }
      end
      @embedded_properties
    end

    def ensurable?
      properties.detect{|p|p.is_ensure?} ? true : false
    end

    def has_name?
      properties.detect{|p|p.is_name?} ? true : false
    end

    def has_embeddedinstances?
      properties.detect{|p|p.embeddedinstance?} ? true : false
    end

    def ps_module
      unless @ps_module
        path_array = @resource_mof_path.split('/')
        revert_array = path_array.reverse
        downcased_array = revert_array.collect{|p| p.downcase}
        index = downcased_array.index('dscresources')
        raise "module for #{self.name} not found" if index == nil

        module_name = revert_array[index + 1 ] rescue nil
        module_dir = path_array[0..(path_array.count - (index + 2))].join('/')
        module_manifest_path = "#{module_dir}/#{module_name}.psd1"
        raise "module manifest #{module_manifest_path} not found" unless File.exists?(module_manifest_path)

        @ps_module = Dsc::Psmodule.new(module_name, module_manifest_path)
      end
      @ps_module
    end

  end
end
