# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
	Encoding.default_external = 'UTF-8'
	config.vm.box = "ubuntu/trusty64"

	config.vm.provider :virtualbox do |vb|
		vb.memory = 4096
		vb.cpus = 2
	end

	config.vm.hostname = "jenkins"
	config.vm.network :private_network, ip: "10.10.10.100"

	config.vm.provision "shell", path: "setup.sh"
end

