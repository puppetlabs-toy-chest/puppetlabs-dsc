
namespace :dsc do

  namespace :dmtf_schema do
    
    item_name = 'DMTF CIM MOF Schema files'

    desc "Import #{item_name}"
    task :import do
      puts "Downloading and Importing #{item_name}"
      m = Dsc::Manager.new
      m.import_dmtf_mofs
    end

    desc "Cleanup #{item_name}"
    task :clean do
      puts "Cleaning #{item_name}"
      m = Dsc::Manager.new
      m.clean_dmtf_mofs
    end

  end

  namespace :modules do

    item_name = 'DSC Powershell modules files'

    desc "Import #{item_name}"
    task :import do
      puts "Downloading and Importing #{item_name}"
      # m = Dsc::Manager.new
      # m.import_dsc_modules
    end

    desc "Cleanup #{item_name}"
    task :clean do
      puts "Cleaning #{item_name}"
      # m = Dsc::Manager.new
      # m.clean_dsc_modules
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
    end

    desc "Build #{item_name}"
    task :build do
      m = Dsc::Manager.new
      msgs = m.build_dsc_types
      msgs.each{|m| puts "#{m}"}
    end
  
  end

end
