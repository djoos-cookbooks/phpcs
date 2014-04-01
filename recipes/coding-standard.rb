#
# Cookbook Name:: phpcs
# Recipe:: coding-standard
#
# Copyright 2013-2014, Escape Studios
#

include_recipe "git"

php_dir = `pear config-show | grep php_dir | awk 'NR==1 {print $(NF)}'`.strip
standards_dir = "#{php_dir}/PHP/CodeSniffer/Standards"

directory standards_dir do
	recursive true
    action :create
end

coding_standards = node['phpcs']['coding_standards']

unless coding_standards.nil?
    coding_standards.keys.each do |key|
        git "#{standards_dir}/#{key}" do
            repository coding_standards[key]['repository']
            reference coding_standards[key]['reference']
            action :sync
        end
    end
end