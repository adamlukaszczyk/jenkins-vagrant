# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
	Encoding.default_external = 'UTF-8'
	config.vm.box = "ubuntu/trusty64"

	if Vagrant.has_plugin?("vagrant-cachier")
		config.cache.scope = :box
	end

	if Vagrant.has_plugin?("vagrant-hostmanager")
		config.hostmanager.enabled = true
		config.hostmanager.manage_host = true
		config.hostmanager.ignore_private_ip = false
		config.hostmanager.include_offline = false
	end

	config.vm.provider :virtualbox do |vb|
		vb.memory = 1024
		vb.cpus = 2
		vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
	end

	config.vm.hostname = "jenkins"
	config.vm.network :private_network, ip: "10.10.10.100"
	config.hostsupdater.aliases = ["jenkins"]

	config.vm.provision "shell", path: "setup.sh"
end

