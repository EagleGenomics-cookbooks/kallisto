# 'master' can be used for the current version
default['kallisto']['version'] = 'v0.42.4'
default['kallisto']['install_path'] = '/usr/local/bin'
default['kallisto']['dir'] = default['kallisto']['install_path'] + '/' + 'kallisto_linux-' + default['kallisto']['version']
default['kallisto']['filename'] = "kallisto_linux-#{node['kallisto']['version']}.tar.gz"
default['kallisto']['url'] = "https://github.com/pachterlab/kallisto/releases/download/#{node['kallisto']['version']}/#{node['kallisto']['filename']}"
