# This is the base type for dsc.
# Used to inherit the providers for the generated DSC resources
Puppet::Type.newtype(:base_dsc) do
  @doc = %q{
    The base Puppet DSC type that all of the types inherit from.
    Do not use this directly.

  }

  newparam(:name, :namevar => true ) do
    desc 'A name to describe your resource, used for uniqueness.'
  end
end
