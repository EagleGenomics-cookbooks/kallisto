#
# Cookbook Name:: kallisto
# Recipe:: dependencies
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.

##########################################################

package ['epel-release'] do
  action :install
end

package ['tar', 'make', 'cmake', 'zlib-devel', 'hdf5-devel'] do
  action :install
end

##########################################################

include_recipe 'build-essential'
