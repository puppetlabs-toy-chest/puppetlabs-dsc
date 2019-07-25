# rubocop:disable Style/ClassAndModuleChildren
module Dsc
  # Handle cleanup and removing old builds
  class TypeCleaner
    attr_accessor :target_module_path
    attr_accessor :puppet_type_subpath
    attr_accessor :puppet_type_spec_subpath
    attr_accessor :module_path

    def initialize(target_module_path, puppet_type_subpath, puppet_type_spec_subpath)
      @target_module_path       = target_module_path
      @puppet_type_subpath      = puppet_type_subpath
      @puppet_type_spec_subpath = puppet_type_spec_subpath
    end

    def clean_dsc_types
      puppet_type_path = "#{@target_module_path}/#{@puppet_type_subpath}"
      clean_folder(["#{puppet_type_path}/dsc_*.rb"])
    end

    def clean_dsc_type_specs
      puppet_type_spec_path = "#{@target_module_path}/#{@puppet_type_spec_subpath}"
      clean_folder(["#{puppet_type_spec_path}/dsc_*_spec.rb"])
    end

    def clean_folder(folders)
      type_pathes = []
      folders.each do |folder|
        Dir.glob(folder.to_s).each do |filepath|
          pn = Pathname.new(filepath).expand_path.relative_path_from(@target_module_path)
          type_pathes << "Remove - #{pn}"
          FileUtils.rm_rf filepath
        end
      end
      type_pathes
    end
  end
end
