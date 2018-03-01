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

    desc "Import DSC Powershell modules files"
    task :import, [:dsc_resources_path, :update_versions] do |t, args|
      dsc_resources_path = args[:dsc_resources_path] || default_dsc_resources_path
      dsc_resources_path = File.expand_path(dsc_resources_path)
      dsc_resources_path_tmp = "#{dsc_resources_path}_tmp"
      update_versions = args[:update_versions] || false
      is_custom_resource = (dsc_resources_path != default_dsc_resources_path)
      
      m = Dsc::TypeImporter.new

      if !is_custom_resource
        puts "Downloading and Importing DSC Powershell modules files"
        cmd = ''
        cmd = "git clone #{dsc_repo} #{dsc_resources_path_tmp} && " unless Dir.exist? dsc_resources_path_tmp
        cmd += "cd #{dsc_resources_path_tmp}"
        cmd += " && git checkout #{ENV['DSC_REF']}" if ENV['DSC_REF']
        cmd += " && git submodule update --init"

        sh cmd

        community_dsc_resources_root = "#{dsc_resources_path_tmp}/xDscResources"
        official_dsc_resources_root = "#{dsc_resources_path_tmp}/DscResources"
        composite_resources = [ 'xChrome','xDSCResourceDesigner','xDscDiagnostics',
          'xFirefox','xSafeHarbor','xSystemSecurity', 'PSDscResources' ]

        Rake::Task['dsc:resources:checkout'].invoke(
          community_dsc_resources_root, update_versions, composite_resources)
        Rake::Task['dsc:resources:checkout'].reenable
        Rake::Task['dsc:resources:checkout'].invoke(
          official_dsc_resources_root, update_versions, composite_resources)

        # filter out unwanted files
        valid_files = m.find_valid_files("#{dsc_resources_path_tmp}/**/*")

        puts "Copying vendored resources from #{dsc_resources_path_tmp} to #{vendor_dsc_resources_path}"

        # remove destination path, copy everything in from the filtered list
        m.move_valid_files(valid_files, community_dsc_resources_root, official_dsc_resources_root, dsc_resources_path, vendor_dsc_resources_path, default_dsc_module_path)
      else
        # filter out unwanted files
        valid_files = m.find_valid_files("#{dsc_resources_path}/**/*")
        m.move_valid_custom_files(valid_files, dsc_resources_path, vendor_dsc_resources_path, default_dsc_resources_path)
      end
    end

    desc "Checkout DSC Powershell modules"
    task :checkout, [:dsc_resources_path, :update_versions, :blacklist] do |t, args|
      dsc_resources_path = args[:dsc_resources_path]
      update_versions    = args[:update_versions]
      blacklist          = args[:blacklist]
      puts "Getting latest release tags for DSC resources in #{dsc_resources_path}..."
      
      resource_tags = {}
      resource_tags = YAML::load_file("#{dsc_resources_file}") if File.exist? dsc_resources_file

      Dir["#{dsc_resources_path}/*"].each do |dsc_resource_path|
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

      resource_tags = resource_tags.reject do |r|
        blacklist.include?(r)
      end
      
      # We use YAML.dump here to update the file instead of overwriting it. This ensures
      # we can write both HQ DSC Resources as well as Expertimental ones to the same yml
      File.open("#{dsc_resources_file}", 'w+') { |f| YAML.dump(resource_tags, f) }
    end

    desc "Cleanup DSC Powershell modules files"
    task :clean, [:dsc_resources_path] do |t, args|
      dsc_resources_path = args[:dsc_resources_path] || default_dsc_resources_path
      puts "Cleaning DSC Powershell modules files"
      FileUtils.rm_rf "#{dsc_resources_path}"
      FileUtils.rm_rf "#{vendor_dsc_resources_path}"
      FileUtils.rm_rf "#{default_dsc_module_path}/import"
    end

  end

  namespace :types do

    desc "Build DSC types and type specs"
    task :build, [:module_path] do |t, args|
      module_path = args[:module_path] || default_dsc_module_path
      m = Dsc::TypeBuilder.new(
        module_path,
        "#{module_path}/import",                                   #manager.@import_folder
        "#{module_path}/import/dsc_resources",                     #manager.@dsc_modules_folder
        "#{module_path}/build/qualifiers/base",                    #manager.@base_qualifiers_folder
        "#{module_path}/build/vendor/dmtf_mof",                    #manager.@dmtf_mof_folder
        "#{module_path}/build/dsc/templates/dsc_type.rb.erb",      #manager.@type_template_file
        "#{module_path}/build/dsc/templates/dsc_type_spec.rb.erb", #manager.@type_spec_template_file
        "lib/puppet/type",                                         #manager.@puppet_type_subpath
        "spec/unit/puppet/type"                                    #manager.@puppet_type_spec_subpath
      )
      m.target_module_path = module_path
      msgs = m.build_dsc_types
      msgs.each{|m| puts "#{m}"}
    end

    desc "Document DSC types and type specs"
    task :document, [:module_path] do |t, args|
      module_path = args[:module_path] || default_dsc_module_path
      m = Dsc::DocumentBuilder.new(
        module_path,
        "#{module_path}/import",                                   #manager.@import_folder
        "#{module_path}/import/dsc_resources",                     #manager.@dsc_modules_folder
        "#{module_path}/build/qualifiers/base",                    #manager.@base_qualifiers_folder
        "#{module_path}/build/vendor/dmtf_mof",                    #manager.@dmtf_mof_folder
        "#{module_path}/build/dsc/templates/dsc_type.rb.erb",      #manager.@type_template_file
        "#{module_path}/build/dsc/templates/dsc_type_spec.rb.erb", #manager.@type_spec_template_file
        "lib/puppet/type",                                         #manager.@puppet_type_subpath
        "spec/unit/puppet/type"                                    #manager.@puppet_type_spec_subpath
      )
      m.document_types("#{default_dsc_module_path}/types.md")
    end

    desc "Cleanup DSC types and type specs"
    task :clean, [:module_path] do |t, args|
      module_path = args[:module_path] || default_dsc_module_path
      puts "Cleaning DSC types and type specs"
      m = Dsc::TypeCleaner.new(
        module_path,
        "lib/puppet/type",
        "spec/unit/puppet/type",
      )
      msgs = m.clean_dsc_types
      msgs.each{|m| puts "#{m}"}
      msgs = m.clean_dsc_type_specs
      msgs.each{|m| puts "#{m}"}
    end

  end

end
