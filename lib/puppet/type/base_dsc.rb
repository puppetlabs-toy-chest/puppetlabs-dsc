# This is the base type for dsc.
# Used to inherit the providers for the generated DSC resources
Puppet::Type.newtype(:base_dsc) do

  newparam(:name, :namevar => true ) do
  end
end
