# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  case ENV['PROVISO_PROVISIONER']
  when /chef/i, nil
    config.librarian_chef.cheffile_dir = "chef"
    config.omnibus.chef_version = "11.4.4"

    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef/cookbooks"
    end
  when /puppet/i
    config.vm.provision :puppet do |puppet|
      puppet.module_path    = ["puppet/modules", "puppet/modules-custom"]
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "zivtech.pp"
    end
  end
end
