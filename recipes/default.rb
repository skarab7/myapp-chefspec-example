#
# Cookbook Name:: myapp-example
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
config_file = node['myapp_example']['config_file'] 
config_file_content = node['myapp_example']['config_content']

package "vim-nox" do
	action :install
end

file config_file do
  	action :create
  	content config_file_content
end
