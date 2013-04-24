#
# Cookbook Name:: selenuim
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node[:platform]
when "debian","ubuntu"
  service "iptables" do
    action [:disable, :stop]	
  end
  service "networking" do
    action :restart
  end
  cookbook_file "/opt/selenium-server-standalone-2.31.0.jar" do
    source "selenium-server-standalone-2.31.0.jar"	
  end
  cookbook_file "/opt/linuxnodeconfig.json" do
    source "linuxnodeconfig.json"
  end
  execute "create-node" do
    cwd "/opt"	
    command "nohup sudo java -jar selenium-server-standalone-2.31.0.jar -role node -hub http://192.168.200.10:4444/grid/register -nodeConfig linuxnodeconfig.json --Dwebdriver.chrome.driver=/opt/chromedriver &"
  end

when "windows"
 #cookbook_file "C:/selenium-server-standalone-2.31.0.jar" do
 	#source "selenium-server-standalone-2.31.0.jar"
 #end
 #cookbook_file "C:/winnodeconfig.json" do
  # source "winnodeconfig.json"
 #end

  remote_directory "C:/Apps" do 
    source "Apps"
    action :create
  end

  windows_batch "create-win-node" do
    cwd "C:/Apps/Selenium"
    code <<-EOH
    SeleniumAsService.bat
    EOH
  end

end
