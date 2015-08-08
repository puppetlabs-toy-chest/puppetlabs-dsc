require 'puppet/util/feature'
require 'puppet/file_system'
require 'fileutils'
require 'win32/registry' if Puppet::Util::Platform.windows?

Puppet.features.add(:vendors_dsc?) do
  return false if !Puppet::Util::Platform.windows?

  module DscSymlink
    # Ensure the symlink folder exists and is pointing to the proper location.
    # This also ensures the directory structure is in place prior to creating
    # the symlink, otherwise the symlink creation fails.
    def self.set_symlink_folder
      puppet_modules_vendor_folder = "#{get_program_files_dir}\\WindowsPowerShell\\Modules\\PuppetVendoredModules"

      return if Puppet::FileSystem.symlink?(puppet_modules_vendor_folder) &&
                Puppet::FileSystem.readlink(puppet_modules_vendor_folder) == vendored_modules_path

      if Puppet::FileSystem.symlink?(puppet_modules_vendor_folder)
        Puppet::FileSystem.unlink(puppet_modules_vendor_folder)
      elsif Puppet::FileSystem.exist?(puppet_modules_vendor_folder)
        FileUtils.mv puppet_modules_vendor_folder, "#{puppet_modules_vendor_folder}.#{Time.now.utc.strftime("%Y%m%d_%H%M%S_%L")}"
      end

      Puppet.debug "Creating symlink at '#{puppet_modules_vendor_folder}' \n pointed to '#{vendored_modules_path}'."
      Puppet::FileSystem.dir_mkpath(puppet_modules_vendor_folder) if !Puppet::FileSystem.dir_exist?(puppet_modules_vendor_folder)
      Puppet::FileSystem.symlink(vendored_modules_path, puppet_modules_vendor_folder,{ :force => true})
    end

    # Get the non-x86 program files path, no matter whether the process is
    # a 32 bit or 64 bit process. Shut off registry redirection and query
    # the ProgramFilesDir key to retrieve the program files value.
    def self.get_program_files_dir
      program_files_dir = nil
      begin
        hive = Win32::Registry::HKEY_LOCAL_MACHINE
        hive.open('SOFTWARE\Microsoft\Windows\CurrentVersion', Win32::Registry::KEY_READ | 0x100) do |reg|
          program_files_dir = reg['ProgramFilesDir']
        end
      rescue Win32::Registry::Error => e
        Puppet.warning "Error occurred attempting to read program files directory from registry, using default. \n Message: #{e.message}"
        program_files_dir = 'C:\Program Files'
      end

      program_files_dir
    end

    def self.vendored_modules_path
      File.expand_path(File.join(__FILE__, '..', '..', '..', 'puppet_x', 'dsc_resources')).gsub(/\//,'\\')
    end
  end

  DscSymlink.set_symlink_folder
  true
end
