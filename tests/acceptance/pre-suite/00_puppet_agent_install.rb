test_name 'Install Puppet Agent'

confine(:to, :platform => 'windows')

#Init
puppet_agent_version = ENV['PUPPET_AGENT_VERSION'] || '1.2.0'

step 'Install Puppet Agent'
agents.each do |agent|
  install_puppetagent_dev_repo(agent, :version => puppet_agent_version)
end

step 'Prevent Puppet Service from Running'
on(agents, puppet('resource service puppet ensure=stopped enable=false'))
