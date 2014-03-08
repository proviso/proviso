# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :private_network, ip: "192.168.33.10"


  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.synced_folder_opts = {
      type: :nfs,
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    }
  end

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  case ENV['PROVISO_PROVISIONER']
  when /chef/i
    config.librarian_chef.cheffile_dir = "chef"
    config.omnibus.chef_version = "11.4.4"

    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef/cookbooks"
    end
  when /puppet/i, nil
    # Install our target version of puppet.
    config.vm.provision :shell do |shell|
      shell.path = "puppet/install.sh"
      # shell.args = target_version = "3.3.0"
    end
    config.vm.provision :puppet do |puppet|
      puppet.module_path    = "puppet/modules"
      puppet.manifests_path = "puppet/manifests"
    end
  end
end
