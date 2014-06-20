require 'minitest/spec'
require 'minitest/pride'

#
# Cookbook Name:: wcfserver
# Spec:: default
#
# Copyright 2014, Trueblue.
#

describe_recipe 'wcfserver::default' do

	describe "IIS tests" do
		it "runs IIS as a service" do
      		service('W3SVC').must_be_running
   		end
   	end
   

	describe 'WCF Configuration' do
	    
	    it 'creates the webroot directory' do
	      directory("#{node[:directorylister][:wcf_root]}directorylister").must_exist
	    end
	  
	    it 'creates the log directory' do
	      directory(node[:directorylister][:log_root]).must_exist
	    end
		
		it "contains the value we want" do
			file("#{node[:directorylister][:wcf_root]}directorylister/web.config").must_include node[:directorylister][:xmlpath]
	   end
	  end

end