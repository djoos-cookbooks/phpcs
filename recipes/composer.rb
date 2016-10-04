#
# Cookbook Name:: phpcs
# Recipe:: composer
#
# Copyright (c) 2016, David Joos
#

include_recipe 'composer'

install_dir = node['phpcs']['install_dir']

# figure out what version to install
version = if node['phpcs']['version'] != 'latest'
            node['phpcs']['version']
          else
            '*.*.*'
          end

composer_install_global 'squizlabs/php_codesniffer' do
  install_dir install_dir
  version version
  bin_dir node['phpcs']['prefix']
end
