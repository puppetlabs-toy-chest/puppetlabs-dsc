require 'json'
require 'yaml'
require 'fileutils'
require 'pathname'
require 'erb'
require 'open-uri'
require 'find'
require 'logger'
require 'docopt'

# Bundler group 'build'
if Bundler.rubygems.find_name('mof').any?
  require 'mof'
  require 'cim'
  require 'charlock_holmes/string'
end

# Debug
require 'pry' if Bundler.rubygems.find_name('pry').any?

LIB_PATH = File.dirname(__FILE__)

require "#{LIB_PATH}/dsc/version"
require "#{LIB_PATH}/dsc/mof"
require "#{LIB_PATH}/dsc/property"
require "#{LIB_PATH}/dsc/resource"
require "#{LIB_PATH}/dsc/psmodule"
require "#{LIB_PATH}/dsc/manager"

class String
  def to_bool
    return true   if self == true   || self =~ (/(true|t|yes|y|1)$/i)
    return false  if self == false  || self =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end

class Hash
  def filter(*keys)
    return self if keys.empty?
    string_keys = {}
    keys.collect do |k,v|
      k.is_a?(Symbol) ? string_keys[k.to_s] = v : string_keys[k] = v
    end
    self.select do |hash_key|
      string_keys.include?(hash_key)
    end
  end
end

# Passing named arguments to Ruby Rake tasks using docopt for data science pipelines
# more infos on:
# https://github.com/blueshift-labs/demo_rake_arguments
#
# The parse_arguments method takes 3 arguments:
# the rake task_name that we want to execute
# the argument_spec
# the args actual input that was provided when launching the task and that should be validated.
# Parsing and validation happens magically by:
#   Docopt::docopt(doc, {:argv => args})
class RakeTaskArguments
  def self.parse_description(task_name, doc, args)
    arguments = {}
    begin
      # Because the new version of rake passes the -- along in the args variable,
      # we need to filter it out if it's present
      args.delete_at(1) if args.length >= 2 and args[1] == '--'
      # Have docopt parse the provided args (via :argv) against the doc spec
      Docopt::docopt(doc, {:argv => args}).each do |key, value|
        # Store key/value, converting '--key' into 'key' for accessability
        # Per docopt pec, the key '--' contains the actual task name as a value
        # so we label it accordingly
        arguments[key == "--" ? 'task_name' : key.gsub('--', '')] = value
      end
    rescue Docopt::Exit => e
      abort(e.message)
    end
    return arguments
  end

  def self.serialize_arguments(parameters)
    serialized_params = []
    # cleanup task_name and help keys
    parameters.reject {|k,v| k == "task_name" || k == "help"}.each do |key, value|
      # Check if boolean
      if !!value == value
        serialized_params.push("--#{key}") if value
      else
        serialized_params.push("--#{key}=#{value}") unless value.nil?
      end
    end
    serialized_params
  end

  # Helper method for invoking and re-enabling rake tasks with params hash
  def self.execute_rake(namespaced_task_name, parameters)
    # Invoke the actual rake task with the given arguments
    invoke_parameters = []
    # Add task name with namespace
    invoke_parameters.push("#{namespaced_task_name}")
    # Add serialize parameters
    invoke_parameters.concat(serialize_arguments(parameters))
    Rake::Task["#{namespaced_task_name}"].invoke(invoke_parameters)
    # Re-enable the rake task in case it is being for different parameters (e.g. in a loop)
    Rake::Task["#{namespaced_task_name}"].reenable
  end
end

module Dsc
end