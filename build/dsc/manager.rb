module Dsc
  class Manager

    def initialize
      @dsc_lib_path               = Pathname.new(__FILE__).dirname
      @tools_path                 = @dsc_lib_path.parent
      @module_path                = @tools_path.parent

      @base_qualifiers_folder     = "#{@module_path}/dsc/qualifiers/base"

      @qualifiers_folder          = "#{@module_path}/#{Dsc::Config['qualifiers_folder']}"
      @dsc_modules_folder         = "#{@module_path}/#{Dsc::Config['dsc_modules_folder']}"
      @download_folder            = "#{@module_path}/#{Dsc::Config['download_folder']}"
      @dmtf_qualifiers_folder     = "#{@module_path}/#{Dsc::Config['dmtf_qualifiers_folder']}"
      @base_qualifiers_folder     = "#{@module_path}/#{Dsc::Config['base_qualifiers_folder']}"
      @dmtf_cim_schema_version    = Dsc::Config['dmtf_cim_schema_version']

      @dmtf_cim_mof_zip_file_name = "cim_schema_#{@dmtf_cim_schema_version}Final-MOFs.zip"
      @dmtf_cim_mof_zip_url       = "http://dmtf.org/sites/default/files/cim/cim_schema_v#{@dmtf_cim_schema_version.gsub('.','') }/#{@dmtf_cim_mof_zip_file_name}"
      @dmtf_cim_mof_zip_path      = "#{@download_folder}/#{@dmtf_cim_mof_zip_file_name}"

      @type_template_file         = "#{@dsc_lib_path}/templates/dsc_type.rb.erb"
      @provider_template_file     = "#{@dsc_lib_path}/templates/dsc_provider.rb.erb"
      @puppet_type_path           = "#{@module_path}/lib/puppet/type"
      @puppet_provider_path       = "#{@module_path}/lib/puppet/provider"
      @json_content               = nil
      @resources_hash             = nil
      @resources                  = nil
    end

    # def json_content
    #   @json_content ||= File.read(@resources_json_path)
    # end

    # def resources_hash
    #   @resources_hash ||= JSON.parse(json_content)
    # end

    def dsc_results
      mof = Dsc::Mof.new(
        :qualifiers_folder       => @qualifiers_folder,
        :dmtf_qualifiers_folder  => @dmtf_qualifiers_folder,
        :base_qualifiers_folder  => @base_qualifiers_folder,
        :dsc_modules_folder      => @dsc_modules_folder,
        :dmtf_cim_schema_version => @dmtf_cim_schema_version
      )
      mof.dsc_results
    end

    def resources
      #@resources ||= resources_hash.collect { |rsh| Dsc::Resource.new(rsh) }.sort_by { |r| r.name.downcase }
      unless @resources
        res = []
        dsc_results.each do |mof_path, mof_res|
          mof_res.classes.each do |mof_class|
            res << Dsc::Resource.new(mof_class, mof_path)
          end
        end
        @resources = res  
      end
      @resources
    end

    # Type's
    def build_dsc_types
      type_pathes = []
      resources.each do |resource|
        type_template = File.open(@type_template_file, 'r').read
        type_erb = ERB.new(type_template, nil, '-')
        if resource.friendlyname
          File.open("#{@puppet_type_path}/dsc_#{resource.friendlyname.downcase}.rb", 'w+') do |file|
            file.write(type_erb.result(binding))
            pn = Pathname.new(file.path).relative_path_from(@module_path)
            type_pathes << "Add - #{pn.to_s}"
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

    # Mof's
    def import_dmtf_mofs
      Dsc::Import.download(@dmtf_cim_mof_zip_url, @dmtf_cim_mof_zip_path)
      Dsc::Import.unzip(@dmtf_cim_mof_zip_path, @dmtf_qualifiers_folder)
    end

    def clean_dmtf_mofs
      clean_folder([@dmtf_qualifiers_folder])
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
