module Dsc
  class Manager

    attr_accessor :target_module_path

    def initialize(module_path, import_folder, dsc_modules_folder, base_qualifiers_folder, dmtf_mof_folder, type_template_file, type_spec_template_file, puppet_type_subpath, puppet_type_spec_subpath)
      @module_path              = module_path
      @import_folder            = import_folder
      @dsc_modules_folder       = dsc_modules_folder
      @base_qualifiers_folder   = base_qualifiers_folder
      @dmtf_mof_folder          = dmtf_mof_folder
      @type_template_file       = type_template_file
      @type_spec_template_file  = type_spec_template_file
      @target_module_path       = module_path
      @puppet_type_subpath      = puppet_type_subpath
      @puppet_type_spec_subpath = puppet_type_spec_subpath

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

    private

  end
end
