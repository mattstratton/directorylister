#
# Cookbook Name:: directorylister
# Recipe:: webserver
#
# Copyright 2014, True Blue
#
# All rights reserved - Do Not Redistribute
#

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
	path "#{node[:directorylister][:web_root]}/directorylister"
	application_pool 'directorylister'
	action [:add, :config, :start]
end

template "#{node[:directorylister][:web_root]}directorylister/web.config" do
	source "web.config.webserver.erb"
	variables({
		:wcf_server => node[:directorylister][:wcf_server]

		})
end

