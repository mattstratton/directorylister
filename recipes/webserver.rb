#
# Cookbook Name:: directorylister
# Recipe:: webserver
#
# Copyright 2014, True Blue
#
# All rights reserved - Do Not Redistribute
#

#creates a new app pool
iis_pool 'directorylister' do
    runtime_version "4.0"
    pipeline_mode :Integrated
    pool_username node[:directorylister][:apppool_user]
    pool_password node[:directorylister][:apppool_password]
    action :add
end

iis_site 'directorylister' do
	protocol :http
	port 80
	path node[:directorylister][:web_root]
	application_pool 'directorylister'
	action [:add, :config, :start]
end

#creates a new app
#iis_app "directorylister" do
#  path "/"
#  application_pool "directorylister"
#  physical_path node[:directorylister][:webroot]
#  enabled_protocols "http,net.pipe"
#  action :add
#end

