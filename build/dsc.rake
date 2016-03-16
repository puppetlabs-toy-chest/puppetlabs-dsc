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

  desc "Import and build all"
  task :build, [:dsc_module_path] do |t, args|
    dsc_module_path = args[:dsc_module_path] || default_dsc_module_path

    if args[:dsc_module_path]
      Rake::Task['dsc:module:skeleton'].invoke(dsc_module_path)
    end

    Rake::Task['dsc:resources:import'].invoke unless File.exists?(default_dsc_resources_path)
    raise "The MOF files are not sanitized" unless sanitize_mof_files("#{default_dsc_resources_path}/**/*.mof", false)    
    Rake::Task['dsc:types:clean'].invoke(dsc_module_path)
    Rake::Task['dsc:types:build'].invoke(dsc_module_path)
    Rake::Task['dsc:types:document'].invoke(dsc_module_path)
  end

  def sanitize_mof_files(path_spec, remediate = false)
    issanitized = true
    detector = CharlockHolmes::EncodingDetector.new
    Dir[path_spec].each do |original|
      if !File.directory?(original)
        content = File.read(original)
        detection = detector.detect(content)
        if detection[:encoding] != 'ISO-8859-1'
          # Check if a BOM is present
          bomtype = nil
          bombytes = IO.binread(original,4)
          case bombytes[0..3]
            when "\x00\x00\xFE\xFF"
              bomtype = bomtype || 'BOM_UTF_32_1'
            when "\xFF\xFE\x00\x00"
              bomtype = bomtype || 'BOM_UTF_32_2'
            when "\xDD\x73\x66\x73"
              bomtype = bomtype || 'BOM_UTF_EBCDIC'
            when "\x84\x31\x95\x33"
              bomtype = bomtype || 'BOM_GB_18030'
          end
          case bombytes[0..2]
            when "\xEF\xBB\xBF"
              bomtype = bomtype || 'BOM_UTF_8'
            when "\xF7\x64\x4C"
              bomtype = bomtype || 'BOM_UTF_1'
            when "\x0E\xFE\xFF"
              bomtype = bomtype || 'BOM_SCSU'
            when "\xFB\xEE\x28"
              bomtype = bomtype || 'BOM_BOCU'
          end
          case bombytes[0..1]
            when "\xFE\xFF"
              bomtype = bomtype || 'BOM_UTF_16_1'
            when "\xFF\xFE"
              bomtype = bomtype || 'BOM_UTF_16_2'
          end

          puts "Unexpected encoding: #{detection[:encoding]} - #{original}"
          
          if (!bomtype.nil?)
            if remediate
              puts "Detected and removed BOM header of type #{bomtype} - #{original}"
              utf8_encoded_content = CharlockHolmes::Converter.convert content, detection[:encoding], 'ISO-8859-1'
              File.open(original, "w+") do |f|
                f.write utf8_encoded_content
              end
            else
              puts "FATAL Detected a BOM header of type #{bomtype} - #{original}"
              issanitized = false
            end
          end
        end
      end
    end
    issanitized
  end    
  
  task :sanitize do |t, args|
    raise "Error while sanitizing the mof files" unless sanitize_mof_files("#{default_dsc_resources_path}/**/*.mof", true)    
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

    task :import, [:dsc_resources_path] do |t, args|
      dsc_resources_path = args[:dsc_resources_path] || default_dsc_resources_path
      dsc_resources_path = File.expand_path(dsc_resources_path)
      dsc_resources_path_tmp = "#{dsc_resources_path}_tmp"
      is_custom_resource = (dsc_resources_path != default_dsc_resources_path)

      if !is_custom_resource
        puts "Downloading and Importing #{item_name}"
        cmd = "git clone #{dsc_repo} #{dsc_resources_path_tmp} && " +
          "cd #{dsc_resources_path_tmp} && "
        cmd += "git checkout #{ENV['DSC_REF']} &&" if ENV['DSC_REF']
        cmd += "git submodule update --init --recursive"

        sh cmd
      else
        puts "Importing custom types from '#{dsc_resources_path}'"
        FileUtils.mkdir_p "#{dsc_resources_path_tmp}"
        FileUtils.cp_r "#{dsc_resources_path}/.", "#{dsc_resources_path_tmp}/"
      end

      FileUtils.rm_rf(Dir["#{dsc_resources_path_tmp}/**/.git"])

      blacklist = ['xChrome', 'xDSCResourceDesigner', 'xDscDiagnostics',
                   'xFireFox', 'xSafeHarbor', 'xSystemSecurity']
      puts "Cleaning out black-listed DSC resources: #{blacklist}"
      blacklist.each { |res| FileUtils.rm_rf("#{dsc_resources_path_tmp}/xDSCResources/#{res}") }

      puts "Cleaning out test and example files for #{item_name}"
      FileUtils.rm_rf(Dir["#{dsc_resources_path_tmp}/**/.git",
                          "#{dsc_resources_path_tmp}/**/*[Ss]ample*",
                          "#{dsc_resources_path_tmp}/**/*[Ee]xample*",
                          "#{dsc_resources_path_tmp}/**/*[Tt]est*"])

      puts "Cleaning out extraneous files for #{item_name}"
      FileUtils.rm_rf(Dir["#{dsc_resources_path_tmp}/**/.{gitattributes,gitignore,gitmodules}"])
      FileUtils.rm_rf(Dir["#{dsc_resources_path_tmp}/**/*.{pptx,docx,sln,cmd,xml,pssproj,pfx,html,txt,xlsm,csv,png,git,yml,md}"])

      vendor_subdir = is_custom_resource ? '' : '/xDSCResources'
      puts "Copying vendored resources from #{dsc_resources_path_tmp}#{vendor_subdir} to #{vendor_dsc_resources_path}"
      FileUtils.cp_r "#{dsc_resources_path_tmp}#{vendor_subdir}/.", vendor_dsc_resources_path, :remove_destination => true
      FileUtils.cp_r "#{dsc_resources_path_tmp}#{vendor_subdir}/.", dsc_resources_path

      if !is_custom_resource
        puts "Copying vendored resources from #{default_dsc_module_path}/build/vendor/wmf_dsc_resources to #{dsc_resources_path}"
        FileUtils.cp_r "#{default_dsc_module_path}/build/vendor/wmf_dsc_resources/.", "#{dsc_resources_path}/"
      else
        puts "Adding custom types to '#{default_dsc_resources_path}'"
        FileUtils.cp_r "#{dsc_resources_path_tmp}/.", "#{default_dsc_resources_path}/"
      end

      puts "Removing extra dir #{dsc_resources_path_tmp}"
      FileUtils.rm_rf "#{dsc_resources_path_tmp}"
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
