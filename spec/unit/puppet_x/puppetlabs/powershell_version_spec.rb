#! /usr/bin/env ruby
require 'spec_helper'
require 'puppet/type'
require 'puppet_x/puppetlabs/powershell_version'

describe PuppetX::PowerShell::PowerShellVersion, :if => Puppet::Util::Platform.windows? do
  context "detecting versions" do
  end
end
