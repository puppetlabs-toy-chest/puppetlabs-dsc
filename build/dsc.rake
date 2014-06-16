import 'build/dsc.rb'

mof_item_name = 'DMTF CIM MOF Schema files'

namespace :dsc do

  namespace :dtmf do

    desc "Import #{mof_item_name}"
    task :import do
      puts "Downloading and Importing #{mof_item_name}"
      m = Dsc::Manager.new
      m.import_dmtf_mofs
      puts "Done"
    end

    desc "Cleanup #{mof_item_name}"
    task :clean do
      puts "Cleaning #{mof_item_name}"
      m = Dsc::Manager.new
      m.clean_dmtf_mofs
      puts "Done"
    end
  end

  namespace :type do

    desc "Cleanup all DSC types (lib/puppet/type) form the imported PS DSC Modules"
    task :clean do
      puts "Cleaning all types"
      m = Dsc::Manager.new
      types = m.clean_dsc_types
      types.each{|t| puts "#{t}"}
      puts "Done"
    end

    desc "Build all DSC types"
    task :build do
      m = Dsc::Manager.new
      types = m.build_dsc_types
    end
  
  end
end
