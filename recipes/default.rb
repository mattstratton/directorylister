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

directory node[:directorylister][:web_root] do
 recursive true
 action :create
end


directory node[:directorylister][:log_root]  do
 recursive true
 action :create
end

 
iis_site  'Default Web Site' do
	action [:stop, :delete]
end



