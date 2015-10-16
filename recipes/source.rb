#
# Cookbook Name:: kallisto
# Recipe:: source
#
# Copyright (c) 2015 Eagle Genomics, All Rights Reserved.

##########################################################

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
execute "find #{node['kallisto']['dir']} -maxdepth 1 -name 'kallisto' -executable -type f -exec ln -s {} . \\;" do
  cwd node['kallisto']['install_path']
end

##########################################################
##########################################################
