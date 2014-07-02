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
  all true
end

windows_feature 'Application-Server' do
	action :install
	all true
end

windows_feature 'IIS-NetFxExtensibility45' do
	action :install
	all true
end

windows_feature 'NetFx4Extended-ASPNET45' do
	action :install
	all true
end

windows_feature 'Application-Server-TCP-Port-Sharing' do
	action :install
	all true
end

windows_feature 'Application-Server-WebServer-Support' do
	action :install
	all true
end

windows_feature 'Application-Server-WAS-Support' do
	action :install
	all true
end

windows_feature 'Application-Server-HTTP-Activation' do
	action :install
	all true
end

windows_feature 'IIS-WebServerRole' do
  action :install
  all true
end

windows_feature 'MSMQ-Services' do
	action :install
	all true
end

windows_feature 'IIS-ISAPIExtensions' do
	action :install
	all true
end

windows_feature 'IIS-ISAPIFilter' do
	action :install
	all true
end

windows_feature 'IIS-ASPNET' do
	action :install
	all true
end


windows_feature 'WCF-HTTP-Activation' do
	action :install
	all true
end

windows_feature 'WAS-ProcessModel' do
	action :install
	all true
end

windows_feature 'WAS-WindowsActivationService' do
	action :install
	all true
end

windows_feature 'WAS-ConfigurationAPI' do
	action :install
	all true
end

directory node[:directorylister][:log_root]  do
 recursive true
 action :create
end




