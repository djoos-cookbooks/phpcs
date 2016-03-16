#
# Cookbook Name:: phpcs
# Recipe:: coding_standard
#
# Copyright 2013-2015, Escape Studios
#

coding_standards = node['phpcs']['coding_standards']

unless coding_standards.nil?
  coding_standards.keys.each do |key|
    phpcs_coding_standard key do
      repository coding_standards[key]['repository']
      reference coding_standards[key]['reference']
      subdirectory coding_standards[key]['subdirectory'] unless coding_standards[key]['subdirectory'].nil?
      action :install
    end
  end
end
