# TODO: We should probably use proper stages here.
class stage1 {

  class { 'mysql::server':
    config_hash => {
      'root_password' => 'foo',
    },
  }
  class { 'mysql::php': }

  class { 'redis':
    version => '2.4.17',
  }

  class { 'memcached':
    max_memory => '10%'
  }

  class { 'apache':
    default_mods => false,
    mpm_module   => 'prefork',
    servername   => 'proviso.local',
  }
  class { 'apache::mod::mime': }->
  class { 'apache::mod::rewrite': }->
  class { 'apache::mod::deflate': }->
  # TODO: We probably want this module but this isn't working for some reason.
  # class { 'apache::mod::expires': }->
  class { 'apache::mod::ssl': }
  # mod php is not included here beacuse it is added by the php::apache class.

  package { 'curl':
    ensure => 'present',
  }


  Php::Extension <| |> -> Php::Config <| |> ~> Service["apache2"]


  include php

  # TODO: Add support for yum.
  class { 'php::cli':
    ensure   => 'present',
    provider => 'apt',
  }
  class { 'php::apache':
    ensure   => 'present',
    provider => 'apt',
  }
  class { 'php::dev':
    ensure   => 'present',
    provider => 'apt',
  }
  class { 'php::pear':
    ensure   => 'present',
    provider => 'apt',
  }
  class { 'php::extension::apc':
    ensure   => 'present',
    provider => 'apt',
    package  => 'php-apc',
  }
  class { 'php::extension::curl':
    ensure   => 'present',
    provider => 'apt',
  }
  package { 'uploadprogress':
    ensure   => 'installed',
    provider => 'pecl',
  }

  include php::composer
  include php::phpunit
  include drush
}

exec { 'apt update':
  command => '/usr/bin/apt-get update ; /usr/bin/apt-get upgrade -y',
}

class { 'stage1':
  require => Exec['apt update']
}
