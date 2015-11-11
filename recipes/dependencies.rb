#
# Cookbook Name:: kallisto
# Recipe:: dependencies
#
# Copyright (c) 2015 Eagle Genomics, All Rights Reserved.

##########################################################

package ['tar'] do
  action :install
end

##########################################################

include_recipe 'build-essential'
