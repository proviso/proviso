desc "Install required Vagrant plugins"
task :install_plugins do
  # TODO: Terrible using system here, need to look @ thor more to
  # see what we can do to make this sane, or possibly use mxin::command?
  installed_plugins = `vagrant plugin list`.split("\n").map { |i| i.split(" ")[0] }
  required_plugins = %w{
    vagrant-librarian-chef
    vagrant-omnibus
  }

  required_plugins.each do |plugin|
    system "vagrant plugin install #{plugin}" unless installed_plugins.include? plugin
  end
end
