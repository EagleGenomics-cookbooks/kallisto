#
# Cookbook Name:: kallisto
# Recipe:: dependencies
#
# Copyright (c) 2015 Eagle Genomics, All Rights Reserved.

##########################################################

package ['epel-release'] do
  action :install
end

package ['tar', 'make', 'cmake', 'zlib-devel', 'hdf5-devel'] do
  action :install
end

##########################################################

include_recipe 'build-essential'
