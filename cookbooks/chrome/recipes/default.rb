#
# Cookbook Name:: chrome
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node[:platform]
when "debian","ubuntu"
%w{libcurl3 libnspr4-0d libxss1 libgconf2-4}.each do |pkg|	
 package pkg do
 	action :install
 end
end
execute "download-chrome" do
  cwd "/opt"
  command "wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"	
  not_if "test -f /opt/google-chrome-stable_current_amd64.deb"
end
execute "install-chrome" do
  cwd "/opt"	
  command "dpkg -i google-chrome*"	
end
execute "download-chrome-webdriver" do
  cwd "/opt"
  command "wget http://chromedriver.googlecode.com/files/chromedriver2_linux64_0.7.zip"
  not_if "test -f /opt/chromedriver2_linux64_0.7.zip"
end
execute "unzip-chromedriver" do
  cwd "/opt"
  command "unzip chromedriver2_linux64_0.7.zip"
end

when "windows"
cookbook_file "C:/Users/vagrant/Downloads/GoogleChromeStandaloneEnterprise.msi" do
  source "GoogleChromeStandaloneEnterprise.msi"
 end
  windows_package "Google Chrome" do
    source "C:/Users/vagrant/Downloads/GoogleChromeStandaloneEnterprise.msi"
    installer_type :msi
    options "-ms"
    action :install
    end
  windows_zipfile "c:/bin" do
    source "http://chromedriver.googlecode.com/files/chromedriver2_win32_0.8.zip"
    action :unzip
    not_if {::File.exists?("c:/bin/chromedriver.exe")}
    end

  windows_path 'C:\bin\chromedriver.exe' do
   action :add
 end
 end
    
