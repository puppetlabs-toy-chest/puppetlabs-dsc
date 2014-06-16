module Dsc
  class Manager

    def initialize
      @dsc_lib_path           = Pathname.new(__FILE__).dirname
      @tools_path             = @dsc_lib_path.parent
      @module_path            = @tools_path.parent
      @resources_json_path    = "#{@module_path}/#{Dsc::Config['import_json_file']}"
      @type_template_file     = "#{@dsc_lib_path}/templates/dsc_type.rb.erb"
      @provider_template_file = "#{@dsc_lib_path}/templates/dsc_provider.rb.erb"
      @puppet_type_path       = "#{@module_path}/lib/puppet/type"
      @puppet_provider_path   = "#{@module_path}/lib/puppet/provider"
      @json_content           = nil
      @resources_hash         = nil
      @resources              = nil
    end

    def json_content
      @json_content ||= File.read(@resources_json_path)
    end

    def resources_hash
      @resources_hash ||= JSON.parse(json_content)
    end

    def resources
      @resources ||= resources_hash.collect { |rsh| Dsc::Resource.new(rsh) }.sort_by { |r| r.name.downcase }
    end

    def build_dsc_types
      type_pathes = []
      resources.each do |resource|
        type_template = File.open(@type_template_file, 'r').read
        type_erb = ERB.new(type_template, nil, '-')
        File.open("#{@puppet_type_path}/dsc_#{resource.name.downcase}.rb", 'w+') do |file|
         file.write(type_erb.result(binding)) 
         pn = Pathname.new(file.path).relative_path_from(@module_path)
         type_pathes << "Add - #{pn.to_s}"
       end
      end
      type_pathes
    end

    def clean_dsc_types
      type_pathes = []
      Dir.glob("#{@puppet_type_path}/dsc_*.rb").each do |filepath|
        pn = Pathname.new(filepath).relative_path_from(@module_path)
        type_pathes << "Remove - #{pn.to_s}"
        FileUtils.rm_rf filepath
      end
      type_pathes
    end

  end
end
