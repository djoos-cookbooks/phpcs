#
# Cookbook Name:: phpcs
# Recipe:: pear
#
# Copyright 2013-2015, Escape Studios
#

include_recipe 'php'

# upgrade PEAR
php_pear 'PEAR' do
  channel 'pear.php.net'
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
  channel 'pear.php.net'
  version node['phpcs']['version'] if node['phpcs']['version'] != 'latest'
  action action
end
