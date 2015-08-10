#! /usr/bin/env ruby
require 'spec_helper'
require 'puppet/type'
require 'fileutils'
require 'puppet/file_system'
require 'puppet/feature/vendors_dsc'

module DscSymlink; end # for tests on non-Windows

describe DscSymlink, :if => Puppet::Util::Platform.windows? do

  context ".set_symlink_folder" do
    context "on Windows" do
      it "should call Puppet::FileSystem.exist?" do
        Puppet::FileSystem.stubs(:symlink)

        Puppet::FileSystem.expects(:symlink?).returns(false).times(1..3)
        Puppet::FileSystem.expects(:exist?).returns(true)
        FileUtils.expects(:mv)

        subject.set_symlink_folder
      end

      it "should create the folder structure when it does not exist" do
        Puppet::FileSystem.stubs(:symlink)

        Puppet::FileSystem.expects(:symlink?).returns(false).times(2)
        Puppet::FileSystem.expects(:exist?).returns(false)
        Puppet::FileSystem.expects(:dir_exist?).returns(false)
        Puppet::FileSystem.expects(:dir_mkpath)

        Puppet::FileSystem.expects(:readlink).never
        Puppet::FileSystem.expects(:unlink).never
        FileUtils.expects(:mv).never

        subject.set_symlink_folder
      end

      it "should create a symlink when it does not exist" do
        Puppet::FileSystem.expects(:symlink?).returns(false).times(2)
        Puppet::FileSystem.expects(:exist?).returns(false)
        Puppet::FileSystem.expects(:dir_exist?).returns(true)
        Puppet::FileSystem.expects(:symlink)

        Puppet::FileSystem.expects(:readlink).never
        FileUtils.expects(:mv).never
        Puppet::FileSystem.expects(:dir_mkpath).never

        subject.set_symlink_folder
      end

      it "should not create a symlink when it already exists" do
        Puppet::FileSystem.expects(:symlink?).returns(true)
        Puppet::FileSystem.expects(:readlink).returns(subject.vendored_modules_path)

        Puppet::FileSystem.expects(:exist?).never
        FileUtils.expects(:mv).never
        Puppet::FileSystem.expects(:dir_exist?).never
        Puppet::FileSystem.expects(:dir_mkpath).never
        Puppet::FileSystem.expects(:unlink).never
        Puppet::FileSystem.expects(:symlink).never

        subject.set_symlink_folder
      end

      it "should recreate a symlink if the existing link path is wrong" do
        Puppet::FileSystem.expects(:symlink?).returns(true).times(2)
        Puppet::FileSystem.expects(:readlink).returns('C:\dsc').times(2)
        Puppet::FileSystem.expects(:exist?).with('C:\dsc').returns(true)
        Puppet::FileSystem.expects(:unlink)
        Puppet::FileSystem.expects(:dir_exist?).returns(true)
        Puppet::FileSystem.expects(:symlink)

        FileUtils.expects(:mv).never
        Puppet::FileSystem.expects(:dir_mkpath).never

        subject.set_symlink_folder
      end

      it "should recreate a symlink if the existing link path does not exist" do
        Puppet::FileSystem.expects(:symlink?).returns(true).times(2)
        Puppet::FileSystem.expects(:readlink).returns('C:\dsc').times(2)
        Puppet::FileSystem.expects(:exist?).with('C:\dsc').returns(false)
        FileUtils.expects(:mv)
        Puppet::FileSystem.expects(:dir_exist?).returns(true)
        Puppet::FileSystem.expects(:symlink)

        Puppet::FileSystem.expects(:unlink).never
        Puppet::FileSystem.expects(:dir_mkpath).never

        subject.set_symlink_folder
      end

      it "should create a symlink if the existing path is not a symlink" do
        Puppet::FileSystem.expects(:symlink?).returns(false).times(2)
        Puppet::FileSystem.expects(:exist?).returns(true)
        FileUtils.expects(:mv)
        Puppet::FileSystem.expects(:dir_exist?).returns(true)
        Puppet::FileSystem.expects(:symlink)

        Puppet::FileSystem.expects(:readlink).never
        Puppet::FileSystem.expects(:unlink).never
        Puppet::FileSystem.expects(:dir_mkpath).never

        subject.set_symlink_folder
      end
    end

    context "on Linux", :if => Puppet.features.posix? do
      it "should not call Puppet::FileSystem.exist?" do
        Puppet::FileSystem.expects(:exist?).never

        subject.expects(:set_symlink_folder).never
      end

      it "should not attempt to create a symlink" do
        Puppet::FileSystem.expects(:symlink).never

        subject.expects(:set_symlink_folder).never
      end
    end
  end

  context ".get_program_files_dir" do
    # Use the `any_instance` option as nothing will iterate and set
    # `program_files_dir` successfully in `get_program_files_dir`.
    # It has the downside that the registry query will actually occur, but the
    # upside that the location will always exist and the following specs are
    # only being performed on Windows. Ugh.

    it "should return program files path from registry" do
      expected_value = 'D:\yes'
      Win32::Registry.any_instance.expects(:[]).with('ProgramFilesDir').returns(expected_value).once

      subject.get_program_files_dir.must == expected_value
    end

    it "should return the default program files path when errors occur" do
      expected_value = 'C:\Program Files'
      Win32::Registry.any_instance.expects(:[]).with('ProgramFilesDir').raises(Win32::Registry::Error.new(2), 'nope').once

      subject.get_program_files_dir.must == expected_value
    end
  end

  context ".vendored_modules_path" do
    it "should not be a relative path" do
      subject.vendored_modules_path.include?('..').must be_false
    end

    it "should point to a valid path" do
      # the switch from / to \ throws off Posix
      File.directory?(subject.vendored_modules_path).must be_true
    end
  end
end
