Facter.add(:uses_win32console) do
  setcode do
    if Puppet::Util::Platform.windows?
      defined?(Win32::Console) &&
        Win32::Console.class == Class
    end
  end
end
