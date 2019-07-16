# rubocop:disable Style/ClassAndModuleChildren
module Dsc
  # Handle importing the dsc files from git repos
  class TypeImporter
    def find_valid_files(directory)
      valid_files = Dir.glob("#{directory}/**/*").reject do |f|
        # reject the .git folder or special git files
        f =~ %r{\/\.(git|gitattributes|gitignore|gitmodules)} ||
          # reject binary and other file extensions
          f =~ %r{\.(pptx|docx|sln|cmd|xml|pssproj|pfx|html|txt|xlsm|csv|png|git|yml|md|js|json)$}i ||
          # reject test / sample / example code
          f =~ %r{\/.*([Ss]ample|[Ee]xample|[Tt]est).*} ||
          # reject stuff that is a Composite DSC Resource
          f =~ %r{(xChrome|xDSCResourceDesigner|xDscDiagnostics|xFirefox|xSafeHarbor|xSystemSecurity).*} ||
          # reject duplicated resources
          f =~ %r{(xSharePoint|PSDscResources).*} ||
          # and don't keep track of dirs
          Dir.exist?(f)
      end

      valid_files
    end

    def move_valid_files(valid_files, community_dsc_resources_root, official_dsc_resources_root, dsc_resources_path, vendor_dsc_resources_path, default_dsc_module_path)
      valid_files.each do |f|
        if f.start_with?("#{community_dsc_resources_root}/")
          move_file(f, community_dsc_resources_root, vendor_dsc_resources_path)
        end
        if f.start_with?("#{official_dsc_resources_root}/")
          move_file(f, official_dsc_resources_root, vendor_dsc_resources_path)
        end
      end

      # and duplicate the vendored files
      FileUtils.cp_r vendor_dsc_resources_path, dsc_resources_path

      puts "Copying vendored resources from #{default_dsc_module_path}/build/vendor/wmf_dsc_resources to #{dsc_resources_path}"
      FileUtils.cp_r "#{default_dsc_module_path}/build/vendor/wmf_dsc_resources/.", "#{dsc_resources_path}/"
    end

    def move_valid_custom_files(valid_files, dsc_resources_path, vendor_dsc_resources_path, default_dsc_resources_path)
      puts "Importing custom types from '#{dsc_resources_path}'"

      puts "Copying vendored resources from #{dsc_resources_path} to #{vendor_dsc_resources_path}"
      valid_files.each do |f|
        dest = Pathname.new(f.sub(dsc_resources_path, vendor_dsc_resources_path))
        FileUtils.mkdir_p(dest.dirname)
        FileUtils.cp(f, dest)
      end

      puts "Adding custom types to '#{default_dsc_resources_path}'"
      FileUtils.mkdir_p(default_dsc_resources_path) unless Dir.exist? default_dsc_resources_path
      valid_files.each do |f|
        dest = Pathname.new(f.sub(dsc_resources_path, default_dsc_resources_path))
        FileUtils.mkdir_p(dest.dirname)
        FileUtils.cp(f, dest)
      end
    end

    def move_file(f, dsc_resources_root, vendor_dsc_resources_path)
      dscresource_name = f.split(dsc_resources_root)[1].split('/')[1]
      if f.include?("/#{dscresource_name}/Modules/#{dscresource_name}")
        d = f.sub("#{dscresource_name}/Modules/#{dscresource_name}", dscresource_name.to_s)
        dest = Pathname.new(d.sub(dsc_resources_root, vendor_dsc_resources_path))
      else
        dest = Pathname.new(f.sub(dsc_resources_root, vendor_dsc_resources_path))
      end

      FileUtils.mkdir_p(dest.dirname)
      FileUtils.cp(f, dest)
    end
  end
end
