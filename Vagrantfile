# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  #if Vagrant.has_plugin?("vagrant-timezone")
  config.timezone.value = "JST"
  #end
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "debian/jessie64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 40772, host: 40772
  config.vm.network "forwarded_port", guest: 20772, host: 20772

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
    vb.memory = "1024"
    vb.customize ["modifyvm", :id, "--usb", "on", "--cpus", 2]
    # UUID:               746a218a-0aa3-4040-a4d0-07f8807bf58a
    # VendorId:           0x3275 (3275)                       
    # ProductId:          0x0080 (0080)
    # Revision:           0.1 (0001)   
    # Port:               2         
    # USB version/speed:  0/High
    # Manufacturer:       PLEX Digital TV Tuner
    # Product:            PX-S1UD Digital TV Tuner
    # Address:            p=0x0080;v=0x3275;s=0x00000ba6b6035ada;l=0x14120000
    vb.customize ['usbfilter', 'add', '0',
                  '--target', :id,
                  '--name', 'PX-S1UD Digital TV Tuner',
                  '--manufacturer', 'PLEX Digital TV Tuner',
                  '--vendorid', '0x3275', '--productid', '0x0080']
    # VendorId:           0x04e6 (04E6)
    # ProductId:          0x5116 (5116)
    # Revision:           3.4 (0304)
    # Port:               1
    # USB version/speed:  0/Full
    # Manufacturer:       SCM Microsystems
    # Product:            SCR33xx v2.0 USB SC Reader
    # Address:            p=0x5116;v=0x04e6;s=0x0000000065b57822;l=0x14110000
    # Current State:      Available
    vb.customize ['usbfilter', 'add', '0',
                  '--target', :id,
                  '--name', 'SCR33xx v2.0 USB SC Reader',
                  '--manufacturer', 'SCM Microsystems',
                  '--vendorid', '0x04e6', '--productid', '0x5116']
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", path: "bootstrap.sh"
end
