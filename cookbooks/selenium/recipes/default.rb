#
# Cookbook Name:: selenuim
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
service "iptables" do
  action [:disable, :stop]	
end
cookbook_file "/opt/selenium-server-standalone-2.31.0.jar" do
  source "selenium-server-standalone-2.31.0.jar"	
end
execute "create-hub" do	
  command "nohup sudo java -jar /opt/selenium-server-standalone-2.31.0.jar -role hub & "
end

