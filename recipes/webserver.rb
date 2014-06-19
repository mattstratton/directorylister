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
	path node[:directorylister][:webroot]
	application_pool 'directorylister'
	action [:add, :start]
end