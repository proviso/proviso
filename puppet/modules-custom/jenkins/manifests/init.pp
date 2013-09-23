class jenkins {
  package { "jenkins":
    ensure => installed,
  }
  service { "jenkins":
    require => Package['jenkins'],
    ensure => 'running',
  }
  file { '/etc/default/jenkins':
    require => Package['pound'],
    source => "puppet:///modules/jenkins/etc-default-jenkins",
    owner => 'root',
    group => 'root',
    mode => 644,
    notify => Service['jenkins'],
  }
  vcsrepo { "/var/lib/jenkins":
    require => [
      Package['tomcat6'],
      Package['jenkins'],
    ],
    source => "git@zivtech.unfuddle.com:zivtech/jenkinscfg.git",
    ensure => "present",
    provider => 'git',
    notify => Service['jenkins'],
    owner => 'jenkins',
    group => 'root',
    mode => 644,
  }
}
