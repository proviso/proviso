desc "Install required Vagrant plugins"
task :install_plugins do
  # TODO: Terrible using system here, maybe `open3` lib to capture stdout.
  installed_plugins = `vagrant plugin list`.split("\n").map { |i| i.split(" ")[0] }
  required_plugins = %w{
    vagrant-librarian-chef
    vagrant-omnibus
    vagrant-vbguest
  }

  required_plugins.each do |plugin|
    system "vagrant plugin install #{plugin}" unless installed_plugins.include? plugin
  end
end
