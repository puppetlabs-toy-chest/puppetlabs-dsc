require 'json'
require 'yaml'
require 'fileutils'
require 'pathname'
require 'erb'

require 'logger'
require 'pry'

LIB_PATH = File.dirname(__FILE__)

require "#{LIB_PATH}/dsc/version"
require "#{LIB_PATH}/dsc/import"
require "#{LIB_PATH}/dsc/mof"
require "#{LIB_PATH}/dsc/property"
require "#{LIB_PATH}/dsc/resource"
require "#{LIB_PATH}/dsc/manager"

module Dsc

  begin
    Config = YAML::load_file("#{LIB_PATH}/dsc.yaml")
  rescue
    binding.pry
    puts "Configuration file not found."
    exit 1
  end  

  # begin
  #   logfile = Config['logfile']
  #   FileUtils.touch(logfile) unless File.exists?(logfile)
  #   Log = Logger.new File.new(logfile, 'w')
  # rescue
  #   puts "Log file must be defined in config file."
  #   exit 1
  # end  
end