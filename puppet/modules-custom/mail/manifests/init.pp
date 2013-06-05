class mail($dev_mail = '') {
  service { "postfix":
    require => Package['base-package'],
    ensure => 'running',
  }
}