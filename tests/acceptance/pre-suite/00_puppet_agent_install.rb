test_name 'Install Puppet Agent'

confine(:to, :platform => 'windows')

#Init
puppet_agent_version = ENV['PUPPET_AGENT_VERSION'] || '1.1.0'

step 'Install Puppet Agent'
agents.each do |agent|
  install_puppetagent_dev_repo(agent, :version => puppet_agent_version)
end
