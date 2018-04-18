require 'beaker-rspec'
require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'
require 'erb'
require 'lib/dsc_utils'

run_puppet_install_helper

install_ca_certs

proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
hosts.each do |host|
  install_module_dependencies_on(host)
  install_dev_puppet_module_on(host, :source => proj_root, :module_name => 'dsc')
end

def windows_agents
  agents.select { |agent| agent['platform'].include?('windows') }
end

def single_dsc_resource_manifest(dsc_type, dsc_props)
  output = "dsc_#{dsc_type} {'#{dsc_type}_test':\n"
  dsc_props.each do |k, v|
    if v =~ /^\[.*\]$/
      output += "  #{k} => #{v},\n"
    elsif v =~ /^(true|false)$/
      output += "  #{k} => #{v},\n"
    elsif v =~ /^{.*}$/
      output += "  #{k} => #{v},\n"
    else
      output += "  #{k} => '#{v}',\n"
    end
  end
  output += "}\n"
  return output
end
