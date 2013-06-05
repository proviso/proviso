class vagrantsetup {

  # TODO: Try deleting the webadmin user here.
  group { ['puppet']:
    ensure => present,
  }

  # Prevent errors by running apt-get update when anything beneath /etc/apt/ changes
  exec { "apt-get-update":
    command => "/usr/bin/apt-get update",
  }

  # We don't actually create the user it already exists,
  # but we do need to ensure it's in the dialout group.
  user { "vagrant":
    groups => ['dialout']
  }
}
