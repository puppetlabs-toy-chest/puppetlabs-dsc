module Dsc
  class Manager

    attr_accessor :module_path,
    :target_module_location,
    :dsc_modules_embedded,
    :dsc_modules_folder,
    :dsc_resources_file,
    :puppet_type_subpath,
    :puppet_type_spec_subpath

    def initialize(target_module_location=nil)
      @dsc_lib_path              = Pathname.new(__FILE__).dirname
      @tools_path                = @dsc_lib_path.parent
      @module_path               = @tools_path.parent

      @base_module_name          = @module_path.basename
      @base_module_repo_url      = %x(git -C #{@module_path} config --get remote.origin.url).strip
      @base_module_repo_branch   = %x(git -C #{@module_path} rev-parse --abbrev-ref HEAD).strip

      @base_qualifiers_folder    = "#{@module_path}/build/qualifiers/base"
      @dmtf_mof_folder           = "#{@module_path}/build/vendor/dmtf_mof"
      @dsc_modules_embedded      = true

      @type_template_file        = "#{@dsc_lib_path}/templates/dsc_type.rb.erb"
      @type_spec_template_file   = "#{@dsc_lib_path}/templates/dsc_type_spec.rb.erb"

      @is_external_module        = !target_module_location.nil?
      @target_module_location    = target_module_location ? Pathname.new(target_module_location).realdirpath : @module_path
      @import_folder             = "#{@target_module_location}/import"
      @dsc_resources_file        = "#{@target_module_location}/dsc_resource_release_tags.yml"
      @dsc_document_file         = "#{@target_module_location}/types.md"
      @vendored_resources_folder = "#{@target_module_location}/lib/puppet_x/dsc_resources"

      @dsc_modules_folder        = "#{@import_folder}/dsc_resources"
      @dsc_modules_folder_tmp    = "#{@dsc_modules_folder}_tmp"

      @puppet_type_subpath       = "lib/puppet/type"
      @puppet_type_spec_subpath  = "spec/unit/puppet/type"

      @json_content              = nil
      @resources_hash            = nil
      @resources                 = nil
      @cim_classes_with_path     = nil

      @spec_test_values          = {
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

    def resources_import(parameters, blacklist=[])
      source_repo_url            = parameters["source_repo_url"]
      source_location            = parameters["source_location"]
      repo_branch                = parameters["repo_branch"] || 'master'
      is_git_repo = false

      if source_repo_url
        mod_name = source_repo_url.split('/').last.split('.').first
        is_git_repo = true
        clone_cmd = "git clone -b #{repo_branch} #{source_repo_url} #{@dsc_modules_folder_tmp}"
        %x(#{clone_cmd}) unless Dir.exist? @dsc_modules_folder_tmp
      elsif source_location
        mod_name = source_location.split('/').last
        is_git_repo = File.exists? File.expand_path("#{source_location}/.git")
        FileUtils.cp_r "#{source_location}", "#{@dsc_modules_folder_tmp}" unless Dir.exist? @dsc_modules_folder_tmp
      end

      if is_git_repo
        # Process git repository
        sub_cmd = "git -C #{@dsc_modules_folder_tmp} submodule"
        submodules_strings = `#{sub_cmd}`

        submodules = submodules_strings.split("\n").collect{ |s| {
            :commit => s.split(' ')[0],
            :path   => "#{@dsc_modules_folder_tmp}/#{s.split(' ')[1]}",
            :name   => s.split(' ')[1].split('/').last,
            :tag    => s.split(' ')[2]
          }
        }

        post_cmd = ''
        post_cmd += "git -C #{@dsc_modules_folder_tmp} checkout #{ENV['DSC_REF']}\n" if ENV['DSC_REF']
        post_cmd += "git -C #{@dsc_modules_folder_tmp} submodule update --init" if submodules.any?
        %x(#{post_cmd}) if !post_cmd.empty?

        # Without submodules, we assume that this is a standalone dsc module
        # and process it as it was a submodule.
        if submodules.empty?
          submodules = [{
            :commit => nil,
            :path   => "#{@dsc_modules_folder_tmp}",
            :name   => mod_name,
            :tag    => nil
          }]
        end

      else
        # Process a directory which is not a git repository
        submodules = [{
          :commit => nil,
          :path   => "#{@dsc_modules_folder_tmp}",
          :name   => mod_name,
          :tag    => nil
        }]
      end

      blacklisted_submodules = submodules.select { |sm| blacklist.include?(sm[:name])}

      # remove blacklisted modules from submodules array
      submodules = submodules - blacklisted_submodules

      # copy everything in from the filtered list
      submodules.each do |submodule|
        dest_module_path = "#{@dsc_modules_folder}/#{submodule[:name]}"
        puts "Copying vendored resources from #{submodule[:path]} to #{dest_module_path}"
        valid_files(submodule[:path]).each do |f|
          dest = Pathname.new(f.sub(submodule[:path], dest_module_path))
          FileUtils.mkdir_p(dest.dirname)
          FileUtils.cp(f, dest)
        end
      end
    end

    def valid_files(path)
      # filter out unwanted files
      valid_files = Dir.glob("#{path}/**/*").reject do |f|
        # reject the .git folder or special git files
        f =~ /\/\.(git|gitattributes|gitignore|gitmodules)/ ||
        # reject binary and other file extensions
        f =~ /\.(pptx|docx|sln|cmd|xml|pssproj|pfx|html|txt|xlsm|csv|png|git|yml|md)$/i ||
        # reject test / sample / example code
        f =~ /\/.*([Ss]ample|[Ee]xample|[Tt]est).*/ ||
        # and don't keep track of dirs
        Dir.exists?(f)
      end
    end

    def resources_embed
      puts "Copying vendored resources from '#{@dsc_modules_folder}/.' to '#{@vendored_resources_folder}'"

      # remove destination path, copy everything in from import folder
      FileUtils.rm_rf(@vendored_resources_folder) if Dir.exists?(@vendored_resources_folder)

      # make sure dsc_resources folder exists in puppetx
      FileUtils.mkdir_p(@vendored_resources_folder) unless File.directory?(@vendored_resources_folder)

      # exclude the base resources 'PSDesiredStateConfiguration' from the sync
      resources_list = Dir["#{@dsc_modules_folder}/*"].reject do |file_path|
        file_path =~ /^#{@dsc_modules_folder}\/PSDesiredStateConfiguration$/
      end
      FileUtils.cp_r resources_list, @vendored_resources_folder, :remove_destination => true
    end

    def resources_clean
      clean_folder([@import_folder])
      clean_folder([@vendored_resources_folder])
    end

    def resources_import_base
      puts "Copying vendored base resources from #{@module_path}/build/vendor/wmf_dsc_resources to #{@dsc_modules_folder}"
      FileUtils.mkdir_p(@dsc_modules_folder) unless File.directory?(@dsc_modules_folder)
      FileUtils.cp_r "#{@module_path}/build/vendor/wmf_dsc_resources/.", "#{@dsc_modules_folder}/"
    end

    def module_skeleton
      module_name = Pathname.new(@target_module_location).basename.to_s
      ext_module_files = [
        '.gitignore',
        '.pmtignore',
        'LICENSE',
        'README.md',
        'Repofile',
        'spec/*.rb',
      ]
      ext_module_files.each do |module_pathes|
        Dir[module_pathes].each do |path|
          if File.directory?(path)
            full_path = "#{@target_module_location}/#{path}"
            unless File.exists?(full_path)
              puts "Creating directory #{full_path}"
              FileUtils.mkdir_p(full_path)
            end
          else
            directory = Pathname.new(path).dirname
            full_directory_path = "#{@target_module_location}/#{directory}"
            full_path = "#{@target_module_location}/#{path}"
            unless File.exists?(full_directory_path)
              puts "Creating directory #{full_directory_path}"
              FileUtils.mkdir_p(full_directory_path)
            end
            unless File.exists?(full_path)
              puts "Copying file #{path} to #{full_path}"
              FileUtils.cp(path, full_path)
            end
          end
        end
      end


      unless File.exists?("#{@target_module_location}/Puppetfile")
        puts "Creating #{@target_module_location}/Puppetfile"
        # Generate Puppetfile with dependency on this dsc module
        puppetfile_content = <<-eos
forge 'https://forgeapi.puppetlabs.com'
mod '#{@base_module_name}', :git => '#{@base_module_repo_url}', :ref => '#{@base_module_branch}'
eos
        File.open("#{@target_module_location}/Puppetfile", 'w') do |file|
          file.write puppetfile_content
        end
      end

      # Generate metadata.json
      unless File.exists?("#{@target_module_location}/metadata.json")
        puts "Creating #{@target_module_location}/metadata.json"
        root_dsc_metadata = JSON.parse(File.read('metadata.json'))
        module_metadata = root_dsc_metadata.dup
        module_metadata["name"] = module_name
        module_metadata["operatingsystem_support"] = root_dsc_metadata["operatingsystem_support"]
        module_metadata["requirements"] = root_dsc_metadata["requirements"]
        module_metadata["dependencies"] = [
          {
            "name"=> root_dsc_metadata['name'].sub('-','/'),
            "version_requirement" => root_dsc_metadata['version']
          }
        ]
        File.open("#{@target_module_location}/metadata.json", 'w') do |file|
          file.write JSON.pretty_generate(module_metadata)
        end
      end

      # Generate .fixtures.yml with dependencies on base dsc module
      unless File.exists?("#{@target_module_location}/.fixtures.yml")

        fixture_hash = {
          'fixtures' => {
            'repositories' => {
              @base_module_name.to_s => {
                'repo' => @base_module_repo_url,
              }
            },
            'symlinks'=> {
              module_name => '#{source_dir}'
            }
          }
        }

        if @base_module_branch
          fixture_hash['fixtures']['repositories'][@base_module_name.to_s]['ref'] = @base_module_branch
        end

        File.open("#{@target_module_location}/.fixtures.yml", 'w') do |file|
          file.write fixture_hash.to_yaml
        end
      end

      # Generate Gemfile without any groups
      unless File.exists?("#{@target_module_location}/Gemfile")
        puts "Creating #{@target_module_location}/Gemfile"
        gemfile_content = File.read('Gemfile')
        File.open("#{@target_module_location}/Gemfile", 'w') do |file|
          #file.write gemfile_content.gsub(/^group.*^end$/m,'')
          file.write gemfile_content
        end
      end

      # Generate Rakefile
      unless File.exists?("#{@target_module_location}/Rakefile")
        puts "Creating #{@target_module_location}/Rakefile"
        rakefile_content = File.read('Rakefile')
        File.open("#{@target_module_location}/Rakefile", 'w') do |file|
          file.write rakefile_content.gsub(/\/spec\/fixtures\/modules\/dsc/, "/spec/fixtures/modules/#{module_name.split('-').last}")
        end
      end

    end

    def ensure_versions(submodules, update_versions, release_tag_prefix, release_tag_suffix)
      resource_tags = {}
      resource_tags = YAML::load_file("#{@dsc_resources_file}") if File.exist? @dsc_resources_file
      submodules.each do |submodule|
        FileUtils.cd(submodule[:path]) do
          dsc_resource_name = %x{ git config --get remote.origin.url }.split('/').last.split('.').first.chomp
          # --date-order probably doesn't matter
          # Requires git version 2.2.0 or higher - https://github.com/git/git/commit/9271095cc5571e306d709ebf8eb7f0a388254d9d
          tags_raw = %x{ git log --tags --pretty=format:'%D' --simplify-by-decoration --date-order }
          tags = tags_raw.scan(/^tag: .*/)
          if !tags.empty?
            if release_tag_prefix || release_tag_suffix
              prefix_regex = release_tag_prefix ? Regexp.quote(release_tag_prefix) : ""
              suffix_regex = release_tag_suffix ? Regexp.quote(release_tag_suffix) : ""
              version_regex = Regexp.new "#{prefix_regex}(\\S+)#{suffix_regex}"
              versions = tags_raw.scan(version_regex).map { | ver | Gem::Version.new(ver[0]) }
              # If the conversion of string to version starts to result in errors,
              # we should explore pushing this out out to a method where we can
              # clean up the tags that may have prerelease versions in them
              # similar to what was done in the Chocolatey module
              if versions.empty?
                raise "#{dsc_resource_name} does not have any '#{prefix_regex}[*]#{release_tag_suffix}' tags. Appears it has not been released yet. Tags found #{tags_raw.to_s}"
              end
              latest_version = "#{release_tag_prefix}" + versions.max.to_s + "#{release_tag_suffix}"
            else
              # TODO
              latest_version = "#{release_tag_prefix}" + versions.max.to_s + "#{release_tag_suffix}"
            end
          else
            # Use last commit as ref
            last_commit = %x{ git log -n 1 --pretty=format:"%H" }
            latest_version = last_commit
          end

          tracked_version = resource_tags["#{dsc_resource_name}"]
          update_version = tracked_version.nil? ? true : update_versions

          if update_version
            puts "Using the latest/available reference of #{latest_version} for #{dsc_resource_name}."
            checkout_version = latest_version
          else
            puts "Using the specified reference of #{tracked_version} for #{dsc_resource_name}."
            checkout_version = tracked_version
            %x(git fetch)
          end

          %x(git checkout #{checkout_version})
          resource_tags["#{dsc_resource_name}"] = checkout_version.encode("UTF-8")
        end
      end
      File.open("#{@dsc_resources_file}", 'w+') {|f| f.write resource_tags.to_yaml }
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
        dsc_resources = []
        cim_classes_with_path.select{|cc| cc[:klass].superclass == "OMI_BaseResource" }.each do |cim_class_with_path|
          dsc_resources << Dsc::Resource.new(cim_class_with_path[:klass], cim_class_with_path[:path], @dsc_modules_embedded)
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
      whitelist = ['archive','environment','file','group','groupset','log','package','processset','registry','script','service','serviceset','user','windowsfeature','windowsfeatureset','windowsoptionalfeature','windowsoptionalfeatureset','windowsprocess']
      resources.each do |resource|
        type_template = File.open(@type_template_file, 'r').read
        type_erb = ERB.new(type_template, nil, '-')
        type_spec_template = File.open(@type_spec_template_file, 'r').read
        type_spec_erb = ERB.new(type_spec_template, nil, '-')
        if resource.friendlyname
          puppet_type_path = "#{@target_module_location}/#{@puppet_type_subpath}"
          FileUtils.mkdir_p(puppet_type_path) unless File.exists?(puppet_type_path)
          File.open("#{puppet_type_path}/dsc_#{resource.friendlyname.downcase}.rb", 'w+') do |file|
            file.write(type_erb.result(binding))
            pn = Pathname.new(file.path).expand_path.relative_path_from(@module_path)
            type_pathes << "Add type - #{pn.to_s}"
          end
          puppet_type_spec_path = "#{@target_module_location}/#{@puppet_type_spec_subpath}"
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
      type_pathes.each{|m| puts "#{m}"}
    end

    def get_dsc_types
      dsc_types = []
      resources.each do |resource|
        dsc_types << "dsc_#{resource.friendlyname.downcase}"
      end
      dsc_types
    end

    def document_types
      puts "Creating #{@dsc_document_file}"
      File.open("#{@dsc_document_file}", 'w+') do |file|
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
      puppet_type_path = "#{@target_module_location}/#{@puppet_type_subpath}"
      clean_folder(["#{puppet_type_path}/dsc_*.rb"])
    end

    def clean_dsc_type_specs
      puppet_type_spec_path = "#{@target_module_location}/#{@puppet_type_spec_subpath}"
      clean_folder(["#{puppet_type_spec_path}/dsc_*_spec.rb"])
    end

    def clean_dsc_types_document
      clean_files(["#{@target_module_location}/types.md"])
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
      folder_pathes = []
      folders.each do |folder|
        file_pathes = clean_file(Dir.glob("#{folder}"))
        folder_pathes = folder_pathes + file_pathes
      end
      folder_pathes
    end

    def clean_file(files)
      type_pathes = []
        files.each do |filepath|
          pn = Pathname.new(filepath).expand_path.relative_path_from(@module_path)
          type_pathes << "Remove - #{pn.to_s}"
          FileUtils.rm_rf filepath
        end
      type_pathes.each{|m| puts "#{m}"}
    end

  end
end
