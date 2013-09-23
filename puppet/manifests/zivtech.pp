# Puppet whines and compains if it doesn't have
# its puppet users  and apt throws a fit if it's out of date,
# so we take care of these things first.

stage { 'first': before => Stage['main'] }

class {
  'vagrantsetup': stage => first;
  'vagrantvm': stage => main;
}

class wget {
  package { 'wget':
    ensure => 'installed',
  }
}

class gcc {
  package { 'gcc':
    ensure => 'installed',
  }
}


class vagrantvm {
  $user = 'vagrant'
  $group = 'vagrant'

  class { 'webadmin':
    webadminuser => $user,
    webadmingroup => $group,
  }

  # This lovely little hack of instantiating the class
  # we extend before the extending class allows us to get
  # our parameters into it.  Otherwise the parent class does
  # not receive them.
  class { "Php53":
    webadminuser => $user,
    webadmingroup => $group,
    require => Class['webadmin'],
    web_permissions => 'false',
  }

  class { "Php53::Dev":
    webadminuser => $user,
    webadmingroup => $group,
    require => Class['webadmin', 'Php53'],
    web_permissions => 'false',
    xdebug_idekey => 'netbeans-xdebug',
    xdebug_remote_host => '33.33.33.1',
  }


  # This lovely little hack of instantiating the class
  # we extend before the extending class allows us to get
  # our parameters into it.  Otherwise the parent class does
  # not receive them.
  class { 'Mysql5':
    mysqlpassword => '',
    webadminuser => $user,
    webadmingroup => $group,
  }

  class { 'Mysql5::Dev':
    mysqlpassword => '',
    webadminuser => $user,
    webadmingroup => $group,
    require => Class['webadmin', 'Mysql5'],
  }

  class { 'mail::dev':
    dev_mail => "${user}@${hostname}",
    require => Class['webadmin'],
  }

  user { "www-data":
    groups => ['dialout']
  }

  class { "solr":
    webadmingroup => $webadmingroup,
  }

  include drush
  class { "drushfetcher":
    fetcher_host => 'https://extranet.zivtech.com',
  }
  include drushphpsh

  include redis
}

include vagrantsetup
include vagrantvm
