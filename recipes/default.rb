#
# Cookbook Name:: directorylister
# Recipe:: default
#
# Copyright 2014, True Blue
#
# All rights reserved - Do Not Redistribute
#

# resource
# attribute
windows_feature 'NetFx4Extended-ASPNET45' do
  action :install
end

windows_feature 'IIS-WebServerRole' do
  action :install
end

windows_feature 'MSMQ-Services' do
	action :install
	all true
end

directory node[:directorylister][:log_root]  do
 recursive true
 action :create
end




