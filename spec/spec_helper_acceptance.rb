# frozen_string_literal: true

require 'lib/dsc_utils'
require 'erb'
require 'serverspec'
require 'puppet_litmus'
require 'open3'
include PuppetLitmus

def single_dsc_resource_manifest(dsc_type, dsc_props)
  output = "dsc_#{dsc_type} {'#{dsc_type}_test':\n"
  dsc_props.each do |k, v|
    output += if v =~ %r{^\[.*\]$}
                "  #{k} => #{v},\n"
              elsif v =~ %r{^(true|false)$}
                "  #{k} => #{v},\n"
              elsif v =~ %r{^{.*}$}
                "  #{k} => #{v},\n"
              else
                "  #{k} => '#{v}',\n"
              end
  end
  output += "}\n"
  output
end

def create_windows_file(folder_path, file_name, content)
  content = content.tr('"', "'")
  manifest = <<-FileManifest
    file{"#{folder_path}":
      ensure => directory,
    }

    file { "#{folder_path}/#{file_name}":
      content => "#{content}",
    }
  FileManifest
  apply_manifest(manifest)
end

def strip_crln(input_string)
  input_string.to_s.delete("\n").delete("\r")
end

def escape_value(value)
  if is_number?(value)
    value
  else
    "'#{value.to_s.gsub("'", "''")}\'"
  end
end

def is_number?(value)
  value.respond_to?(:to_i) ? value.to_s == value.to_i.to_s : false
end

if ENV['TARGET_HOST'].nil? || ENV['TARGET_HOST'] == 'localhost'
  puts 'Running tests against this machine !'
  if Gem.win_platform?
    set :backend, :cmd
  else
    set :backend, :exec
  end
else
  puts "TARGET_HOST #{ENV['TARGET_HOST']}"
  # load inventory
  inventory_hash = inventory_hash_from_inventory_file
  node_config = config_from_node(inventory_hash, ENV['TARGET_HOST'])

  if target_in_group(inventory_hash, ENV['TARGET_HOST'], 'ssh_nodes')
    set :backend, :ssh
    options = Net::SSH::Config.for(host)
    options[:user] = node_config.dig('ssh', 'user') unless node_config.dig('ssh', 'user').nil?
    options[:port] = node_config.dig('ssh', 'port') unless node_config.dig('ssh', 'port').nil?
    options[:password] = node_config.dig('ssh', 'password') unless node_config.dig('ssh', 'password').nil?
    host = if ENV['TARGET_HOST'].include?(':')
             ENV['TARGET_HOST'].split(':').first
           else
             ENV['TARGET_HOST']
           end
    set :host,        options[:host_name] || host
    set :ssh_options, options
  elsif target_in_group(inventory_hash, ENV['TARGET_HOST'], 'winrm_nodes')
    require 'winrm'

    set :backend, :winrm
    set :os, family: 'windows'
    user = node_config.dig('winrm', 'user') unless node_config.dig('winrm', 'user').nil?
    pass = node_config.dig('winrm', 'password') unless node_config.dig('winrm', 'password').nil?
    endpoint = "http://#{ENV['TARGET_HOST']}:5985/wsman"

    opts = {
      user: user,
      password: pass,
      endpoint: endpoint,
      operation_timeout: 300,
    }

    winrm = WinRM::Connection.new opts
    Specinfra.configuration.winrm = winrm
  end
end
