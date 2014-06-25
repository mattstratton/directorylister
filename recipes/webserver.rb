#
# Cookbook Name:: directorylister
# Recipe:: webserver
#
# Copyright 2014, True Blue
#
# All rights reserved - Do Not Redistribute
#

include_recipe "chef_handler"

handler_path = node['chef_handler']['handler_path']
handler = ::File.join handler_path, 'send_email'

cookbook_file "#{handler}.rb" do
  source 'send_email.rb'
end

# create directory

directory "#{node[:directorylister][:web_root]}directorylister" do
 recursive true
 action :create
end

#creates a new app pool
iis_pool 'directorylister' do
    runtime_version "4.0"
    pipeline_mode :Integrated
    pool_username node[:directorylister][:apppool_user]
    pool_password node[:directorylister][:apppool_password]
    action [:add, :config]
end

iis_site 'directorylister' do
	protocol :http
	port 80
	path "#{node[:directorylister][:web_root]}directorylister"
	application_pool 'directorylister'
	action [:add, :config, :start]
end

template "#{node[:directorylister][:web_root]}directorylister/web.config" do
	source "web.config.webserver.erb"
	variables({
		:wcf_server => node[:directorylister][:wcf_server]

		})
end

