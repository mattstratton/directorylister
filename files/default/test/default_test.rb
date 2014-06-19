require 'minitest/spec'

#
# Cookbook Name:: directorylister
# Spec:: default
#
# Copyright 2014, Trueblue.
#

describe_recipe 'directorylister::default' do

	describe "IIS tests" do
		it "runs IIS as a service" do
      		service('W3SVC').must_be_running
   		end
   	end
   

	describe 'Website Configuration' do
	    
	    it 'creates the webroot directory' do
	      directory(node[:directorylister][:web_root]).must_exist
	    end
	  
	    it 'creates the log directory' do
	      directory(node[:directorylister][:log_root]).must_exist
	    end
	  
	  end

end