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
  Chef::Log.info 'Installing coding standard #{new_resource.name}'

  case node['phpcs']['install_method']
  when 'pear'
    php_dir = `pear config-get php_dir`.strip
    standards_dir = "#{php_dir}/PHP/CodeSniffer/Standards"
  when 'composer'
    standards_dir = "#{Chef::Config[:file_cache_path]}/phpcs/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards"
  end

  if new_resource.subfolder.nil?
    git_clone_folder = "#{standards_dir}/#{new_resource.name}"
  else
    git_clone_folder = "#{Chef::Config[:file_cache_path]}/#{new_resource.name}"
  end

  git git_clone_folder do
    repository new_resource.repository
    reference new_resource.reference
    action :sync
    only_if { Dir.exist?(standards_dir) }
  end


  if !new_resource.subfolder.nil?
    bash "copy-drupal-standard" do
      user "root"
      code <<-EOH
        cp -Rf #{Chef::Config[:file_cache_path]}/#{new_resource.name}/#{new_resource.subfolder} #{standards_dir}
      EOH
    end
  end

  new_resource.updated_by_last_action(true)
end
