# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "https://atlas.hashicorp.com/ubuntu/boxes/wily64/versions/20160715.0.0/providers/virtualbox.box"
  config.vm.provision :shell, path: "init.sh"
  config.vm.synced_folder "sailor/", "/vagrant/sailor", create: true
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.network "forwarded_port", guest: 80, host: 9090
end
