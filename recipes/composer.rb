#
# Cookbook Name:: phpcs
# Recipe:: composer
#
# Copyright (c) 2016, David Joos
#

include_recipe 'composer'

install_dir = node['phpcs']['install_dir']

directory install_dir do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# figure out what version to install
version = if node['phpcs']['version'] != 'latest'
            node['phpcs']['version']
          else
            '*.*.*'
          end

# composer.json
template "#{install_dir}/composer.json" do
  source 'composer.json.erb'
  owner 'root'
  group 'root'
  mode '0600'
  variables(
    :version => version,
    :bindir => node['phpcs']['prefix']
  )
end

# composer update
execute 'phpcs-composer' do
  user 'root'
  cwd install_dir
  command 'composer update'
  action :run
end
