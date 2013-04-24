#
# Cookbook Name:: iexplorer
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

windows_zipfile "c:/bin" do
      source "http://selenium.googlecode.com/files/IEDriverServer_Win32_2.32.3.zip"
      action :unzip
      not_if {::File.exists?("c:/bin/IEDriverServer.exe")}
    end

 windows_path 'C:\bin\IEDriverServer.exe' do
   action :add
 end