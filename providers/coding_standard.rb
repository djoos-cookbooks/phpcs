#
# Cookbook Name:: phpcs
# Provider:: coding_standard
#
# Copyright 2013-2014, Escape Studios
#

use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :install do
  Chef::Log.debug 'install coding standard'

  php_dir = `pear config-get php_dir`.strip
  standards_dir = "#{php_dir}/PHP/CodeSniffer/Standards"

  git "#{standards_dir}/#{new_resource.name}" do
    repository new_resource.repository
    reference new_resource.reference
    action :sync
    only_if { Dir.exists?(standards_dir) }
  end

  new_resource.updated_by_last_action(true)
end
