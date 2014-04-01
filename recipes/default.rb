#
# Cookbook Name:: phpcs
# Recipe:: default
#
# Copyright 2013-2014, Escape Studios
#

case node['phpcs']['install_method']
	when "pear"
		include_recipe "phpcs::pear"
	when "composer"
		include_recipe "phpcs::composer"
end

include_recipe "phpcs::coding-standard"