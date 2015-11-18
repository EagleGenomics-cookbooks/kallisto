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

directory "#{node['kallisto']['dir']}/build" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'kallisto cmake' do
  command 'cmake ../CMakeLists.txt'
  cwd "#node['kallisto']['dir']/build"
  not_if { ::File.exist?("#{node['kallisto']['dir']}/Makefile") }
end

execute 'kallisto make' do
  command 'make ../'
  cwd "#node['kallisto']['dir']/build"
  not_if { ::File.exist?("#{node['kallisto']['dir']}/srcsdsds") } # TODO: finish this
end

execute 'kallisto make install' do
  command 'make install ../'
  cwd "#node['kallisto']['dir']/build"
  not_if { ::File.exist?("#{node['kallisto']['install_dir']}/bin/kallisto") }
end

# this symlinks every executable in the install subdirectory to the top of the directory tree
# so that they are in the PATH
execute "find #{node['kallisto']['dir']} -maxdepth 1 -name 'kallisto' -executable -type f -exec ln -sf {} . \\;" do
  cwd node['kallisto']['install_path'] + '/bin'
end

##########################################################
##########################################################
