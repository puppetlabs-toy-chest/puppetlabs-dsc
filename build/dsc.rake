require 'yaml'

namespace :dsc do

  root_path                           = Pathname.new(__FILE__).dirname
  default_dsc_module_path             = root_path.parent
  default_dsc_resources_path          = "#{default_dsc_module_path}/import/dsc_resources"
  default_vendored_dsc_resources_path = "#{default_dsc_module_path}/lib/puppet_x/dsc_resources"
  dsc_resources_tags_file             = "#{default_dsc_module_path}/dsc_resource_release_tags.yml"
  dsc_repo                            = 'https://github.com/PowerShell/DscResources.git'

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
      microsoft_source = (dsc_resources_path == default_dsc_resources_path)

      m = Dsc::TypeImporter.new

      if microsoft_source
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

        puts "Copying vendored resources from #{dsc_resources_path_tmp} to #{default_vendored_dsc_resources_path}"

        # Create our final import directory and our working copy
        # We need the former to have as the final set of DSC Resources to both vendor and parse
        # We need the later as a staging area for files to copy and modify
        # In other words: dsc_resources_tmp is where we git clone, dsc_resources_copy is where we filter
        FileUtils.mkdir_p("#{default_dsc_module_path}/import/dsc_resources")
        FileUtils.mkdir_p("#{default_dsc_module_path}/import/dsc_resources_copy")

        # Copy all HQRM and Community DSC Resources to our working copy
        # This avoids alot of hardship in dealing with file paths later on
        FileUtils.cp_r "#{dsc_resources_path_tmp}/xDscResources/.", "#{default_dsc_module_path}/import/dsc_resources_copy"
        FileUtils.cp_r "#{dsc_resources_path_tmp}/DscResources/.", "#{default_dsc_module_path}/import/dsc_resources_copy"

        # We remove Composite DSC Resources entirely because we cannot parse them
        composite_resources.each do |cr|
          FileUtils.rm_rf "#{default_dsc_module_path}/import/dsc_resources_copy/#{cr}"
        end

        # These HQRM have a special folder structure that breaks our parsing and is different from the
        # shipped PSGallery folder structure. For example: https://github.com/PowerShell/ComputerManagementDsc/tree/dev/Modules/ComputerManagementDsc/DSCResources
        # We deal with this by moving anything in `<DSCResourceName>\Modules\<DSCResourceName>` to `<DSCResourceName>`,
        # essentially removing the `Modules` subfolder.
        [ 'ComputerManagementDsc', 'OfficeOnlineServerDsc', 'SharePointDsc' ].each do | hq |
          FileUtils.cp_r "#{dsc_resources_path_tmp}/DscResources/#{hq}", "#{default_dsc_module_path}/import/dsc_resources_copy"
          FileUtils.cp_r "#{default_dsc_module_path}/import/dsc_resources_copy/#{hq}/Modules/#{hq}/.",
            "#{default_dsc_module_path}/import/dsc_resources_copy/#{hq}"
          FileUtils.rm_rf "#{default_dsc_module_path}/import/dsc_resources_copy/#{hq}/Modules/#{hq}"
        end

        # Because we're using the git repos, we have to get rid of all the files that don't get shipped
        valid_files = m.find_valid_files("#{default_dsc_module_path}/import/dsc_resources_copy/**/*")

        # At this point all folders and files are in the correct structure, we need to copy all of them
        # out to our final import directory: `import/dsc_resources`. This special folder is what the MOF
        # parser looks at in the `dsc:types:build` rake task.
        valid_files.each do |f|
          dest = Pathname.new(f.sub("#{default_dsc_module_path}/import/dsc_resources_copy", "#{default_dsc_module_path}/import/dsc_resources"))
          FileUtils.mkdir_p(dest.dirname)
          FileUtils.cp(f, dest)
        end

        # Cleanup our working copy, we don't need it anymore
        FileUtils.rm_rf "#{default_dsc_module_path}/import/dsc_resources_copy"

        # We need to remove the existing `lib/puppet_x/dsc_resources` folder in order to account for file move/deletions
        FileUtils.rm_rf "#{default_dsc_module_path}/lib/puppet_x/dsc_resources"

        # First copied is the vendored DSC Resources (PSDesiredStateConfiguration) that are builtin to WMF
        puts "Copying vendored resources from #{default_dsc_module_path}/build/vendor/wmf_dsc_resources to #{default_dsc_module_path}/import/dsc_resources"
        FileUtils.cp_r "#{default_dsc_module_path}/build/vendor/wmf_dsc_resources/.", "#{default_dsc_module_path}/import/dsc_resources/."

        # At this point everything is in `import/dsc_resources` that we need to vendor, so copy it inside our module
        FileUtils.cp_r "#{default_dsc_module_path}/import/dsc_resources/.", "#{default_dsc_module_path}/lib/puppet_x/dsc_resources"
      else
        # filter out unwanted files
        valid_files = m.find_valid_files("#{dsc_resources_path}/**/*")
        m.move_valid_custom_files(valid_files, dsc_resources_path, default_vendored_dsc_resources_path, default_dsc_resources_path)
      end
    end

    desc "Checkout DSC Powershell modules"
    task :checkout, [:dsc_resources_path, :update_versions, :blacklist] do |t, args|
      dsc_resources_path = args[:dsc_resources_path]
      update_versions    = args[:update_versions]
      blacklist          = args[:blacklist]
      puts "Getting latest release tags for DSC resources in #{dsc_resources_path}..."

      resource_tags = {}
      resource_tags = YAML::load_file("#{dsc_resources_tags_file}") if File.exist? dsc_resources_tags_file

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
            latest_version = %x{ git rev-parse HEAD }.strip
            puts "WARNING: #{dsc_resource_name} does not have any '*-PSGallery' tags. Falling back to commit hash: #{latest_version}"
          else
            latest_version = versions.max.to_s + "-PSGallery"
          end

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
      File.open("#{dsc_resources_tags_file}", 'w+') { |f| YAML.dump(resource_tags, f) }
    end

    desc "Cleanup DSC Powershell modules files"
    task :clean, [:dsc_resources_path] do |t, args|
      dsc_resources_path = args[:dsc_resources_path] || default_dsc_resources_path
      puts "Cleaning DSC Powershell modules files"
      FileUtils.rm_rf "#{dsc_resources_path}"
      FileUtils.rm_rf "#{default_vendored_dsc_resources_path}"
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
