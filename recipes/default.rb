#
# Cookbook Name:: kallisto
# Recipe:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.

# Note: centos 6.6 ships with gcc 4.4.7 but kallisto uses
# a command line argument only supported in 4.7 onwards.
# Most of the code is ready in kallisto::dependencies and
# kallisto::source but for the time being we are just using
# the binary installation here in the default recipe.
# TODO: use gcc 4.7 and install from source. Then all we will
# need is:
#
# include_recipe 'kallisto::dependencies'
# include_recipe 'kallisto::source'

# And the following code can be removed:

package ['tar'] do
  action :install
end

include_recipe 'build-essential'

# here for use by serverspec
magic_shell_environment 'kallisto_DIR' do
  value node['kallisto']['dir']
end

magic_shell_environment 'kallisto_VERSION' do
  value node['kallisto']['version']
end

magic_shell_environment 'kallisto_INSTALL' do
  value node['kallisto']['install_path']
end

remote_file "#{Chef::Config[:file_cache_path]}/#{node['kallisto']['filename']}" do
  source node['kallisto']['url']
  action :create_if_missing
end

execute 'un-tar kallisto tar ball' do
  command "tar zxvf #{Chef::Config[:file_cache_path]}/#{node['kallisto']['filename']} -C #{node['kallisto']['install_path']}"
  not_if { ::File.exist?("#{node['kallisto']['dir']}/kallisto") }
end

# this symlinks every executable in the install subdirectory to the top of the directory tree
# so that they are in the PATH
execute "find #{node['kallisto']['dir']} -maxdepth 1 -name 'kallisto' -executable -type f -exec ln -sf {} . \\;" do
  cwd node['kallisto']['install_path'] + '/bin'
end
