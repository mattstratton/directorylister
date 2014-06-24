#
# Cookbook Name:: directorylister
# Recipe:: wcfserver
#
# Copyright 2014, True Blue
#
# All rights reserved - Do Not Redistribute
#

# directory = resource, :directorylister = attribute value is from the default.rb file.
directory "#{node[:directorylister][:wcf_root]}directorylister" do
 recursive true
 action :create
end

template "#{node[:directorylister][:wcf_root]}directorylister/web.config" do
	source "web.config.wcfserver.erb"
	variables({
		:foo => "bar"

		})
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
	path "#{node[:directorylister][:wcf_root]}/directorylister"
	application_pool 'directorylister'
	action [:add, :config, :start]
end

template "#{node[:directorylister][:wcf_root]}directorylister/web.config" do
	source "web.config.wcfserver.erb"
	variables({
		:wcf_server => node[:directorylister][:wcf_server]

		})
end