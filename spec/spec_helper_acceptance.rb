require 'beaker-rspec'
require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'
require 'erb'
require 'lib/dsc_utils'
require 'beaker/testmode_switcher/dsl'

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

def test_file_path_manifest (test_dir_path, test_file_path, test_file_contents)
  <<-Manifest
  dsc_file {'tmp_folder':
      dsc_ensure          => 'present',
      dsc_type            => 'Directory',
      dsc_destinationpath => "#{test_dir_path}",
  }

  dsc_file {'tmp_file':
      dsc_ensure          => 'present',
      dsc_type            => 'File',
      dsc_destinationpath => "#{test_file_path}",
      dsc_contents        => "#{test_file_contents}"
  }
  Manifest
end

# Due to IMAGES-825, sometimes we can't create folders from within Cygwin, but instead
# need to break out to native Windows binaries to create them.  This creates files and
# folders with a correct and sane DACL
def create_remote_windows_directory(hosts, windows_path)
  windows_path = windows_path.gsub('\\','\\\\\\')
  on(hosts, "cmd.exe /c mkdir #{windows_path}", :accept_all_exit_codes => true)
end

def create_remote_windows_file(hosts, windows_path, content)
  # Note content CANNOT contain backslashes or file endings.  Single string only
  windows_path = windows_path.gsub('\\','\\\\\\')
  on(hosts, "cmd.exe /c echo #{content} > #{windows_path}", :accept_all_exit_codes => true)
end
