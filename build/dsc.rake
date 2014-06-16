import 'build/dsc.rb'

mof_item_name = 'DMTF CIM MOF Schema files'

namespace :dsc do
  namespace :import do
    desc "Import #{mof_item_name}"
    task :dmtf do
      puts "Downloading and Importing #{mof_item_name}"
      m = Dsc::Manager.new
      m.import_dmtf_mofs
      puts "Done"
    end
  end

  namespace :clean do

    desc "Cleanup #{mof_item_name}"
    task :dmtf do
      puts "Cleaning #{mof_item_name}"
      m = Dsc::Manager.new
      m.clean_dmtf_mofs
      puts "Done"
    end

    desc "Cleanup all DSC types (lib/puppet/type) form the imported PS DSC Modules"
    task :types do
      puts "Cleaning all types"
      m = Dsc::Manager.new
      types = m.clean_dsc_types
      types.each{|t| puts "#{t}"}
      puts "Done"
    end
  end


  desc "Build all DSC types (lib/puppet/type)"
  task :build do
    m = Dsc::Manager.new
    types = m.build_dsc_types
    types.each{|t| puts "#{t}"}
    puts "Done"
  end

end
