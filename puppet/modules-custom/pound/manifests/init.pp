class pound {
  package { "pound":
    ensure => installed,
  }
  service { "pound":
    require => Package['pound'],
    ensure => 'running',
  }
  file { '/etc/default/pound':
    require => Package['pound'],
    source => "puppet:///modules/pound/etc-default-pound",
    owner => 'root',
    group => 'root',
    mode => 644,
    notify => Service['pound'],
  }
  file { '/etc/pound/pound.cfg':
    require => Package['pound'],
    source => "puppet:///modules/pound/pound.cfg",
    owner => 'root',
    group => 'root',
    mode => 644,
    notify => Service['pound'],
  }
}
