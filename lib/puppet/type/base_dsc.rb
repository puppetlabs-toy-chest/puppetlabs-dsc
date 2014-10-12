# This is the base type for dsc.
# Used to inherit the providers for the generated DSC resources
require 'puppet_x/msutter/helpers/dsc_type_helpers'

Puppet::Type.newtype(:base_dsc) do

  include PuppetX::Msutter::Helpers::DscTypeHelpers

  newparam(:name, :namevar => true ) do
  end

end
