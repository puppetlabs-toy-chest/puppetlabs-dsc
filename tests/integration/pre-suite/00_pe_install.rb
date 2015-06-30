require 'master_manipulator'
test_name 'FM-2626 - C48 - Install Puppet Enterprise'

step 'Install PE'
install_pe

step 'Disable Node Classifier'
disable_node_classifier(master)

step 'Disable environment caching'
disable_env_cache(master)

step 'Restart Puppet Server'
restart_puppet_server(master)
