require 'puppetlabs_spec_helper/module_spec_helper'
require 'rake'
require 'fileutils'

# for debugging
require 'pry' if Bundler.rubygems.find_name('pry').any?

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

# Workaround for cross-module type dependency
dsc_lib_path = File.join(fixture_path, 'modules', 'dsc','lib')
$:.unshift(dsc_lib_path) unless $:.include?(dsc_lib_path)

RSpec.configure do |c|
  c.module_path = File.join(fixture_path, 'modules')
  c.manifest_dir = File.join(fixture_path, 'manifests')
  c.pattern = FileList[c.pattern].exclude(/^spec\/fixtures/)

  # ensure specs are cleaned up
  tmpdir = Dir.mktmpdir("rspecrun_dsc")
  oldtmpdir = Dir.tmpdir()
  ENV['TMPDIR'] = tmpdir

  c.expect_with :rspec do |e|
    e.syntax = [:should, :expect]
  end

  c.after :suite do
    # return to original tmpdir
    ENV['TMPDIR'] = oldtmpdir
    if Puppet::Util::Platform.windows?
      #FileUtils.rm_rf(tmpdir) - follows symlinks on Windows
      # and deletes there as well :/
      system("rmdir /s /q \"#{tmpdir}\"")
    end
  end
end

# We need this because the RAL uses 'should' as a method.  This
# allows us the same behaviour but with a different method name.
class Object
  alias :must :should
  alias :must_not :should_not
end

Puppet::Util::Log.level = :warning
Puppet::Util::Log.newdestination(:console)

