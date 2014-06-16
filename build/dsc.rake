import 'build/dsc.rb'

namespace :dsc do

  desc "Import DSC types (populates import directory)"
  task :import do
    puts "Importing DSC types"
  end

  desc "Cleanup all DSC types (lib/puppet/type) form the imported PS DSC Modules"
  task :clean do
    puts "Cleaning all types"
    m = Dsc::Manager.new
    types = m.clean_dsc_types
    types.each{|t| puts "#{t}"}

  end

  desc "Build all DSC types (lib/puppet/type)"
  task :build do
    m = Dsc::Manager.new
    types = m.build_dsc_types
    types.each{|t| puts "#{t}"}
  end

end
