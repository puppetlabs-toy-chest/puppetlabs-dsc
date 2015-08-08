#! /usr/bin/env ruby
require 'spec_helper'
require 'puppet/type'
require 'puppet/type/base_dsc'

describe Puppet::Type.type(:base_dsc).provider(:powershell) do

  it "should be an instance of Puppet::Type::Base_dsc::ProviderPowershell" do
    subject.must be_an_instance_of Puppet::Type::Base_dsc::ProviderPowershell
  end

end
