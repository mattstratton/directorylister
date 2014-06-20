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