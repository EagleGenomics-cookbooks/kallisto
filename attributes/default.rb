default['kallisto']['version'] = '0.42.4'
default['kallisto']['install_path'] = '/usr/local'
default['kallisto']['dir'] = default['kallisto']['install_path'] + '/' + 'kallisto_linux-v' + default['kallisto']['version']
default['kallisto']['filename'] = "kallisto_linux-v#{node['kallisto']['version']}.tar.gz"
default['kallisto']['url'] = "https://github.com/pachterlab/kallisto/releases/download/v#{node['kallisto']['version']}/#{node['kallisto']['filename']}"
