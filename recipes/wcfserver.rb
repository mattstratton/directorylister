#
# Cookbook Name:: directorylister
# Recipe:: wcfserver
#
# Copyright 2014, True Blue
#
# All rights reserved - Do Not Redistribute
#

template "#{node[:directorylister][:wcf_root]}directorylister/web.config" do
	source "web.config.wcfserver.erb"
	variables({
		:foo => "bar"

		})
end