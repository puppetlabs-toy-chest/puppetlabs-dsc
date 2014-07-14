module Dsc
  class Manager

    def initialize
      @dsc_lib_path            = Pathname.new(__FILE__).dirname
      @tools_path              = @dsc_lib_path.parent
      @module_path             = @tools_path.parent

      @base_qualifiers_folder  = "#{@module_path}/build/qualifiers/base"

      @import_folder           = "#{@module_path}/#{Dsc::Config['import_folder']}"
      @dsc_modules_folder      = "#{@import_folder}/#{Dsc::Config['dsc_modules_folder']}"
      @dmtf_mof_folder         = "#{@import_folder}/#{Dsc::Config['dmtf_mof_folder']}"

      @type_template_file      = "#{@dsc_lib_path}/templates/dsc_type.rb.erb"
      @type_spec_template_file = "#{@dsc_lib_path}/templates/dsc_type_spec.rb.erb"

      @puppet_type_path        = "#{@module_path}/lib/puppet/type"
      @puppet_type_spec_path   = "#{@module_path}/spec/unit/puppet/type"

      @json_content            = nil
      @resources_hash          = nil
      @resources               = nil
      @cim_classes_with_path   = nil

      @spec_test_values        = {
        'string'   => 'foo',
        'string[]' => ['foo','bar','spec'],
        'bool'     => true,
        'boolean'  => true,
        'munged_bools' => ['true','false','True', 'False', :true, :false],
        'munged_ints' => ['16','-16','32', '-32'],
        'munged_uints' => ['16','32','64'],
        'datetime' => '20140711',
        'int'      => -16,
        'int16'    => -16,
        'int16[]'  => [-16, 32, -64],
        'int32'    => -32,
        'int32[]'  => [-32, 64, -128],
        'int64'    => -64,
        'int64[]'  => [-64, 128, -256],
        'sint16'    => -16,
        'sint16[]'  => [-16, 32, -64],
        'sint32'    => -32,
        'sint32[]'  => [-32, 64, -128],
        'sint64'    => -64,
        'sint64[]'  => [-64, 128, -256],
        'uint'     => 16,
        'uint16'   => 16,
        'uint16[]' => [16, 32, 64],
        'uint32'   => 32,
        'uint32[]' => [32, 64, 128],
        'uint64'   => 64,
        'uint64[]' => [64, 128, 256],
      }

    end

    def dsc_results
      mof = Dsc::Mof.new(
        :import_folder          => @import_folder,
        :dmtf_mof_folder        => @dmtf_mof_folder,
        :base_qualifiers_folder => @base_qualifiers_folder,
        :dsc_modules_folder     => @dsc_modules_folder,
      )
      mof.dsc_results
    end

    def cim_classes_with_path
      unless @cim_classes
        cim_classes_array = []
        dsc_results.each do |mof_path, mof_res|
          mof_res.classes.each do |cim_class|
            cim_classes_array << { :klass => cim_class, :path => mof_path }
          end
        end
        @cim_classes_with_path = cim_classes_array
      end
      @cim_classes_with_path
    end

    def resources
      unless @resources
        dsc_resources = []
        cim_classes_with_path.select{|cc| cc[:klass].superclass == "OMI_BaseResource" }.each do |cim_class_with_path|
          dsc_resources << Dsc::Resource.new(cim_class_with_path[:klass], cim_class_with_path[:path])
        end
        @resources = dsc_resources
      end
      @resources
    end

    def embedded_resources
      resources.select{|r|r.has_embeddedinstances?}
    end

    def embedded_class_names
      class_names_array = []
      embedded_resources.each do |er|
        er.embedded_properties.each do |ep|
          class_names_array << ep.embeddedinstance_class_name
        end
      end
      class_names_array.uniq
    end

    def embedded_cim_classes
      cim_classes_with_path.select{|cc| embedded_class_names.include?(cc[:klass].name) }.collect{|cc| cc[:klass] }
    end

    def build_dsc_types
      type_pathes = []
      resources.each do |resource|
        type_template = File.open(@type_template_file, 'r').read
        type_erb = ERB.new(type_template, nil, '-')
        type_spec_template = File.open(@type_spec_template_file, 'r').read
        type_spec_erb = ERB.new(type_spec_template, nil, '-')
        if resource.friendlyname
          File.open("#{@puppet_type_path}/dsc_#{resource.friendlyname.downcase}.rb", 'w+') do |file|
            file.write(type_erb.result(binding))
            pn = Pathname.new(file.path).relative_path_from(@module_path)
            type_pathes << "Add type - #{pn.to_s}"
          end
          File.open("#{@puppet_type_spec_path}/dsc_#{resource.friendlyname.downcase}_spec.rb", 'w+') do |file|
            file.write(type_spec_erb.result(binding))
            pn = Pathname.new(file.path).relative_path_from(@module_path)
            type_pathes << "Add type spec - #{pn.to_s}"
          end
        else
          puts "#{resource.name} from #{resource.dsc_module} has invalid mof (no friendlyname defined)"
          puts "#{resource.name} will not be usable with puppet"
        end
      end
      type_pathes
    end

    def clean_dsc_types
      clean_folder(["#{@puppet_type_path}/dsc_*.rb"])
    end

    def clean_dsc_type_specs
      clean_folder(["#{@puppet_type_spec_path}/dsc_*_spec.rb"])
    end

    # Mof's
    def import_dmtf_mofs
      Dsc::Import.download(@dmtf_cim_mof_zip_url, @dmtf_cim_mof_zip_path)
      Dsc::Import.unzip(@dmtf_cim_mof_zip_path, @dmtf_mof_folder)
    end

    def clean_dmtf_mofs
      clean_folder([@dmtf_mof_folder])
    end

    def format_type_value(type_value)
      case
      when type_value.class.name == 'Symbol'
        ":#{type_value}"
      when type_value.class.name == 'String'
        "'#{type_value}'"
      when type_value.class.name == 'Numeric'
        "#{type_value}"
      else
        type_value
      end
    end

    def format_newvalues(values)
      output = []
      values.each do |v|
        if v.respond_to?('downcase')
          output << format_type_value(v)
          output << format_type_value(v.downcase)
        else
          output << format_type_value(v)
        end
      end
      output.join(', ')
    end

    private

    def clean_folder(folders)
      type_pathes = []
      folders.each do |folder|
        Dir.glob("#{folder}").each do |filepath|
          pn = Pathname.new(filepath).relative_path_from(@module_path)
          type_pathes << "Remove - #{pn.to_s}"
          FileUtils.rm_rf filepath
        end
      end
      type_pathes
    end

  end
end
