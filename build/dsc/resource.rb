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
      @absentable          = nil
    end

    def relative_mof_path
      Pathname.new(@resource_mof_path).relative_path_from(Pathname.new(File.expand_path("#{LIB_PATH}/.."))).to_s
    end

    def friendlyname
      @friendlyname ||= @resource_cim_class.qualifiers['Friendlyname'].value if @resource_cim_class.qualifiers['Friendlyname']
    end

    def name
      @name ||= @resource_cim_class.name
    end

    def instance_name
      "Dsc_#{self.friendlyname.downcase}"
    end

    def properties
      unless @properties
        @properties ||= @resource_cim_class.features.collect{|cim_feature| Dsc::Property.new(cim_feature, @resource_mof_path) }
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
      ensure_property ? true : false
    end

    def ensure_property
      @ensure_property ||= properties.find{|p| p.is_ensure?}
    end

    def absentable?
      if @absentable.nil?
        if !ensurable?
          @absentable = false
        else
          override = ensure_type_overrides[name.downcase]
          @absentable = override ?
            # if an override exists, the absence of the :absent hash key (or nil value at :absent) means not absentable
            !override[:absent].nil? :
            # otherwise use typical 'absent' heuristic
            ensure_property.values.any? { |v| v.casecmp('absent') == 0 }
        end
      end
      @absentable
    end

    def ensure_type_overrides
      # always key the hash with a lower case version of the name
      # the first defined present value is the default
      # :absent may be omitted to indicate there is no ability to absent the resource
      @ensure_type_overrides ||=
      {
        'MSFT_xRunbookDirectory'.downcase      => { :present => ['published', 'draft'], :absent => 'absent' },
        'MSFT_WindowsOptionalFeature'.downcase => { :present => ['enable'], :absent => 'disable' },
      }
    end

    def absent_value
      @absent_value ||=
        # explicit absent by MOF type name
        if (ensure_values = ensure_type_overrides[name.downcase])
          ensure_values[:absent]
        # resources like MSFT_LogResource or MSFT_ScriptResource have no Ensure / can't be 'absent'
        elsif ensure_property.nil?
          # absent_value should never be called if absentable? is not true
          throw "Error processing MOF schema for #{name} - absent_value unavailable on property that is not absentable"
        # absent is explicitly in the value map
        elsif ensure_property.values.any? { |v| v.casecmp('absent') == 0 }
          'absent'
        else
          throw "Error processing MOF schema for #{name} - could not determine equivalent 'absent' value for ensure"
        end
    end

    def valid_ensure_present_values
      @valid_ensure_present_values ||=
        # explicit absent by MOF type name
        if (ensure_values = ensure_type_overrides[name.downcase])
          ensure_values[:present]
        # resources like MSFT_LogResource with no Ensure *must* be able to set 'present'
        elsif ensure_property.nil?
          ['present']
        # a non-nil list of ensure values with 'absent' filtered
        elsif (present = ensure_property.values.collect { |v| v.downcase }.select { |v| v != 'absent' })
          # empty list of properties OR properties only contains 'absent' - makes no sense, FAIL hard
          throw("Error processing MOF schema for #{name} - no valid ensure present property found in list #{ensure_property.values}") if present.empty?
          present
        else
          throw "Error processing MOF schema for #{name} - could not determine equivalent 'present' value for ensure"
        end
    end

    def default_ensure_value
      # with overrides present, use the first value
      if ensure_type_overrides.include?(name.downcase)
        valid_ensure_present_values[0]
      # if no explicit overrides, and multiple values, favor present if defined
      elsif valid_ensure_present_values.any? { |v| v.casecmp('present') == 0 }
        'present'
      # otherwise, use the first value for present, which should be 'present'
      else
        valid_ensure_present_values[0]
      end
    end

    def has_name?
      properties.detect{|p|p.is_name?} ? true : false
    end

    def has_embeddedinstances?
      properties.detect{|p|p.embeddedinstance?} ? true : false
    end

    def has_credential?
      properties.detect{|p|p.credential?} ? true : false
    end

    def ps_module
      unless @ps_module
        path_array = @resource_mof_path.split('/')
        revert_array = path_array.reverse
        downcased_array = revert_array.collect{|p| p.downcase}
        index = downcased_array.index('dscresources')
        raise "module for #{self.name} not found (Missing DSCResources directory in path #{@resource_mof_path})" if index == nil

        module_name = revert_array[index + 1 ] rescue nil
        if (module_name == "dsc_resources")
          warn("The name of the module in directory #{@resource_mof_path} was detected as #{module_name}.  This may indicate that the wrong directory was used to import the resource")
        end

        module_dir = path_array[0..(path_array.count - (index + 2))].join('/')

        # A psd1 manifest is assumed to be the same name as the DSC Resource
        # However on case sensitive OS, the file name could be a different
        # case than the DSC Resource name, i.e SqlServerDsc vs SQLServerDsc.ps1,
        # which would cause File.exists? to fail to find the file even though
        # it exists.
        #
        # Dir.glob is used here to find any psd1 manifest in the module_dir
        # folder. This is a safe assumption because by convention there can
        # only be one manifest file for a DSC Resource because it follows
        # PowerShell Module manifest conventions. However there could be cases
        # where there are other psd1 files for different purposes, so we
        # filter for ones that match the module_name exactly, lowercased
        module_manifest_path = Dir.glob("#{module_dir}/*.psd1")
                                  .select{ |fn| (File.basename(fn, ".psd1")).downcase == module_name.downcase }
                                  .first
        if module_manifest_path.nil?
          raise "module manifest #{module_dir}/#{module_name}.psd1 not found"
        end

        @ps_module = Dsc::Psmodule.new(module_name, module_manifest_path)
      end
      @ps_module
    end

  end
end
