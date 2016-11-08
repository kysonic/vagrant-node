VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.5"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions/20160215.0.0/providers/virtualbox.box"
  config.vm.box_check_update = true

  # Ports for http, https, Express, http-server and Harp
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 3030, host: 3030
  config.vm.network "forwarded_port", guest: 3031, host: 3031
  config.vm.network "forwarded_port", guest: 3032, host: 3032

  config.ssh.forward_agent = true

  config.vm.synced_folder "../", "/home/vagrant/repo"

  config.vm.provider "virtualbox" do |vm|
    vm.memory = 2048
    vm.cpus = 2
  end

  config.vm.provider "vmware_fusion" do |vm|
    vm.memory = 2048
    vm.cpus = 2
  end

  config.vm.provision "shell", path: "provision.sh", privileged: false
end
