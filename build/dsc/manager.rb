module Dsc
  class Manager

    attr_accessor :target_module_path

    def initialize
      @dsc_lib_path             = Pathname.new(__FILE__).dirname
      @tools_path               = @dsc_lib_path.parent
      @module_path              = @tools_path.parent

      @base_qualifiers_folder   = "#{@module_path}/build/qualifiers/base"

      @import_folder            = "#{@module_path}/import"
      @dsc_modules_folder       = "#{@import_folder}/dsc_resources"
      @dmtf_mof_folder          = "#{@module_path}/build/vendor/dmtf_mof"

      @type_template_file       = "#{@dsc_lib_path}/templates/dsc_type.rb.erb"
      @type_spec_template_file  = "#{@dsc_lib_path}/templates/dsc_type_spec.rb.erb"

      @target_module_path       = @module_path
      @puppet_type_subpath      = "lib/puppet/type"
      @puppet_type_spec_subpath = "spec/unit/puppet/type"

      @json_content             = nil
      @resources_hash           = nil
      @resources                = nil
      @cim_classes_with_path    = nil

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
      unless @cim_classes_with_path
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
        dsc_resources = {}
        duplicate_imports = {}
        cim_classes_with_path.select{|cc| cc[:klass].superclass == "OMI_BaseResource" }.each do |cim_class_with_path|
          klass = cim_class_with_path[:klass]
          resource = Dsc::Resource.new(klass, cim_class_with_path[:path])

          # track the paths where this CIM name has already shown up
          if dsc_resources.include?(resource.name)
            if resource.relative_mof_path.split(/\//)[2] == dsc_resources[resource.name].relative_mof_path.split(/\//)[2]
              # we don't care if the module or dsc resource is inside the folder containing the DSC resources
              # if it's inside the folder, then it's only used by the dsc resource, not externally, so we
              # don't have to parse it and shouldn't throw an error
              # we can't blacklist this, because it's internal to a dsc resource, and not part of the main repo.
              # for example, the xAdcsDeployment DSC Resource had xCertificateServices internalized in the 1.0.0 tag,
              # causing duplicate MOFs to be parsed
              next
            end
            duplicate_imports[resource.name] ||= [dsc_resources[resource.name].relative_mof_path]
            duplicate_imports[resource.name] << resource.relative_mof_path
            next
          end
          dsc_resources[resource.name] = resource
        end
        if !duplicate_imports.empty?
          msg =  duplicate_imports.map { |k,v| "Duplicate definitions of #{k} found at:\n#{v.join("\n")}" }
          raise "Catastrophic Failure - Found duplication CIM definitions:\n" + msg.join("\n\n")
        end
        @resources = dsc_resources.values
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

    def get_dsc_types
      dsc_types = []
      resources.each do |resource|
        dsc_types << "dsc_#{resource.friendlyname.downcase}"
      end
      dsc_types
    end

    # Mof's
    def import_dmtf_mofs
      Dsc::Import.download(@dmtf_cim_mof_zip_url, @dmtf_cim_mof_zip_path)
      Dsc::Import.unzip(@dmtf_cim_mof_zip_path, @dmtf_mof_folder)
    end

    private

  end
end
