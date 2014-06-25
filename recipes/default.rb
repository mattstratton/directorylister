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


directory node[:directorylister][:log_root]  do
 recursive true
 action :create
end

<<<<<<< HEAD


=======
>>>>>>> 9c6d9d7eafd8f3346c12f2b337d93daaacb92141



