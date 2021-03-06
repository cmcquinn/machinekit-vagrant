# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "debian/stretch64"
  config.vm.box_version = "9.9.0"

  config.vagrant.plugins = "vagrant-vbguest"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

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
  config.vm.synced_folder ".", "/home/vagrant/shared/"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    vb.name = "Machinekit SDK"
    vb.cpus = 2
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
    # Enable the shared clipboard:
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "fix-no-tty", type: "shell" do |s|
    s.privileged = false
    s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end
  config.vm.provision "install dirmngr", type: "shell", inline: "sudo apt install -y dirmngr"
  config.vm.provision "copy-user-provision", type: "shell", path: "cookbook/copy-user-provision.sh"
  config.vm.provision "select-mirror", type: "shell", path: "cookbook/select-mirror.sh"
  config.vm.provision "gui", type: "shell", path: "cookbook/gui.sh"
  # config.vm.provision "vbox-guest-additions", type: "shell", path: "cookbook/vbox-guest-additions.sh"
  config.vm.provision "machinekit-package", type: "shell", path: "cookbook/machinekit-package.sh"
  config.vm.provision "startx", type: "shell", path: "cookbook/startx.sh"
  config.vm.provision "qt-base", type: "shell", path: "cookbook/qt-base.sh"
  config.vm.provision "machinetalk", type: "shell", path: "cookbook/machinetalk.sh"

end
