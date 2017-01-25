log "I am cookbook #{cookbook_name}"

raise if node['platform'] == 'debian'
