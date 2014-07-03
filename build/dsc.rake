
namespace :dsc do

    desc "Import and build all"
    task :build do
      Rake::Task['dsc:dmtf:import'].execute
      Rake::Task['dsc:resources:import'].execute
      Rake::Task['dsc:types:build'].execute
    end

    desc "Cleanup all"
    task :clean do
      Rake::Task['dsc:types:clean'].execute
      Rake::Task['dsc:resources:clean'].execute
      Rake::Task['dsc:dmtf:clean'].execute
    end

   namespace :dmtf do

    item_name = 'DMTF CIM MOF Schema files'

    desc "Import #{item_name}"
    task :import do
      sh "librarian-repo install --verbose --path #{Dsc::Config['import_folder']} --Repofile 'build/dmtf.repo'"
    end

    desc "Cleanup #{item_name}"
    task :clean do
      sh "librarian-repo clean --verbose --path #{Dsc::Config['import_folder']}/#{Dsc::Config['dmtf_mof_folder']}"
    end

  end

  namespace :resources do

    item_name = 'DSC Powershell modules files'

    desc "Import #{item_name}"
    task :import do
      puts "Downloading and Importing #{item_name}"
      sh "librarian-repo install --verbose --path #{Dsc::Config['import_folder']}/#{Dsc::Config['dsc_modules_folder']}"
    end

    desc "Cleanup #{item_name}"
    task :clean do
      puts "Cleaning #{item_name}"
      sh "librarian-repo clean --verbose --path #{Dsc::Config['import_folder']}/#{Dsc::Config['dsc_modules_folder']}"
    end

  end

  namespace :types do

    item_name = 'DSC types in (lib/puppet/type)'

    desc "Cleanup #{item_name}"
    task :clean do
      puts "Cleaning #{item_name}"
      m = Dsc::Manager.new
      msgs = m.clean_dsc_types
      msgs.each{|m| puts "#{m}"}
      msgs = m.clean_dsc_type_specs
      msgs.each{|m| puts "#{m}"}
    end

    desc "Build #{item_name}"
    task :build do
      m = Dsc::Manager.new
      msgs = m.build_dsc_types
      msgs.each{|m| puts "#{m}"}
    end

  end

end
