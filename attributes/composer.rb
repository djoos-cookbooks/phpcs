#
# Cookbook Name:: phpcs
# Attributes:: composer
#
# Copyright (c) 2016, David Joos
#

default['phpcs']['prefix'] = default['composer']['global_install']['install_dir']
if default['phpcs']['install_method'] == 'composer'
  default['phpcs']['bin_dir'] = default['composer']['global_install']['install_dir']
end
