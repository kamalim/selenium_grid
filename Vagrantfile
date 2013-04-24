# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.


  config.vm.define :sehub do |sehub_config|

        sehub_config.vm.box = "centos-chef"
        sehub_config.vm.boot_mode = :gui
        sehub_config.ssh.private_key_path = '/Users/kamalim/.ssh/id_rsa'
        sehub_config.vm.network :hostonly, "192.168.200.10"
        sehub_config.vm.host_name = "se-hub"
   
        sehub_config.vm.provision :chef_solo do |chef|
         chef.cookbooks_path = "cookbooks"
         chef.add_recipe("java") 
         chef.add_recipe("selenium")
   end
  end

  config.vm.define :ubuntu1 do |ubuntu1_config|

        ubuntu1_config.vm.box = "ubuntu_desktop_64"
        ubuntu1_config.vm.boot_mode = :gui
        ubuntu1_config.ssh.private_key_path = '/Users/kamalim/.ssh/id_rsa'
        ubuntu1_config.vm.network :hostonly, "192.168.200.11"
        ubuntu1_config.vm.host_name = "ubuntu-1"

        ubuntu1_config.vm.provision :chef_solo do |chef|
         chef.cookbooks_path = "cookbooks"
         chef.add_recipe("chrome")
         chef.add_recipe("java")
         chef.add_recipe("selenium::client")
   end

  end

  config.vm.define :win1 do |win1_config|
        win1_config.vm.guest = :windows
        win1_config.vm.box = "win7_VL"
        win1_config.vm.boot_mode = :gui
        
        win1_config.vm.forward_port 3389, 3390, :name => "rdp", :auto => true
        win1_config.vm.forward_port 5985, 5985, :name => "winrm", :auto => true
        win1_config.vm.network :hostonly, "192.168.200.12"

        win1_config.vm.provision :chef_solo do |chef|
         chef.cookbooks_path = "cookbooks"
         chef.add_recipe("chef_handler")
         chef.add_recipe("windows")
         chef.add_recipe("firefox")
         chef.add_recipe("java")
         chef.add_recipe("chrome")
         chef.add_recipe("iexplorer")
         chef.add_recipe("selenium::client")        
   end

     
  end

 



  # Every Vagrant virtual environment requires a box to build off of.
 # config.vm.box = "centos"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui
   

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  #config.vm.network :hostonly, "192.168.33.10"
  
  #config.ssh.port = 22

  #config.ssh.private_key_path ='/Users/Admin/.ssh/id_rsa'

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port 80, 8080

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file lucid32.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "lucid32.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding 
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # IF you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
