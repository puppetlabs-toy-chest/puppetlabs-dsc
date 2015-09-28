require 'spec_helper'

RSpec.describe 'dsc::lcm_config', :type => :define do

  context 'refresh_mode should default to Disabled' do
    let (:title) { 'lcm_default' }

    it {
      should contain_dsc__lcm_config(title).with(
        {
          'refresh_mode' => 'Disabled'
        }
      )
    }
  end

  ['Disabled', 'Push'].each do |mode|
    context "when refresh_mode => #{mode}" do
      let (:title)  { "lcm_#{mode}" }
      let (:params) { {:refresh_mode => mode} }

      it {should compile}

      it {
        should contain_dsc__lcm_config(title).with(
          {
            'refresh_mode' => mode
          }
        )
      }
    end
  end

  ['disabled', 'push', 'pull', 'Pull', 'foo', 'bar'].each do |mode|
    context "when refresh_mode => #{mode}" do
      let (:title)  { "lcm_#{mode}" }
      let (:params) { {:refresh_mode => mode} }

      it {should_not compile}

      let (:error_message) { /refresh_mode must be one of/}
      it {
        expect { catalogue }.to raise_error(Puppet::Error, error_message)
      }
    end
  end
end
