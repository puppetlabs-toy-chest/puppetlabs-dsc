require 'yaml'

namespace :dsc do

  # local pathes
  dsc_build_path             = Pathname.new(__FILE__).dirname
  dsc_repo_url               = %x(git config --get remote.origin.url).strip
  dsc_repo_branch            = %x(git rev-parse --abbrev-ref HEAD).strip
  # defaults
  default_dsc_module_path    = dsc_build_path.parent
  default_dsc_resources_path = "#{default_dsc_module_path}/import/dsc_resources"
  vendor_dsc_resources_path  = "#{default_dsc_module_path}/lib/puppet_x/dsc_resources"

  default_repofile           = "#{default_dsc_module_path}/Repofile"
  default_types_path         = "#{default_dsc_module_path}/lib/puppet/type"
  default_type_specs_path    = "#{default_dsc_module_path}/spec/unit/puppet/type"

  dsc_repo                   = 'https://github.com/PowerShell/DscResources.git'
  dsc_resources_file         = "#{default_dsc_module_path}/dsc_resource_release_tags.yml"

  desc "Import and build all"
  task :build, [:dsc_module_path] do |t, args|
    dsc_module_path = args[:dsc_module_path] || default_dsc_module_path

    if args[:dsc_module_path]
      Rake::Task['dsc:module:skeleton'].invoke(dsc_module_path)
    end

    # the presence of this git clone does not indicate the source is up to date
    Rake::Task['dsc:resources:import'].invoke
    Rake::Task['dsc:types:clean'].invoke(dsc_module_path)
    Rake::Task['dsc:types:build'].invoke(dsc_module_path)
    Rake::Task['dsc:types:document'].invoke(dsc_module_path)
  end

  desc "Cleanup all"
  task :clean, [:dsc_module_path] do |t, args|
    dsc_module_path = args[:dsc_module_path] || default_dsc_module_path

    Rake::Task['dsc:types:clean'].invoke(dsc_module_path)
    Rake::Task['dsc:resources:clean'].invoke(default_dsc_resources_path)
  end

  namespace :resources do

    item_name = 'DSC Powershell modules files'
    desc <<-eod
    Import #{item_name}

Default values:
  dsc_resources_path: #{default_dsc_resources_path}
eod

    task :import, [:dsc_resources_path, :update_versions] do |t, args|
      dsc_resources_path = args[:dsc_resources_path] || default_dsc_resources_path
      dsc_resources_path = File.expand_path(dsc_resources_path)
      dsc_resources_path_tmp = "#{dsc_resources_path}_tmp"
      update_versions = args[:update_versions] || false
      is_custom_resource = (dsc_resources_path != default_dsc_resources_path)

      if !is_custom_resource
        puts "Downloading and Importing #{item_name}"
        cmd = ''
        cmd = "git clone #{dsc_repo} #{dsc_resources_path_tmp} && " unless Dir.exist? dsc_resources_path_tmp
        cmd += "cd #{dsc_resources_path_tmp}"
        cmd += " && git checkout #{ENV['DSC_REF']}" if ENV['DSC_REF']
        cmd += " && git submodule update --init"

        sh cmd
      else
        puts "Importing custom types from '#{dsc_resources_path}'"
        FileUtils.mkdir_p "#{dsc_resources_path_tmp}"
        FileUtils.cp_r "#{dsc_resources_path}/.", "#{dsc_resources_path_tmp}/"
      end

      blacklist = ['xChrome', 'xDSCResourceDesigner', 'xDscDiagnostics',
                   'xFirefox', 'xSafeHarbor', 'xSystemSecurity'] # Case sensitive
      puts "Cleaning out black-listed DSC resources: #{blacklist}"
      blacklist.each { |res| FileUtils.rm_rf("#{dsc_resources_path_tmp}/xDscResources/#{res}") }

      resource_tags = {}
      resource_tags = YAML::load_file("#{dsc_resources_file}") if File.exist? dsc_resources_file

      puts "Getting latest release tags for DSC resources..."
      Dir["#{dsc_resources_path_tmp}/xDscResources/*"].each do |dsc_resource_path|
        dsc_resource_name = Pathname.new(dsc_resource_path).basename
        FileUtils.cd(dsc_resource_path) do
          # --date-order probably doesn't matter
          # Requires git version 2.2.0 or higher - https://github.com/git/git/commit/9271095cc5571e306d709ebf8eb7f0a388254d9d
          tags_raw = %x{ git log --tags --pretty=format:'%D' --simplify-by-decoration --date-order }
          # If the conversion of string to version starts to result in errors,
          # we should explore pushing this out out to a method where we can
          # clean up the tags that may have prerelease versions in them
          # similar to what was done in the Chocolatey module
          versions = tags_raw.scan(/(\S+)\-PSGallery/).map { | ver | Gem::Version.new(ver[0]) }
          if versions.empty?
            raise "#{dsc_resource_name} does not have any '*-PSGallery' tags. Appears it has not been released yet. Tags found #{tags_raw.to_s}"
          end

          latest_version = versions.max.to_s + "-PSGallery"
          tracked_version = resource_tags["#{dsc_resource_name}"]

          update_version = tracked_version.nil? ? true : update_versions

          if update_version
            puts "Using the latest/available reference of #{latest_version} for #{dsc_resource_name}."
            checkout_version = latest_version
          else
            puts "Using the specified reference of #{tracked_version} for #{dsc_resource_name}."
            checkout_version = tracked_version
          end

          # If the checkout_version does not yet exist in the current repo source
          # then re-fetch the upstream repository
          tag_exists = begin sh "git rev-parse #{checkout_version}" rescue false end
          if !tag_exists
            puts "#{checkout_version} is not a PSGallery tag. Fetching from git remote"
            sh "git fetch"
          end

          sh "git checkout #{checkout_version}"
          resource_tags["#{dsc_resource_name}"] = checkout_version.encode("UTF-8")
        end
      end

      File.open("#{dsc_resources_file}", 'w+') {|f| f.write resource_tags.to_yaml }

      # filter out unwanted files
      valid_files = Dir.glob("#{dsc_resources_path_tmp}/**/*").reject do |f|
        # reject the .git folder or special git files
        f =~ /\/\.(git|gitattributes|gitignore|gitmodules)/ ||
        # reject binary and other file extensions
        f =~ /\.(pptx|docx|sln|cmd|xml|pssproj|pfx|html|txt|xlsm|csv|png|git|yml|md)$/i ||
        # reject test / sample / example code
        f =~ /\/.*([Ss]ample|[Ee]xample|[Tt]est).*/ ||
        # and don't keep track of dirs
        Dir.exists?(f)
      end

      vendor_subdir = is_custom_resource ? '' : '/xDscResources' # Case sensitive
      puts "Copying vendored resources from #{dsc_resources_path_tmp}#{vendor_subdir} to #{vendor_dsc_resources_path}"

      # remove destination path, copy everything in from the filtered list
      puts "Adding custom types to '#{default_dsc_resources_path}'" if is_custom_resource
      FileUtils.rm_rf(vendor_dsc_resources_path) if Dir.exists?(vendor_dsc_resources_path)
      vendor_root = "#{dsc_resources_path_tmp}#{vendor_subdir}"
      valid_files.each do |f|
        if f.start_with?("#{vendor_root}/")
          dest = Pathname.new(f.sub(vendor_root, vendor_dsc_resources_path))

          FileUtils.mkdir_p(dest.dirname)
          FileUtils.cp(f, dest)
        end
        if is_custom_resource
          dest = Pathname.new(f.sub(dsc_resources_path_tmp, default_dsc_resources_path))
          FileUtils.mkdir_p(dest.dirname)
          FileUtils.cp(f, dest)
        end
      end
      # and duplicate the vendor_subdir files
      FileUtils.cp_r vendor_dsc_resources_path, dsc_resources_path

      if !is_custom_resource
        puts "Copying vendored resources from #{default_dsc_module_path}/build/vendor/wmf_dsc_resources to #{dsc_resources_path}"
        FileUtils.cp_r "#{default_dsc_module_path}/build/vendor/wmf_dsc_resources/.", "#{dsc_resources_path}/"
      end
    end

    desc <<-eod
    Cleanup #{item_name}

Default values:
  dsc_resources_path: #{default_dsc_resources_path}"
eod

    task :clean, [:dsc_resources_path] do |t, args|
      dsc_resources_path = args[:dsc_resources_path] || default_dsc_resources_path
      puts "Cleaning #{item_name}"
      FileUtils.rm_rf "#{dsc_resources_path}"
      FileUtils.rm_rf "#{vendor_dsc_resources_path}"
      FileUtils.rm_rf "#{default_dsc_module_path}/import"
    end

  end

  namespace :types do

    item_name = 'DSC types and type specs'

    desc "Build #{item_name}"
    task :build, [:module_path] do |t, args|
      module_path = args[:module_path] || default_dsc_module_path
      m = Dsc::Manager.new
      wait_for_resources = Dir["#{module_path}/**/MSFT_WaitFor*"]
      fail "MSFT_WaitFor* resources found - aborting type building! Please remove the following MSFT_WaitFor* DSC Resources and run the build again.\n\n#{wait_for_resources}\n" if !wait_for_resources.empty?
      m.target_module_path = module_path
      msgs = m.build_dsc_types
      msgs.each{|m| puts "#{m}"}
    end

    desc "Document #{item_name}"
    task :document, [:module_path] do |t, args|
      module_path = args[:module_path] || default_dsc_module_path
      m = Dsc::Manager.new
      m.target_module_path = module_path
      m.document_types("#{default_dsc_module_path}/types.md", m.get_dsc_types)
    end

    desc "Cleanup #{item_name}"
    task :clean, [:module_path] do |t, args|
      module_path = args[:module_path] || default_dsc_module_path
      puts "Cleaning #{item_name}"
      m = Dsc::Manager.new
      m.target_module_path = module_path
      msgs = m.clean_dsc_types
      msgs.each{|m| puts "#{m}"}
      msgs = m.clean_dsc_type_specs
      msgs.each{|m| puts "#{m}"}
    end

  end

  namespace :module do

    item_name = 'External DSC module'

    desc "Generate skeleton for #{item_name}"
    task :skeleton, [:dsc_module_path] do |t, args|
      dsc_module_path = args[:dsc_module_path] || default_dsc_module_path
      module_name = Pathname.new(dsc_module_path).basename.to_s
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
            full_path = "#{dsc_module_path}/#{path}"
            unless File.exists?(full_path)
              puts "Creating directory #{full_path}"
              FileUtils.mkdir_p(full_path)
            end
          else
            directory = Pathname.new(path).dirname
            full_directory_path = "#{dsc_module_path}/#{directory}"
            full_path = "#{dsc_module_path}/#{path}"
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

      unless File.exists?("#{dsc_module_path}/Puppetfile")
        puts "Creating #{dsc_module_path}/Puppetfile"

        # Generate Puppetfile with dependency on this dsc module
        Puppetfile_content = <<-eos
forge "https://forgeapi.puppetlabs.com"
mod '#{dsc_build_path.parent.basename}', :git => '#{dsc_repo_url}'
eos

        File.open("#{dsc_module_path}/Puppetfile", 'w') do |file|
          file.write Puppetfile_content
        end

      end

      # Generate Gemfile without any groups
      unless File.exists?("#{dsc_module_path}/Gemfile")
        puts "Creating #{dsc_module_path}/Gemfile"
        Gemfile_content = File.read('Gemfile')
        File.open("#{dsc_module_path}/Gemfile", 'w') do |file|
          file.write Gemfile_content.gsub(/^group.*^end$/m,'')
        end
      end

      # Generate Rakefile
      unless File.exists?("#{dsc_module_path}/Rakefile")
        puts "Creating #{dsc_module_path}/Rakefile"
        Rakefile_content = File.read('Rakefile')
        File.open("#{dsc_module_path}/Rakefile", 'w') do |file|
          file.write Rakefile_content.gsub(/\/spec\/fixtures\/modules\/dsc/, "/spec/fixtures/modules/#{module_name.split('-').last}")
        end
      end

    end

  end

end
