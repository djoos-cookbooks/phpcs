#
# Cookbook Name:: phpcs
# Recipe:: default
#
# Copyright (c) 2016, David Joos
#

case node['phpcs']['install_method']
when 'pear'
  include_recipe 'phpcs::pear'
when 'composer'
  include_recipe 'phpcs::composer'
end
