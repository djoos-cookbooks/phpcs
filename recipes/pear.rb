#
# Cookbook Name:: phpcs
# Recipe:: pear
#
# Copyright 2013-2014, Escape Studios
#

include_recipe "php"

#PHP Extension and Application Repository PEAR channel
pearhub_chan = php_pear_channel "pear.php.net" do
  action :update
end

#upgrade PEAR
php_pear "PEAR" do
	channel pearhub_chan.channel_name
	action :upgrade
end

#PHPUnit PEAR channel
php_pear_channel "pear.phpunit.de" do
	action :discover
end

#install/upgrade phpcs
package = "PHP_CodeSniffer"

php_pear package do
	channel pearhub_chan.channel_name
	if node['phpcs']['version'] != "latest"
		version "#{node['phpcs']['version']}"
	end
	#upgrade when package is installed and latest version is required
	action ( !(`pear list | grep #{package}`.empty?) and node['phpcs']['version'] == "latest" ) ? :upgrade : :install
end