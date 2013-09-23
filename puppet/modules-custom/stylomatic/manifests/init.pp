class stylomatic {

  package { 'rubygems1.8':
      ensure => installed,
  }

  package { 'sass':
      ensure => '3.1.12',
      provider => 'gem',
  }

  package { 'compass':
      ensure => '0.11.7',
      provider => 'gem',
  }

  package { 'compass-susy-plugin':
      ensure => '0.9',
      provider => 'gem',
  }

  package { 'fancy-buttons':
      ensure => '1.1.2',
      provider => 'gem',
  }

  package { 'sassy-text-shadow':
      #ensure => '0.0.4',
      provider => 'gem',
  }

  package { 'omg-text':
      #ensure => '0.0.2',
      provider => 'gem',
  }

  package { 'bundler':
      ensure => '1.1.4',
      provider => 'gem',
  }

  exec { 'add ruby gems bin to $PATH':
    require => Package['rubygems1.8'],
    command => "echo `sed 's/PATH=\"\\(.*\\)\"\\(.*\\)/PATH=\"\\1:\\/var\\/lib\\/gems\\/1.8\\/bin\"\\2/' /etc/environment` > /etc/environment",
    path => "/usr/bin:/usr/sbin:/bin",
    unless => "/bin/grep -q 'lib/gems' /etc/environment"
  }
}
