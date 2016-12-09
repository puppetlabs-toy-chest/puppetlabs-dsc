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

      @spec_test_values         = {
        'string'   => 'foo',
        'string[]' => ['foo','bar','spec'],
        'MSFT_Credential' => { 'user' => 'user', 'password' => 'password' },
        'MSFT_KeyValuePair' => { 'somekey' => 'somevalue' },
        'MSFT_KeyValuePair[]' => { 'somekey' => 'somevalue', 'somekey2' => 'somevalue2' },
        'bool'     => true,
        'boolean'  => true,
        'munged_bools' => ['true','false','True', 'False', :true, :false],
        'munged_ints' => ['16','-16','32', '-32'],
        'munged_uints' => ['16','32','64'],
        'int_not_bool_mungeable'  => -16,
        'uint_not_bool_mungeable' => 16,
        'datetime' => '20140711',
        'int8'     => -16,
        'int8[]'   => [-128, 0, 127],
        'int16'    => -16,
        'int16[]'  => [-16, 32, -64],
        'int32'    => -32,
        'int32[]'  => [-32, 64, -128],
        'int64'    => -64,
        'int64[]'  => [-64, 128, -256],
        'sint8'     => -128,
        'sint8[]'   => [-128, 0, 127],
        'sint16'    => -16,
        'sint16[]'  => [-16, 32, -64],
        'sint32'    => -32,
        'sint32[]'  => [-32, 64, -128],
        'sint64'    => -64,
        'sint64[]'  => [-64, 128, -256],
        'uint8'    => 1,
        'uint8[]'  => [0, 16, 255],
        'uint16'   => 16,
        'uint16[]' => [16, 32, 64],
        'uint32'   => 32,
        'uint32[]' => [32, 64, 128],
        'uint64'   => 64,
        'uint64[]' => [64, 128, 256],
        'real32'   => '32.000',
        'real64'   => '64.000',
      }

    end

    def get_spec_test_value(type)
      # generate a hash here for any EmbeddedInstance type not seen yet
      if ! @spec_test_values[type]

        type_name = type.gsub(/\[\]$/, '') # strip [] off end of MOF type name
        values = cim_classes_with_path
          .select{ |c| c[:klass].name == type_name }
          .first[:klass]
          .features
          .map do |prop|
            # use first value in ValueMap if present
            if prop.qualifiers['Values']
              val = prop.qualifiers['Values'].value.first
            else
              val = get_spec_test_value(prop.type.to_s)
            end
            [prop.name, val]
          end

        @spec_test_values[type] = Hash[ values ]
      end

      @spec_test_values[type]
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

    def build_dsc_types
      type_pathes = []
      whitelist = ['archive','environment','file','group','groupset','log','package',
        'processset','registry','script','service','serviceset','user','windowsfeature',
        'windowsfeatureset','windowsoptionalfeature','windowsoptionalfeatureset','windowsprocess']
      resources.each do |resource|
        type_template = File.open(@type_template_file, 'r').read
        type_erb = ERB.new(type_template, nil, '-')
        type_spec_template = File.open(@type_spec_template_file, 'r').read
        type_spec_erb = ERB.new(type_spec_template, nil, '-')
        if resource.friendlyname
          puppet_type_path = "#{@target_module_path}/#{@puppet_type_subpath}"
          FileUtils.mkdir_p(puppet_type_path) unless File.exists?(puppet_type_path)
          File.open("#{puppet_type_path}/dsc_#{resource.friendlyname.downcase}.rb", 'w+') do |file|
            file.write(type_erb.result(binding))
            pn = Pathname.new(file.path).expand_path.relative_path_from(@module_path)
            type_pathes << "Add type - #{pn.to_s}"
          end
          puppet_type_spec_path = "#{@target_module_path}/#{@puppet_type_spec_subpath}"
          FileUtils.mkdir_p(puppet_type_spec_path) unless File.exists?(puppet_type_spec_path)
          if whitelist.include?(resource.friendlyname.downcase)
            File.open("#{puppet_type_spec_path}/dsc_#{resource.friendlyname.downcase}_spec.rb", 'w+') do |file|
              file.write(type_spec_erb.result(binding))
              pn = Pathname.new(file.path).expand_path.relative_path_from(@module_path)
              type_pathes << "Add type spec - #{pn.to_s}"
            end
          end
        else
          puts "#{resource.name} from #{resource.dsc_module} has invalid mof (no friendlyname defined)"
          puts "#{resource.name} will not be usable with puppet"
        end
      end
      type_pathes
    end

    def get_dsc_types
      dsc_types = []
      resources.each do |resource|
        dsc_types << "dsc_#{resource.friendlyname.downcase}"
      end
      dsc_types
    end

    def document_types(markdown_file_path, dsc_types)
      puts "Creating #{markdown_file_path}"
      File.open("#{markdown_file_path}", 'w+') do |file|
        file.write("## Resource Types included with DSC module\n")
        file.write("For any system this module is installed on, use\n`Puppet describe typename` for more information.\n\n")

        file.write("#### WMF Core Types\n\n")
        file.write("Puppet Type | DSC Resource\n")
        file.write("----------- | -----------------\n")
        resources.select { |t| t.instance_name.downcase.match(/dsc_[^x]/)}.each do |dsc_type|
          pth = File.dirname(dsc_type.relative_mof_path.gsub(/import\/dsc_resources/,"build/vendor/wmf_dsc_resources"))
          file.write("dsc_#{dsc_type.friendlyname.downcase} | [#{dsc_type.friendlyname}](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/#{pth}) | #{dsc_type.relative_mof_path}\n")
        end

        file.write("\n#### Community x Prefixed types\n\n")
        resources.select { |t| t.instance_name.downcase.match(/dsc_x/)}.group_by { |dt| dt.ps_module.name}.each do |dsc_type|
          file.write("##### #{dsc_type[0]}\n\n")
          file.write("Puppet Type | DSC Resource | Github Repo\n")
          file.write("----------- | ----------------- | -----\n")
          dsc_type[1].each do | sb |
            pth = File.dirname(sb.relative_mof_path.gsub(/import\/dsc_resources/,"lib/puppet_x/dsc_resources"))
            file.write("dsc_#{sb.friendlyname.downcase} | [#{sb.friendlyname}](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/#{pth}) | [repo](https://github.com/PowerShell/#{dsc_type[0]})\n")
          end
          file.write("\n")
        end
      end
    end

    def clean_dsc_types
      puppet_type_path = "#{@target_module_path}/#{@puppet_type_subpath}"
      clean_folder(["#{puppet_type_path}/dsc_*.rb"])
    end

    def clean_dsc_type_specs
      puppet_type_spec_path = "#{@target_module_path}/#{@puppet_type_spec_subpath}"
      clean_folder(["#{puppet_type_spec_path}/dsc_*_spec.rb"])
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
    
    def find_valid_files(directory)
      valid_files = Dir.glob("#{directory}/**/*").reject do |f|
        # reject the .git folder or special git files
        f =~ /\/\.(git|gitattributes|gitignore|gitmodules)/ ||
        # reject binary and other file extensions
        f =~ /\.(pptx|docx|sln|cmd|xml|pssproj|pfx|html|txt|xlsm|csv|png|git|yml|md)$/i ||
        # reject test / sample / example code
        f =~ /\/.*([Ss]ample|[Ee]xample|[Tt]est).*/ ||
        # reject stuff that is a Composite DSC Resource
        f =~ /(xChrome|xDSCResourceDesigner|xDscDiagnostics|xFirefox|xSafeHarbor|xSystemSecurity).*/ ||
        # reject duplicated resources
        f =~ /(xSharePoint|PSDscResources).*/ ||
        # and don't keep track of dirs
        Dir.exists?(f)
      end
      
      valid_files
    end

    private

    def clean_folder(folders)
      type_pathes = []
      folders.each do |folder|
        Dir.glob("#{folder}").each do |filepath|
          pn = Pathname.new(filepath).expand_path.relative_path_from(@module_path)
          type_pathes << "Remove - #{pn.to_s}"
          FileUtils.rm_rf filepath
        end
      end
      type_pathes
    end

  end
end
