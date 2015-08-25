#! /usr/bin/env ruby
require 'spec_helper'
require 'puppet/type'
require 'fileutils'
require 'puppet/file_system'
require 'puppet/feature/vendors_dsc'

describe DscSymlink, :if => Puppet::Util::Platform.windows? do

  let (:top_level_path) do
    Dir.mktmpdir('dsc_playground')
  end
  let (:path) { top_level_path }
  let (:program_files) { "#{path}\\Program Files"}
  let (:vendored_modules_symlink_path){ "#{program_files}\\WindowsPowerShell\\Modules\\PuppetVendoredModules" }

  context ".set_symlink_folder" do
    before :each do
      Win32::Registry.any_instance.expects(:[]).with('ProgramFilesDir').returns(program_files).at_most(10)
      Puppet::FileSystem.unlink(vendored_modules_symlink_path) if Puppet::FileSystem.symlink?(vendored_modules_symlink_path)
      # do NOT use FileUtils.rm_rf. It follows the links
      system("rmdir /s /q \"#{program_files}\"") if ::File.directory?(program_files)
    end

    def set_symlink_and_check
      subject.set_symlink_folder

      Puppet::FileSystem.symlink?(vendored_modules_symlink_path).must be_true
      Puppet::FileSystem.readlink(vendored_modules_symlink_path).must == subject.vendored_modules_path
    end

    it "should not create a symlink if it already exists" do
      FileUtils.mkdir_p(::File.expand_path('..', vendored_modules_symlink_path))
      Puppet::FileSystem.symlink(subject.vendored_modules_path, vendored_modules_symlink_path, { :force => true})
      Puppet::FileSystem.expects(:symlink).never

      set_symlink_and_check
    end

    it "should recreate a symlink if the existing link path is wrong" do
      FileUtils.mkdir_p(::File.expand_path('..', vendored_modules_symlink_path))
      Puppet::FileSystem.symlink(Dir.mktmpdir('dsc_link'), vendored_modules_symlink_path, { :force => true})

      set_symlink_and_check
    end

    it "should recreate a symlink if the existing link path does not exist" do
      FileUtils.mkdir_p(::File.expand_path('..', vendored_modules_symlink_path))
      link_target = Dir.mktmpdir('dsc_link')
      Puppet::FileSystem.symlink(link_target, vendored_modules_symlink_path, { :force => true})
      system("rmdir /s /q \"#{link_target}\"")

      set_symlink_and_check
    end

    it "should create a symlink if the existing path is a directory" do
      FileUtils.mkdir_p(vendored_modules_symlink_path)

      set_symlink_and_check
    end

    it "should create a symlink if the existing path is a file" do
      FileUtils.mkdir_p(::File.expand_path('..', vendored_modules_symlink_path))
      FileUtils.touch vendored_modules_symlink_path

      set_symlink_and_check
    end

    it "should create a symlink when the symlink does not exist" do
      FileUtils.mkdir_p(program_files)

      set_symlink_and_check
    end

    it "should create the folder structure and symlink when the folder structure does not exist" do
      set_symlink_and_check
    end
  end
end
