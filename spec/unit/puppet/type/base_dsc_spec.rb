#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:base_dsc) do

  let :base_dsc do
    Puppet::Type.type(:base_dsc).new(
      :name     => 'foo',
    )
  end

  it "should stringify normally" do
    expect(base_dsc.to_s).to eq("Base_dsc[foo]")
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(base_dsc)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(base_dsc)
    end

  end

end
