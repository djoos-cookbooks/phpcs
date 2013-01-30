#
# Cookbook Name:: phpcs
# Recipe:: pear
#
# Copyright 2013, Escape Studios
#

include_recipe "php"

#PHP Extension and Application Repository PEAR channel
php_pear_channel "pear.php.net" do
  action :update
end

#upgrade PEAR
php_pear "PEAR" do
	action :upgrade
end

#upgrade phpcs
php_pear "PHP_CodeSniffer" do
	channel pearhub_chan.channel_name
	if node[:phpcs][:version] != "latest"
		version "#{node[:phpcs][:version]}"
	end
	action :upgrade
end