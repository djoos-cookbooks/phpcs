#
# Cookbook Name:: phpcs
# Resource:: coding_standard
#
# Copyright 2013-2015, Escape Studios
#

actions :install
default_action :install

attribute :name, :name_attribute => true, :kind_of => String, :default => nil
attribute :repository, :kind_of => String, :default => nil
attribute :reference, :kind_of => String, :default => nil
attribute :subdirectory, :kind_of => String, :default => nil

def initialize(*args)
  super
  @action = :install

  @run_context.include_recipe 'git'
end
