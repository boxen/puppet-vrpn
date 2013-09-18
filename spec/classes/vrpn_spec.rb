require 'spec_helper'
# Rename this file to classname_spec.rb
# Check other boxen modules for examples
# or read http://rspec-puppet.com/tutorial/
describe 'vrpn' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen',
      :boxen_user => 'testuser',
    }
  end

  it do
    should include_class('vrpn::config')

    should include_class('homebrew')

    should contain_package('vrpn')

    should contain_service('vrpn_server').with(:ensure => 'running')
  end
end
