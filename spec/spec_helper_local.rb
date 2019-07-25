RSpec.configure do |c|
  # ensure specs are cleaned up
  tmpdir = Dir.mktmpdir('rspecrun_dsc')
  oldtmpdir = Dir.tmpdir
  ENV['TMPDIR'] = tmpdir

  c.after :suite do
    # return to original tmpdir
    ENV['TMPDIR'] = oldtmpdir
    if Puppet::Util::Platform.windows?
      # FileUtils.rm_rf(tmpdir) - follows symlinks on Windows
      # and deletes there as well :/
      system("rmdir /s /q \"#{tmpdir}\"")
    end
  end
end

# We need this because the RAL uses 'should' as a method.  This
# allows us the same behaviour but with a different method name.
class Object
  alias must should
  alias must_not should_not
end

# Mocking Objects
class MockCIMClass
  attr_accessor :name
  attr_accessor :qualifiers

  def initialize(name)
    @name = name
    @qualifiers = {}
  end
end

class MockCIMQualifier
  attr_accessor :value

  def initialize(value)
    @value = value
  end
end
