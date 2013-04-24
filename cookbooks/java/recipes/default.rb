#
# Cookbook Name:: java
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node[:platform]
when "centos","redhat","fedora","suse"
cookbook_file "/opt/jdk-7u17-linux-x64.rpm" do
  source "jdk-7u17-linux-x64.rpm"
end
execute "java" do
  command "rpm -ivh /opt/jdk-7u17-linux-x64.rpm"
  not_if "test -d /usr/java"
  notifies :run, "script[JAVA_HOME]"  

end
	
script "JAVA_HOME" do
	interpreter "bash"
    code <<-EOH
    echo "export JAVA_HOME=/usr/java/jdk1.7.0_17" >> ~/.bash_profile
    export JAVA_HOME
    echo "export PATH=$JAVA_HOME/bin:$PATH" >> ~/.bash_profile
    source ~/.bash_profile
    EOH
end

when "debian","ubuntu"
  directory "/usr/local/java" do
    owner "root"
    group "root"
    recursive true
    action :create
end
  cookbook_file "/usr/local/java/jdk-7u17-linux-x64.tar.gz" do 
    source "jdk-7u17-linux-x64.tar.gz"
    mode "0770"
  end
  execute "tar" do
    cwd "/usr/local/java/"
    command "sudo -s tar xvf jdk-7u17-linux-x64.tar.gz"
  end

  script "java_home" do
    interpreter "bash"
    code <<-EOH
    sudo echo JAVA_HOME=/usr/local/java/jdk1.7.0_17 >> /etc/profile
    sudo echo PATH=$PATH:$HOME/bin:$JAVA_HOME/bin >> /etc/profile
    sudo echo "export JAVA_HOME" >> /etc/profile
    sudo echo "export PATH" >> /etc/profile
    sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.7.0_17/bin/java" 1 
    sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.7.0_17/bin/javac" 1 
    sudo update-alternatives --set java /usr/local/java/jdk1.7.0_17/bin/java 
    sudo update-alternatives --set javac /usr/local/java/jdk1.7.0_17/bin/javac
    sudo sh /etc/profile
    EOH
   
  end
when "windows"
  cookbook_file "C:/jdk-7u17-windows-i586.exe" do
    source "jdk-7u17-windows-i586.exe"
  end
  windows_package "jdk1.7.0_17" do
        source "jdk-7u17-windows-i586.exe"
        installer_type :custom
        options "/s"
        action :install
    end

 end 