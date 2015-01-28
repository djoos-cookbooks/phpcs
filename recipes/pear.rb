#
# Cookbook Name:: phpcs
# Recipe:: pear
#
# Copyright 2013-2014, Escape Studios
#

include_recipe 'php'

# PHP Extension and Application Repository PEAR channel
pearhub_chan = php_pear_channel 'pear.php.net' do
  action :update
end

# upgrade PEAR
php_pear 'PEAR' do
  channel pearhub_chan.channel_name
  action :upgrade
end

# install/upgrade phpcs
package = 'PHP_CodeSniffer'

# upgrade when package is installed and latest version is required
if !(`pear list | grep #{package}`.empty?) && node['phpcs']['version'] == 'latest'
  action = :upgrade
else
  action = :install
end

php_pear package do
  channel pearhub_chan.channel_name
  version node['phpcs']['version'] if node['phpcs']['version'] != 'latest'
  action action
end
