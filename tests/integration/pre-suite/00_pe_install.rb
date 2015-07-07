require 'master_manipulator'
test_name 'FM-2626 - C48 - Install Puppet Enterprise'

# Init
options[:version] = ENV['PUPPET_AGENT_VERSION'] || '1.2.0'
options[:sha] = ENV['PUPPET_AGENT_VERSION'] || '1.2.0'

step 'Install PE'
install_pe

step 'Disable Node Classifier'
disable_node_classifier(master)

step 'Disable Environment Caching'
disable_env_cache(master)

step 'Restart Puppet Server'
restart_puppet_server(master)
