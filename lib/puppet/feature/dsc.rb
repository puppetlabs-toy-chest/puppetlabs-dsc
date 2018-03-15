require 'puppet/util/feature'

if Puppet.features.microsoft_windows?
  required_version = Gem::Version.new('5.0.10586.117')
  installed_version = Gem::Version.new(Facter.value(:powershell_version))

  if (installed_version >= required_version)
    Puppet.features.add(:dsc)
  else
    Puppet.warn_once(
      'dsc_unavailable',
      :dsc_unavailable,
      _("The dsc module requires PowerShell version %{required} - current version %{current}") %
        { :required => required_version, :current => installed_version},
      nil,
      nil,
      :err
    )
  end
end
