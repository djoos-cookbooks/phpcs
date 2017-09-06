#
# Cookbook Name:: phpcs
# Resource:: coding_standard
#
# Copyright (c) 2016, David Joos
#

actions :install
default_action :install

attribute :name, :name_attribute => true, :kind_of => String
attribute :repository, :kind_of => String, :default => nil
attribute :reference, :kind_of => String, :default => nil
attribute :subdirectory, :kind_of => String, :default => nil
attribute :standards_dir, :kind_of => String, :default => nil

def initialize(*args)
  super
  @action = :install

  @run_context.include_recipe 'git'
end
