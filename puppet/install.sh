#!/usr/bin/env sh

# Remove the versiono of puppet installed by the vagrant guys.
# Augeas is broken on it.
sudo rm -rf /opt/vagrant_ruby/lib/ruby/gems/1.8/gems/puppet*
sudo rm -rf /opt/vagrant_ruby/bin/puppet*
sudo rm -rf /opt/vagrant_ruby/bin/facter
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
sudo dpkg -i puppetlabs-release-precise.deb
rm -rf puppetlabs-release-precise.deb
sudo apt-get update

# Install the most recent puppet (3.0.x)
sudo apt-get install -y puppet

# Prevent errors by creating the default hiera.yaml because the installer won't.
echo '---' > /etc/puppet/hiera.yaml
echo ':backends: yaml' >> /etc/puppet/hiera.yaml
echo ':yaml:' >> //etc/puppet/hiera.yaml
echo '  :datadir: /var/lib/hiera' >> //etc/puppet/hiera.yaml
echo ':hierarchy: common' >> //etc/puppet/hiera.yaml
echo ':logger: console' >> //etc/puppet/hiera.yaml
