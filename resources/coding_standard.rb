#
# Cookbook:: phpcs
# Resource:: coding_standard
#
# Copyright:: (c) 2016, David Joos
#

actions :install
default_action :install

attribute :repository, kind_of: String, default: nil
attribute :reference, kind_of: String, default: nil
attribute :subdirectory, kind_of: String, default: nil
attribute :standards_dir, kind_of: String, default: nil

def initialize(*args)
  super

  @run_context.include_recipe 'git'
end
